(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open CpTypes
open Extra

let strdump_uniq_elem = function
	| P -> "U"
	| S -> "S"

let strload_uniq_elem = function
	| 'U' -> P
	| 'S' -> S
	| _   -> assert false

let bindump_uniq_elem elem stream = match elem with
	| P -> false::stream
	| S -> true ::stream

let binload_uniq_elem = function
	| false::stream -> P, stream
	| true ::stream -> S, stream
	| _ -> assert false


let strdump_uniq = List.map strdump_uniq_elem
let strload_uniq = List.map strload_uniq_elem

let bindump_uniq = BinDump.list bindump_uniq_elem
let binload_uniq = BinLoad.list binload_uniq_elem

let bindump_pair_elem elem stream = match elem with
	| SP -> false::false::stream
	| PS -> false::true ::stream
	| SS -> true ::stream

let binload_pair_elem = function
	| false::false::stream -> SP, stream
	| false::true ::stream -> PS, stream
	| true ::stream        -> SS, stream
	| _ -> assert false

let bindump_pair = BinDump.list bindump_pair_elem
let binload_pair = BinLoad.list binload_pair_elem

let bindump_edge = BinDump.pair BinDump.bool bindump_uniq
let binload_edge = BinLoad.pair BinDump.bool binload_uniq

let bindump_node ((), edge0, edge1) stream =
	BinDump.pair bindump_edge bindump_edge (edge0, edge1) stream

let binload_node stream =
	let (edge0, edge1), stream = BinLoad.pair binload_edge binload_edge stream in
	((), edge0, edge1), stream



let bindump_ttag carry = function
	| TAnd (b0, b1) -> false::b0   ::b1   ::carry
	| TCons b		-> true ::false::b    ::carry
	| TXor			-> true ::true ::carry

let binload_ttag = function
	| false::b0   ::b1   ::carry -> (TAnd (b0, b1)), carry
	| true ::false::b    ::carry -> (TCons b      ), carry
	| true ::true ::carry        -> (TXor         ), carry
	| _ -> assert false

let bindump_tacx (t, l) = bindump_ttag (bindump_pair l) t |> Array.of_list |> Bitv.L.of_bool_array
let binload_tacx = Bitv.L.to_bool_array >> Array.to_list >> binload_ttag >> (fun (t, l) -> (t, binload_pair l))

let cmp x y =
	if x = y
	then None
	else Some(x>y)

let cmpid getid = function
	| (Utils.Leaf (), Utils.Leaf ()) -> None
	| (Utils.Node nx, Utils.Node ny) -> cmp (getid nx) (getid ny)
	| (Utils.Leaf _ , Utils.Node _ ) -> Some false
	| (Utils.Node _ , Utils.Leaf _ ) -> Some true

let solve_cons getid ((bX, lX) as eX, iX) ((bY, lY) as eY, iY) =
	assert(List.length lX = List.length lY);
	if (cmpid getid (iX, iY) = None) && (eX = eY)
	then (Utils.MEdge ((bX, P::lX), iX))
	else
	(
		let lXY, lXY' = merge_uniq (lX, lY) in
		Utils.MNode ((bX, S::lXY), ((bX<>bY, lXY'), iX, iY))
	)

let node_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (e', x, y)) -> Utils.MNode (e, (bindump_node e', x, y))

let tacx_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, ((b, l), x, y)) -> Utils.MNode (e, (bindump_tacx (TCons b, l), x, y))

let get_root b ((_, l), _) = ((b, MyList.ntimes P (List.length l)), Utils.Leaf ())

let solve_and gid (((bx, lx), ix) as x) (((by, ly), iy) as y) =
	assert(List.length lx = List.length ly);
	match ix with
	| Utils.Leaf () -> Utils.MEdge (if bx then (* x ~ 1 *) y else (* x ~ 0 *) x)
	| Utils.Node nx ->
	match iy with
	| Utils.Leaf () -> Utils.MEdge (if by then (* y ~ 1 *) x else (* y ~ 0 *) y)
	| Utils.Node ny ->
	if (gid nx = gid ny) && (lx = ly)
	then Utils.MEdge (if bx = by
		then (* x =  y *) x
		else (* x = ~y *) (get_root false x)
		             )
	else
	(
		let lxy, lxy' = merge_uniq (lx, ly) in
		let lx', ly' = split_pair lxy' in
		let bx, ix, lx', by, iy, ly' = if ((gid nx, bx, lx') <= (gid ny, by, ly'))
			then (bx, ix, lx', by, iy, ly')
			else (by, iy, ly', bx, ix, lx')
		in
		let lxy' = merge_pair lx' ly' in
		Utils.MNode ((false, lxy), (((bx, by), lxy'), ix, iy))
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
	| h::lx' ->  match h with
		| P -> let e' = (bx, lx') in Utils.MEdge ((Cons, (e', i), (e', i)):op_tag * 't edge * 't edge)
		| S -> Utils.MNode (fun node ->
			let t, x', y' = tacx_pull_node getid node in
			let e' = match t with
				| Cons	-> (bx, lx')
				| _		-> (bx, lx )
			in
			((t, (compose e' x'), (compose e' y')): op_tag * 't edge * 't edge))


