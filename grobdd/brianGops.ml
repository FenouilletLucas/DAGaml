(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open BrianTypes
open Extra

let strdump_uniq (i, j) = List.map string_of_int [i; j]
let strload_uniq = List.map int_of_string >> (function [i; j] -> (i, j) | _ -> assert false)

let strdump_edge (b, u) = Tree.Node ((GUtils.pm_of_bool b)::(strdump_uniq u))
let strload_edge = function
	| Tree.Node(pm::tail) -> (GUtils.bool_of_pm pm, strload_uniq tail)
	| _ -> assert false

let strdump_edge_and ((bx, by), u) = Tree.Node((GUtils.pm_of_bool bx)::(GUtils.pm_of_bool by)::(strdump_uniq u))
let strload_edge_and = function
	| Tree.Node(pmx::pmy::tail) -> ((GUtils.bool_of_pm pmx, GUtils.bool_of_pm pmy), strload_uniq tail)
	| _ -> assert false

let strdump_edge_xor u = Tree.Node(strdump_uniq u)
let strload_edge_xor = function
	| Tree.Node(tail) -> strload_uniq tail
	| _ -> assert false


let bindump_tacx (t, l) = bindump_ttag (bindump_pair l) t |> Array.of_list |> Bitv.L.of_bool_array
let binload_tacx = Bitv.L.to_bool_array >> Array.to_list >> binload_ttag >> (fun (t, l) -> (t, binload_pair l))

let eq getid = function
	| (Utils.Leaf (), Utils.Leaf ()) -> true
	| (Utils.Node nx, Utils.Node ny) -> (getid nx) = (getid ny)
	| _								 -> false

let solve_cons getid (((bX, (xX, yX)) as eX), iX) (((bY, (xY, yY)) as eY), iY) = 
	assert(xX = xY);
	if (eq getid (iX, iY)) && (eX = eY)
	then (Utils.MEdge ((bX, (xX+1, yX)), iX))
	else
	(
		Utils.MNode ((bX, (xX+1, xX+1)), ((bX<>, (xX+1, yX, yY)), iX, iY))
	)

let node_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (e', x, y)) -> Utils.MNode (e, (e', x, y))

let tacx_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, ((b, l), x, y)) -> Utils.MNode (e, ((TCons b, l), x, y))

let get_root b (_, (xX, _)) = (b, (xX, 0))

let solve_and gid ((((bX, (xX, yX)) as eX), iX) as x) ((((bY, (xY, yY)) as eY), iY) as y)= 
	assert(xX = xY);
	match iX with
	| Utils.Leaf () -> Utils.MEdge (if bX then (* x ~ 1 *) y else (* x ~ 0 *) x)
	| Utils.Node nx ->
	match iY with
	| Utils.Leaf () -> Utils.MEdge (if bY then (* y ~ 1 *) x else (* y ~ 0 *) y)
	| Utils.Node ny ->
	if (gid nx = gid ny) && (yX = yY)
	then Utils.MEdge (if bx = by
		then (* x =  y *) x
		else (* x = ~y *) (get_root false x)
		             )
	else
	(
		let yXY = max yX yY in
		Utils.MNode ((false, (xX, yXY)), (((bx, by), (yXY, yX, yY)), iX, iY))
	)

let tacx_push_and gid x y = match solve_and gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (((bx, by), lxy), x, y)) -> Utils.MNode (e, (bindump_tacx (TAnd (bx, by), lxy), x, y))

let node_solve_and : ('t -> 'i) -> 't edge * 't edge -> ('t edge, edge_state * (Bitv.t * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode)) Utils.merge =
	fun gid (x, y) -> match solve_and gid x y with
		| Utils.MEdge e -> Utils.MEdge e
		| Utils.MNode (e, (e', x, y)) -> Utils.MNode (e, (bindump_node_and e', x, y))

let neg ((b, l), i) = ((not b, l), i)
let cneg x ((b, l), i) = (( x <> b, l), i)

let solve_xor gid ((((bx, lx)), ix)as x) ((((by, ly)), iy)as y) =
	assert(List.length lx = List.length ly);
	match ix with
	| Utils.Leaf () -> Utils.MEdge (cneg bx y)
	| Utils.Node nx ->
	match iy with
	| Utils.Leaf () -> Utils.MEdge (cneg by x)
	| Utils.Node ny ->
	if (nx == ny) && (lx = ly)
	then Utils.MEdge (get_root (bx<>by) x)
	else
	(
		let lxy, lxy' = merge_uniq (lx, ly) in
		let lx', ly' = split_pair lxy' in
		let ix, lx', iy, ly' = if ((gid nx, lx') <= (gid ny, ly'))
			then (ix, lx', iy, ly')
			else (iy, ly', ix, lx')
		in
		let lxy' = merge_pair lx' ly' in
		Utils.MNode ((bx<>by, lxy), (lxy', ix, iy))
	)

let tacx_push_xor gid x y = match solve_xor gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (l, x, y)) -> Utils.MNode (e, (bindump_tacx (TXor, l), x, y))

let node_solve_xor gid (x, y) = match solve_xor gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (l, x, y)) -> Utils.MNode (e, (bindump_node_xor l, x, y))

let tacx_push gid = function
	| And  -> tacx_push_and  gid
	| Cons -> tacx_push_cons gid
	| Xor  -> tacx_push_xor  gid


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

let node_split (b, lxy) =
	let lx, ly = split_pair lxy in
	((false, lx), (b, ly))

let node_pull_node _ (c, ix, iy) =
	let ex, ey = node_split (binload_node c) in
	(ex, ix), (ey, iy)
i
let node_pull getid ((bx, lx), i) = match lx with
	| [] -> assert false
	| h::lx' -> let e' = (bx, lx') in match h with
		| P -> Utils.MEdge ((e', i), (e', i))
		| S -> Utils.MNode (fun node ->
			let x', y' = node_pull_node getid node in
			((compose e' x'), (compose e' y')))

let tacx_split (t, lxy) =
	let lx, ly = split_pair lxy in
	match t with
	| TAnd (bx, by) -> (And,  (bx, lx), (by, ly))
	| TCons by		-> (Cons, (false, lx), (by, ly))
	| TXor			-> (Xor,  (false, lx), (false, ly))

let tacx_pull_node _ (c, ix, iy) =
	let t, ex, ey = tacx_split (binload_tacx c) in
	(t, (ex, ix), (ey, iy))

let tacx_pull (getid:'t -> 'i) (((bx, lx), i):'t edge) : (op_tag, 't edge, 't cnode) Utils.unmerge_tagged = match lx with
	| [] -> assert false
	| h::lx' -> let e' = (bx, lx') in match h with
		| P -> Utils.MEdge ((Cons, (e', i), (e', i)):op_tag * 't edge * 't edge)
		| S -> Utils.MNode (fun node ->
			let t, x', y' = tacx_pull_node getid node in
			((t, (compose e' x'), (compose e' y')): op_tag * 't edge * 't edge))


