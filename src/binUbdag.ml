type stream  = bool list
type 't dump = 't -> stream -> stream
type 't load = stream -> 't  * stream

module type MODELE =
sig
	type leaf
	type edge
	type node

	type 'i next' = (leaf, 'i) Utils.gnode
	type 'i edge' = edge * 'i next'
	type 'i node' = node * 'i edge' * 'i edge'

	val dump_edge : ('i dump) -> 'i edge' dump
	val dump_node : ('i dump) -> 'i node' dump
	
	val load_edge : ('i load) -> 'i edge' load
	val load_node : ('i load) -> 'i node' load

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

	val push_edge : edge' -> Bitv.t
	val pull_edge : Bitv.t -> edge'
	
end

module MODULE(M0:MODELE) =
struct
	module M = M0
	type ident = int

	type manager = {
		man : Bitv.t H2Table.t;
	}

    let makeman hsize = {
        man = H2Table.create hsize 0;
    }

    let default_newman_hsize = 10000

    let newman () = makeman default_newman_hsize

    let dump_stat man = Tree.Node [
        Tree.Leaf "#node: "; Tree.Node [ StrTree.of_int (H2Table.length man.man) ]
    ]

	let dump_ident = BinDump.int
	let load_ident = BinLoad.int

	let push' node = M.dump_node dump_ident node [] |> Bitv.L.of_bool_list
	let pull' bitv =
		let node, stream = M.load_node load_ident (Bitv.L.to_bool_list bitv) in
		assert(stream = []);
		node

	let push man node =
		let bitv = push' node in
		if M.__check_reverse__
		then
		(
			let node' = pull' bitv in
			assert(node = node')
		);
		H2Table.push man.man bitv

	let pull man ident =
		let bitv = H2Table.pull man.man ident in
		let node = pull' bitv in
		if M.__check_reverse__
		then
		(
			let bitv' = push' node in
			assert(bitv = bitv')
		);
		node
	
	let push_edge edge = M.dump_edge dump_ident edge [] |> Bitv.L.of_bool_list
	let pull_edge bitv =
		let edge, stream = M.load_edge load_ident (Bitv.L.to_bool_list bitv) in
		assert(stream = []);
		edge
end

let default_dump_node dump_core dump_leaf dump_ident (node, (edge0, next0), (edge1, next1)) stream =
	let stream = dump_core (node, edge0, edge1) stream in
	let dump_next next stream = match next with
		| Utils.Leaf leaf -> false::(dump_leaf leaf stream)
		| Utils.Node ident -> true::(dump_ident ident stream)
	in
	dump_next next0 (dump_next next1 stream)

let default_load_node load_core load_leaf load_ident stream =
	let load_next = function
		| [] -> assert false
		| false::stream ->
		(
			let leaf, stream = load_leaf stream in
			(Utils.Leaf leaf, stream)
		)
		| true::stream ->
		(
			let ident, stream = load_ident stream in
			(Utils.Node ident, stream)
		)
	in
	let next0, stream = load_next stream in
	let next1, stream = load_next stream in
	let (node, edge0, edge1) = load_core stream in
	(node, (edge0, next0), (edge1, next1))

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

		let dump_edge dump_ident edge stream = 
			M0.SRC.M.dump_edge dump_ident (M0.dump_edge edge) stream
		let dump_node dump_ident node stream =
			M0.SRC.M.dump_node dump_ident (M0.dump_node node) stream
		
		let load_edge load_ident stream = 
			let edge, stream = M0.SRC.M.load_edge load_ident stream in
			M0.load_edge edge, stream
		let load_node load_ident stream =
			let node, stream = M0.SRC.M.load_node load_ident stream in
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
		let push_edge man edge  : Bitv.t =
			let edge' = M0.dump_edge edge in
			if M0.__check_reverse__
			then
			(
				let edge'' = M0.load_edge edge' in
				assert(edge = edge'')
			);
			M0.SRC.push_edge edge'

		let pull_edge man bitv : edge' =
			let edge' = M0.SRC.pull_edge bitv in
			let edge = M0.load_edge edge' in
			if M0.__check_reverse__
			then
			(
				let edge'' = M0.dump_edge edge in
				assert(edge' = edge'')
			);
			edge
	end

	let export : M0.SRC.manager -> MODULE.manager = fun man -> man
end

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
		(* SRC.ident -> DST.edge' MemoTable.t *)
		man : (M0.SRC.ident, Bitv.t) MemoTable.t;
		map_next : M0.SRC.next' -> M0.DST.edge';
		map_edge : M0.SRC.edge' -> M0.DST.edge';
		map_node : M0.SRC.ident -> M0.DST.edge';
	}

	let makeman src dst hsize =
		let man, apply = MemoTable.make hsize in
		let rec map_next = function
			| Utils.Leaf leaf -> M0.map_leaf leaf
			| Utils.Node ident -> map_node ident
		and     map_edge (edge, next) = M0.map_edge edge (map_next next)
		and     rec_node ident = apply (fun ident ->
			let (node, edge'0, edge'1) = M0.SRC.pull src ident in
			let edge', merge = M0.map_node node (map_edge edge'0) (map_edge edge'1) in
			M0.DST.push_edge (edge', match merge with
				| Utils.MEdge next' -> next'
				| Utils.MNode node' -> Utils.Node(M0.DST.push dst node'))
		) ident
		and		map_node ident =
			M0.DST.pull_edge (rec_node ident)
		in {src; dst; man; map_next; map_edge; map_node}
    
	let default_newman_hsize = 10000
	
	let newman src dst = makeman src dst default_newman_hsize

	let man_next man = man.map_next
	let man_edge man = man.map_edge
	let man_node man = man.map_node
	
end

type eval = bool option list

let dump_eval eval stream = none_list (fun elem stream -> match elem with
	| None -> false::false::stream
	| Some elem -> match elem with
		| None -> false::true ::stream
		| Some elem -> true ::elem ::stream ) eval stream

module BIDIR_MODELE =
sig
	module M : MODULE_SIG

	val compose : M.M.edge -> M.edge' -> M.edge'
	val solver : M.node' ->  M.M.edge * (M.next', M.node')



	

(* WIP *)

end

module IBOP =
struct
	
end 
