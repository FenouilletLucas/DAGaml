(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open CpxTypes2
open CpxUtils2

module CpxDL = CpxDumpLoad

let consensus f x y =
	let xy, xy' = List.split(List.map f (List.combine x y)) in
	xy, List.split(MyList.list_of_oplist xy')

let block_is_singleton block = match block.block with Id _ -> true | _ -> false

let solve_cons_id_spx_no_merge x shift liste =
	let rec aux carryC carryc i = function
		| [] -> (List.rev carryC, List.rev carryc)
		| head::tail -> match head with
			| P when i<>x  -> (aux (P::carryC)        carryc  (i+1) tail)
			| _            -> (aux (S::carryC) (head::carryc) (i+1) tail)
	in
	let listeC, listec = aux [] [] 0 liste in
	let listeC = S::listeC in
	let tagC = get_spx_tag_from_block_spx listeC
	and tagc = get_spx_tag_from_block_spx listec in
	let rec aux n i = function
		| [] -> assert false
		| head::tail -> if i = x then n else match head with
			| P -> aux  n    (i+1) tail
			| _ -> aux (n+1) (i+1) tail
	in
	(false, tagC, listeC), (List.length listec), (aux 0 0 liste), (shift, tagc, listec)
	

let meta_solve_cons ((block0, node0) as edge0) ((block1, node1) as edge1) ifspx2 =
	assert(check_edge edge0);
	assert(check_edge edge1);
	assert(block0.arity = block1.arity);
	if node0 = node1
	then (Utils.MEdge (push_P_edge edge0))
	else match block0.block, block1.block with
	| C0      , _        -> Utils.MEdge(push_X0_edge false block0.neg edge1)
	| _       , C0       -> Utils.MEdge(push_X0_edge true  block1.neg edge0)
	| Id x0   , Id x1    ->
	(
		if x0 = x1
		then
		(
			assert(block0.neg <> block1.neg);
			let liste = S::(MyList.init block0.arity (fun i -> if i = x0 then S else P)) in
			let tag = {hasS = true; hasP = block0.arity > 1; maxX = None} in
			let block_spx = (false, tag, liste) in
			Utils.MNode (
				{neg = block0.neg; arity = block0.arity+1; block = SPX block_spx},
				((
					{neg = false; arity = 1; block = Id 0},
					{neg = true ; arity = 1; block = Id 0}
				), node0, node1)
			)
		)
		else
		(
			let liste = S::(MyList.init block0.arity (fun i -> if i = x0 || i = x1 then S else P)) in
			let id0, id1 = if x0 < x1 then (0, 1) else (1, 0) in
			let tag = {hasS = true; hasP = block0.arity > 2; maxX = None} in
			let block_spx = (false, tag, liste) in
			Utils.MNode (
				{neg = block0.neg; arity = block0.arity+1; block = SPX block_spx},
				((
					{neg = false; arity = 2; block = Id id0},
					{neg = block0.neg <> block1.neg; arity = 2; block = Id id1}
				), node0, node1)
			)
		)
	) 
	| Id x   , SPX (shift, _, liste) ->
	(
		match List.nth liste x with
		| X(b, 0) when (b <> block0.neg) = (shift <> block1.neg) ->
		(
			let liste' = (X(false, 1))::(List.mapi (fun y -> function X(b, i) when x<>y -> X(b, i+2) | e -> e) liste) in
			let block = reduce_block_spx block1.neg (block1.arity+1) (Utils.gnode_is_leaf node1) shift liste' in
			Utils.MEdge (block, node1)
		)
		| _ ->
		(
			let spxC, (arityc:int), (xc:int), spxc = solve_cons_id_spx_no_merge x shift liste in
			Utils.MNode (
				{neg = block0.neg; arity = block0.arity+1; block = SPX spxC},
				((
					{neg = false; arity = arityc; block = Id xc},
					{neg = block0.neg <> block1.neg; arity = arityc; block = SPX spxc}
				), node0, node1)
			)
		)
	)
	| SPX (shift, _, liste), Id x    ->
	(
		match List.nth liste x with
		| X(b, 0) when (shift <> block0.neg) <> (b <> block1.neg) ->
		(
			let liste' = (X(true, 1))::(List.mapi (fun y -> function X(b, i) when x<>y -> X(b, i+2) | e -> e) liste) in
			let block = reduce_block_spx block0.neg (block0.arity+1) (Utils.gnode_is_leaf node1) shift liste' in
			Utils.MEdge (block, node0)
		)
		| _ ->
		(
			let spxC, arityc, xc, spxc = solve_cons_id_spx_no_merge x shift liste in
			Utils.MNode (
				{neg = block0.neg; arity = block0.arity+1; block = SPX spxC},
				((
					{neg = false; arity = arityc; block = SPX spxc},
					{neg = block0.neg <> block1.neg; arity = arityc; block = Id xc}
				), node0, node1)
			)
		)
	)
	| SPX spx0, SPX spx1 -> ifspx2 block0.arity block0.neg block1.neg (spx0, node0) (spx1, node1)


let final_ifspx2 arity neg0 neg1 (spx0, i0) (spx1, i1) =
	Utils.MNode (
		make_block_S neg0 (arity+1),
		((
			{neg = false     ; arity; block = SPX spx0},
			{neg = neg0<>neg1; arity; block = SPX spx1}
		), i0, i1)
	)

let facto_ifspx2 arity neg0 neg1 ((s0, t0, l0), i0) ((s1, t1, l1), i1) =
	match t0.maxX, t1.maxX with
	| Some max0, Some max1 when (neg0 <> s0) = (neg1 <> s1) ->
	(
		let opmin = List.fold_left (fun opmin -> function
			| X(b, i), X(b', i') -> if (b=b')&&(i=i)
				then opmin
				else (Tools.opmin (min i i') opmin)
			| X(_, i), _
			| _      , X(_, i) -> Tools.opmin i opmin
			| _                -> opmin) None (List.combine l0 l1) in
		let cfun = match opmin with
			| None -> (function (P, P) -> P, None | (X bi, X bi') -> assert(bi = bi'); X bi, None | (x, y) -> (S, Some(x, y)))
			| Some min -> (function
				| P, P -> P, None
				| X(b, i), X(b', i') when (b=b')&&(i=i')&&(i<=min) -> X(b, i), None
				| (x, y) -> S, Some (x, y)
			)
		in
		let listeC, (listec0, listec1) = consensus cfun l0 l1 in
		let arity' = List.length listec0 in
		assert(arity' = List.length listec1);
		let spxC  = reduce_block_spx false (arity+1) false                    false listeC  in
		let spxc0 = reduce_block_spx neg0  arity'    (Utils.gnode_is_leaf i0) s0    listec0 in
		let spxc1 = reduce_block_spx neg0  arity'    (Utils.gnode_is_leaf i1) s1    listec1 in
		match meta_solve_cons (spxc0, i0) (spxc1, i1) final_ifspx2 with
		| Utils.MEdge edge -> Utils.MEdge(compose_edge spxC edge)
		| Utils.MNode (edge, node) -> Utils.MNode(compose_block spxC edge false, node)
	)
	| _ ->
	(
		let cfun = function (P, P) -> P, None | (x, y) -> (S, Some(x, y)) in
		let listeC, (listec0, listec1) = consensus cfun l0 l1 in
		let arity' = List.length listec0 in
		assert(arity' = List.length listec1);
		let spxC  = reduce_block_spx false (arity+1) false                    false listeC  in
		let spxc0 = reduce_block_spx neg0  arity'    (Utils.gnode_is_leaf i0) s0    listec0 in
		let spxc1 = reduce_block_spx neg0  arity'    (Utils.gnode_is_leaf i1) s1    listec1 in
		Utils.MNode(spxC, ((spxc0, spxc1), i0, i1))
	)

let solve_cons edge0 edge1 : (_, _) Utils.merge = meta_solve_cons edge0 edge1 facto_ifspx2


let pull_X i neg arity shift liste next_is_leaf =
	(*print_string"block: "; print_string(CpxDL.block_dummydump block); print_newline();*)
	let mod2i = mod2 i in
	let liste_then = List.map (function (X(_, j)) as e when j < i -> e | _ -> P) liste in
	let block_then = reduce_block_spx (neg <> shift <> mod2i) (arity-1) true mod2i liste_then in
	let block_else = if List.for_all (function X(_, j) -> i<>j | _ -> true) liste
	then if i = 0
		then
		(
			let liste = List.map (function X(b, j) -> X(b, j-1) | e -> e) liste in
			reduce_block_spx neg (arity-1) next_is_leaf (not shift) liste
		)
		else
		(
			let liste = List.map (function X(b, j) when j > i -> X(b, j-2) | e -> e) liste in
			reduce_block_spx neg (arity-1) next_is_leaf shift liste
		)
	else (reduce_block_spx neg (arity-1) next_is_leaf shift liste) in
	(block_then, block_else)

let node_pull ((block, node) as edge) =
	assert(block.arity > 0);
	assert(check_edge edge);
	match block.block with
	| C0 ->
	(
		assert(node = Utils.Leaf());
		let block' = {neg = block.neg; arity = block.arity-1; block = C0} in
		Utils.MEdge ((block', Utils.Leaf()), (block', Utils.Leaf()))
	)
	| Id 0 ->
	(
		assert(node = Utils.Leaf());
		let block0 = {neg = block.neg; arity = block.arity-1; block = C0}
		and block1 = {neg = not block.neg; arity = block.arity-1; block = C0} in
		Utils.MEdge ((block0, Utils.Leaf()), (block1, Utils.Leaf()))
	)
	| Id x ->
	(
		assert(node = Utils.Leaf());
		assert(x > 0);
		let block' = {neg = block.neg; arity = block.arity-1; block = Id(x-1)} in
		Utils.MEdge ((block', Utils.Leaf()), (block', Utils.Leaf()))
	)
	| SPX(shift, tag, liste) -> match liste with
		| [] -> assert false
		| elem::liste' ->
		(
			let block' = reduce_block_spx block.neg (block.arity-1) (Utils.gnode_is_leaf node) shift liste' in
			match elem with
			| P -> Utils.MEdge ((block', node), (block', node))
			| S -> Utils.MNode (fun node ->
				let edge0, edge1 = node_split node in
				(compose_edge block' edge0, compose_edge block' edge1)
			)
			| X(b, i) ->
				let block_then, block_else = pull_X i block.neg block.arity shift liste (Utils.gnode_is_leaf node) in
				let edge_then = (block_then, Utils.Leaf())
				and edge_else = (block_else, node) in
				Utils.MEdge (Tools.cswap b (edge_then, edge_else))
		)

(*

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

let solve_xore gid x y = match solve_xor gid x y with
	| Utils.MEdge (edge, gtree) -> Utils.M3Edge (edge, (None, gtree))
	| Utils.MNode (edge, (block, x, y)) -> Utils.M3Node (edge, (block, (None, x), (None, y)))


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

let contiguify (block, ident) =
	let min_bigger_than x sub = List.fold_left (fun opmin -> function X(b, i) when i > x -> Tools.opmin i opmin | _ -> opmin) None sub in
	let dec_bigger_than x dec sub = List.map (function X(b, i) when i > x -> X(b, i-dec) | x -> x) sub in
	let min sub = List.fold_left (fun opmin -> function X(b, i) -> Tools.opmin i opmin | _ -> opmin) None sub in
	let dec dec sub =
		if dec = 0
		then sub
		else (List.map (function X(b, i) -> X(b, i-dec) | x -> x) sub)
	in
	match min block.sub with
	| None -> ({neg = block.neg; shift = false; sub = block.sub}, ident)
	| Some min ->
	(
		let rec aux pos sub = match min_bigger_than pos sub with
			| None -> sub
			| Some min ->
			(
				let diff = min - pos in
				let dec = diff - (diff mod 2) in
				aux (if diff mod 2 = 0 then pos else (pos+1)) (if dec = 0 then sub else (dec_bigger_than pos dec sub))
			)
		in
		let block = {neg = block.neg; shift = block.shift<>(mod2 min); sub = aux 0 (dec min block.sub)} in
		((match ident with Utils.Leaf () -> reduce_0 block | Utils.Node _ -> block), ident)
	)

	

let assign = function
	| None -> fun block -> block, None
	| Some set -> fun (block, ident) ->
		assert(List.length set = List.length block.sub);
		let foldmap f i l =
			let rec aux l' i = function
				| [] -> List.rev l', i
				| head::tail ->
					let e, i = f i head in
					aux (e::l') i tail
			in aux [] i l
		in
		let opsubopset, opmin = foldmap (fun opmin -> fun (set, sub) -> match set with
			| None	   -> ( Some sub, (match sub with S -> Some None | _ -> None)), opmin
			| Some set -> match sub with
				| P		  -> (None    , None     ), opmin
				| S		  -> (None    , Some (Some set) ), opmin
				| X(b, i) -> (None    , None     ), if b = set then Tools.opmin i opmin else opmin
			) None (List.combine set block.sub) in
		let opsub, opset = List.split opsubopset in
		let sub = MyList.list_of_oplist opsub
		and set = MyList.list_of_oplist opset in
		match opmin with
		| None -> ((contiguify ({neg = block.neg; shift = block.shift; sub = sub}, ident)), (if List.for_all ((=)None) set then None else (Some set)))
		| Some min -> ((contiguify ({neg = block.neg <> block.shift <> (mod2 min); shift = (mod2 min); sub = List.map (function S | P -> P | X(_, i) when i >= min -> P | (X _) as x -> x) sub}, Utils.Leaf())), None)


let assign_dummydump = function
	| None -> "None"
	| Some set -> "["^(StrUtil.catmap "; " (Tools.string_of_option StrUtil.string_of_bool) set)^"]"



let solve_ande_P2 (ex, ix) (ey, iy) =
	let sub, subXY = consensus(function
		| (P, P) -> P, None
		| (x, y) -> S, Some(x, y)) ex.sub ey.sub in
	Utils.M3Node (
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
			(None, ix),
			(None, iy)
		)
	)

let solve_ande_P2X2_11 (ex, ix) (ey, iy) =
	(*print_string "solve_ande_P2PX2_11"; print_newline();*)
	let sub, subXY = consensus(function
		| P, P -> P, None
		| X(b, 0), X(b', 0) when b = b' -> X(b, 0), None
		| (x, y) -> S, Some(x, y)) ex.sub ey.sub in
	Utils.M3Node (
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
			(None, ix),
			(None, iy)
		)
	)

exception Return_False

let solve_ande_P2X2 bX bY (ex, ix) (ey, iy) =
	let bX, ex = if (bX = false) && (block_is_singleton ex)
		then (true,(
			assert(ex.shift = true);
			{neg = not ex.neg; shift = true; sub = List.map (function X(b, i) -> assert(i = 0); X(not b, 0) | x -> x) ex.sub};
		))
		else (bX, ex)
	and bY, ey = if (bY = false) && (block_is_singleton ey)
		then (true,(
			assert(ey.shift = true);
			{neg = not ey.neg; shift = true; sub = List.map (function X(b, i) -> assert(i = 0); X(not b, 0) | x -> x) ey.sub};
		))
		else (bY, ey)
	in
	if (not bX) && (not bY)
	then ( solve_ande_P2X2_11 (ex, ix) (ey, iy) )
	else try
	(
		(*print_string "solve_ande_P2PX2"; print_newline();
		print_string "\tbX: "; print_string(StrUtil.string_of_bool bX); print_newline();
		print_string "\tbY: "; print_string(StrUtil.string_of_bool bY); print_newline();*)
		let sub, setsubXsetsubY = List.split(List.map(function
			| P, P -> P, (None, None)
			| X(b, 0), X(b', 0) when bX && bY -> if b = b' then (X(b, 0), (None, None)) else (raise Return_False) 
			| X(b, 0), y		when bX -> X(b, 0), (None, Some(Some(not b), y))
			| x, X(b, 0)		when bY -> X(b, 0), (Some(Some(not b), x), None)
			| x, y				-> S, (Some(None, x), Some(None, y))
		) (List.combine ex.sub ey.sub)) in
		let setsubX, setsubY = List.split setsubXsetsubY in
		let setX, subX = List.split(MyList.list_of_oplist setsubX)
		and setY, subY = List.split(MyList.list_of_oplist setsubY) in
		let setX = if List.for_all (function None -> true | _ -> false) setX then None else Some setX
		and setY = if List.for_all (function None -> true | _ -> false) setY then None else Some setY in
		let subX = if bX then (List.map (function X(b, i) -> assert(i>0); X(b, i-1) | x -> x) subX) else subX
		and subY = if bY then (List.map (function X(b, i) -> assert(i>0); X(b, i-1) | x -> x) subY) else subY in
		let ex = {neg = ex.neg; shift = ex.shift<>bX; sub = subX}
		and ey = {neg = ey.neg; shift = ey.shift<>bY; sub = subY} in
		(*print_string "[0] solve_ande_P2X2"; print_newline();
		print_string "\tex: "; print_string(CpxDL.block_dummydump ex); print_newline();
		print_string "\tey: "; print_string(CpxDL.block_dummydump ey); print_newline();
		print_string "\tsetX:"; print_string ("["^(StrUtil.catmap "; " (Tools.string_of_option StrUtil.string_of_bool) setX)^"]"); print_newline();
		print_string "\tsetY:"; print_string ("["^(StrUtil.catmap "; " (Tools.string_of_option StrUtil.string_of_bool) setY)^"]"); print_newline();*)
		let (ex, ix), setX = assign setX (ex, ix)
		and (ey, iy), setY = assign setY (ey, iy) in
		(*print_string "[1] solve_ande_P2X2"; print_newline();
		print_string "\tex: "; print_string(CpxDL.block_dummydump ex); print_newline();
		print_string "\tey: "; print_string(CpxDL.block_dummydump ey); print_newline();*)

		Utils.M3Node (
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
					subXY = List.combine ex.sub ey.sub;
				},
				(setX, ix),
				(setY, iy)
			)
		)
	)
	with Return_False -> ( let edge, gtree = get_root false (ex, ix) in Utils.M3Edge (edge, (None, gtree)) )

let solve_ande_0 ((blockX, ix) as x) ((blockY, iy) as y) =
	(*print_string "solve_ande_0"; print_newline();
	print_string "\tblockX: "; print_string(CpxDL.edge_dummydump (blockX, ix)); print_newline();
	print_string "\tblockY: "; print_string(CpxDL.edge_dummydump (blockY, iy)); print_newline();*)
	let _, maxXX = classify blockX
	and _, maxXY = classify blockY in
	if (maxXX = None) && (maxXY = None)
	then ( solve_ande_P2 x y )
	else
	(
		let tx = blockX.neg <> blockX.shift
		and ty = blockY.neg <> blockY.shift in
		solve_ande_P2X2 (not tx) (not ty) x y
	)

let compose blockC (blockc, e) =
	(*print_string "compose: "; print_newline();
	print_string "\tblockC: "; print_string(CpxDL.block_dummydump blockC); print_newline();
	print_string "\tblockc: "; print_string(CpxDL.edge_dummydump (blockc, e)); print_newline();*)
	let edge = compose blockC (blockc, e) in
	(*print_string "\tblockCc: "; print_string(CpxDL.edge_dummydump edge); print_newline();*)
	edge

let solve_ande getid ((ex, ix) as x) ((ey, iy) as y) =
	match node_is_const x with
	| Some b -> Utils.M3Edge ( let edge, gtree = if b then y else x in (edge, (None, gtree)))
	| None -> match node_is_const y with
	| Some b -> Utils.M3Edge ( let edge, gtree = if b then x else y in (edge, (None, gtree)))
	| None ->
	if (CpGops.cmpid getid (ix, iy) = None) && (ex.shift = ey.shift) && (ex.sub = ey.sub)
	then Utils.M3Edge (let edge, gtree = if ex.neg = ey.neg then x (* = y *) else get_root false x in (edge, (None, gtree)))
	else
	( match solve_ande_0 x y with
		| Utils.M3Edge (e, (ope, i)) -> Utils.M3Edge (reduce' e, (ope, i))
		| Utils.M3Cons (e, (e0, e1)) -> Utils.M3Cons (e, (e0, e1))
		| Utils.M3Node (e, (exy, (opex, ix), (opey, iy))) ->
			let sub, subXY = List.split(List.map(function(P, P) -> P, None | (x, y) -> S, Some(x, y))exy.subXY) in
			let subXY = MyList.list_of_oplist subXY in
			let e = compose_block' e {neg = false; shift = false; sub}
			and exy = {negX = exy.negX; negY = exy.negY; shiftX = exy.shiftX; shiftY = exy.shiftY; subXY} in
			assert(not(List.exists (function(P, P) -> true | _ -> false) exy.subXY));
			if (opex = None) && (opey = None)
			then
			(
				let ex, ey = block_split exy in
				(*print_string "[POST] solve_ande_0"; print_newline();
				print_string "e: "; print_string(CpxDL.block_dummydump e); print_newline();
				print_string "ex: "; print_string(CpxDL.edge_dummydump (ex, ix)); print_newline();
				print_string "ey: "; print_string(CpxDL.edge_dummydump (ey, iy)); print_newline();*)
				let e = reduce' e in
				let ex = reduce ex
				and ey = reduce ey in
				(*print_string "[POST] solve_ande_0"; print_newline();
				print_string "e: "; print_string(CpxDL.block_dummydump e); print_newline();
				print_string "blockX: "; print_string(CpxDL.edge_dummydump (ex, ix)); print_newline();
				print_string "blockY: "; print_string(CpxDL.edge_dummydump (ey, iy)); print_newline();*)
				match block_is_const ex with
				| Some b -> Utils.M3Edge (let edge, gtree = compose e (if b then (ey, iy) else (ex, ix)) in (edge, (None, gtree)))
				| None -> match block_is_const ey with
				| Some b -> Utils.M3Edge (let edge, gtree = compose e (if b then (ex, ix) else (ey, iy)) in (edge, (None, gtree)))
				| None ->
				(
					let return () = Utils.M3Node (e, (if (ex, ix) < (ey, iy) then (block_merge ex ey, (None, ix), (None, iy)) else (block_merge ey ex, (None, iy), (None, ix)))) in
					assert(List.length ex.sub = List.length ey.sub);
					assert(List.length ex.sub >= 1);
					if (ex.neg <> ex.shift) && (ey.neg <> ex.shift)
					then match ex.sub, ey.sub with
						| X(b, 0)::subX, X(b', 0)::subY when b <> b' ->
						(
							let x = (reduce {neg = ex.neg; shift = ex.shift; sub = subX}, (None, ix))
							and y = (reduce {neg = ey.neg; shift = ey.shift; sub = subY}, (None, iy)) in
							Utils.M3Cons (e, (Tools.cswap b (y, x)))
						)
						| _ -> return()
					else return()
				)
			)
			else
			(
				let return () = Utils.M3Node (e, (exy, (opex, ix), (opey, iy))) in
				if (List.length exy.subXY >= 1) && (exy.negX <> exy.shiftX) && (exy.negY <> exy.shiftY)
				then match exy.subXY with
					| [] -> assert false
					| (X(b, 0), X(b', 0))::subXY when b <> b' ->
					(
						let ex, ey = CpxUtils.block_split {negX = exy.negX; negY = exy.negY; shiftX = exy.shiftX; shiftY = exy.shiftY; subXY } in
						let x = (reduce {neg = ex.neg; shift = ex.shift; sub = ex.sub}, (opex, ix))
						and y = (reduce {neg = ey.neg; shift = ey.shift; sub = ey.sub}, (opey, iy)) in
						Utils.M3Cons (e, (Tools.cswap b (y, x)))
					)
					| _ -> return()
				else return()
			)
			(*(
				(*print_string "[PROPA] solve_ande_0"; print_newline();
				let ex, ey = block_split exy in
				print_string "\te: "; print_string(CpxDL.block_dummydump e); print_newline();
				print_string "\tex: "; print_string(CpxDL.edge_dummydump (ex, ix)); print_newline();
				print_string "\tey: "; print_string(CpxDL.edge_dummydump (ey, iy)); print_newline();
				print_string "\tsetX:"; print_string (assign_dummydump opex); print_newline();
				print_string "\tsetY:"; print_string (assign_dummydump opey); print_newline();*)
				Utils.M3Node (e, (exy, (opex, ix), (opey, iy)))
			)*)
	)


let node_push_ande gid (x, y) = match solve_ande gid x y with
	| Utils.M3Edge e -> Utils.M3Edge e
	| Utils.M3Cons (e, (e0, e1)) -> Utils.M3Cons (e, (e0, e1))
	| Utils.M3Node (e, (block, x, y)) -> Utils.M3Node (e, (CpxDL.bindump_node block, x, y))

let tacx_propa_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge (edge, gtree) -> Utils.MEdge (edge, (None, gtree))
	| Utils.MNode (e, (block, gtreeX, gtreeY)) ->
	(
		let edgeX, edgeY = block_split block in
		Utils.MNode (e, (CpTypes.Cons, (edgeX, (None, gtreeX)), (edgeY, (None, gtreeY))))
	)

let tacx_propa_and gid x y = match solve_ande gid x y with
	| Utils.M3Edge e -> Utils.MEdge e
	| Utils.M3Cons (e, (eogX, eogY)) -> Utils.MNode (e, (CpTypes.Cons, eogX, eogY))
	| Utils.M3Node (e, (block, ogX, ogY)) ->
	(
		let edgeX, edgeY = block_split block in
		Utils.MNode (e, (CpTypes.And, (edgeX, ogX), (edgeY, ogY)))
	)

let tacx_propa_xor gid x y = match solve_xore gid x y with
	| Utils.M3Edge e -> Utils.MEdge e
	| Utils.M3Cons (e, (eogX, eogY)) -> Utils.MNode (e, (CpTypes.Cons, eogX, eogY))
	| Utils.M3Node (e, (block, ogX, ogY)) ->
	(
		let edgeX, edgeY = block_split block in
		Utils.MNode (e, (CpTypes.Xor, (edgeX, ogX), (edgeY, ogY)))
	)

let tacx_propa gid = CpTypes.(function
	| Cons -> tacx_propa_cons gid
	| And  -> tacx_propa_and  gid
	| Xor  -> tacx_propa_xor  gid)
*)
