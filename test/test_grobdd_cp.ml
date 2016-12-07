open Subdag

type edge_mu_state = P | S
type node_mu_state = SS | SP | PS

type edge_state = bool * (edge_mu_state list)
type node_state = bool * (node_mu_state list)

let push getid (((bx, lx)as ex), ix) (((by, ly)as ey), iy) =
	if (ex = ey) && (match (ix, iy) with Utils.Leaf (), Utils.Leaf () -> true | Utils.Node ix, Utils.Node iy -> getid ix = getid iy | _ -> false)
	then Utils.MEdge ((bx, P::lx), ix)
	else
	(
		let mu_merge = function
			| (P, P) -> P, None
			| (P, S) -> S, Some PS
			| (S, P) -> S, Some SP
			| (S, S) -> S, Some SS
		in
		let merge x y =
			let xy, opxy' = List.split (List.map2 (fun x y -> mu_merge (x, y)) x y) in
			(S::xy, MyList.list_of_oplist opxy')
		in
		let xy, xy' = merge lx ly in
		Utils.MNode ((bx, xy), ((bx<>by, xy'), ix, iy))
	)

let compose _ (bx, lx) ((by, ly), i) =
	let compose =
		let rec aux c = function
			| ([], []) -> List.rev c
			| ([], _ ) -> assert false
			| (P::x, y) -> aux (P::c) (x, y)
			| (S::x, []) -> assert false
			| (S::x, h::y) -> aux (h::c) (x, y)
		in (fun x y -> aux [] (x, y))
	in
	((bx<>by, compose lx ly), i)

let uncompact (b, lxy) =
	let mu_uncompact = function
		| PS -> P, S
		| SP -> S, P
		| SS -> S, S
	in
	let lx, ly = List.split (List.map mu_uncompact lxy) in
	((false, lx), (b, ly))

let pull_node _ (c, ix, iy) =
	let ex, ey = uncompact c in
	(ex, ix), (ey, iy)

let pull getid ((bx, lx), i) = match lx with
	| [] -> assert false
	| h::lx' -> let e' = (bx, lx') in match h with
		| P -> Utils.REdge ((e', i), (e', i))
		| S -> Utils.RNode (fun node ->
			let x', y' = pull_node getid node in
			((compose getid e' x'), (compose getid e' y')))

module UnitH : MODELE_SUBDAG with
		type node = node_state
	and	type edge = edge_state
	and type leaf = unit
=
struct
	
	type node = node_state
	type edge = edge_state
	type leaf = unit

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push (getid:('t -> 'i)) (edgex: 't e) (edgey: 't e) : ('t e, edge * 't n) Utils.merge = push getid edgex edgey
	let pull = pull
	let compose = compose
	
	let pull_node = pull_node
end;;

module T = SUBDAG(UnitH);;

let man = T.newman();;

let c0 = T.push_leaf (false, []) ();;
let c1 = T.push_leaf (true , []) ();;
let x0 = T.push man c0 c1;;
let nx0 = T.push man c1 c0;;
let x1 = T.push man x0 x0;;
let nx1 = T.push man nx0 nx0;;

(*
assert(T.pull man z' = (y, x));;
assert(T.pull man z  = (x, y));;
assert(T.pull man y  = (x, x));;
assert(x = ((), Utils.Leaf ()));;

module IBA_M : T.MODELE_IBOP =
struct
	type t = unit
	let compare () () = 0
	type transform = unit
	let compose () x = x
	let decomp x y () = (((), x), ((), y))
	let solver = function
		| (((), Utils.Leaf ()):T.edge), ((), y)
		| ((), y), (((), Utils.Leaf ()):T.edge) -> Utils.MEdge ((), y)
		| ((), x), ((), y) -> Utils.MNode ((), ((), x, y))
end;;

module IBA = T.IBOP(IBA_M);;

let iba_man, iba = IBA.newman man;;
let xy = iba x y;;
let yy = iba y y;;
StrTree.tree_print print_string [IBA.dump_stat iba_man];;
*)

exit 0;;
