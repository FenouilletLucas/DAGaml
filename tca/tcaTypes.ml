module type MODELE =
sig
	type leaf
	type edge
	type node
	type btag (* binary transaction tag *)
	type utag (* unary  transaction tag *)
end

module TYPES(M0:MODELE) =
struct
	type uti   = int (* unique transaction identifier *)
	type ident = int

	type next_t =
		| Leaf of M0.leaf
		| Node of ident
	type edge_t = M0.edge * next_t
	type node_t = M0.node * next_t * next_t

	type edge_uti = uti
	type node_uti = uti

	type uni =
		| Uti of node_uti
		| Uni of ident		(* unique node identifier *)
	
	type next_uni =
		| TLeaf of M0.leaf
		| TNode of uni
	type edge_uni = M0.edge * next_uni
	type node_uni = M0.node * next_uni * next_uni

	type abs =
		| UtiNode of node_uti
		| UniNode of ident
		| TheNode of node_uni
		| UtiEdge of edge_uti

	type next_abs =
		| ALeaf of M0.leaf
		| ANode of abs
	type edge_abs = M0.edge * next_abs
	type node_abs = M0.node * next_abs * next_abs

	type cons_uti = uti
	type cons_tra = cons_uti * edge_abs * edge_abs

	type btag_uti = uti
	type btag_tra = btag_uti * M0.btag * edge_abs * edge_abs
	
	type utag_uti = uti
	type utag_tra = utag_uti * M0.utag * edge_abs

end
