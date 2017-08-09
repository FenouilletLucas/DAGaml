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
		let dumpA (peval, ident) : Bitv.t =
			BinDump.pair M.dump_peval M.M.G.dump_ident (peval, ident) [] |> Bitv.L.of_bool_list
		and loadA (stream : Bitv.t) = stream
			|> Bitv.L.to_bool_list
			|> BinLoad.pair M.load_peval M.M.G.load_ident
			|> (fun (pair, stream) -> assert(stream=[]); pair)
		and dumpB edge = M.M.G.dump_edge edge [] |> Bitv.L.of_bool_list
		and loadB stream = stream
			|> Bitv.L.to_bool_list
			|> M.M.G.load_edge
			|> (fun (edge, stream) -> assert(stream=[]); edge)
		 in
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

	type next' = M.M.next'
	type edge' = M.M.edge'
	type node' = M.M.node'
	type tree' = (next', edge, node) GTree.edge

	val dump_node : node' Utils.dump
	val load_node : node' Utils.load

	val dump_tree : tree' Utils.dump
	val load_tree : tree' Utils.load

	val rewrite : node' -> tree'
end

module REWRITE(M0:REWRITE_MODELE) =
struct

	type manager = {
		man : M0.M.M.M.manager;
		mem : (M0.node', Bitv.t, M0.tree', Bitv.t) MemoBTable.t;
		map : M0.M.M.M.G.edge' -> M0.M.M.M.G.edge';
	}

	let makeman man hsize =
		let dumpA = BinDump.closure M0.dump_node
		and loadA = BinLoad.closure M0.load_node
		and dumpB = BinDump.closure M0.dump_tree
		and loadB = BinLoad.closure M0.load_tree in
		let mem, apply = MemoBTable.make dumpA loadA dumpB loadB hsize in
		()
	
end
