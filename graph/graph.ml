module type HEADER = sig
    type node
    type edge
    
	val dump_edge : (edge -> StrTree.tree) option
	val load_edge : (StrTree.tree -> edge) option
	val dot_of_edge : (edge -> string) option
	
	val dump_node : (node -> StrTree.tree) option
	val load_node : (StrTree.tree -> node) option
	val dot_of_node : (int -> node -> string) option
end

module EmptyGraph(H:HEADER) =
struct
    module H = H

    type node_ident
    type edge_ident

    type node_ref =
        | NIdent of node_ident
        | NRef of node
    and  edge_ref =
        | EIdent of edge_ident
        | ERef of edge
    and  node = {
        node : H.node;
        edges_out : edge_ref list;
        edges_int : edge_ref list
    }
    and  edge = {
        edge : H.edge;
        nodes_out : node_ref list;
        nodes_int : node_ref list;
    }

end
