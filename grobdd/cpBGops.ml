(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open CpTypes
open Extra

let merge_uniq (uniqX, uniqY) = GUtils.consensus (function
	| P, P -> P, None
	| x, y -> S, Some(x, y)) uniqX uniqY

let solve_cons ((), (((bX, lX), iX) as eX), (((bY, lY), iY) as eY)) =
	assert(List.length lX = List.length lY);
	if eX = eY
	then ((bX, P::lX), Utils.MEdge iX)
	else
	(
		let lXY, (lX', lY') = merge_uniq (lX, lY) in
		((bX, S::lXY), Utils.MNode ((), ((false, lX'), iX), ((bX<>bY, lY'), iY)))
	)

let get_root b ((_, l), _) = ((b, MyList.ntimes P (List.length l)), Utils.Leaf ())

let solve_and ((), (((bx, lx), ix) as x), (((by, ly), iy) as y)) =
	assert(List.length lx = List.length ly);
	match ix with
	| Utils.Leaf () ->
	(
		let e, i = if bx then (* x ~ 1 *) y else (* x ~ 0 *) x in
		(e, Utils.MEdge i)
	)
	| Utils.Node nx ->
	match iy with
	| Utils.Leaf () ->
	(
		let e, i = if by then (* y ~ 1 *) x else (* y ~ 0 *) y in
		(e, Utils.MEdge i)
	)
	| Utils.Node ny ->
	if (nx = ny) && (lx = ly)
	then
	(
		let e, i = if bx = by then (* x =  y *) x else (* x = ~y *) (get_root false x) in
		(e, Utils.MEdge i)
	)
	else
	(
		let lxy, (lx', ly') = merge_uniq (lx, ly) in
		let bx, ix, lx', by, iy, ly' = if ((nx, bx, lx') <= (ny, by, ly'))
			then (bx, ix, lx', by, iy, ly')
			else (by, iy, ly', bx, ix, lx')
		in
		((false, lxy), Utils.MNode ((), ((bx, lx'), ix), ((by, ly'), iy)))
	)

let neg ((b, l), i) = ((not b, l), i)
let cneg x ((b, l), i) = (( x <> b, l), i)

let solve_xor ((), (((bx, lx), ix)as x), (((by, ly), iy)as y)) =
	assert(List.length lx = List.length ly);
	match ix with
	| Utils.Leaf () ->
	(
		let e, i = cneg bx y in
		(e, Utils.MEdge i)
	)
	| Utils.Node nx ->
	match iy with
	| Utils.Leaf () ->
	(
		let e, i = cneg by x in
		(e, Utils.MEdge i)
	)
	| Utils.Node ny ->
	if (nx == ny) && (lx = ly)
	then
	(
		let e, i = get_root (bx<>by) x in
		(e, Utils.MEdge i)
	)
	else
	(
		let lxy, (lx', ly') = merge_uniq (lx, ly) in
		let ix, lx', iy, ly' = if (( nx, lx') <= ( ny, ly'))
			then (ix, lx', iy, ly')
			else (iy, ly', ix, lx')
		in
		((bx<>by, lxy), Utils.MNode ((), ((false, lx'), ix), ((false, ly'), iy)))
	)

let solver_of_tag = TacxTypes.(function
	| And  -> solve_and
	| Cons -> solve_cons
	| Xor  -> solve_xor
)

let solve_tacx (tag, edge0, edge1) =
	let edge, merge = (solver_of_tag tag) ((), edge0, edge1) in
	(edge, match merge with
	| Utils.MEdge next -> Utils.MEdge next
	| Utils.MNode ((), edge0, edge1) -> Utils.MNode (tag, edge0, edge1))

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

let node_pull (((bx, lx), i) : 'i CpTypes.edge) : ('i CpTypes.node, 'i * ('i CpTypes.node -> 'i CpTypes.node)) Utils.merge = match lx with
	| [] -> assert false
	| h::lx' -> let e' = (bx, lx') in match h with
		| P -> Utils.MEdge ((), (e', i), (e', i))
		| S -> Utils.MNode (Utils.gnode_node i, fun ((), edge0, edge1) ->
			((), (compose e' edge0), (compose e' edge1))
		)