module type MODELE =
sig
	module M : BinUbdag.MODELE

	val push_node : 'i M.node' -> M.edge * ('i M.next', 'i M.node') Utils.merge

	val compose : M.edge -> 'i M.edge' -> 'i M.edge'

end

module type MODULE_SIG =
sig
	module M : MODELE
	module G : BinUbdag.MODULE_SIG with
		    type M.leaf = M.M.leaf
		and type M.edge = M.M.edge
		and type M.node = M.M.node

	type manager

	val makeman : int -> manager
	val newman : unit -> manager

	val dump_stats : manager -> StrTree.tree

	val push : manager -> G.node' -> G.edge'
	val pull : manager -> G.ident -> G.node'

	val dump : manager -> G.edge' -> StrTree.tree
	val load : StrTree.tree  -> manager * G.edge'
end

module MODULE(M0:MODELE) =
struct
	module M = M0
	module G = BinUbdag.MODULE(M0.M)

	type manager = G.manager

    let makeman = G.makeman

    let default_newman_hsize = 10000

    let newman () = makeman default_newman_hsize

    let dump_stat man = G.dump_stat

	let push man node' =
		let edge, merge = M.push_node node' in
		(edge, match merge with
		| Utils.MEdge next' -> next'
		| Utils.MNode node' -> Utils.Node (G.push man node'))
	let pull man ident = G.pull man ident

	let dump = G.dump
	let load = G.load
	
end

module type PEVAL_MODELE =
sig
	module M : MODULE_SIG

	type peval

	val dump_peval : peval Utils.dump
	val load_peval : peval Utils.load

	type next = peval option * M.G.ident

	type next' = next M.M.M.next'
	type edge' = next M.M.M.edge'
	type node' = next M.M.M.node'

	val eval_edge : peval -> edge' ->  edge'
	val eval_node : peval -> node' -> (edge', node') Utils.merge
	
end

module type PEVAL_SIG =
sig
	module M : PEVAL_MODELE
	
	type manager
	
	val rec_edge : manager -> M.edge' -> M.M.G.edge'
	val rec_node : manager -> M.peval -> M.M.G.ident -> M.M.G.edge'
	val map_edge : manager -> M.peval -> M.M.G.edge' -> M.M.G.edge'
	val map_node : manager -> M.peval -> M.M.G.node' -> M.M.G.edge'

end


module PEVAL(M:PEVAL_MODELE) =
struct
	type manager = {
		man : M.M.manager;
		mem : (M.peval * M.M.G.ident, Bitv.t, M.M.G.edge', Bitv.t) MemoBTable.t;
		rec_edge : M.edge' -> M.M.G.edge';
		rec_node : M.peval -> M.M.G.ident -> M.M.G.edge';
		map_edge : M.peval -> M.M.G.edge' -> M.M.G.edge';
		map_node : M.peval -> M.M.G.node' -> M.M.G.edge';
	}

	let makeman man hsize =
		let dumpA = BinDump.closure (BinDump.pair M.dump_peval M.M.G.dump_ident)
		and loadA = BinLoad.closure (BinLoad.pair M.load_peval M.M.G.load_ident)
		and dumpB = BinDump.closure M.M.G.dump_edge
		and loadB = BinLoad.closure M.M.G.load_edge in
		let compose = M.M.M.compose in
		let mem, apply = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let rec rec_edge  (edge, next) = match next with
			| Utils.Leaf leaf -> (edge, Utils.Leaf leaf)
			| Utils.Node (opeval, ident) -> match opeval with
				| None -> (edge, Utils.Node ident)
				| Some peval -> compose edge (rec_node peval ident)
		and     rec_node peval ident = apply (fun (peval, ident) ->
			map_node peval (M.M.pull man ident)
		) (peval, ident)
		and     map_node peval node = 
			match M.eval_node peval (Utils.pnode_of_node node) with
			| Utils.MEdge edge -> rec_edge edge
			| Utils.MNode (node, edge0, edge1) ->
				M.M.push man (node, rec_edge edge0, rec_edge edge1)
		in
		let map_edge peval edge = rec_edge (M.eval_edge peval (Utils.pedge_of_edge edge)) in
		{man; mem; rec_edge; rec_node; map_edge; map_node}

    let default_newman_hsize = 10000

    let newman man = makeman man default_newman_hsize

	let rec_edge man = man.rec_edge
	let rec_node man = man.rec_node
	let map_edge man = man.map_edge
	let map_node man = man.map_node

end

module type REWRITE_MODELE =
sig
	module M : PEVAL_SIG

	type leaf = M.M.M.M.M.leaf
	type edge = M.M.M.M.M.edge
	type node = M.M.M.M.M.node

	type ident = M.M.M.G.ident
	type next' = M.M.M.G.next'
	type edge' = M.M.M.G.edge'
	type node' = M.M.M.G.node'

	type next'' = M.M.next'
	type edge'' = M.M.edge'
	type node'' = M.M.node'
	type tree'' = (next'', edge, node) GTree.edge

	val rewrite : node'' -> tree''
end

module REWRITE(M0:REWRITE_MODELE) =
struct

	type manager = {
		man : M0.M.M.M.manager;
		memR : (M0.ident, M0.ident, M0.edge', Bitv.t) MemoBTable.t;
		memE : (M0.M.M.peval * M0.ident, Bitv.t, M0.edge', Bitv.t) MemoBTable.t;
		map : M0.M.M.peval option -> M0.edge' -> M0.edge';
	}

	let makeman man hsize =
		let dumpA x = x
		and loadA x = x
		and dumpB = BinDump.closure M0.M.M.M.G.dump_edge
		and loadB = BinLoad.closure M0.M.M.M.G.load_edge in
		let memR, applyR = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let dumpA = BinDump.closure (BinDump.pair M0.M.M.dump_peval M0.M.M.M.G.dump_ident)
		and loadA = BinLoad.closure (BinLoad.pair M0.M.M.load_peval M0.M.M.M.G.load_ident) in
		let memE, applyE = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let compose = M0.M.M.M.M.compose in	
		let push : M0.node' -> M0.edge' = M0.M.M.M.push man
		and pull : M0.ident -> M0.node' = M0.M.M.M.pull man in
		(* goup = go up *)
		let rec goup_edge ((edge, next) : M0.edge'') : bool * M0.edge'= match next with
			| Utils.Leaf leaf -> (false, (edge, Utils.Leaf leaf))
			| Utils.Node (opeval, ident) -> match opeval with
				| None -> (false, (edge, Utils.Node ident))
				| Some peval -> (true, compose edge (eval_ident peval ident))
		and     eval_ident peval ident : M0.edge' = applyE (fun (peval, ident) ->
			let node = pull ident in
			match M0.M.M.eval_node peval (Utils.pnode_of_node node) with
			| Utils.MEdge edge -> goup_edge edge |> snd
			| Utils.MNode node -> goup_node node
		) (peval, ident)
		and     goup_node (node, edge0, edge1) : M0.edge' =
			let t0, edge0 = goup_edge edge0
			and t1, edge1 = goup_edge edge1 in
			let node : M0.node' = (node, edge0, edge1) in
			if t0||t1
			then (rewr node)
			else (push node)
		and     rewr (node : M0.node') : M0.edge' = read_edge (M0.rewrite (Utils.pnode_of_node node))
		and     read_edge (edge, node) : M0.edge' = match node with
			| GTree.Leaf (next : M0.next'') -> goup_edge ((edge, next) : M0.edge'') |> snd
			| GTree.Node (node, edge0, edge1) ->
				goup_node (Utils.pnode_of_node (node, read_edge edge0, read_edge edge1))
		in
		let rec down_ident ident : M0.edge' = applyR (fun ident ->
			let (node, edge0, edge1) = pull ident in
			rewr (node, down_edge edge0, down_edge edge1)
		) ident
		and     down_edge ((edge, next) : M0.edge') : M0.edge' = match next with
			| Utils.Leaf leaf -> (edge, Utils.Leaf leaf)
			| Utils.Node ident -> compose edge (down_ident ident)
		in
		let map opeval edge : M0.edge' =
			let edge = match opeval with
				| None -> edge
				| Some peval -> goup_edge (M0.M.M.eval_edge peval (Utils.pedge_of_edge edge)) |> snd
			in
			down_edge edge
		in
		{man; memR; memE; map}
	
end
