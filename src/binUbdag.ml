module type MODELE =
sig
	type leaf
	type edge
	type node

	val dump_leaf : leaf BinUtils.dump
	val dump_edge : edge BinUtils.dump
	val dump_node : node BinUtils.dump

	val load_leaf : leaf BinUtils.load
	val load_edge : edge BinUtils.load
	val load_node : node BinUtils.load

	type 'i next' = (leaf, 'i) Utils.gnode
	type 'i edge' = edge * 'i next'
	type 'i node' = node * 'i edge' * 'i edge'

	val dump_next' : ('i BinUtils.dump) -> 'i next' BinUtils.dump
	val dump_edge' : ('i BinUtils.dump) -> 'i edge' BinUtils.dump
	val dump_node' : ('i BinUtils.dump) -> 'i node' BinUtils.dump
	
	val load_next' : ('i BinUtils.load) -> 'i next' BinUtils.load
	val load_edge' : ('i BinUtils.load) -> 'i edge' BinUtils.load
	val load_node' : ('i BinUtils.load) -> 'i node' BinUtils.load

	(* assert(x |> dump |> load = x) && assert(x |> load |> dump |> stream) *)
	val __check_reverse__ : bool

end

module type MODULE_SIG =
sig
	type ident

	module M : MODELE

	type next' = ident M.next'
	type edge' = ident M.edge'
	type node' = ident M.node'

	type manager

	val makeman : int -> manager
	val newman : unit -> manager

	val dump_stats : manager -> StrTree.tree

	val push : manager -> node' -> ident
	val pull : manager -> ident -> node'

	val dump_ident : ident BinUtils.dump
	val load_ident : ident BinUtils.load

	val dump_next' : next' BinUtils.dump
	val load_next' : next' BinUtils.load

	val dump_edge' : edge' BinUtils.dump
	val load_edge' : edge' BinUtils.load

	val dump_node' : node' BinUtils.dump
	val load_node' : node' BinUtils.load

	val push_edge' : edge' -> Bitv.t
	val pull_edge' : Bitv.t -> edge'
	
	val push_node' : node' -> Bitv.t
	val pull_node' : Bitv.t -> node'

	val dump : manager -> edge' list -> StrTree.tree
	val load : StrTree.tree  -> manager * edge' list

end

module MODULE(M0:MODELE) =
struct
	module M = M0
	type ident = int

	type next' = ident M.next'
	type edge' = ident M.edge'
	type node' = ident M.node'

	type manager = {
		man : Bitv.t H2Table.t;
	}

    let makeman hsize = {
        man = H2Table.create hsize 0;
    }

    let default_newman_hsize = 10000

    let newman () = makeman default_newman_hsize

    let dump_stats man = Tree.Node [
        Tree.Leaf "#node: "; Tree.Node [ StrTree.of_int (H2Table.length man.man) ]
    ]

	let dump_ident = BinDump.int
	let load_ident = BinLoad.int

	let dump_next' = M.dump_next' dump_ident
	let load_next' = M.load_next' load_ident

	let dump_edge' = M.dump_edge' dump_ident
	let load_edge' = M.load_edge' load_ident

	let dump_node' = M.dump_node' dump_ident
	let load_node' = M.load_node' load_ident

	let push_node' = BinDump.closure dump_node'
	let pull_node' = BinLoad.closure load_node'

	let push man node =
		let bitv = push_node' node in
		if M.__check_reverse__
		then
		(
			let node' = pull_node' bitv in
			assert(node = node')
		);
		H2Table.push man.man bitv

	let pull man ident =
		let bitv = H2Table.pull man.man ident in
		let node = pull_node' bitv in
		if M.__check_reverse__
		then
		(
			let bitv' = push_node' node in
			assert(bitv = bitv')
		);
		node
	
	let push_edge' = BinDump.closure dump_edge'
	let pull_edge' = BinLoad.closure load_edge'

	let dump man edges =
		let man = H2Table.strdump Extra.(Bitv.L.to_hexa_string >> StrTree.of_string) man.man
		and edges = List.map Extra.(push_edge' >> Bitv.L.to_hexa_string >> StrTree.of_string) edges in
		Tree.Node (man::edges)

	let load' hsize = function
		| Tree.Node (man::edges) ->
		(
			let man = H2Table.strload hsize Extra.(StrTree.to_string >> Bitv.L.of_hexa_string) man
			and edges = List.map Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> pull_edge') edges in
			({man}, edges)
		)
		| _ -> assert false

	let load stree = load' default_newman_hsize stree

end

let default_dump_node dump_core dump_leaf dump_ident (node, (edge0, next0), (edge1, next1)) stream =
	let stream = dump_core (node, edge0, edge1) stream in
	let dump_next = Utils.dump_gnode dump_leaf dump_ident in
	dump_next next0 (dump_next next1 stream)

let default_load_node load_core load_leaf load_ident stream =
	let load_next = Utils.load_gnode load_leaf load_ident in
	let next0, stream = load_next stream in
	let next1, stream = load_next stream in
	let (node, edge0, edge1), stream = load_core stream in
	(node, (edge0, next0), (edge1, next1)), stream


module type OOO_MAP_MODELE =
sig
	module SRC : MODULE_SIG
	module DST : MODULE_SIG

	val map_leaf : SRC.M.leaf -> DST.M.leaf
	val map_edge : SRC.M.edge -> DST.M.edge
	val map_node : SRC.M.node -> DST.M.node
end

module OOO_MAP(M0:OOO_MAP_MODELE) =
(* One-On-One MAPping *)
struct
	type manager = {
		src :  M0.SRC.manager;
		dst :  M0.DST.manager;
		man : (M0.SRC.ident, M0.DST.ident) MemoTable.t;
		map_next : M0.SRC.next' -> M0.DST.next';
		map_edge : M0.SRC.edge' -> M0.DST.edge';
		map_node : M0.SRC.ident -> M0.DST.ident;
	}

	let makeman src dst hsize =
		let man, apply = MemoTable.make hsize in
		let rec map_next = function
			| Utils.Leaf leaf -> Utils.Leaf (M0.map_leaf leaf)
			| Utils.Node ident -> Utils.Node (map_node ident)
		and     map_edge (edge, next) = (M0.map_edge edge, map_next next)
		and     map_node ident = apply (fun ident ->
			let (node, edge'0, edge'1) = M0.SRC.pull src ident in
			M0.DST.push dst (M0.map_node node, map_edge edge'0, map_edge edge'1)
		) ident
		in {src; dst; man; map_next; map_edge; map_node}
    
	let default_newman_hsize = 10000
	
	let newman src dst = makeman src dst default_newman_hsize

	let man_next man = man.map_next
	let man_edge man = man.map_edge
	let man_node man = man.map_node
end

module REMAN(M:MODULE_SIG) =
struct

	type manager = {
		src : M.manager;
		dst : M.manager;
		mem : (M.ident, M.ident) MemoTable.t;
		map_node : M.ident -> M.ident;
		map_edge : M.edge' -> M.edge';
	}

	let makeman src dst hsize =
		let mem, apply = MemoTable.make hsize in
		let rec map_node ident = apply (fun ident ->
			M.push dst (rec_node (M.pull src ident))
		) ident
		and     rec_node (node, edge0, edge1) =
			(node, map_edge edge0, map_edge edge1)
		and     map_edge (edge, next) = (edge, map_next next)
		and     map_next = function
			| Utils.Leaf leaf -> Utils.Leaf leaf
			| Utils.Node ident -> Utils.Node (map_node ident)
		in {src; dst; mem; map_node; map_edge}
	
	let default_newman_hsize = 10000

	let newman src dst = makeman src dst default_newman_hsize

	let map_node man = man.map_node
	let map_edge man = man.map_edge

end

module type SEM_MAP_MODELE =
sig
	module SRC : MODULE_SIG
	module DST : MODULE_SIG

	val map_leaf : SRC.M.leaf -> DST.edge'
	val map_edge : SRC.M.edge -> DST.edge' -> DST.edge'
	val map_node : SRC.M.node -> DST.edge' -> DST.edge' ->
		DST.M.edge * (DST.next', DST.node') Utils.merge
end

module SEM_MAP(M0:SEM_MAP_MODELE) =
struct
	type manager = {
		src :  M0.SRC.manager;
		dst :  M0.DST.manager;
		man : (M0.SRC.ident, M0.SRC.ident, M0.DST.edge', Bitv.t) MemoBTable.t;
		map_next : M0.SRC.next' -> M0.DST.edge';
		map_edge : M0.SRC.edge' -> M0.DST.edge';
		map_node : M0.SRC.ident -> M0.DST.edge';
	}

	let makeman src dst hsize =
		let dumpA x = x
		and loadA x = x
		and dumpB x = M0.DST.push_edge' x
		and loadB x = M0.DST.pull_edge' x in
		let man, apply = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let rec map_next = function
			| Utils.Leaf leaf -> M0.map_leaf leaf
			| Utils.Node ident -> map_node ident
		and     map_edge (edge, next) = M0.map_edge edge (map_next next)
		and     map_node ident = apply (fun ident ->
			let (node, edge'0, edge'1) = M0.SRC.pull src ident in
			let edge', merge = M0.map_node node (map_edge edge'0) (map_edge edge'1) in
			(edge', match merge with
				| Utils.MEdge next' -> next'
				| Utils.MNode node' -> Utils.Node(M0.DST.push dst node'))
		) ident
		in {src; dst; man; map_next; map_edge; map_node}
    
	let default_newman_hsize = 10000
	
	let newman src dst = makeman src dst default_newman_hsize

	let man_next man = man.map_next
	let man_edge man = man.map_edge
	let man_node man = man.map_node
	
end

(*
module type PROXY_MODELE =
sig
	module SRC : MODULE_SIG

	type leaf
	type edge
	type node

	type 'i next' = (leaf, 'i) Utils.gnode
	type 'i edge' = edge * 'i next'
	type 'i node' = node * 'i edge' * 'i edge'

	val dump_edge : 'i edge' -> 'i SRC.M.edge'
	val dump_node : 'i node' -> 'i SRC.M.node'
	
	val load_edge : 'i SRC.M.edge' -> 'i edge'
	val load_node : 'i SRC.M.node' -> 'i node'
	
	val __check_reverse__ : bool
	
end

module PROXY(M0:PROXY_MODELE) =
struct
	module MODELE =
	struct
		type leaf = M0.leaf
		type edge = M0.edge
		type node = M0.node

		type 'i next' = (leaf, 'i) Utils.gnode
		type 'i edge' = edge * 'i next'
		type 'i node' = node * 'i edge' * 'i edge'

		let dump_edge' dump_ident edge stream = 
			M0.SRC.M.dump_edge' dump_ident (M0.dump_edge' edge) stream
		let dump_node' dump_ident node stream =
			M0.SRC.M.dump_node' dump_ident (M0.dump_node' node) stream
		
		let load_edge' load_ident stream = 
			let edge, stream = M0.SRC.M.load_edge' load_ident stream in
			M0.load_edge edge, stream
		let load_node' load_ident stream =
			let node, stream = M0.SRC.M.load_node' load_ident stream in
			M0.load_node node, stream

		let __check_reverse__ = M0.SRC.M.__check_reverse__ && M0.__check_reverse__
	end

	module MODULE =
	struct
		module M = MODELE
		type ident = M0.SRC.ident
		type next' = ident M.next'
		type edge' = ident M.edge'
		type node' = ident M.node'

		type manager = M0.SRC.manager

		let makeman : int -> manager = M0.SRC.makeman
		let newman : unit -> manager = M0.SRC.newman

		let dump_stats : manager -> StrTree.tree = M0.SRC.dump_stats

		let push man node  : ident =
			let node' = M0.dump_node node in
			if M0.__check_reverse__
			then
			(
				let node'' = M0.load_node node' in
				assert(node = node'')
			);
			M0.SRC.push man node'
		let pull man ident : node' =
			let node' = M0.SRC.pull man ident in
			let node = M0.load_node node' in
			if M0.__check_reverse__
			then
			(
				let node'' = M0.dump_node node in
				assert(node' = node'')
			);
			node
		let push_edge' man edge  : Bitv.t =
			let edge' = M0.dump_edge edge in
			if M0.__check_reverse__
			then
			(
				let edge'' = M0.load_edge edge' in
				assert(edge = edge'')
			);
			M0.SRC.push_edge' edge'

		let pull_edge' man bitv : edge' =
			let edge' = M0.SRC.pull_edge bitv in
			let edge = M0.load_edge edge' in
			if M0.__check_reverse__
			then
			(
				let edge'' = M0.dump_edge' edge in
				assert(edge' = edge'')
			);
			edge

		let dump = M0.SRC.dump
		let load = M0.SRC.load

	end

	let export : M0.SRC.manager -> MODULE.manager = fun man -> man
end
*)
