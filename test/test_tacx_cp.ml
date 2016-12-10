(*
TACX : Transform And Cons Xor
*)

type edge_mu_state = P | S
type node_mu_state = SS | SP | PS

type op_tag =
	| And
	| Cons
	| Xor

type tacx_tag =
	| TAnd  of bool * bool
	| TCons of bool
	| TXor

type edge_state = bool * (edge_mu_state list)
type tacx_state = tacx_tag * (node_mu_state list)

type 'a edge = edge_state * (unit, 'a) Utils.gnode
type 'a tacx = tacx_state * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode


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

let get_root b ((_, l), _) = ((b, MyList.ntimes P (List.length l)), Utils.Leaf ())
;;

let push_and getid (((((bx, lx)), ix)as x):'node edge) (((((by, ly)), iy)as y):'node edge) =
	match ix with
	| Utils.Leaf () -> Utils.MEdge (if bx then y else x) (* as x ~ false *)
	| Utils.Node nx ->
	match iy with
	| Utils.Leaf () -> Utils.MEdge (if by then x else y) (* as y ~ false *)
	| Utils.Node ny ->
	if (nx == ny) && (lx = ly)
	then Utils.MEdge (if bx = by
		then x (* as x = y *)
		else ((get_root false x):'node edge))
	else
	(
		let lxy, lxy' = merge lx ly in
		let bx, ix, by, iy = if ((getid nx, bx) <= (getid ny, by))
			then (bx, ix, by, iy)
			else (by, iy, bx, ix)
		in
		Utils.MNode (((false, lxy):edge_state), (((TAnd (bx, by), lxy'), ix, iy):'node tacx))
	)
;;

let neg ((b, l), i) = ((not b, l), i)
;;

let push_xor getid ((((bx, lx)), ix)as x) ((((by, ly)), iy)as y) =
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
		let ix, iy = if (getid nx <= getid ny)
			then (ix, iy)
			else (iy, ix)
		in
		Utils.MNode ((bx<>by, lxy), ((TXor, lxy'), ix, iy))
	)
;;

let push_cons getid  (((((bx, lx)as ex):edge_state), ix)) (((((by, ly)as ey):edge_state), iy)) =
	if (ex = ey) && (match (ix, iy) with
		| Utils.Leaf (), Utils.Leaf () -> true 
		| Utils.Node nx, Utils.Node ny -> getid nx = getid ny 
		| _ -> false)
	then Utils.MEdge ((((bx, P::lx):edge_state), ix):'node edge)
	else
	(
		let xy, xy' = merge lx ly in
		Utils.MNode (((bx, (S::xy)):edge_state), (((TCons (bx<>by), xy'):tacx_state), ix, iy))
	)
;;

let check ((_, l), i) = match i with
	| Utils.Leaf () -> MyList.onehash_check (fun x -> x) P l
	| Utils.Node _ -> (MyList.count (function S -> true | _ -> false) l) >= 1
;;

let push getid tag ((((_, lx), _)as x):'node edge) ((((_, ly), _) as y):'node edge) =
	assert(check x);
	assert(check y);
	assert(List.length lx = List.length ly);
	(match tag with
		And -> push_and 
		| Cons -> push_cons 
		| Xor -> push_xor ) getid x y
;;

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
;;

let unmerge =
	let func = function
		| PS -> P, S
		| SP -> S, P
		| SS -> S, S
	in
	let unmerge lxy = List.split(List.map func lxy) in
	unmerge
;;

let uncompact (tag, lxy) =
	let lx, ly = unmerge lxy in
	let t, bx, by = match tag with
		| TAnd (bx, by) -> And,  bx, by
		| TCons b		-> Cons, false, b
		| TXor			-> Xor,  false, false
	in
	(t, (bx, lx), (by, ly))

let pull_node _ (c, ix, iy) =
	let t, ex, ey = uncompact c in
	t, (ex, ix), (ey, iy)

let pull getid ((bx, lx), i) : (op_tag, 'node edge, 'node tacx) Utils.unmerge_tagged = match lx with
	| [] -> assert false
	| h::lx' -> let e' = (bx, lx') in match h with
		| P -> Utils.MEdge (Cons, (e', i), (e', i))
		| S -> Utils.MNode (fun node ->
			let t, x', y' = pull_node getid node in
			(t, (compose e' x'), (compose e' y')))


module TACX_CP_M : TaggedSubdag.MODELE with
		type node = tacx_state
	and	type edge = edge_state
	and type leaf = unit
	and type tag  = op_tag
=
struct
	
	type node = tacx_state
	type edge = edge_state
	type leaf = unit
	type tag  = op_tag

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push (getid:('t -> 'i)) (tag:tag) (edgex: 't e) (edgey: 't e) : ('t e, edge * 't n) Utils.merge = push getid tag edgex edgey
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

	let dump_node   = Some (fun (tag, lxy) -> let state = (List.map dump_node_mu_state lxy) in Tree.Node(match tag with TAnd (bx, by) -> (Tree.Leaf "A")::(StrTree.of_bool bx)::state | TCons b -> (Tree.Leaf "C")::(StrTree.of_bool b)::state | TXor -> (Tree.Leaf "X")::state))
	let load_node   = Some (function
	| Tree.Node ((Tree.Leaf tag)::seq) ->
		(
			let load_state = fun state -> List.map load_node_mu_state state in
			match tag, seq with	
			| "A", bx::by::state -> (TAnd (StrTree.to_bool bx, StrTree.to_bool by), load_state state)
			| "C", bx::state -> (TCons (StrTree.to_bool bx), load_state state)
			| "X", state -> (TXor, load_state state)
			| _ -> assert false
		)
	| _ -> assert false)
	let dot_of_node = None
	
	let dump_edge   = Some (fun (b, l) -> Tree.Node ((StrTree.of_bool b)::(List.map dump_edge_mu_state l)))
	let load_edge   = Some (function Tree.Node (b::lxy) -> (StrTree.to_bool b, List.map load_edge_mu_state lxy) | _ -> assert false)
	let dot_of_edge = Some (fun (b, l) -> String.concat "" ((if b then "-" else "+")::(List.map(function S -> "S" | P -> "P")l)))

	let dump_leaf   = Some StrTree.of_unit
	let load_leaf   = Some StrTree.to_unit
	let dot_of_leaf = Some (fun () -> "0")
end;;

module T = TaggedSubdag.MODULE(TACX_CP_M);;

let man = T.newman();;

let cons x y = T.push man Cons x y
let (&!) x y = T.push man And x y
and (^!) x y = T.push man Xor x y

let make_const b n = T.push_leaf (b, MyList.ntimes P n) ();;

let make_ident b n = cons (make_const b n) (make_const (not b) n);;

let push_pass ((b, l), i) = ((b, P::l), i)

let no ((b, l), i) = ((not b, l), i)

let c0 = make_const false 0;;
let c1 = make_const true 0;;
let x1 = make_ident false 0;; (* function x -> x *)
let nx1 = make_ident true 0;; (* function x -> -x *)
let x01 = cons x1 x1;; (* function x y -> y *)
let nx01 = cons nx1 nx1;; (* function x y -> -y *)
let x10 = make_ident false 1;;
let nx10 = make_ident true 1;;


let is_root = function
	| ((b, l), Utils.Leaf ()) -> Some b
	| _ -> None 
;;



let (=!!) (ex, ix) (ey, iy) = match ix, iy with
	| Utils.Leaf (), Utils.Leaf () -> ex = ey
	| Utils.Node nx, Utils.Node ny -> (nx == ny) && (ex = ey)
	| _ -> false
;;

assert(c0 &! c0 =!! c0);;
assert(c0 &! c1 =!! c0);;
assert(c1 &! c0 =!! c0);;
assert(c1 &! c1 =!! c1);;

assert(c0 ^! c0 =!! c0);;
assert(c0 ^! c1 =!! c1);;
assert(c1 ^! c0 =!! c1);;
assert(c1 ^! c1 =!! c0);;

assert(nx01 ^! nx10 =!! x01 ^! x10);;

(*StrTree.tree_print print_string [AND.dump_stat and_man; XOR.dump_stat xor_man];;*)

exit 0;;