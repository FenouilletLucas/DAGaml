type edge_mu_state = P | S
type node_mu_state = SS | SP | PS

type edge_state = bool * (edge_mu_state list)
type node_state = bool * (node_mu_state list)


let merge =
	let func = function
		| (P, P) -> P, None
		| (P, S) -> S, Some PS
		| (S, P) -> S, Some SP
		| (S, S) -> S, Some SS
	in
	let merge x y =
		assert(List.length x = List.length y);
		let xy, opxy' = List.split (List.map2 (fun x y -> func (x, y)) x y) in
		(xy, MyList.list_of_oplist opxy')
	in merge

let push getid (((bx, lx)as ex), ix) (((by, ly)as ey), iy) =
	if (ex = ey) && (match (ix, iy) with Utils.Leaf (), Utils.Leaf () -> true | Utils.Node ix, Utils.Node iy -> getid ix = getid iy | _ -> false)
	then Utils.MEdge ((bx, P::lx), ix)
	else
	(
		let xy, xy' = merge lx ly in
		Utils.MNode ((bx, (S::xy)), ((bx<>by, xy'), ix, iy))
	)

let compose (bx, lx) ((by, ly), i) =
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

let unmerge =
	let func = function
		| PS -> P, S
		| SP -> S, P
		| SS -> S, S
	in
	let unmerge lxy = List.split(List.map func lxy) in
	unmerge
		

let uncompact (b, lxy) =
	let lx, ly = unmerge lxy in
	((false, lx), (b, ly))

let pull_node _ (c, ix, iy) =
	let ex, ey = uncompact c in
	(ex, ix), (ey, iy)

let pull getid ((bx, lx), i) = match lx with
	| [] -> assert false
	| h::lx' -> let e' = (bx, lx') in match h with
		| P -> Utils.MEdge ((e', i), (e', i))
		| S -> Utils.MNode (fun node ->
			let x', y' = pull_node getid node in
			((compose e' x'), (compose e' y')))

module GroBdd_CP_M : Subdag.MODELE with
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
	let compose _ = compose
	
	let pull_node = pull_node
	
	let dump_node_mu_state x = Tree.Leaf(match x with
		| SS -> "0"
		| SP -> "1"
		| PS -> "2")
	
	let load_node_mu_state = function
		| Tree.Node _ -> assert false
		| Tree.Leaf x -> match x with
			| "0" -> SS
			| "1" -> SP
			| "2" -> PS
			| _	  -> assert false
	
	let dump_edge_mu_state x = Tree.Leaf(match x with
		| S -> "S"
		| P -> "P")
	
	let load_edge_mu_state = function
		| Tree.Node _ -> assert false
		| Tree.Leaf x -> match x with
			| "S" -> S
			| "P" -> P
			| _   -> assert false

	let dump_node   = Some (fun (b, lxy) -> Tree.Node ((StrTree.of_bool b)::(List.map dump_node_mu_state lxy)))
	let load_node   = Some (function Tree.Node (b::lxy) -> (StrTree.to_bool b, List.map load_node_mu_state lxy) | _ -> assert false)
	let dot_of_node = None
	
	let dump_edge   = Some (fun (b, l) -> Tree.Node ((StrTree.of_bool b)::(List.map dump_edge_mu_state l)))
	let load_edge   = Some (function Tree.Node (b::lxy) -> (StrTree.to_bool b, List.map load_edge_mu_state lxy) | _ -> assert false)
	let dot_of_edge = Some (fun (b, l) -> String.concat "" ((if b then "-" else "+")::(List.map(function S -> "S" | P -> "P")l)))

	let dump_leaf   = Some StrTree.of_unit
	let load_leaf   = Some StrTree.to_unit
	let dot_of_leaf = Some (fun () -> "0")
end;;

module T = Subdag.MODULE(GroBdd_CP_M);;

let man = T.newman();;

let make_const b n = T.push_leaf (b, MyList.ntimes P n) ();;

let make_ident man b n = T.push man (make_const b n) (make_const (not b) n);;

let push_pass ((b, l), i) = ((b, P::l), i)

let no ((b, l), i) = ((not b, l), i)

let c0 = make_const false 0;;
let c1 = make_const true 0;;
let x1 = make_ident man false 0;; (* function x -> x *)
let nx1 = make_ident man true 0;; (* function x -> -x *)
let x01 = T.push man x1 x1;; (* function x y -> y *)
let nx01 = T.push man nx1 nx1;; (* function x y -> -y *)
let x10 = make_ident man false 1;;
let nx10 = make_ident man true 1;;


type and_node_state = (bool*bool*(node_mu_state list))
type xor_node_state = (node_mu_state list)

let is_root = function
	| ((b, l), Utils.Leaf ()) -> Some b
	| _ -> None 

let get_root b ((_, l), _) = ((b, MyList.ntimes P (List.length l)), Utils.Leaf ())

let neg ((b, l), i) = ((not b, l), i)

let (=??) (ex, ix) (ey, iy) = match ix, iy with
	| Utils.Leaf (), Utils.Leaf () -> ex = ey
	| Utils.Node nx, Utils.Node ny -> (nx == ny) && (ex = ey)
	| _ -> false

module AND_M : T.MODELE_IBOP =
struct
	type t = and_node_state
	let compare = Pervasives.compare
	type transform = edge_state
	let compose (t:transform) (e:T.edge) : T.edge = compose t e
	let decomp x y (bx, by, lxy) =
		let lx, ly = unmerge lxy in
		((bx, lx), x), ((by, ly), y)
	let solver (((((bx, lx), ix)as x), (((by, ly), iy) as y)): T.edge * T.edge) =
		match ix with
		| Utils.Leaf () -> Utils.MEdge ((if bx then y else x):T.edge) (* as x ~ false *)
		| Utils.Node nx ->
		match iy with
		| Utils.Leaf () -> Utils.MEdge ((if by then x else y):T.edge) (* as y ~ false *)
		| Utils.Node ny ->
		if (nx == ny) && (lx = ly)
		then Utils.MEdge ((if bx = by
		then x (* as x = y *)
		else (get_root false x)):T.edge)
		else
		(
			let lxy, lxy' = merge lx ly in
			Utils.MNode (((false, lxy):transform), (((bx, by, lxy'):t), (Utils.Node nx), (Utils.Node ny)))
		)
end;;

module XOR_M : T.MODELE_IBOP =
struct
	type t = xor_node_state
	let compare = Pervasives.compare
	type transform = edge_state
	let compose = compose
	let decomp x y lxy =
		let lx, ly = unmerge lxy in
		((false, lx), x), ((false, ly), y)
	let solver ((((bx, lx), ix)as x), (((by, ly), iy) as y)) =
		assert(List.length lx = List.length ly);
		match ix with
		| Utils.Leaf () -> Utils.MEdge (if bx then (neg y) else y)
		| Utils.Node nx ->
		match iy with
		| Utils.Leaf () -> Utils.MEdge (if by then (neg x) else x)
		| Utils.Node ny ->
		if (nx == ny) && (lx = ly)
		then Utils.MEdge (get_root (bx<>by) x)
		else
		(
			let lxy, lxy' = merge lx ly in
			Utils.MNode ((bx<>by, lxy), (lxy', (Utils.Node nx), (Utils.Node ny)))
		)
end;;

module AND = T.IBOP(AND_M);;
module XOR = T.IBOP(XOR_M);;

let and_man, (&?) = AND.newman man;;
let xor_man, (^?) = XOR.newman man;;

assert(c0 &? c0 =?? c0);
assert(c0 &? c1 =?? c0);
assert(c1 &? c0 =?? c0);
assert(c1 &? c1 =?? c1);

assert(c0 ^? c0 =?? c0);
assert(c0 ^? c1 =?? c1);
assert(c1 ^? c0 =?? c1);
assert(c1 ^? c1 =?? c0);

(*
let c0 = T.push_leaf (false, []) ();;
let c1 = T.push_leaf (true , []) ();;
let x0 = T.push man c0 c1;;
let nx0 = T.push man c1 c0;;
let x1 = T.push man x0 x0;;
let nx1 = T.push man nx0 nx0;;
*)

assert(nx01 ^? nx10 =?? x01 ^? x10);;

StrTree.tree_print print_string [AND.dump_stat and_man; XOR.dump_stat xor_man];;

exit 0;;