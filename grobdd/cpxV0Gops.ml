open CpxV0Types
open CpxV0Utils

module CpxDL = CpxV0DumpLoad


let compare_subs = List.fold_left2 (fun (x_sub_y, y_sub_x, max_xy, equal) x y -> match x, y with
(* TODO the equal component is not used, remove it *)
		| S, S			-> (x_sub_y, y_sub_x, max_xy, equal)
		| S, P			-> (false  , y_sub_x, max_xy, false)
		| P, S			-> (x_sub_y, false  , max_xy, false)
		| P, P			-> (x_sub_y, y_sub_x, max_xy, equal)
		| S, X(b, i)
		| X(b, i), S	-> (false  , false  , Tools.opmin i max_xy, false)
		| P, X(b, i)	-> (x_sub_y, false  , Tools.opmin i max_xy, false)
		| X(b, i), P	-> (false  , y_sub_x, Tools.opmin i max_xy, false)
		| X(b, i), X(b', i') ->
			if (b = b') && (i = i')
			then		   (x_sub_y, y_sub_x, max_xy, equal)
			else		   (false  , false  , Tools.opmin (min i i') max_xy, false)
	) (true, true, None, true) 



let solve_cons_2 (e0, i0) (e1, i1) =
	let sub, subsub = List.split(List.map2 (fun x y -> match x, y with
		| P, P -> (P, None)
		| X(b, i), X(b', i') -> assert(b = b' && i = i'); (X(b, i), None)
		| X _, _
		| _, X _ -> assert false
		| _ -> (S, Some(x, y))) e0.sub e1.sub) in
	{
		neg		= e0.neg;
		shift	= e0.shift;
		sub		= S::sub;
	},
	(
		{
			negX = false;
			negY = e1.neg <> e0.neg;
			shiftX = e0.shift;
			shiftY = e1.shift;
			subXY = MyList.list_of_oplist subsub;
		},
		i0,
		i1
	)
	

let solve_cons_1 rank (e0, i0) (e1, i1) =
	let sub, subsub = List.split(List.map2 (fun x y -> match x, y with
		| P, P -> (P, None)
		| X(b, i), X(b', i') when (b = b') && (i = i') && (i <= rank) -> (X(b, i), None)
		| _ -> (S, Some(x, y))) e0.sub e1.sub) in
	let sub0, sub1 = List.split (MyList.list_of_oplist subsub) in
	let blockC = {
		neg		= e0.neg;
		shift	= e0.shift;
		sub		= sub;
	}
	and block0 = reduce {
		neg		= false;
		shift	= e0.shift;
		sub		= sub0;
	}
	and block1 = reduce {
		neg		= e1.neg <> e0.neg;
		shift	= e1.shift;
		sub		= sub1;
	} in
	let blockC0 = compose_block blockC block0 in assert(blockC0 = e0);
	let blockC1 = compose_block blockC block1 in assert(blockC1 = e1);
	let blockC = push_S blockC in
	if		List.for_all (function P -> true | _ -> false) block0.sub
	(* block0 is const equal to block0.neg *)
	then Utils.MEdge (compose blockC (push_X false 0 block0.neg block1, i1))
	else if List.for_all (function P -> true | _ -> false) block1.sub
	(* block1 is const equal to block1.sub *)
	then Utils.MEdge (compose blockC (push_X true  0 block1.neg block0, i0))
	else
	Utils.MNode (
		reduce {
			neg = blockC.neg <> block0.neg;
			shift = blockC.shift <> block0.neg;
			sub = blockC.sub;
		},
		(
			{
				negX	= false;
				negY	= block1.neg <> block0.neg;
				shiftX	= block0.shift;
				shiftY	= block1.shift;
				subXY	= List.combine block0.sub block1.sub;
			},
			i0,
			i1
		)
	)


let solve_cons_0 (e0, i0) (e1, i1) =
	(* X-less merging *)
	let subsubXY = List.map	( function
		| (P, P) -> (P, None)
		| (x, y) -> (S, Some(x, y))
	) (List.combine e0.sub e1.sub) in
	let sub, subXY = List.split subsubXY in
	let subXY = MyList.list_of_oplist subXY in
	(
		{
			neg		= e0.neg;
			shift	= false;
			sub		= S::sub;
		},
		(
			{
				negX	= false;
				negY	= e1.neg <> e0.neg;
				shiftX	= e0.shift;
				shiftY	= e1.shift;
				subXY	= subXY;
			},
			i0,
			i1
		)
	)

let solve_cons_3 ((blockC, (blockXY, iX, iY)) : block * (block2 * _ * _ )) =
	assert(blockXY.negX = false);
	let xX, xXY, xY = List.fold_left (fun (xX, xXY, xY) -> function X(b, 0), X(b', 0) when b <> b' -> (xX, xXY+1, xY) | X _, X _ -> (xX+1, xXY, xY+1) | X _, _ -> (xX+1, xXY, xY) | _, X _ -> (xX, xXY, xY+1) | _ -> (xX, xXY, xY)) (0, 0, 0) blockXY.subXY
	and yX, yXY, yY = List.fold_left (fun (xX, xXY, xY) -> function X(b, 0), X(b', 0) when b = b' -> (xX, xXY+1, xY) | X _, X _ -> (xX+1, xXY, xY+1) | X _, _ -> (xX+1, xXY, xY) | _, X _ -> (xX, xXY, xY+1) | _ -> (xX, xXY, xY)) (0, 0, 0) blockXY.subXY in
	let sX, sY = List.fold_left (fun (sX, sY) -> fun (x, y) -> (sX || (x = S), sY || (y = S))) (false, false) blockXY.subXY in
	let uX = ( xX = 0 ) && ( not sX ) (* x is zero-ending subset of y *)
	and uY = ( xY = 0 ) && ( not sY ) (* y is zero-ending subset of x *) in
	let vX = ( yX = 0 ) && ( not sX )
	and vY = ( yY = 0 ) && ( not sY ) in
	let shifted = blockXY.shiftX <> blockXY.negY <> blockXY.shiftY in
	if shifted && xXY = 1 && (uX || uY)
	then
	(
		Utils.MEdge (compose blockC (
			if		uY
			then
			(
				let subC', subX = List.split(List.map (function X(b, i), X(b', i') -> assert(i = 0 && i' = 0 && (b <> b')); X(b, i), None | (x, _) -> S, (Some x)) blockXY.subXY) in
				let blockX = reduce {
					neg = false;
					shift = blockXY.shiftX;
					sub = MyList.list_of_oplist subX;
				} in
				let blockC' = reduce {
					neg = false;
					shift = blockXY.shiftX;
					sub = S::subC';
				} in
				compose blockC' (push_X true 0 (not blockXY.negY) blockX, iX)
			)
			else
			(
				assert(uX);
				let subC', subY = List.split(List.map(function X(b, i), X(b', i') -> assert(i = 0 && i' = 0 && (b <> b')); X(b', i'), None | (_, y) -> S, (Some y)) blockXY.subXY) in
				let blockY = reduce {
					neg = false;
					shift = blockXY.shiftY;
					sub = MyList.list_of_oplist subY;
				} in
				let blockC' = reduce {
					neg = blockXY.negY;
					shift = blockXY.shiftY;
					sub = S::subC';
				} in
				compose blockC' (push_X false 0 (not blockXY.negY) blockY, iY)
			)
		))
	)
	else if (not shifted) && yXY = 1 && (vX || vY)
	then
	(
		Utils.MEdge (compose blockC (
			if		vY
			then
			(
				let subC', subX = List.split(List.map (function X(b, i), X(b', i') -> assert(i = 0 && i' = 0 && (b = b')); X(b, i), None | (x, _) -> S, (Some x)) blockXY.subXY) in
				let blockX = reduce {
					neg = false;
					shift = blockXY.shiftX;
					sub = MyList.list_of_oplist subX;
				}
				and blockC' = reduce {
					neg = false;
					shift = blockXY.shiftX;
					sub = S::subC';
				} in
				compose blockC' (push_X true 0 blockXY.negY blockX, iX)
			)
			else
			(
				assert(vX);
				let subC', subY = List.split(List.map(function X(b, i), X(b', i') -> assert(i = 0 && i' = 0 && (b = b')); X(b', i'), None | (_, y) -> S, (Some y)) blockXY.subXY) in
				let blockY = reduce {
					neg = blockXY.negY;
					shift = blockXY.shiftY;
					sub = MyList.list_of_oplist subY;
				} in
				let blockC' = reduce {
					neg = false;
					shift = blockXY.shiftX;
					sub = S::subC';
				} in
				compose blockC' (push_X false 0 false blockY, iY)
			)
		))
	)
	else if xXY = 0 && (uX || uY)
	then
	(
		let blockX, blockY = block_split blockXY in
		let blockX = reduce blockX
		and blockY = reduce blockY in
		Utils.MEdge (compose blockC (if uX
		then
		(
			assert(List.for_all (function P -> true | _ -> false) blockX.sub);
			(push_X false 0 blockX.neg blockY, iY)
		)
		else
		(
			assert(uY);
			assert(List.for_all (function P -> true | _ -> false) blockY.sub);
			(push_X true  0 blockY.neg blockX, iX)
		)))
	)
	else
	(
		let blockX, blockY = block_split blockXY in
		let blockX = reduce blockX
		and blockY = reduce blockY in
		let blockX = {
			neg = false;
			shift = blockX.shift;
			sub = blockX.sub;
		}
		and blockY = {
			neg = blockY.neg <> blockX.neg;
			shift = blockY.shift;
			sub = blockY.sub;
		}
		and blockC = reduce {
			neg = blockC.neg <> blockX.neg;
			shift = blockC.shift <> blockX.neg;
			sub = blockC.sub;
		}
		in
		Utils.MNode (blockC, (block_merge blockX blockY, iX, iY))
	)


let solve_cons' getid ((e0, i0) as f0) ((e1, i1) as f1) =
	assert(check e0);
	assert(check e1);
	let cmp = CpGops.cmpid getid (i0, i1) in
	if (e0 = e1)
	then if (cmp = None)
		(* the first variable is not significant *)
		then (Utils.MEdge (push_P e0, i0))
		(* the first variable is significant, the consensus is obvious *)
		else (Utils.MNode (push_S e0, (cmake_nSS (e0.sub), i0, i1)))
	else	  match block_is_const e0 with
	(* f0 is a constant, thus mergeable *)
	| Some tB -> (Utils.MEdge (push_X false 0 tB e1, i1))
	| None -> match block_is_const e1 with
	(* f1 is a constant, thus mergeable *)
	| Some tB -> (Utils.MEdge (push_X true  0 tB e0, i0))
	| None ->
	(* at this point all trivial merging & consensus have been eliminated *)
	if ((e0.neg <> e0.shift) = (e1.neg <> e1.shift))
	then
	(
		(* mergeable *)
		let hasS0, maxX0 = classify e0
		and hasS1, maxX1 = classify e1 in
		match maxX0, maxX1 with
		| Some maxX0, Some maxX1 ->
		(
			let x_sub_y, y_sub_x, max_xy, equal = compare_subs e0.sub e1.sub in
			if equal
			then Utils.MNode (solve_cons_2 f0 f1)
			else
			(
				assert(not(x_sub_y && y_sub_x)); (* they can't be both a subset of each other without being equal *)
				match max_xy with
				| Some max_xy -> (solve_cons_1 max_xy f0 f1)
				(* no X-related conflict has been detected, thus we focus only on P-related problems *)
				| None -> Utils.MNode (solve_cons_2 f0 f1)
			)
		)
		(* X-less merging *)
		| _ -> Utils.MNode (solve_cons_0 f0 f1)
	)
	(* X-less merging *)
	else (Utils.MNode (solve_cons_0 f0 f1))

let solve_cons gid x y =
	match solve_cons' gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (blockC, (blockXY, iX, iY)) -> solve_cons_3 (blockC, (blockXY, iX, iY))

let pull_S i block =
	(*print_string"block: "; print_string(CpxDL.block_dummydump block); print_newline();*)
	let f = block.shift <> (mod2 i) in
	let ethen = {
		neg = block.neg <> f;
		shift = block.shift <> f;
		sub = List.map (function
			| ((X(_, j)) as x)  when j < i -> x
			| _ -> P) block.sub;
	} in
	let cnt = MyList.count (function X(_, j) when i = j -> true | _ -> false) block.sub in
	let eelse = if cnt = 0
	then (if i = 0
	then
	{
		neg		= block.neg;
		shift	= not block.shift;
		sub		= List.map (function X(b, j) -> X(b, j-1) | x -> x) block.sub;
	}
	else
	{
		neg		= block.neg;
		shift	= block.shift;
		sub		= List.map (function X(b, j) when j > i -> X(b, j-2) | x -> x) block.sub;
	})
	else block
	in
	reduce ethen, reduce eelse



let node_pull getid (b, i) = match b.sub with
	| [] -> assert false
	| head::tail -> 
		let b' = {
			neg		= b.neg;
			shift	= b.shift;
			sub		= tail;
		} in match head with
		| S ->	Utils.MNode (fun node ->
			let x', y' = node_split node in
			(compose b' x', compose b' y'))
		| P ->	Utils.MEdge ((b', i), (b', i))
		| X(b, j) ->
		(
			let ethen, eelse = pull_S j b' in
			(*print_string"ethen: "; print_string(CpxDL.block_dummydump ethen); print_newline();
			print_string"eelse: "; print_string(CpxDL.block_dummydump eelse); print_newline();*)
			let ethen = (ethen, Utils.Leaf ())
			and eelse = (eelse, i) in
			(*print_string"b: "; print_string(if b then "true" else "false"); print_newline();*)
			Utils.MEdge (Tools.cswap b (ethen, eelse))
		)


let solve_and_1 (ex, ix) (ey, iy) =
	let a, bc = List.split(List.map (function (P, P) -> P, None | (x, y) -> S, Some(x, y)) (List.combine ex.sub ey.sub)) in
	Utils.MNode (
		{
			neg = false;
			shift = false;
			sub = a;
		},
		(
			{
				negX = ex.neg;
				negY = ey.neg;
				shiftX = ex.shift;
				shiftY = ey.shift;
				subXY = MyList.list_of_oplist bc;
			},
			ix,
			iy
		)
	)

let solve_and_2 (ex, ix) (ey, iy) =
	let a, bc = List.split(List.map (function
		| (P, P)			-> P, None
		| X(b, 0), X(b', 0) -> assert(b = b'); X(b, 0), None
		| (x, y)			-> S, Some(x, y)
		) (List.combine ex.sub ey.sub)) in
	Utils.MNode (
		{
			neg = false;
			shift = false;
			sub = a;
		},
		(
			{
				negX = ex.neg;
				negY = ey.neg;
				shiftX = ex.shift;
				shiftY = ey.shift;
				subXY = MyList.list_of_oplist bc;
			},
			ix,
			iy
		)
	)

let solve_and_3 (ex, ix) (ey, iy) =
	let a, bc = List.split(List.map (function
		| (P, P)						-> P, None
		| X(b, 0), X(b', 0) when b = b'	-> X(b, 0), None
		| (x, y)						-> S, Some(x, y)
		) (List.combine ex.sub ey.sub)) in
	Utils.MNode (
		{
			neg = false;
			shift = true;
			sub = a;
		},
		(
			{
				negX = ex.neg;
				negY = ey.neg;
				shiftX = ex.shift;
				shiftY = ey.shift;
				subXY = MyList.list_of_oplist bc;
			},
			ix,
			iy
		)
	)

let solve_and_0 ((blockX, ix) as x) ((blockY, iy) as y) : (block * 'g, block * (block2 * 'g * 'g)) Utils.merge =
	let hasSX, maxXX = classify blockX
	and hasSY, maxXY = classify blockY in
	match maxXX, maxXY with
	| None, None -> solve_and_1 x y
	| Some maxXX, None ->
	(
		solve_and_1 x y
	)
	| None, Some maxXY ->
	(
		solve_and_1 x y
	)
	| Some maxXX, Some maxXY ->
	(
		match blockX.neg <> blockX.shift, blockY.neg <> blockY.shift with
		| false, false ->
		(
			(* look for conflict in level 0 *)
			if List.exists (function X(b, 0), X(b', 0) when b <> b' -> true | _ -> false ) (List.combine blockX.sub blockY.sub)
			then ( Utils.MEdge (get_root false x) )
			else ( solve_and_2 x y )
		)
		| true , true  -> solve_and_3 x y
		| _ -> solve_and_1 x y
	)

let solve_and getid ((ex, ix) as x) ((ey, iy) as y) =
	match node_is_const x with
	| Some b -> Utils.MEdge ( if b then y else x )
	| None -> match node_is_const y with
	| Some b -> Utils.MEdge ( if b then x else y )
	| None ->
	if (CpGops.cmpid getid (ix, iy) = None) && (ex.shift = ey.shift) && (ex.sub = ey.sub)
	then Utils.MEdge (if ex.neg = ey.neg then x (* = y *) else get_root false x)
	else
	( match solve_and_0 x y with
		| Utils.MEdge (e, i) -> Utils.MEdge (reduce e, i)
		| Utils.MNode (e, (exy, ix, iy)) ->
			let e = reduce e in
			let ex, ey = block_split exy in
			let ex = reduce ex
			and ey = reduce ey in
			match block_is_const ex with
			| Some b -> Utils.MEdge (compose e (if b then (ey, iy) else (ex, ix)))
			| None -> match block_is_const ey with
			| Some b -> Utils.MEdge (compose e (if b then (ex, ix) else (ey, iy)))
			| None ->	Utils.MNode (e, (block_merge ex ey, ix, iy))
	)

let solve_xor_0 (ex, ix) (ey, iy) =
	let _, _, max_xy, _ = compare_subs ex.sub ey.sub in
	match max_xy with
	| None ->
	(
		let subC, subXY = List.split(List.map (function(P, P) -> P, None | (X(b, i), X(b', i')) -> assert(b=b' && i=i'); X(b, 0), None | (x, y) -> S, Some(x, y)) (List.combine ex.sub ey.sub)) in
		let subX, subY = List.split(MyList.list_of_oplist subXY) in
		let blockC = {
			neg = ex.neg <> ex.shift <> ey.neg <> ey.shift;
			shift = false;
			sub  = subC;
		}
		and blockX = reduce {
			neg = ex.shift;
			shift = ex.shift;
			sub = subX;
		}
		and blockY = reduce {
			neg = ey.shift;
			shift = ey.shift;
			sub = subY;
		} in
		reduce {
			neg = blockC.neg <> blockX.neg <> blockY.neg;
			shift = blockC.shift <> blockX.neg <> blockY.neg;
			sub = blockC.sub;
		},
		(
			{
				negX = false;
				negY = false;
				shiftX = blockX.shift;
				shiftY = blockY.shift;
				subXY = List.combine blockX.sub blockY.sub;
			},
			ix,
			iy
		)
	)
	| Some max_xy ->
	(
		let subC, subXY = List.split(List.map (function(P, P) -> P, None | (X(b, i), X(b', i')) when b = b' && i = i' && i <= max_xy -> X(b, 0), None | (x, y) -> S, Some(x, y)) (List.combine ex.sub ey.sub)) in
		let subX, subY = List.split(MyList.list_of_oplist subXY) in
		let blockC = {
			neg = ex.neg <> ex.shift <> ey.neg <> ey.shift;
			shift = false;
			sub  = subC;
		}
		and blockX = reduce {
			neg = ex.shift;
			shift = ex.shift;
			sub = subX;
		}
		and blockY = reduce {
			neg = ey.shift;
			shift = ey.shift;
			sub = subY;
		} in
		reduce {
			neg = blockC.neg <> blockX.neg <> blockY.neg;
			shift = blockC.shift <> blockX.neg <> blockY.neg;
			sub = blockC.sub;
		},
		(
			{
				negX = false;
				negY = false;
				shiftX = blockX.shift;
				shiftY = blockY.shift;
				subXY = List.combine blockX.sub blockY.sub;
			},
			ix,
			iy
		)
	)



let solve_xor getid ((ex, ix) as x) ((ey, iy) as y) =
	match node_is_const x with
	| Some b -> Utils.MEdge ( cneg b y )
	| None -> match node_is_const y with
	| Some b -> Utils.MEdge ( cneg b x )
	| None ->
	if (CpGops.cmpid getid (ix, iy) = None) && (ex.shift = ey.shift) && (ex.sub = ey.sub)
	then Utils.MEdge (get_root (ex.neg <> ey.neg) x )
	else Utils.MNode (solve_xor_0 x y)


let node_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (CpxDL.bindump_node block, x, y))

let tacx_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (CpxDL.bindump_tacx (CpTypes.Cons, block), x, y))

let node_push_and gid (x, y) = match solve_and gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (CpxDL.bindump_node block, x, y))

let tacx_push_and gid x y = match solve_and gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (CpxDL.bindump_tacx (CpTypes.And, block), x, y))

let node_push_xor gid (x, y) = match solve_xor gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (CpxDL.bindump_node block, x, y))

let tacx_push_xor gid x y = match solve_xor gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (CpxDL.bindump_tacx (CpTypes.Xor, block), x, y))


let tacx_pull_node _ (c, ix, iy) =
	let t, ex, ey = tacx_split (CpxDL.binload_tacx c) in
	(t, (ex, ix), (ey, iy))

let tacx_pull gid e = assert false

let tacx_push gid = CpTypes.(function
	| Cons -> tacx_push_cons gid
	| And  -> tacx_push_and  gid
	| Xor  -> tacx_push_xor  gid)
	
