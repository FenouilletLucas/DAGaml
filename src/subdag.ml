open Utils

module type MODELE = sig
	type leaf
	type edge
	type node

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn
	type 't e = edge * 't gn

	val push : ('t -> 'i) -> 't e -> 't e -> ('t e, (edge * 't n)) merge
	val pull : ('t -> 'i) -> 't e -> ('t e, 't n) unmerge

	val pull_node : ('t -> 'i) -> 't n -> 't e * 't e
	val compose : ('t -> 'i) -> edge -> 't e -> 't e	
	
	val dump_leaf : (leaf -> StrTree.tree) option
	val load_leaf : (StrTree.tree -> 't e) option
	val dot_of_leaf : (leaf -> string) option

	val dump_edge : (edge -> StrTree.tree) option
	val load_edge : (StrTree.tree -> edge) option
	val dot_of_edge : (edge -> string) option
	
	val dump_node : (node -> StrTree.tree) option
	val load_node : (StrTree.tree -> node) option
	val dot_of_node : (int -> node -> string) option

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


module MODULE(M0:MODELE)
(*:MODULE_SUBDAG with
		type M.node = M0.node
	and type M.edge = M0.edge
	and type M.leaf = M0.leaf *)
=
(* M = Modele *)
struct
	module M = M0
	module MODELE =
	struct
		type leaf = M0.leaf
		type edge = M0.edge
		type node = M0.node

		type 't gn = (leaf, 't) Utils.gnode
		type 't n = node * 't gn * 't gn
		type 't e = edge * 't gn

		let push = M0.push
		let pull = M0.pull
		let pull_node = M0.pull_node
		let compose = M0.compose
		
		let dump_leaf = None
		let load_leaf = None
		let dot_of_leaf = None

		let dump_edge = None
		let load_edge = None
		let dot_of_edge = None
		
		let dump_node = None
		let load_node = None
		let dot_of_node = None

	end
	module G = Ubdag.UBDAG(MODELE)
	
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
		| MEdge (x, y) -> (x, y)
		| MNode f -> match n with
			| Utils.Leaf _ -> assert false
			| Utils.Node p -> f(G.pull man p)

	let compose = M.compose G.get_ident

	module MEdge =
	struct
		module D0 =
		struct
			type t = M.edge * M.leaf
			let compare = Pervasives.compare
		end

		module M0 = Ubdag.M0T(D0)

		module D1 =
		struct
			type t = M.edge
			let compare = Pervasives.compare
		end
		module M1 = G.M1T(D1)

		type 'a manager =
		{
			man_leaf : 'a M0.manager;
			man_node : 'a M1.manager;
		}

		let makeman man hsize =
		{
			man_leaf = M0.makeman hsize;
			man_node = M1.makeman hsize;
		}

		let newman man = makeman man 10000
		
		let dump_stat man = Tree.Node [
			Tree.Node [Tree.Leaf "memo leaf:"; M0.dump_stat man.man_leaf];
			Tree.Node [Tree.Leaf "memo node:"; M1.dump_stat man.man_node];
		]

		let apply man func (edge, gnode) = match gnode with
			| Utils.Leaf leaf ->
			(
				M0.apply man.man_leaf (fun (edge, leaf) -> func (edge, Utils.Leaf leaf)) (edge, leaf)
			)
			| Utils.Node node ->
			(
				M1.apply man.man_node (fun node edge -> func (edge, Utils.Node node)) (node:G.pnode) (edge:M.edge)
			)
	end

	module type MODELE_NODE_VISITOR =
	sig
		type xnode
		type xedge
		type extra

		val do_leaf : extra -> M.leaf -> xnode 
		val do_node : extra -> G.node -> (xnode, xnode -> xnode -> xnode) Utils.merge
		val do_edge : extra -> M.edge -> xnode -> xedge

	end
	
	module type MODELE_EDGE_VISITOR =
	sig
		type xedge
		type extra

		val do_leaf: extra -> M.edge -> M.leaf -> xedge
		val do_node: extra -> M.edge -> (xedge, (xedge -> xedge -> xedge)) Utils.merge
	end


	module EDGE_VISITOR(D0:MODELE_EDGE_VISITOR) =
	struct
		
		type eleaf = M.edge * M.leaf
		module ELeaf : Map.OrderedType with
			type t = eleaf
		=
		struct
			type t = eleaf
			let compare = Pervasives.compare
		end

		module MEL = Ubdag.M0T(ELeaf)

		module ENode : Map.OrderedType with
			type t = M.edge
		=
		struct
			type t = M.edge
			let compare = Pervasives.compare
		end

		module MEN = G.M1T(ENode)
		
		type memo = {
			man     : manager;
			extra   : D0.extra;
			calc    : edge -> D0.xedge;
			memo0	: D0.xedge MEL.manager;
			memo1	: D0.xedge MEN.manager;
		}
		
		let makeman man extra hsize=
			let memo0  = MEL.makeman hsize in
			let apply0 = MEL.apply memo0 in
			let memo1  = MEN.makeman hsize in
			let apply1 = MEN.apply memo1 in
			let rec calcrec (edge, gnode) = match gnode with
				| Utils.Leaf leaf -> apply0 fun0 (edge, leaf)
				| Utils.Node node -> apply1 fun1 node edge
			and fun0 (edge, leaf) = D0.do_leaf extra edge leaf
			and fun1 node edge = match D0.do_node extra edge with
				| Utils.MEdge xedge -> xedge
				| Utils.MNode merger ->
				(
					let edge0, edge1 = pull_node man node in
					merger (calcrec edge0) (calcrec edge1)
				)
			in
			({
				man  = man;
				extra = extra;
				calc = calcrec;
				memo0 = memo0;
				memo1 = memo1;
			}, calcrec)

		let newman man extra = makeman man extra 10000
		let calc man = man.calc
		let dump_stat man = Tree.Node [
			Tree.Node [Tree.Leaf "man edge leaf:"; MEL.dump_stat man.memo0];
			Tree.Node [Tree.Leaf "man edge node:"; MEN.dump_stat man.memo1];
		]
		
	end

	module type MODELE_EUOP =
	(* External Unary OPerator *)
	sig
		include Map.OrderedType
		(* t = compact *)
		type transform
		type extern
		type t1
		type t2
		type extra
		val compose : extra -> transform -> extern -> extern
		val  decomp : extra -> G.tree -> t -> t1 * t2 * edge
		val  solver : extra -> t2 -> edge  -> (extern, (transform * (t * G.tree))) Utils.merge
		val  merger : extra -> t1 -> extern -> extern -> extern
	end
	
	module EUOP(D0:MODELE_EUOP) =
	(* External Unary OPerator *)
	struct
		type ld = M.leaf * D0.t
		module BLD : Map.OrderedType with
			type t = ld
		=
		struct
			type t = ld
			let compare (x, t) (x', t') = match Pervasives.compare x x' with 0 -> (D0.compare t t') | x -> x
		end
		module MEMO0 = Ubdag.M0T(BLD)
		
		module MEMO1 = G.M1T(D0)
		type memo = {
			man  : manager;
			extra : D0.extra;
			calc : D0.t2 -> edge -> D0.extern;
			memo0	: D0.extern MEMO0.manager;
			memo1	: D0.extern MEMO1.manager;
		}
		
		let makeman man extra hsize=
			let memo0  = MEMO0.makeman hsize in
			let apply0 : (ld -> D0.extern) -> ld -> D0.extern = MEMO0.apply memo0 in
			let memo1  = MEMO1.makeman hsize in
			let apply1 = MEMO1.apply memo1
			and pull = pull man in
			let rec calcrec t2 x = match D0.solver extra t2 x with
			| Utils.MEdge f -> f
			| Utils.MNode (t, (c, n)) -> D0.compose extra t (match n with
				| Leaf (l:M.leaf) -> (((apply0:(ld->D0.extern)->ld->D0.extern) (fun0:ld->D0.extern) ((l, c):ld)):D0.extern)
				| Node (n:G.pnode) -> (apply1 fun1 (n:G.pnode) c))
			and fun0 ((l, c):ld) = calc c (Leaf l)
			and fun1 n c = calc c (Node n)
			and calc compact node =
				let (t1:D0.t1), (t2:D0.t2), (edge:edge) = D0.decomp extra node compact in
				let f0, f1 = pull edge in
				((D0.merger extra t1 (calcrec t2 f0) (calcrec t2 f1)):D0.extern)
			in
			({
				man  = man;
				extra = extra;
				calc = calcrec;
				memo0 = memo0;
				memo1 = memo1;
			}, calcrec)

		let newman man extra = makeman man extra 10000
		let calc man = man.calc
		let dump_stat man = Tree.Node [
			Tree.Node [Tree.Leaf "memo0:"; MEMO0.dump_stat man.memo0];
			Tree.Node [Tree.Leaf "memo1:"; MEMO1.dump_stat man.memo1];
		]
		
	end

	module MODELE_DUMP : MODELE_EDGE_VISITOR with
			type xedge = Udag.StrTree.edge_t
		and type extra = Udag.StrTree.manager
	=
	struct
		type xedge = Udag.StrTree.edge_t
		type extra = Udag.StrTree.manager
		
		let dump_edge = match M.dump_edge with
			| None -> (fun _ -> Tree.Node [])
			| Some x -> x
		and dump_leaf = match M.dump_leaf with
			| None -> (fun _ -> Tree.Node [])
			| Some x -> x

		let do_leaf extra edge leaf =
			((dump_edge edge, Udag.StrTree.Leaf (dump_leaf leaf)):Udag.StrTree.edge_t)

		let do_node extra edge =
			let merger edge0 edge1 =
				((dump_edge edge, Udag.StrTree.NodeRef (Udag.StrTree.push extra (Tree.Node [], [edge0; edge1]))):Udag.StrTree.edge_t)
			in ((Utils.MNode merger):(xedge, (xedge -> xedge -> xedge))Utils.merge)

	end

	module DUMP = EDGE_VISITOR(MODELE_DUMP)

	let dump man dump_man =
		let man, calc = DUMP.makeman man dump_man 10000 in
		List.map calc
	
	module MODELE_LOAD : Udag.StrTree.MODELE_VISITOR with
			type xedge = edge
		and type xnode = edge
		and type extra = manager
	=
	struct
		type xedge = edge
		type xnode = edge
		type extra = manager

		let load_leaf = match M.load_leaf with
			| None -> (fun _ -> assert false)
			| Some f -> f

		let load_edge = match M.load_edge with
			| None -> (fun _ -> assert false)
			| Some f -> f

		let do_leaf _ leaf = load_leaf leaf
		let do_edge _ edge xnode = compose (load_edge edge) xnode
		let do_node man node xedgelist = match node, xedgelist with
			| (Tree.Node []), [edge0; edge1] -> push man edge0 edge1
			| _ -> assert false
	end

	module LOAD = Udag.StrTree.VISITOR(MODELE_LOAD)

	let load man dump_man =
		let man, calc = LOAD.newman dump_man man in
		List.map calc

	module type MODELE_IUOP =
	sig
		include Map.OrderedType
		(* t = compact *)
		type transform
		type t1
		type t2
		val compose : transform -> edge -> edge
		val  decomp : G.tree -> t -> t1 * t2 * edge
		val  solver : t2 -> edge -> (edge, (transform * (t*G.tree))) Utils.merge
		val  merger : t1 -> edge -> edge -> edge
	end


	module IUOP(D0:MODELE_IUOP) =
	(* Internal Unary OPerator *)
	struct
		module MY_MODELE_EUOP : MODELE_EUOP with
				type t = D0.t
			and type transform = D0.transform
			and type extern = edge
			and type t1 = D0.t1
			and type t2 = D0.t2
			and type extra = unit
		=
		struct
			type t = D0.t
			let compare = D0.compare
			type transform = D0.transform
			type extern = edge
			type t1 = D0.t1
			type t2 = D0.t2
			type extra = unit
			let compose () = D0.compose
			let  decomp () = D0.decomp
			let  solver () = D0.solver
			let  merger () = D0.merger
		end

		module MY_EUOP = EUOP(MY_MODELE_EUOP)

		type memo = MY_EUOP.memo

		let makeman	man = MY_EUOP.makeman man (():MY_MODELE_EUOP.extra)
		let newman man	= MY_EUOP.newman man ()
		let dump_stat	= MY_EUOP.dump_stat
		let calc		= MY_EUOP.calc
	end
			

	module type MODELE_IBOP =
	(* Internal Binary OPerator *)
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
					| Node n1, Node n2 ->   apply2 fun2 n1 n2 c)
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
