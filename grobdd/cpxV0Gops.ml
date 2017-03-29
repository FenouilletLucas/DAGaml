open CpxV0Types
open CpxV0Utils

module CpxDL = CpxV0DumpLoad

let consensus f x y =
	let xy, xy' = List.split(List.map f (List.combine x y)) in
	xy, MyList.list_of_oplist xy'

let block_is_singleton block =
	let res = List.fold_left (function
		| None -> fun _ -> None
		| Some b -> (function
			| S -> None
			| P -> Some b
			| X _ -> if b then None else (Some true))
		) (Some false) block.sub in
	match res with
	| Some true -> true
	| _			-> false

let final_solve_cons blockC (blockX, iX) (blockY, iY) =
	let blockC = reduce blockC
	and blockX = reduce blockX
	and blockY = reduce blockY in
	let mnode () = Utils.MNode (
		reduce {
			neg = blockC.neg <> blockX.neg;
			shift = blockC.shift <> blockX.neg;
			sub = blockC.sub;
		},
		(
			{
				negX = false;
				negY = blockY.neg <> blockX.neg;
				shiftX = blockX.shift;
				shiftY = blockY.shift;
				subXY = List.combine blockX.sub blockY.sub;
			},
			iX,
			iY
		)
	) in
	match block_is_const blockX with
	| Some th -> Utils.MEdge(compose blockC (push_X false 0 th blockY, iY))
	| None -> match block_is_const blockY with
	| Some th -> Utils.MEdge(compose blockC (push_X true  0 th blockX, iX))
	| None ->
	(
		let allign = ( blockX.neg <> blockX.shift ) = ( blockY.neg <> blockY.shift ) in
		let xx0 () = List.fold_left (function
			| Some x -> (fun _ -> Some x)
			| None -> (function
				(* when ... && (if allign then b = b' else b <> b' ) *)
				| X(b, i), X(b', i') when i = 0 && i' = 0 && (allign <> b <> b') -> Some(b, b')
				| _ -> None)
			) None (List.combine blockX.sub blockY.sub)
		in
		match block_is_singleton blockX, block_is_singleton blockY with
		| true , true  ->
		(
			assert(blockX.shift = true);
			assert(blockY.shift = true);
			if blockX.sub = blockY.sub
			then
			(
				assert(List.length blockX.sub = 1);
				assert(List.length blockY.sub = 1);
				assert(blockX.neg <> blockY.neg);
				(* the first can't be non-significant without having been detected *)
			)
			else
			(
				assert(List.length blockX.sub = 2);
				assert(List.length blockY.sub = 2);
			);
			mnode()
		)
		| true , false ->
		(
			assert(blockX.shift = true);
			match xx0() with
			| None -> ( mnode() )
			| Some(_, b') ->
			(
				let subC', subY = consensus (function
					| X _, X _ -> X(b', 0), None
					| _  , y   -> S, (Some y) ) blockX.sub blockY.sub in
				let negX = blockX.neg = allign in
				let blockY = reduce {
					neg = blockY.neg <> negX;
					shift = blockY.shift;
					sub = subY;
				} in
				let blockC' = reduce {
					neg = negX;
					shift = true;
					sub = S::subC';
				} in
				Utils.MEdge(compose blockC (compose blockC' (push_X false 0 false blockY, iY)))
			)
		)
		| false, true  ->
		(
			assert(blockY.shift = true);
			match xx0() with
			| None -> ( mnode() )
			| Some(b, _) ->
			(
				let subC', subX = consensus (function
					| X _, X _ -> X(b, 0), None
					| x  , _   -> S, (Some x) ) blockX.sub blockY.sub in
				let negY = blockY.neg = allign in
				let blockX = reduce {
					neg = blockX.neg <> negY;
					shift = blockX.shift;
					sub = subX;
				} in
				let blockC' = reduce {
					neg = negY;
					shift = true;
					sub = S::subC';
				} in
				Utils.MEdge(compose blockC (compose blockC' (push_X true 0 false blockX, iX)))
			)
		)
		| false, false ->
		(
			mnode()
		)
	)

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
	let subC, subsub = consensus (function
		| P, P -> (P, None)
		| X(b, i), X(b', i') -> assert(b = b' && i = i'); (X(b, i), None)
		| X _, _
		| _, X _ -> assert false
		| (x, y) -> (S, Some(x, y))) e0.sub e1.sub in
	let subX, subY = List.split subsub in
	final_solve_cons
	{
		neg		= e0.neg;
		shift	= e0.shift;
		sub		= S::subC;
	}
	({
		neg = false;
		shift = e0.shift;
		sub = subX;
	}, i0)
	({
		neg = e0.neg <> e1.neg;
		shift = e1.shift;
		sub = subY;
	}, i1)
	

let solve_cons_1 rank (e0, i0) (e1, i1) =
	let sub, subsub = consensus (function
		| P, P -> (P, None)
		| X(b, i), X(b', i') when (b = b') && (i = i') && (i <= rank) -> (X(b, i), None)
		| (x, y) -> (S, Some(x, y))) e0.sub e1.sub in
	let sub0, sub1 = List.split subsub in
	final_solve_cons {
		neg		= e0.neg;
		shift	= e0.shift;
		sub		= S::sub;
	}
	({
		neg		= false;
		shift	= e0.shift;
		sub		= sub0;
	}, i0)
	({
		neg		= e1.neg <> e0.neg;
		shift	= e1.shift;
		sub		= sub1;
	}, i1)


let solve_cons_0 (e0, i0) (e1, i1) =
	(* X-less merging *)
	let subC, subXY = consensus ( function
		| (P, P) -> (P, None)
		| (x, y) -> (S, Some(x, y))
	) e0.sub e1.sub in
	let subX, subY = List.split subXY in
	final_solve_cons
	{
		neg = e0.neg;
		shift = e0.shift;
		sub = S::subC;
	}
	({
		neg = false;
		shift = e0.shift;
		sub = subX;
	}, i0)
	({
		neg = e1.neg <> e0.neg;
		shift = e1.shift;
		sub = subY;
	}, i1)

let solve_cons getid ((e0, i0) as f0) ((e1, i1) as f1) =
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
			then solve_cons_2 f0 f1
			else
			(
				assert(not(x_sub_y && y_sub_x)); (* they can't be both a subset of each other without being equal *)
				match max_xy with
				| Some max_xy -> (solve_cons_1 max_xy f0 f1)
				(* no X-related conflict has been detected, thus we focus only on P-related problems *)
				| None -> solve_cons_2 f0 f1
			)
		)
		(* X-less merging *)
		| _ -> solve_cons_0 f0 f1
	)
	(* X-less merging *)
	else (solve_cons_0 f0 f1)

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
	let sub, subXY = consensus(function
		| (P, P) -> P, None
		| (x, y) -> S, Some(x, y)) ex.sub ey.sub in
	Utils.MNode (
		{
			neg = false;
			shift = false;
			sub;
		},
		(
			{
				negX = ex.neg;
				negY = ey.neg;
				shiftX = ex.shift;
				shiftY = ey.shift;
				subXY;
			},
			ix,
			iy
		)
	)

let solve_and_2 (ex, ix) (ey, iy) =
	let sub, subXY = consensus(function
		| (P, P)			-> P, None
		| X(b, 0), X(b', 0) -> assert(b = b'); X(b, 0), None
		| (x, y)			-> S, Some(x, y)
		) ex.sub ey.sub in
	Utils.MNode (
		{
			neg = false;
			shift = false;
			sub;
		},
		(
			{
				negX = ex.neg;
				negY = ey.neg;
				shiftX = ex.shift;
				shiftY = ey.shift;
				subXY;
			},
			ix,
			iy
		)
	)

let solve_and_3 (ex, ix) (ey, iy) =
	let sub, subXY = consensus(function
		| (P, P)						-> P, None
		| X(b, 0), X(b', 0) when b = b'	-> X(b, 0), None
		| (x, y)						-> S, Some(x, y)
		) ex.sub ey.sub in
	Utils.MNode (
		{
			neg = false;
			shift = true;
			sub;
		},
		(
			{
				negX = ex.neg;
				negY = ey.neg;
				shiftX = ex.shift;
				shiftY = ey.shift;
				subXY;
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
			| None ->	Utils.MNode (e, (if (ex, ix) < (ey, iy) then (block_merge ex ey, ix, iy) else (block_merge ey ex, iy, ix)))
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
	else
	(
		let e, (xy, ix, iy) = solve_xor_0 x y in
		let ex, ey = block_split xy in
		let ex = reduce ex
		and ey = reduce ey in
		Utils.MNode (e, (if (ex, ix) < (ey, iy)
		then (block_merge ex ey, ix, iy)
		else (block_merge ey ex, iy, ix)))
	)


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
	
