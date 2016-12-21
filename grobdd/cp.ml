let strdump_node = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_node = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> Gops.binload_node >> Gops.node_split)

let strdump_tacx = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_tacx = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> Gops.binload_tacx >> Gops.tacx_split)

let strdump_edge = Extra.(Gops.bindump_edge >> Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_edge = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> Gops.binload_edge)

let dot_of_edge_aux color (b, l) =
	"[label = \""^(String.concat "" ((if b then "-" else "+")::(List.map Gops.strdump_uniq_elem l)))^"\"; color=\""^color^"\"];"

let dot_of_edge = dot_of_edge_aux "black"

let dot_of_node node =
	let e0, e1 = Gops.binload_node node |> Gops.node_split in
	"", (dot_of_edge_aux "red" e0), (dot_of_edge_aux "green" e1)

let default_leaf = ((false, []), Utils.Leaf ())

let strdump_leaf = (fun () -> Tree.Node [])
let strload_leaf = (function Tree.Node [] -> default_leaf | _ -> assert false)

module GroBdd_CP_M : Subdag.MODELE with
		type node = Types.node_cstate
	and	type edge = Types.edge_state
	and type leaf = unit
=
struct
	
	type node = Types.node_cstate
	type edge = Types.edge_state
	type leaf = unit

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push : ('t -> 'i) -> 't e -> 't e -> ('t e, edge * 't n) Utils.merge =
		Gops.node_push_cons
	let pull = Gops.node_pull
	let compose _ = Gops.compose
	
	let pull_node = Gops.node_pull_node
	
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

module GroBdd_CP =
struct
	include Subdag.MODULE(GroBdd_CP_M)
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

let newman = GroBdd_CP.newman

let make_const b n = GroBdd_CP.push_leaf (b, MyList.ntimes Types.P n) ();;

let make_ident man b n = GroBdd_CP.push man (make_const b n) (make_const (not b) n);;

let arity ((_, l), _) = List.length l

let push_pass ((b, l), i) = ((b, Types.P::l), i)

let no ((b, l), i) = ((not b, l), i)

let is_root = function
	| ((b, l), Utils.Leaf ()) -> Some b
	| _ -> None 

let get_root b ((_, l), _) = ((b, MyList.ntimes Types.P (List.length l)), Utils.Leaf ())

let (=??) (ex, ix) (ey, iy) = match ix, iy with
	| Utils.Leaf (), Utils.Leaf () -> ex = ey
	| Utils.Node nx, Utils.Node ny -> (nx == ny) && (ex = ey)
	| _ -> false

module AND_M : GroBdd_CP.MODELE_IBOP =
struct
	type t = Bitv.t
	let compare = Pervasives.compare
	type transform = Types.edge_state
	let compose = Gops.compose
	let decomp x y c =
		let ((bx, by), lxy) = Gops.binload_node_and c in
		let lx, ly = Gops.split_pair lxy in
		((bx, lx), x), ((by, ly), y)
	let solver = Gops.node_solve_and
end;;

module XOR_M : GroBdd_CP.MODELE_IBOP =
struct
	type t = Bitv.t
	let compare = Pervasives.compare
	type transform = Types.edge_state
	let compose = Gops.compose
	let decomp x y c =
		let lxy = Gops.binload_node_xor c in
		let lx, ly = Gops.split_pair lxy in
		((false, lx), x), ((false, ly), y)
	let solver = Gops.node_solve_xor
end;;

module AND = GroBdd_CP.IBOP(AND_M);;
module XOR = GroBdd_CP.IBOP(XOR_M);;


module TACX_CP_M : TaggedSubdag.MODELE with
		type node = Types.tacx_cstate
	and	type edge = Types.edge_state
	and type leaf = unit
	and type tag  = Types.op_tag
=
struct
	
	type node = Types.tacx_cstate
	type edge = Types.edge_state
	type leaf = unit
	type tag  = Types.op_tag

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push = Gops.tacx_push
	let pull = Gops.tacx_pull
	let compose _ = Gops.compose
	
	let pull_node = Gops.tacx_pull_node
	
	let dump_node   = Some strdump_tacx
	let load_node   = Some strload_tacx
	let dot_of_node = None
	
	let dump_edge   = Some strdump_edge
	let load_edge   = Some strload_edge
	let dot_of_edge = Some dot_of_edge

	let dump_leaf   = Some strdump_leaf
	let load_leaf   = Some strload_leaf
	let dot_of_leaf = Some (fun () -> "0")

	let dot_of_tag = Some Extra.(Types.(function And -> "A" | Cons -> "C" | Xor -> "X") >> (fun x -> "[label = \""^x^"\"];"))
end

module TACX_CP =
struct
	include TaggedSubdag.MODULE(TACX_CP_M)
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

let ( *! ) man x y = TACX_CP.push man Types.Cons x y
let ( &! ) man x y = TACX_CP.push man Types.And x y
and ( ^! ) man x y = TACX_CP.push man Types.Xor x y

module EVAL =
struct
	module EVAL_VISITOR =
	struct
		type xnode = GroBdd_CP.edge
		type xedge = GroBdd_CP.edge
		type cons = xedge -> xedge -> xedge
		type extra = cons * cons * cons (* (a, c, x) *)

		let do_leaf _ () = default_leaf
		let do_node (a, c, x) = Extra.(Gops.binload_tacx >> Gops.tacx_split >> (fun (tag, edgeX, edgeY) ->
			let merge = Types.(match tag with And -> a | Cons -> c | Xor -> x) in
			Utils.MNode (fun nodeX nodeY -> merge (Gops.compose edgeX nodeX) (Gops.compose edgeY nodeY))))
		let do_edge _ = Gops.compose
	end

	module EVAL = TACX_CP.NODE_VISITOR(EVAL_VISITOR)

	type manager = {
		grobdd : GroBdd_CP.manager;
		andman : AND.manager;
		xorman : XOR.manager;
		theman : EVAL.manager;
		calc   : TACX_CP.edge -> GroBdd_CP.edge
	}

	let newman tacx man =
		let c = GroBdd_CP.push man in
		let aman, a = AND.newman man
		and xman, x = XOR.newman man in
		let theman, calc = EVAL.newman tacx (a, c, x) in
		{
			grobdd = man;
			andman = aman;
			xorman = xman;
			theman = theman;
			calc = calc
		}, List.map calc

end
