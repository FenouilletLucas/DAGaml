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

    let dump_stats man = G.dump_stats

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

module IBOP(M0:BINOP_MODELE) =
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
