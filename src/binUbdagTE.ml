module type MODELE =
sig
	module M : BinUbdag.MODELE

	type peval

	val dump_peval : peval Utils.dump
	val load_peval : peval Utils.load

	type 'i link = peval option * 'i
	type 'i next'' = 'i link M.next'
	type 'i edge'' = 'i link M.edge'
	type 'i node'' = 'i link M.node'
	type 'i tree'' = ('i next'', M.edge, M.node) GTree.edge

	val eval_edge : peval -> 'i edge'' ->  'i edge''
	val eval_node : peval -> 'i node'' -> ('i edge'', 'i node'') Utils.merge

	val push_node : 'i node'' -> 'i tree''

	val compose : M.edge -> 'i M.edge' -> 'i M.edge'

end

module type MODULE_SIG =
sig
	module M : MODELE
	module G : BinUbdag.MODULE_SIG with
		    type M.leaf = M.M.leaf
		and type M.edge = M.M.edge
		and type M.node = M.M.node

	type link = M.peval option * G.ident
	type next'' = G.ident M.next''
	type edge'' = G.ident M.edge''
	type node'' = G.ident M.node''
	type tree'' = G.ident M.tree''

	type manager

	val makeman : int -> manager
	val newman : unit -> manager

	val dump_stats : manager -> StrTree.tree

	val push : manager -> G.node' -> G.edge'
	val pull : manager -> G.ident -> G.node'

	val dump : manager -> G.edge' -> StrTree.tree
	val load : StrTree.tree  -> manager * G.edge'

	val eval : manager -> M.peval -> G.edge' -> G.edge'
end

module MODULE(M0:MODELE) =
struct
	module M = M0
	module G = BinUbdag.MODULE(M0.M)

	type link = M.peval option * G.ident
	type next'' = G.ident M.next''
	type edge'' = G.ident M.edge''
	type node'' = G.ident M.node''
	type tree'' = G.ident M.tree''

    type manager = {
		man : G.manager;
		mem : (M.peval * G.ident, Bitv.t, G.edge', Bitv.t) MemoBTable.t;
		eval : M.peval -> G.edge' -> G.edge';
		push : G.node' -> G.edge';
	}

	let makeman hsize =
		let man = G.makeman hsize in
		let dumpA = BinDump.closure (BinDump.pair M.dump_peval G.dump_ident)
		and loadA = BinLoad.closure (BinLoad.pair M.load_peval G.load_ident)
		and dumpB = G.push_edge
		and loadB = G.pull_edge in
		let mem, apply = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let rec push node : G.edge' = read_edge (M.push_node (Utils.pnode_of_node node))
		and     eval peval (edge : G.edge') : G.edge' =
			goup_edge' (M.eval_edge peval (Utils.pedge_of_edge edge))
		and     goup_edge ((edge, next) : edge'') : bool * G.edge' = match next with
			| Utils.Leaf leaf -> (false, (edge, Utils.Leaf leaf))
			| Utils.Node (opeval, ident) -> match opeval with
				| None -> (false, (edge, Utils.Node ident))
				| Some peval -> (true, M.compose edge (eval_ident peval ident))
		and     goup_edge' edge : G.edge' = goup_edge edge |> snd
		and     eval_ident peval ident = apply (fun (peval, ident) ->
			let node = G.pull man ident |> Utils.pnode_of_node in
			match M.eval_node peval node with
			| Utils.MEdge edge -> goup_edge' edge
			| Utils.MNode (node, edge0, edge1) ->
				push (node, goup_edge' edge0, goup_edge' edge1)
		) (peval, ident)
		and     goup_node edge (node, edge0, edge1) =
			let t0, edge0 = goup_edge edge0
			and t1, edge1 = goup_edge edge1 in
			let node = (node, edge0, edge1) in
			if t0||t1
			then (M.compose edge (push node))
			else (edge, Utils.Node (G.push man node))
		and     read_edge (edge, next) = match next with
			| GTree.Leaf next -> goup_edge' (edge, next)
			| GTree.Node node -> goup_node   edge (read_node node |> Utils.pnode_of_node)
		and     read_node (node, edge0, edge1) =
			(node, read_edge edge0, read_edge edge1)
		in
		{man; mem; push; eval}

    let default_newman_hsize = 10000

    let newman () = makeman default_newman_hsize

    let dump_stat man = Tree.Node [
		G.dump_stat man.man;
		MemoBTable.dump_stat man.mem;
	]

	let push man = man.push
	let pull man ident = G.pull man ident

	let dump = G.dump
	let load = G.load

	let eval man = man.eval
	
end

module type REWRITE_MODELE =
sig
	module M : MODULE_SIG

	type leaf = M.M.M.leaf
	type edge = M.M.M.edge
	type node = M.M.M.node

	type ident = M.G.ident
	type next' = M.G.next'
	type edge' = M.G.edge'
	type node' = M.G.node'

	type next'' = M.next''
	type edge'' = M.edge''
	type node'' = M.node''
	type tree'' = M.tree''

	val rewrite : node'' -> tree''
end

module REWRITE(M0:REWRITE_MODELE) =
struct

	type manager = {
		man : M0.M.manager;
		memR : (M0.ident, M0.ident, M0.edge', Bitv.t) MemoBTable.t;
		memE : (M0.M.M.peval * M0.ident, Bitv.t, M0.edge', Bitv.t) MemoBTable.t;
		map : M0.M.M.peval option -> M0.edge' -> M0.edge';
	}

	let makeman man hsize =
		let dumpA x = x
		and loadA x = x
		and dumpB = BinDump.closure M0.M.G.dump_edge
		and loadB = BinLoad.closure M0.M.G.load_edge in
		let memR, applyR = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let dumpA = BinDump.closure (BinDump.pair M0.M.M.dump_peval M0.M.G.dump_ident)
		and loadA = BinLoad.closure (BinLoad.pair M0.M.M.load_peval M0.M.G.load_ident) in
		let memE, applyE = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let compose = M0.M.M.compose in	
		let push : M0.node' -> M0.edge' = M0.M.push man
		and pull : M0.ident -> M0.node' = M0.M.pull man in
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
