type elem =
	| S (* significant variable *)
	| P (* useless variable *)
	| X of (bool * int) (* if x then (i [2] XOR shift XOR neg) else ... *)

type block = {
	neg		: bool;
	shift	: bool;
	sub		: elem list;
}

let block_dummydump block =
	(if block.neg then "-" else "+")^
	(if block.shift then "-" else "+")^"["^
	(StrUtil.catmap ", " (function
		| S -> "S"
		| P -> "P"
		| X(b, i) -> "X("^(if b then "1" else "0")^", "^(string_of_int i)^")") block.sub)^" ]"

type block2 = {
	negY	: bool;
(* TODO the shiftX component could be factorised, think about it in next version *)
	shiftX	: bool;
	shiftY  : bool;
	subXY	: (elem * elem) list;
}

let node_split block =
	let subX, subY = List.split block.subXY in
	{
		neg = false;
		shift = block.shiftX;
		sub = subX
	},
	{
		neg = block.negY;
		shift = block.shiftY;
		sub = subY;
	}

let node_pull_node _ (b2, i0, i1) =
	let b0, b1 = node_split b2 in
	(b0, i0), (b1, i1)
	

(* return true if x is odd, false otherwise *)
let mod2 x = (x mod 2) = 1

let size block = List.length block.sub

(* check that a block is properly formed *)
(* TODO
	- check for trailing 0s
	- check that shift is set to 0 if their is no X elem
	- check for a single trailing 1
	- check for sub-normal case +/- I (if false then true else false)
*)
let check_0 block = (* check for contiguity *)
	let n = size block in
	let cnt = Array.make n 0 in
	let clk x = cnt.(x) <- cnt.(x) + 1 in
	List.iter (function
		| S | P -> ()
		| X (_, x) -> clk x) block.sub;
	let res = Array.fold_left ( function
		| None -> (fun _ -> None)
		| Some true ->  ( function
			| 0 -> Some true
			| _ -> None
						)
		| Some false -> ( function
			| 0 -> Some true
			| _ -> Some false
						)
	) (Some false) cnt in
	match res with
	| None		-> false
	| Some _	-> true

let is_const block =
	if List.for_all (function P -> true | _ -> false) block.sub
	then Some block.neg
	else None

let push_S block = {
	neg = block.neg;
	shift = block.shift;
	sub = S::block.sub;
}

let push_P block = {
	neg		= block.neg;
	shift	= block.shift;
	sub		= P::block.sub;
}

let classify block = List.fold_left (fun (hasS, maxX) -> function
		| S			-> (true, maxX					)
		| P			-> (hasS, maxX					)
		| X(b, i)	-> (hasS, Tools.opmax i maxX	)
	) (false, None) block.sub

let check block =
	(check_0 block)&&(
	let hasS, maxX = classify block in
	match maxX with
	| None -> block.shift = false
	| Some maxX ->
	(
		hasS || 
		(
			(block.shift <> (mod2 maxX))&&(
				let n = MyList.count (function X(_, i) when i = maxX -> true | _ -> false) block.sub in
				assert(n>=1);
				n > 1
			)
		)
	))

let reduce block =
	let minX = List.fold_left (fun x -> function S | P -> x | X(_, i) -> Tools.opmin i x) None block.sub in
	match minX with
	| None ->
	{
		neg		= block.neg;
		shift	= false;
		sub		= block.sub;
	}
	| Some minX ->
		assert(minX>=0);
		let block = {
			neg		= block.neg;
			shift	= block.shift <> (mod2 minX);
			sub		= if minX = 0
			then block.sub
			else List.map (function
				| S -> S
				| P -> P
				| X(b, i) -> X(b, i-minX)) block.sub
		} in
		let hasS, maxX = classify block in
		let maxX = match maxX with None -> assert false | Some maxX -> maxX in
		if hasS = false
		then
		(
			let  block = if block.shift <> (mod2 maxX)
				then block
				else
				{
					neg		= block.neg;
					shift	= block.shift;
					sub		= List.map (function X(_, i) when i = maxX -> P | x -> x) block.sub;
				}
			in
			let hasS, maxX = classify block in
			assert(hasS = false);
			match maxX with
			| None ->
			{
				neg		= block.neg;
				shift	= false;
				sub		= block.sub;
			}
			| Some maxX ->
			(
				let n = MyList.count (function X(_, i) -> i = maxX | _ -> false) block.sub in
				assert(n>=1);
				if n = 1
				then ( if maxX = 0
				then
				(
					(* single significant variable *)
					let iB = match (List.fold_left   ( function
						| Some x -> (fun _ -> Some x)
						| None   -> function
							| S | P -> None
							| X(b, 0) -> Some b
							| _       -> assert false ) None block.sub) with
					| None -> assert false
					| Some iB -> iB
					in
					{
						neg		= block.neg <> iB;
						shift	= true;
						sub		= List.map (function X _ -> X(false, 0) | x -> x) block.sub;

					}
				)
				else
				{
					neg		= not block.neg;
					shift	= not block.shift;
					sub		= List.map (function X(b, i) when i = maxX -> X(b, i-1) | x -> x) block.sub;
				} )
				else block
			)
		)
		else block


let push_X iB rN tB (* if, rank, then *) block =
	assert(rN >= 0);
	let hasS, maxX = classify block in
	match maxX with
	| None ->
	(
		assert(rN = 0);
		assert(block.shift = false);
		if hasS
		then
		{
			neg		= block.neg;
			shift	= tB <> block.neg;
			sub		= (X(iB, 0))::block.sub;
		}
		else if (tB <> block.neg) = false
		then
		(* trailing 0 *)
		{
			neg		= block.neg;
			shift	= false;
			sub		= P::block.sub;
		}
		else
		(* trailing 1 *)
		{
			neg = block.neg <> iB;
			shift = true;
			sub = (X(false, 0))::block.sub;
		}
	)
	| Some maxX ->
	(
		assert(maxX >= 0);
		assert(rN <= maxX + 1);
		if(not hasS && rN = maxX + 1)
		then
		(* trailing 1 *)
		{
			neg		= not block.neg;
			shift	= not block.shift;
			sub		= (X(not iB, maxX))::block.sub;
		}
		else if (tB <> block.neg <> block.shift <> (mod2 rN)) = false
		then
		(* correct alignment *)
		{
			neg		= block.neg;
			shift	= block.shift;
			sub		= (X(iB, rN))::block.sub;
		}
		else
		(
			(* incorrect alignment *)
			if rN = 0
			then
			(
				let sub' = (X(iB, rN))::(List.map (function
					| S -> S
					| P -> P
					| X(b, i) -> X(b, i+1))) block.sub in
				{
					neg		= block.neg;
					shift	= not block.shift;
					sub		= sub';
				}
			)
			else
			(
				{
					neg		= block.neg;
					shift	= block.shift;
					sub		= (X(iB, rN-1))::block.sub;
				}
			)
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

let count_nS = MyList.count (function S -> true | _ -> false) 
let  make_nSS n = {
	negY   = false;
	shiftX = false;
	shiftY = false;
	subXY  = MyList.ntimes (S, S) n;
}

let  make_nS n = {
	neg   = false;
	shift = false;
	sub   = MyList.ntimes S n;
}

let cmake_nSS block = make_nSS (count_nS block)
let cmake_nS  block = make_nS  (count_nS block)


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
		sub		= sub;
	},
	(
		{
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
	let get_min = List.fold_left (fun minX -> function
		| S | P -> minX
		| X(b, i) -> Tools.opmin i minX) None in
	let min0 = get_min sub0
	and min1 = get_min sub1 in
	let dec j = List.map (function
		| S -> S
		| P -> P
		| X(b, i) -> assert(i-j >= 0); X(b, i-j)) in
	let opdec = function
		| None -> (fun sub -> sub)
		| Some j -> dec j in
	let sub0 = opdec min0 sub0
	and sub1 = opdec min1 sub1 in
	let decshift shift = function
		| None -> false
		| Some i -> shift <> (mod2 i)
	in
	{
		neg = e0.neg;
		shift = e0.shift;
		sub = sub;
	},
	(
		{
			negY	= e1.neg <> e0.neg;
			shiftX	= decshift e0.shift min0;
			shiftY	= decshift e1.shift min1;
			subXY	= List.combine sub0 sub1;
		},
		i0,
		i1
	)


let solve_cons_0 (e0, i0) (e1, i1) =
	(* X-less merging *)
	let subsubXY = List.map	( function
		| (P, P) -> (P, None)
		| (x, y) -> (S, Some(x, y))
	) (List.combine e0.sub e0.sub) in
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
				negY	= e1.neg <> e0.neg;
				shiftX	= e0.shift;
				shiftY	= e1.shift;
				subXY	= subXY;
			},
			i0,
			i1
		)
	)


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
	else	  match is_const e0 with
	(* f0 is a constant, thus mergeable *)
	| Some tB -> (Utils.MEdge (push_X false 0 tB e1, i1))
	| None -> match is_const e1 with
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
			assert(equal = false);
			assert(not(x_sub_y && y_sub_x)); (* they can't be both a subset of each other without being equal *)
			match max_xy with
			| Some max_xy ->
			(
				if		x_sub_y && (not hasS0)
				then
				(
					(* mergeable *)
					assert(maxX0 = max_xy);
					Utils.MEdge ((push_X false (maxX0 + 1) e0.neg (* ? *) e0), i0)
				)
				else if y_sub_x && (not hasS1)
				then
				(
					(* mergeable *)
					assert(maxX1 = max_xy);
					Utils.MEdge ((push_X true  (maxX1 + 1) e1.neg (* ? *) e1), i1)
				)
				(* at this point all merging and consensus have been eliminated *)
				else (Utils.MNode (solve_cons_1 max_xy f0 f1))
			)
			(* no X-related conflict has been detected, thus we focus only on P-related problems *)
			| None -> Utils.MNode (solve_cons_2 f0 f1)
		)
		(* X-less merging *)
		| _ -> Utils.MNode (solve_cons_0 f0 f1)
	)
	(* X-less merging *)
	else (Utils.MNode (solve_cons_0 f0 f1))

let pull_S i block =
	let f = block.shift <> (mod2 i) in
	let ethen = {
		neg = block.neg <> f;
		shift = block.neg <> f;
		sub = List.map (function
			| ((X(b, j)) as x)  when j < i -> x
			| _ -> P) block.sub;
	} in
	let cnt = MyList.count (function X(_, j) when i = j -> true | _ -> false) block.sub in
	let eelse = {
		neg = block.neg;
		shift = block.shift;
		sub = if cnt = 0
		then
		(
			List.map
				( function
					| S -> S
					| P -> P
					| X(b, j) -> assert(i<>j); if j < i
						then X(b, j)
						else X(b, j-2)
				) block.sub
		)
		else block.sub ;
	} in
	ethen, eelse

let compose_block blockC blockc =
	let hasS, maxX = classify blockC in
	match maxX with
	| None ->
	(
		let sub = (let rec aux carry = function
			| ([], []) -> List.rev carry
			| ([], _) -> assert false
			| (S::x', y::y') -> aux (y::carry) (x', y')
			| (S::_, []) -> assert false
			| ((X _)::x' , _) -> assert false
			| (P::x', y') -> aux (P::carry) (x', y') in aux [] (blockC.sub, blockc.sub)) in
		assert(blockC.shift = false);
		{
			neg		= blockC.neg <> blockc.neg;
			shift	= blockc.shift;
			sub		= sub;
		}
	)
	| Some maxX ->
	(
		let blockC_neg = blockC.neg <> blockc.neg
		and blockC_shift = blockC.shift <> blockc.neg in
		let blockc_dec = maxX + (if ((mod2 maxX) <> blockC_shift) =  blockc.shift then 0 else 1) in
		let sub = (let rec aux carry = function
			| ([], []) -> List.rev carry
			| ([], _ ) -> assert false
			| (S::x', y::y') -> aux ((match y with X(b, i) -> X(b, i+blockc_dec) | _ -> y)::carry) (x', y')
			| (S::_, []) -> assert false
			| (x::x', y') -> aux (x::carry) (x', y') in aux [] (blockC.sub, blockc.sub)) in
		{
			neg		= blockC_neg;
			shift	= blockC_shift;
			sub		= sub;
		}
	)

let compose bC (bc, ic) = (compose_block bC bc, ic)

let node_pull getid (b, i) = match b.sub with
	| [] -> assert false
	| head::tail -> 
		let b' = {
			neg		= b.neg;
			shift	= b.shift;
			sub		= tail;
		} in match head with
		| S ->	Utils.MNode (fun node ->
			let x', y' = node_pull_node getid node in
			(compose b' x', compose b' y'))
		| P ->	Utils.MEdge ((b', i), (b', i))
		| X(b, j) ->
		(
			let ethen, eelse = pull_S j b' in
			let ethen = (ethen, Utils.Leaf ())
			and eelse = (eelse, i) in
			Utils.MEdge (Tools.cswap b (ethen, eelse))
		)

