module type MODELE =
sig
	module M : BinUbdag.MODELE

	val compose : M.edge -> 'i M.edge' -> 'i M.edge'

	val push_node : 'i UBDAG.node' -> UBDAG.edge * ('i next', 'i node') Utils.merge

end

module type MODULE_SIG =
sig
	module M : MODELE
	module G : BinUbdag.MODULE_SIG with
		    type M.leaf = M.leaf
		and type M.edge = M.edge
		and type M.node = M.node

	type manager

	val makeman : int -> manager
	val newman : unit -> manager

	val dump_stats : manager -> StrTree.tree

	val push : manager -> G.node' -> G.edge'
	val pull : manager -> G.ident -> G.node'
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
	
end

module type PEVAL_MODELE =
sig
	module M : MODULE_SIG

	type peval

	val dump_peval : peval Utils.dump
	val load_peval : peval Utils.load

	type next = peval option * M.G.ident

	type next' = next M.M.next'
	type edge' = next M.M.edge'
	type node' = next M.M.node'

	val eval_edge : peval -> edge' ->  edge'
	val eval_node : peval -> node' -> (edge', node') Utils.merge
	
end


module PEVAL(M:PEVAL_MODELE) =
struct
	
	type manager = {
		man : M.M.manager;
		mem : (M.peval * M.M.G.ident, Bitv.t, M.M.edge', Bitv.t) MemoBTable.t;
		rec_edge : M.edge' -> M.M.edge'
		rec_node : M.peval -> M.M.G.ident -> M.M.edge';
		map_edge : M.peval -> M.M.edge' -> M.M.edge';
		map_node : M.peval -> M.M.node' -> M.M.edge';
	}

	let makeman man hsize =
		let dumpA (peval, ident) =
			BinDump.pair M.dump_peval M.G.dump_ident [] |> Bitv.L.of_bool_list
		and loadA stream = stream
			|> Bitv.L.to_bool_list
			|> BinLoad.pair M.load_eval M.G.load_ident
			|> (fun (pair, stream) -> assert(stream=[]); pair)
		and dumpB = M.M.dump_edge
		and loadB = M.M.load_edge in
		let compose = M.M.M.compose in
		let mem, apply = MemoBTable.make dumpA loadB dumpB loadB hsize in
		let rec rec_edge  (edge, next) = match next with
			| Utils.Leaf leaf -> (edge, Utils.Leaf leaf)
			| Utils.Node (opeval, ident) -> match opeval with
				| None -> (edge, Utils.Node ident)
				| Some peval -> 
			| Utils.Node (Some peval, ident) -> compose edge (rec_node peval ident)
		and     rec_node peval ident = apply (fun (peval, ident) ->
			map_node peval (M.M.pull man ident)
		) (peval, ident)
		and     map_node peval node = 
			match M.eval_node peval node with
			| Utils.MEdge edge -> rec_edge edge
			| Utils.MNode (node, edge0, edge1) ->
				M.M.push man (node, rec_edge edge0, rec_edge edge1)
		in
		let map_edge peval edge = rec_edge (M.eval_edge edge) in
		{man; mem; rec_edge; rec_node; map_edge; map_node}

	let rec_edge man = man.rec_edge
	let rec_node man = man.rec_node
	let map_edge man = man.map_edge
	let map_node man = man.map_node

end

(*module type BIDIR =
sig
	
end*)
