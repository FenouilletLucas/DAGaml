open Utils

module type MODELE_SUBDAG = sig
	include Ubdag.HEADER
	type edge

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn
	type 't e = edge * 't gn

	val push : ('t -> 'i) -> 't e -> 't e -> ('t e, (edge * 't n)) merge
	val pull : ('t -> 'i) -> 't e -> ('t e, 't n) unmerge

	val pull_node : ('t -> 'i) -> 't n -> 't e * 't e
	val compose : ('t -> 'i) -> edge -> 't e -> 't e
	
end
module type MODULE_SUBDAG =
(* M = Modele *)
sig
	module M : MODELE_SUBDAG
	module G : Ubdag.MODULE_UBDAG with
			type H.node = M.node
		and type H.leaf = M.leaf 

	type edge = M.edge * G.tree

	type manager

	val newman : unit -> manager
	val makeman : int -> manager

	val push_leaf : M.edge -> M.leaf -> edge
	val pull_node : manager -> G.pnode -> edge * edge

	val push : manager -> edge -> edge -> edge
	val pull : manager -> edge -> edge *  edge
	val compose : M.edge -> edge -> edge
end

module SUBDAG(M0:MODELE_SUBDAG):MODULE_SUBDAG with
		type M.node = M0.node
	and type M.edge = M0.edge
	and type M.leaf = M0.leaf
=
(* M = Modele *)
struct
	module M = M0
	module G = Ubdag.UBDAG(M)
	
	type edge = M.edge * G.tree
	
	type manager = G.manager

	let newman = G.newman
	let makeman = G.makeman

	let push_leaf (e:M.edge) (l:M.leaf) = ((e, ((Utils.Leaf l):G.tree)):edge)
	let pull_node man (n:G.pnode) = M.pull_node G.get_ident (G.pull man n)

	let push man x y = match M.push G.get_ident x y with
		| MEdge e -> e
		| MNode (e, (n:G.node)) -> (e, Utils.Node (G.push man (n:G.node)))

	let pull man ((_, n)as e) = match M.pull G.get_ident e with
		| REdge (x, y) -> (x, y)
		| RNode f -> match n with
			| Utils.Leaf _ -> assert false
			| Utils.Node p -> f(G.pull man p)

	let compose = M.compose G.get_ident

	module type MODELE_IBOP =
	sig
		include Map.OrderedType
		(* t = compact *)
		type transform
		val compose : transform -> edge -> edge
		val  decomp : G.tree -> G.tree -> t -> edge * edge
		val  solver : edge * edge -> (edge, (transform * t)) Utils.merge
	end
	
	module IBOP(D0:MODELE_IBOP) =
	(* Internal Binary OPerator *)
	struct
		module MEMO0 = Ubdag.M0T(D0)
		module MEMO1 = G.M1T(D0)
		module MEMO2 = G.M2T(D0)
		type memo = {
			man  : manager;
			calc : edge -> edge -> edge;
			memo0		: edge MEMO0.manager;
			memo1_nl	: edge MEMO1.manager;
			memo1_ln	: edge MEMO1.manager;
			memo2		: edge MEMO2.manager;
		}
		
		let makeman man hsize=
			let memo = MEMO.makeman hsize in
			let apply = MEMO.apply memo in
			let push = push man
			and pull = pull man in
			let rec calc compact = apply	(fun tx ty compact ->
				let fx, fy = D0.decomp tx ty compact in
				let fx0, fx1 = pull fx
				and fy0, fy1 = pull fy in
				let f0 = match solver fx0 fy0 with
					| Utils.MEdge f -> f
					| Utils.MNode (t, c) -> D0.compose t (calc c)
				in
				let f1 = match solver fx1 fy1 with
					| Utils.MEdge f -> f
					| Utils.MNode (t, c) -> D0.compose t (calc c)
				in
				push f0 f1
											) compact
			in
		{
			man  = man;
			calc = (fun x y -> match solver x y with
				| Utils.MEdge z -> z
				| Utils.MNode (t, c) -> D0.compose t (calc c));
			memo = memo;
		}
	end
end

