module type MODELE = sig
	type leaf
	type edge
	type node
	type tag

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn
	type 't e = edge * 't gn

	val push : ('t -> 'i) -> tag -> 't e -> 't e -> ('t e, (edge * 't n)) Utils.merge
	val pull : ('t -> 'i) -> 't e -> (tag, 't e, 't n) Utils.unmerge_tagged

	val pull_node : ('t -> 'i) -> 't n -> tag * 't e * 't e
	val compose : edge -> 't e -> 't e	
	
	val dump_leaf : (leaf -> StrTree.tree) option
	val load_leaf : (StrTree.tree -> 't e) option
	val dot_of_leaf : (leaf -> string) option

	val dump_edge : (edge -> StrTree.tree) option
	val load_edge : (StrTree.tree -> edge) option
	val dot_of_edge : (edge -> string) option
	
	val dump_node : (node -> StrTree.tree) option
	val load_node : (StrTree.tree -> tag * edge * edge) option
	val dot_of_node : (int -> node -> string) option

	val dot_of_tag : (tag -> string) option

end



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

	let push man tag x y = match M.push G.get_ident tag x y with
		| Utils.MEdge e -> e
		| Utils.MNode (e, (n:G.node)) -> (e, Utils.Node (G.push man n))

	let pull man ((_, n)as e) = match M.pull G.get_ident e with
		| Utils.MEdge (t, x, y) -> (t, x, y)
		| Utils.MNode f -> match n with
			| Utils.Leaf _ -> assert false
			| Utils.Node p -> f(G.pull man p)

	let compose = M.compose

	let dump_stat = G.dump_stat
	

	module type MODELE_NODE_VISITOR =
	sig
		type xnode
		type xedge
		type extra

		val do_leaf : extra -> M.leaf -> xnode 
		val do_node : extra -> M.node -> (xnode, xnode -> xnode -> xnode) Utils.merge
		val do_edge : extra -> M.edge -> xnode -> xedge

	end
	

	module NODE_VISITOR(D0:MODELE_NODE_VISITOR)=
	struct
		type memo = {
			man  : manager;
			extra : D0.extra;
			calc : edge -> D0.xedge;
			memoLeaf: (M.leaf,  D0.xnode) MemoTable.t;
			memoEdge: (edge,    D0.xedge) MemoTable.t;
			memoNode: (G.pnode, D0.xnode) MemoTable.t;
		}

		type manager = memo
		
		let makeman man extra hsize =
			let memoLeaf, applyLeaf = MemoTable.make hsize
			and memoEdge, applyEdge = MemoTable.make hsize
			and memoNode, applyNode = MemoTable.make hsize in
			let rec calcrec = function
				| Utils.Leaf leaf -> calcleaf leaf
				| Utils.Node node -> calcnode node
			and		calcedge edge = applyEdge (fun (edge, gnode) -> D0.do_edge extra edge (calcrec gnode)) edge
			and		calcleaf leaf = applyLeaf (D0.do_leaf extra) leaf
			and		calcnode node = applyNode (fun node ->
				let (node:M.node), (nx:G.tree), (ny:G.tree) = G.pull man node in
				match D0.do_node extra node with
				| Utils.MEdge xnode -> xnode
				| Utils.MNode merger -> merger (calcrec nx) (calcrec ny)) node
			in
			{
				man  = man;
				extra = extra;
				calc = calcedge;
				memoLeaf = memoLeaf;
				memoEdge = memoEdge;
				memoNode = memoNode;
			}, calcedge
		let newman man extra = makeman man extra 10000
		let calc man = man.calc
		let dump_stat man = Tree.Node [
			Tree.Node [Tree.Leaf "memo leaf:"; MemoTable.dump_stat man.memoLeaf];
			Tree.Node [Tree.Leaf "memo edge:"; MemoTable.dump_stat man.memoEdge];
			Tree.Node [Tree.Leaf "memo node:"; MemoTable.dump_stat man.memoNode]
		]
	end

	module type MODELE_EDGE_VISITOR =
	sig
		type xedge
		type extra

		val do_leaf: extra -> M.edge -> M.leaf -> xedge
		val do_node: extra -> M.edge -> (xedge, (M.tag -> xedge -> xedge -> xedge)) Utils.merge
	end


	module EDGE_VISITOR(D0:MODELE_EDGE_VISITOR) =
	struct
		
		type memo = {
			man     : manager;
			extra   : D0.extra;
			calc    : edge -> D0.xedge;
			memo0	: (M.edge * M.leaf, D0.xedge) MemoTable.t;
			memo1	: (M.edge * G.pnode, D0.xedge) MemoTable.t;
		}

		type manager = memo
		
		let makeman man extra hsize=
			let memo0, apply0 = MemoTable.make hsize
			and memo1, apply1 = MemoTable.make hsize in
			let rec calcrec (edge, gnode) = match gnode with
				| Utils.Leaf leaf -> apply0 fun0 (edge, leaf)
				| Utils.Node node -> apply1 fun1 (edge, node)
			and fun0 (edge, leaf) = D0.do_leaf extra edge leaf
			and fun1 (edge, node) = match D0.do_node extra edge with
				| Utils.MEdge xedge -> xedge
				| Utils.MNode merger ->
				(
					let tag, edge0, edge1 = pull_node man node in
					merger tag (calcrec edge0) (calcrec edge1)
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
			Tree.Node [Tree.Leaf "man edge leaf:"; MemoTable.dump_stat man.memo0];
			Tree.Node [Tree.Leaf "man edge node:"; MemoTable.dump_stat man.memo1];
		]
		
	end

	module MODELE_DUMP_NODE : MODELE_NODE_VISITOR with
			type xnode = Udag.StrTree.next_t
		and type xedge = Udag.StrTree.edge_t
		and type extra = Udag.StrTree.manager

	=
	struct
		type xnode = Udag.StrTree.next_t
		type xedge = Udag.StrTree.edge_t
		type extra = Udag.StrTree.manager

		let dump_leaf = match M.dump_leaf with
			| Some f -> f
			| None -> (fun _ -> assert false)

		let dump_node = match M.dump_node  with
			| Some f -> f
			| None -> (fun _ -> assert false)

		let dump_edge = match M.dump_edge with
			| Some f -> f
			| None -> (fun _ -> assert false)

		let do_leaf extra leaf = Utils.Leaf (dump_leaf leaf)
		let do_node extra node : (xnode, xnode -> xnode -> xnode) Utils.merge =
			let node = dump_node node in
			Utils.MNode(fun son0 son1 -> Utils.Node (Udag.StrTree.push extra (node, [(Tree.Node[], son0); (Tree.Node[], son1)])))

		let do_edge (extra:extra) edge son = (Tree.Node [dump_edge edge], son)

	end

	(* module DUMP_EDGE = NODE_VISITOR(MODELE_DUMP_EDGE) *)
	module DUMP_NODE = NODE_VISITOR(MODELE_DUMP_NODE)

	let dump man dump_man : edge list -> MODELE_DUMP_NODE.xedge list =
		let man, calc = DUMP_NODE.makeman man dump_man 10000 in
		List.map calc

	module MODELE_TO_DOT_EDGE : MODELE_EDGE_VISITOR with
			type xedge = Udag.String.edge_t
		and type extra = Udag.String.manager
	=
	struct
		type xedge = Udag.String.edge_t
		type extra = Udag.String.manager
		
		let dump_edge = match M.dot_of_edge with
			| None -> (fun _ -> "")
			| Some x -> x
		and dump_leaf = match M.dot_of_leaf with
			| None -> (fun _ -> "")
			| Some x -> x
		and dump_tag = match M.dot_of_tag with
			| None -> (fun _ -> "")
			| Some x -> x

		let do_leaf extra edge leaf =
			((dump_edge edge, Utils.Leaf (dump_leaf leaf)):Udag.String.edge_t)

		let do_node extra edge =
			let merger tag edge0 edge1 =
				((dump_edge edge, Utils.Node (Udag.String.push extra ((None, dump_tag tag), [edge0; edge1]))):Udag.String.edge_t)
			in ((Utils.MNode merger):(xedge, (M.tag -> xedge -> xedge -> xedge))Utils.merge)

	end
	
	module TO_DOT_EDGE = EDGE_VISITOR(MODELE_TO_DOT_EDGE)
	
	let to_dot man strman : edge list -> MODELE_TO_DOT_EDGE.xedge list =
		let man, calc = TO_DOT_EDGE.makeman man strman 10000 in
		List.map calc
	


	module MODELE_LOAD_NODE : Udag.StrTree.MODELE_VISITOR with
			type xedge = edge
		and type xnode = edge
		and type extra = manager
	=
	struct
		type xedge = edge
		type xnode = edge
		type extra = manager

		let unop default = function Some x -> x | None -> default

		let load_leaf = unop (fun _ -> assert false) M.load_leaf
		let load_edge = unop (fun _ -> assert false) M.load_edge
		let load_node = unop (fun _ -> assert false) M.load_node

		let do_leaf _ leaf = load_leaf leaf
		let do_edge _ = function
			| Tree.Node [] -> (fun xnode -> xnode)
			| Tree.Node [edge] -> (fun xnode -> compose (load_edge edge) xnode)
			|  _ -> assert false
		let do_node man node xedgelist =
			let tag, edgex, edgey = load_node node in
			match xedgelist with
			| [edge0; edge1] -> push man tag (compose edgex edge0) (compose edgey edge1)
			| _ -> assert false
	end

	module LOAD = Udag.StrTree.VISITOR(MODELE_LOAD_NODE)

	let load man dump_man =
		let man, calc = LOAD.newman dump_man man in
		List.map calc
	
	module type MODELE_IUOP =
	sig
		type eval

		val eval : eval -> edge -> (
			edge,
			M.edge * (eval * G.pnode)
		) Utils.merge
		val read : eval -> M.tag -> (
			edge,				(* MStop *)
			eval,				(*  Go0  *)
			eval,				(*  Go1  *)
			M.tag * eval * eval	(* MPull *)
		) Utils.binpull
	end

	module IUOP(D0:MODELE_IUOP) =
	struct
		type memo = {
			man     : manager;
			calc    : D0.eval -> edge -> edge;
			memo    : (D0.eval * G.pnode, edge) MemoTable.t;
		}

		type manager = memo
		
		let makeman man extra hsize=
			let memo, apply = MemoTable.make hsize in
			let rec calcrec mess edge = match D0.eval mess edge with
				| Utils.MEdge edge -> edge
				| Utils.MNode (medge, (mess, node)) -> compose medge (apply calc (mess, node))
			and		calc (mess, node) =
				let tag, edgeX, edgeY = pull_node man node in
				match D0.read mess tag with
				| Utils.MStop edge -> edge
				| Utils.Go0 eval -> calcrec eval edgeX
				| Utils.Go1 eval -> calcrec eval edgeY
				| Utils.MPull (tag, messX, messY) -> push man tag (calcrec messX edgeX) (calcrec messY edgeY)
			in
			({
				man  = man;
				calc = calcrec;
				memo = memo;
			}, calcrec)

		let newman man extra = makeman man extra 10000
		let calc man = man.calc
		let dump_stat man = Tree.Node [
			Tree.Node [Tree.Leaf "memo:"; MemoTable.dump_stat man.memo];
		]
		
	end
	
(*
	module type MODELE_IUOP_EVAL =
	sig
	end

	module IUOP_EVAL(D0:MODELE_IUOP_EVAL) =
	struct
	end
*)

end
