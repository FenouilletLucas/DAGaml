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
	val compose : ('t -> 'i) -> edge -> 't e -> 't e	
	
	val dump_leaf : (leaf -> StrTree.tree) option
	val load_leaf : (StrTree.tree -> leaf) option
	val dot_of_leaf : (leaf -> string) option

	val dump_edge : (edge -> StrTree.tree) option
	val load_edge : (StrTree.tree -> edge) option
	val dot_of_edge : (edge -> string) option
	
	val dump_node : (node -> StrTree.tree) option
	val load_node : (StrTree.tree -> node) option
	val dot_of_node : (int -> node -> string) option

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
	module G = Ubdag.UBDAG(M)
	
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

	let compose = M.compose G.get_ident

end
