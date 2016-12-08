(* UDAG : Unique - Directed Acyclic Diagramm
 *
 *)


module type GRAPH_HEADER = sig
    type leaf
    type edge
    type node
end
module type GRAPH = sig
    include GRAPH_HEADER
    type ident

	type next_t =
		| Leaf of leaf
		| NodeRef of ident
	type edge_t = edge * next_t
	type node_t = node * (edge_t list)
    
    type manager
    
    val newman : unit -> manager
    val push : manager -> node_t -> ident
    val pull : manager -> ident -> node_t
	
end
module type UDAG_HEADER = sig
	include GRAPH_HEADER

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

module UDAG (Header:UDAG_HEADER) =
struct
	type ident = int

    type leaf = Header.leaf
    type edge = Header.edge
    type node = Header.node

	type next_t =
		| Leaf of leaf
		| NodeRef of ident
	type edge_t = edge * next_t
	type node_t = node * (edge_t list)
	
	type manager = {
        unique : node_t H2Table.t;
	}

    
	let makeman hsize = {
        unique = H2Table.create hsize 0;
    }

    let default_newman_hsize = 10000
	let newman () = makeman default_newman_hsize
	
	let push udag = H2Table.push udag.unique
	let pull udag = H2Table.pull udag.unique
	
	let length udag = H2Table.length udag.unique
	
	let dump =
		let dump_leaf = match Header.dump_leaf with
			| Some dump -> dump
			| None		-> (fun _ -> StrTree.of_unit())
		and dump_edge = match Header.dump_edge with
			| Some dump -> dump
			| None		-> (fun _ -> StrTree.of_unit())
		and dump_node = match Header.dump_node with
			| Some dump -> dump
			| None		-> (fun _ -> StrTree.of_unit())
		in
		let dump_next_t parcours = function
			| Leaf leaf -> [Tree.Leaf "Leaf"; dump_leaf leaf]
			| NodeRef ident -> [Tree.Leaf "NodeRef"; StrTree.of_int ident]
		in
		let dump_edge_t parcours =
            let dump_next_t = dump_next_t parcours in
            function ((edge, next) : edge_t) ->
                Tree.Node ((dump_edge edge)::(dump_next_t next))
		in
		let dump_node_t parcours =
			let dump_edge_t = dump_edge_t parcours in
			function ((node, edges) : node_t) -> (dump_node node)::(List.map dump_edge_t edges)
		in fun udag edges ->
			let memo = MemoTable.create (H2Table.length udag.unique) in
			let apply = MemoTable.apply memo in
			let liste = ref [] in
			let push x = liste:=(x::(!liste)) in
			let revret () =
				let temp = List.rev (!liste) in
				liste := [];
				temp
			in

			let rec parcours ident = apply ident	(fun ident ->
				(
					let node : node_t = H2Table.pull udag.unique ident in
					push (Tree.Node ((StrTree.of_int ident)::(dump_node_t parcours node)))
				)
													)
			in
			let liste_edges =	(
				List.map (dump_edge_t parcours) edges
								)
			in
			let liste_nodes =	revret() in
			Tree.Node [Tree.Node liste_nodes; Tree.Node liste_edges]
			
	let load =
		match Header.load_leaf with
			| None -> None
			| Some load_leaf ->
		match Header.load_edge with
			| None -> None
			| Some load_edge ->
		match Header.load_node with
			| None -> None
			| Some load_node ->
		let load_next getid = function
			| [Tree.Leaf "Leaf"; leaf] -> Leaf (load_leaf leaf)
			| [Tree.Leaf "NodeRef"; ident] ->
					NodeRef (getid (StrTree.to_int ident))
			| _ -> assert false
		in
		let load_edge getid = function
			| Tree.Node (edge::noderef) -> (load_edge edge, load_next getid noderef)
			| _ -> assert false
		in
		let load_node getid = function
			| node::edges -> (load_node node, (List.map (load_edge getid) edges))
			| _ -> assert false
		in Some (function
			| Tree.Node [Tree.Node liste_nodes; Tree.Node liste_edges] ->
			(
				let n = List.length liste_nodes in
				let htbl = Hashtbl.create n in
				let getid = Hashtbl.find htbl
				and add = Hashtbl.add htbl
				and mem = Hashtbl.mem htbl in
				let udag = makeman n in
				let load_node = function
					| Tree.Node (ident::node) ->
						let ident = StrTree.to_int ident in
						assert(not(mem ident));
						add ident ((load_node getid node)|>(push udag))
					| _ -> assert false
				in
				List.iter load_node liste_nodes;
				let liste_edges = List.map (load_edge getid) liste_edges in
				udag, liste_edges
			)
			| _ -> assert false
                )

end


module STRTREE_HEADER : UDAG_HEADER with
		type leaf = StrTree.tree
	and type edge = StrTree.tree
	and type node = StrTree.tree
=
struct
	type leaf = StrTree.tree
	type edge = StrTree.tree
	type node = StrTree.tree

	let dump_leaf = Some (fun x -> x)
	let load_leaf = Some (fun x -> x)
	let dot_of_leaf = Some (fun x -> StrTree.dump_tree x)

	let dump_edge = Some (fun x -> x)
	let load_edge = Some (fun x -> x)
	let dot_of_edge = Some (fun x -> StrTree.dump_tree x)

	let dump_node = Some (fun x -> x)
	let load_node = Some (fun x -> x)
	let dot_of_node = Some (fun _ x -> StrTree.dump_tree x)
end

module STRTREE_UDAG = UDAG(STRTREE_HEADER)

module STRING_HEADER : UDAG_HEADER with
		type leaf = string
	and type edge = string
	and type node = (int option) * string
=
struct
	type leaf = string
	type edge = string
	type node = (int option) * string

	let dump_leaf = Some (fun x -> Tree.Leaf x)
	let load_leaf = Some (function Tree.Leaf x -> x | _ -> assert false)
	let dot_of_leaf = Some (fun x -> x)

	let dump_edge = Some (fun x -> Tree.Leaf x)
	let load_edge = Some (function Tree.Leaf x -> x | _ -> assert false)
	let dot_of_edge = Some (fun x -> x)

	let dump_node = Some (function (None, x) -> Tree.Leaf x | (Some i, x) -> Tree.Node [StrTree.of_int i; Tree.Leaf x])
	let load_node = Some (function
		| Tree.Leaf x -> (None, x)
		| Tree.Node [i; Tree.Leaf x] -> (Some(StrTree.to_int i), x)
		| _ -> assert false)
	let dot_of_node = Some (fun _ (_, x) -> x)
end

module STRING_UDAG = UDAG(STRING_HEADER)
