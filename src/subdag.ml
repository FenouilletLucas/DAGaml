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
(*module type MODULE_SUBDAG =
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
*)
module SUBDAG(M0:MODELE_SUBDAG)
(*:MODULE_SUBDAG with
		type M.node = M0.node
	and type M.edge = M0.edge
	and type M.leaf = M0.leaf *)
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
		val  solver : edge * edge -> (edge, (transform * (t*G.tree*G.tree))) Utils.merge
	end
	
	module IBOP(D0:MODELE_IBOP) =
	(* Internal Binary OPerator *)
	struct
                type lld = (M.leaf * M.leaf) * D0.t
                module LLD : Map.OrderedType with type t = lld =
                struct
                        type t = lld
                        let compare (x, t) (x', t') = match Pervasives.compare x x' with 0 -> (D0.compare t t') | x -> x
                end
		module MEMO0 = Ubdag.M0T(LLD)
                type bld = (bool * M.leaf) * D0.t
                (* true = Node * Leaf, false = Leaf * Node *)
                module BLD : Map.OrderedType with type t = bld =
                struct
                        type t = bld
                        let compare (x, t) (x', t') = match Pervasives.compare x x' with 0 -> (D0.compare t t') | x -> x
                end
		module MEMO1 = G.M1T(BLD)
		module MEMO2 = G.M2T(D0)
		type memo = {
			man  : manager;
			calc : edge -> edge -> edge;
			memo0	: edge MEMO0.manager;
			memo1	: edge MEMO1.manager;
			memo2	: edge MEMO2.manager;
		}
		
		let makeman man hsize=
			let memo0  = MEMO0.makeman hsize in
			let apply0 = MEMO0.apply memo0 in
			let memo1  = MEMO1.makeman hsize in
			let apply1 = MEMO1.apply memo1 in
			let memo2  = MEMO2.makeman hsize in
			let apply2 = MEMO2.apply memo2 in
			let push = push man
			and pull = pull man in
                        let rec calcrec (x:edge) (y:edge) = match D0.solver (x, y) with
                        | Utils.MEdge f -> f
                        | Utils.MNode (t, (c, n1, n2)) -> D0.compose t (match n1, n2 with
                                | Leaf l1, Leaf l2 ->   apply0 fun0 ((l1, l2), c)
                                | Leaf (l:M.leaf ) , Node (n:G.pnode)  ->   apply1 fun1 n ((false, l), (c:D0.t))
                                | Node (n:G.pnode) , Leaf (l:M.leaf )  ->   apply1 fun1 n ((true,  l), c)
                                | Node n1, Node n2 ->   apply2 fun2 n1 n2 c
			)
                        and fun0 ((l1, l2), c) = calc c (Leaf l1) (Leaf l2)
                        and fun1 n ((b, l), c) = if b
                                then calc c (Node n) (Leaf l)
                                else calc c (Leaf l) (Node n)
                        and fun2 n n' c = calc c (Node n) (Node n')
                        and calc compact nx ny =
				let fx, fy = D0.decomp nx ny compact in
				let fx0, fx1 = pull fx
				and fy0, fy1 = pull fy in
				let f0 = calcrec fx0 fy0
				and f1 = calcrec fx1 fy1 in
				push f0 f1
			in
			{
				man  = man;
				calc = calcrec;
				memo0 = memo0;
				memo1 = memo1;
				memo2 = memo2;
			}, calcrec
		let newman man = makeman man 10000
		let calc man = man.calc
		let dump_stat man = Tree.Node [
			Tree.Node [Tree.Leaf "memo0:"; MEMO0.dump_stat man.memo0];
			Tree.Node [Tree.Leaf "memo1:"; MEMO1.dump_stat man.memo1];
			Tree.Node [Tree.Leaf "memo2:"; MEMO2.dump_stat man.memo2]
		]
	end
end

