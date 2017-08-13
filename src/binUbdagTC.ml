module type MODELE =
sig
	module M : BinUbdag.MODELE with
		type node = unit

	val push_node : 'i M.node' -> M.edge * ('i M.next', 'i M.node') Utils.merge
	val pull_node : 'i M.edge' -> ('i M.node', 'i * ('i M.node' -> 'i M.node')) Utils.merge

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
	val pull : manager -> G.edge' -> G.node'

	val export : manager -> G.manager
end

module MODULE(M0:MODELE) =
struct
	module M = M0
	module G = BinUbdag.MODULE(M0.M)

	type manager = G.manager

    let makeman = G.makeman

    let default_newman_hsize = 10000

    let newman () = makeman default_newman_hsize

    let dump_stats = G.dump_stats

	let push man node' =
		let edge, merge = M0.push_node node' in
		(edge, match merge with
		| Utils.MEdge next' -> next'
		| Utils.MNode node' -> Utils.Node (G.push man node'))
	let pull man edge' =
		match M0.pull_node edge' with
		| Utils.MEdge node' -> node'
		| Utils.MNode (ident, func) -> func (G.pull man ident)

	let dump = G.dump
	let load = G.load

	let export man = man
	
end

module type BINOP_MODELE =
sig
	module M : MODULE_SIG
	
	val solver : M.G.node' -> M.M.M.edge * (M.G.next', M.G.node', M.G.node') Utils.merge3

end

module BINOP(M0:BINOP_MODELE) =
struct
	
	module M = M0

	type manager = {
		man : M0.M.manager;
		mem : (M0.M.G.node', Bitv.t, M0.M.G.edge', Bitv.t) MemoBTable.t;
		map : M0.M.G.node' -> M0.M.G.edge';
	}

	let makeman man hsize =
		let dumpA = M0.M.G.push_node'
		and loadA = M0.M.G.pull_node'
		and dumpB = M0.M.G.push_edge'
		and loadB = M0.M.G.pull_edge' in
		let mem, apply = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let push = M0.M.push man
		and pull = M0.M.pull man
		and compose = M0.M.M.compose in
		let rec calcrec ((), edge'X, edge'Y) =
			let edge, merge3 = M0.solver ((), edge'X, edge'Y) in
			match merge3 with
			| Utils.M3Edge next' -> (edge, next')
			| Utils.M3Cons node' -> compose edge (push node')
			| Utils.M3Node node' -> compose edge (apply (fun ((), edgeX, edgeY) ->
				let ((), edgeX0, edgeX1) = pull edgeX
				and ((), edgeY0, edgeY1) = pull edgeY in
				let edge'0 = calcrec ((), edgeX0, edgeY0)
				and edge'1 = calcrec ((), edgeX1, edgeY1) in
				push ((), edge'0, edge'1) ) node')
		in {man; mem; map = calcrec}

    let default_newman_hsize = 10000

    let newman man = makeman man default_newman_hsize

    let dump_stats man = MemoBTable.dump_stats man.mem

	let map man = man.map
	
end

module type PEVAL_MODELE =
sig
	module M : MODULE_SIG

	type peval

	val dump_peval : peval BinUtils.dump
	val load_peval : peval BinUtils.load

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
		and dumpB = BinDump.closure M.M.G.dump_edge'
		and loadB = BinLoad.closure M.M.G.load_edge' in
		let compose = M.M.M.compose in
		let pull =
			let man = M.M.export man in
			M.M.G.pull man
		in
		let mem, apply = MemoBTable.make dumpA loadA dumpB loadB hsize in
		let rec rec_edge  (edge, next) = match next with
			| Utils.Leaf leaf -> (edge, Utils.Leaf leaf)
			| Utils.Node (opeval, ident) -> match opeval with
				| None -> (edge, Utils.Node ident)
				| Some peval -> compose edge (rec_node peval ident)
		and     rec_node peval ident = apply (fun (peval, ident) ->
			map_node peval (pull ident)
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

module IMPORT(M0:MODULE_SIG) =
struct
	module G = M0

	module MODELE =
	struct
		module M = G.G

		type extra  = G.manager
		type xnode  = M.edge'
		type xnode' = Bitv.t
		type xedge  = M.edge'

		let dump_xnode = M.push_edge'
		let load_xnode = M.pull_edge'

		type next' = (unit -> xnode) M.M.next'
		type edge' = (unit -> xnode) M.M.edge'
		type node' = (unit -> xnode) M.M.node'

		let rec_edge (edge, next) = match next with
			| Utils.Leaf leaf -> (edge, Utils.Leaf leaf)
			| Utils.Node node -> G.M.compose edge (node())

		let map_node man (node, edge0, edge1) =
			G.push man (node, rec_edge edge0, rec_edge edge1)

		let map_edge man edge = rec_edge edge
		
	end

	include BinUbdag.EXPORT(MODELE)

end

module STDIO(M1:MODELE) =
struct
	module G1 = MODULE(M1)
	module G0 = G1.G

	module REMAN = BinUbdag.REMAN(G0)

	let dumpfile man edges target =
		let ubdag = G1.export man in
		let ubdag' = G0.newman () in
		let man = REMAN.newman ubdag ubdag' in
		let map = REMAN.map_edge man in
		let edges' = List.map map edges in
		let stree = G0.dump ubdag' edges' in
		StrTree.dumpfile [stree] target

	module IMPORT = IMPORT(G1)
	
	let loadfile target =
		let ubdag', edges' = match StrTree.loadfile target with
			| [objet] -> G0.load objet
			| _ -> assert false
		in
		let grobdd = G1.newman () in
		let man = IMPORT.newman ubdag' grobdd in
		let map = IMPORT.rec_edge man in
		let edges = List.map map edges' in
		(grobdd, edges)
end


(*
module PEVAL(M:PEVAL_MODELE) =
struct
	
	type manager = {
		man : M.M.manager;
		mem : (M.peval * M.M.G.ident, Bitv.t, M.M.edge', Bitv.t) MemoBTable.t;
		map : M.peval -> M.M.edge' -> M.M.edge';
	}

	let makeman man hsize =
		let mem, apply = 


	
	
end
*)

(*module type BIDIR =
sig
	
end*)
