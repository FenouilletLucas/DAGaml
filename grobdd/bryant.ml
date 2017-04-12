(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

let strdump_node = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_node = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> BryantGops.load_stream BryantGops.binload_node >> BryantGops.node_split)

let strdump_tacx = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_tacx = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> BryantGops.load_stream BryantGops.binload_tacx >> BryantGops.tacx_split)

let strdump_edge = Extra.(BryantGops.dump_stream BryantGops.bindump_edge >> Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_edge = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> BryantGops.load_stream BryantGops.binload_edge)

let dot_of_edge_aux color block =
	"[label = \""^(BryantGops.strdump_edge block)^"\"; color=\""^color^"\"];"

let dot_of_edge = dot_of_edge_aux "black"

let dot_of_node node =
	let e0, e1 = BryantGops.load_stream BryantGops.binload_node node |> BryantGops.node_split in
	"", (dot_of_edge_aux "red" e0), (dot_of_edge_aux "green" e1)

let default_leaf = ((false, (0, 0)), Utils.Leaf ())

let strdump_leaf = (fun () -> Tree.Node [])
let strload_leaf = (function Tree.Node [] -> default_leaf | _ -> assert false)

module GroBdd_M : Subdag.MODELE with
		type node = BryantTypes.node_cstate
	and	type edge = BryantTypes.edge_state
	and type leaf = unit
=
struct
	
	type node = BryantTypes.node_cstate
	type edge = BryantTypes.edge_state
	type leaf = unit

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push : ('t -> 'i) -> 't e -> 't e -> ('t e, edge * 't n) Utils.merge =
		BryantGops.node_push_cons
	let pull = BryantGops.node_pull
	let compose = BryantGops.compose
	
	let pull_node = BryantGops.node_pull_node
	
	let dump_node   = Some strdump_node
	let load_node   = Some strload_node
	let dot_of_node = Some dot_of_node
	
	let dump_edge   = Some strdump_edge
	let load_edge   = Some strload_edge
	let dot_of_edge = Some dot_of_edge

	let dump_leaf   = Some strdump_leaf
	let load_leaf   = Some strload_leaf
	let dot_of_leaf = Some (function () -> "[label = \"0\"];")
end

module GroBdd =
struct
	include Subdag.MODULE(GroBdd_M)
	let dumpfile man edges target =
		let strman = Udag.StrTree.newman() in
		let stredges = dump man strman edges in
		Udag.StrTree.dumpfile strman stredges target
	
	let loadfile target =
		let strman, stredges = Udag.StrTree.loadfile target in
		let man = newman () in
		let edges = load man strman stredges in
		man, edges
end
