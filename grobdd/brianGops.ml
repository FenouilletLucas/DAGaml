(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open BrianTypes
open Extra

let bindump_uniq (i, j) stream = BinDump.int i (BinDump.int j stream)
let binload_uniq stream =
	let i, stream = BinLoad.int stream in
	let j, stream = BinLoad.int stream in
	(i, j), stream

let bindump_pair (i, j0, j1) stream = BinDump.int i (BinDump.int j0 (BinDump.int j1 stream))
let binload_pair stream =
	let i, stream  = BinLoad.int stream in
	let j0, stream = BinLoad.int stream in
	let j1, stream = BinLoad.int stream in
	(i, j0, j1), stream

let bindump_edge (b, u) stream = BinDump.bool b (bindump_uniq u stream)
let binload_edge stream =
	let b, stream = BinLoad.bool stream in
	let u, stream = binload_uniq stream in
	(b, u), stream

let bindump_node (b, p) stream = BinDump.bool b (bindump_pair p stream)
let binload_node stream =
	let b, stream = BinLoad.bool stream in
	let p, stream = binload_pair stream in
	(b, p), stream

let bindump_node_and (b0, b1, p) stream = BinDump.bool b0 (BinDump.bool b1 (bindump_pair p stream))
let binload_node_and stream =
	let b0, stream = BinLoad.bool stream in
	let b1, stream = BinLoad.bool stream in
	let p, stream = binload_pair stream in
	(b0, b1, p), stream

let bindump_node_xor = bindump_pair
let binload_node_xor = binload_pair

let bindump_tacx (ttag, p) stream = CpGops.bindump_ttag (bindump_pair p) ttag
let binload_tacx stream =
	let ttag, stream = CpGops.binload_ttag stream in
	let p, stream = binload_pair stream in
	(ttag, p), stream



let strdump_edge (b, (i, j)) = (GUtils.bool_of_mp b)^" "^(string_of_int i)^" -> "^(string_of_int j)

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
		Utils.MNode ((bX, (xX+1, xX+1)), ((bX<>bY, (xX, yX, yY)), iX, iY))
	)

let node_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (e', x, y)) -> Utils.MNode (e, ((e' |> bindump_node), x, y))

let tacx_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, ((b, l), x, y)) -> Utils.MNode (e, (((TCons b, l) |> bindump_tacx), x, y))

let get_root b (_, (xX, _)) = (b, (xX, 0))

let solve_and gid ((((bX, (xX, yX)) as eX), iX) as x) ((((bY, (xY, yY)) as eY), iY) as y)= 
	assert(xX = xY);
	match iX with
	| Utils.Leaf () -> Utils.MEdge (if bX then (* x = 1 *) y else (* x = 0 *) x)
	| Utils.Node nx ->
	match iY with
	| Utils.Leaf () -> Utils.MEdge (if bY then (* y = 1 *) x else (* y = 0 *) y)
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
	| Utils.MNode (e, (((bx, by), lxy), x, y)) -> Utils.MNode (e, (bindump_tacx ((TAnd (bx, by), lxy) |> bindump_tacx), x, y))

let node_solve_and : ('t -> 'i) -> 't edge * 't edge -> ('t edge, edge_state * (Bitv.t * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode)) Utils.merge =
	fun gid (x, y) -> match solve_and gid x y with
		| Utils.MEdge e -> Utils.MEdge e
		| Utils.MNode (e, (e', x, y)) -> Utils.MNode (e, ((e' |> bindump_node_and), x, y))

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


