open Types
open Extra

let strdump_uniq_elem = function
	| P -> "P"
	| S -> "S"

let strload_uniq_elem = function
	| 'P' -> P
	| 'S' -> S
	| _   -> assert false

let bindump_uniq_elem = function
	| P -> false
	| S -> true

let binload_uniq_elem = function
	| false -> P
	| true  -> S


let strdump_uniq = List.map strdump_uniq_elem
let strload_uniq = List.map strload_uniq_elem

let bindump_uniq = List.map bindump_uniq_elem
let binload_uniq = List.map binload_uniq_elem

let bindump_pair =
	let rec aux carry = function
		| h::next -> aux	(match h with
			| SP -> false::true ::carry
			| PS -> true ::true ::carry
			| SS ->        false::carry
							) next
		| [] -> List.rev carry
	in aux []

let binload_pair =
	let rec aux carry = function
		| []				 -> List.rev carry
		| false::next        -> aux (SS::carry) next
		|  true:: true::next -> aux (PS::carry) next
		|  true::false::next -> aux (SP::carry) next
		| _					-> assert false
	in aux []

let merge_uniq (uniqX, uniqY) =
	let uniqXY, uniqXY' = List.split(List.map2(fun x y -> match x, y with
		| P, P -> P, None
		| S, P -> S, Some SP
		| P, S -> S, Some PS
		| S, S -> S, Some SS) uniqX uniqY) in
	uniqXY, (MyList.list_of_oplist uniqXY')

let split_pair uniqXY = List.split(List.map (function
	| SP -> S, P
	| PS -> P, S
	| SS -> S, S) uniqXY)

let merge_pair uniqX uniqY = List.map2 (fun x y -> match x, y with
	| P, P -> assert false
	| S, P -> SP
	| P, S -> PS
	| S, S -> SS) uniqX uniqY

let bindump_edge (b, l) = b::(bindump_uniq l) |> Array.of_list |> Bitv.L.of_bool_array 
let binload_edge = Bitv.L.to_bool_array >> Array.to_list >> (function b::l -> (b, binload_uniq l) | _ -> assert false)

let strdump_edge (b, l) = String.concat "" ((if b then "-" else "+")::(strdump_uniq l))
let strload_edge data = StrUtil.explode >> (function b::l -> ((match b with '-' -> false | '+' -> true | _ -> assert false), strload_uniq l) | _ -> assert false)

let bindump_node (b, l) = b::(bindump_pair l) |> Array.of_list |> Bitv.L.of_bool_array
let binload_node = Bitv.L.to_bool_array >> Array.to_list >> (function b::l -> (b, binload_pair l) | _ -> assert false)

let bindump_node_and ((bx, by), l) = bx::by::(bindump_pair l) |> Array.of_list |> Bitv.L.of_bool_array
let binload_node_and = Bitv.L.to_bool_array >> Array.to_list >> (function bx::by::l -> ((bx, by), binload_pair l) | _ -> assert false)

let bindump_node_xor l = bindump_pair l |> Array.of_list |> Bitv.L.of_bool_array
let binload_node_xor = Bitv.L.to_bool_array >> Array.to_list >> binload_pair

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

let eq getid = function
	| (Utils.Leaf (), Utils.Leaf ()) -> true
	| (Utils.Node nx, Utils.Node ny) -> (getid nx) = (getid ny)
	| _								 -> false

let solve_cons getid ((bX, lX) as eX, iX) ((bY, lY) as eY, iY) =
	assert(List.length lX = List.length lY);
	if (eq getid (iX, iY)) && (eX = eY)
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
	| h::lx' -> let e' = (bx, lx') in match h with
		| P -> Utils.MEdge ((Cons, (e', i), (e', i)):op_tag * 't edge * 't edge)
		| S -> Utils.MNode (fun node ->
			let t, x', y' = tacx_pull_node getid node in
			((t, (compose e' x'), (compose e' y')): op_tag * 't edge * 't edge))


