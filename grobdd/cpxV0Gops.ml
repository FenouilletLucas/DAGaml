open CpxV0Types


let bindump_elem elem stream = match elem with
	| Some x ->
	( match x with
		| S -> true::stream
		| P -> false::true::stream
		| X(b, i) -> false::false::true::b::(BinDump.int i stream)
	)
	| None -> false::false::false::stream

let bindump_elem2 elem2 stream = match elem2 with
	| Some x ->
	( match x with
		| S, S					-> true ::stream
		| S, P					-> false::true::false ::stream
		| P, S					-> false::true::true  ::stream
		| P, P					-> assert false
		| S, X(b, i)			-> false::false::true ::false::b::(BinDump.int i stream)
		| X(b, i), S			-> false::false::true ::true ::b::(BinDump.int i stream)
		| P, X(b, i)			-> false::false::false::true ::false::b::(BinDump.int i stream)
		| X(b, i), P			-> false::false::false::true ::true ::b::(BinDump.int i stream)
		| X(b, i), X(b', i')	-> false::false::false::false::true ::b::b'::(BinDump.int i (BinDump.int i' stream))
	)
	| None						-> false::false::false::false::false::stream

let binload_elem = function
	| true::stream -> Some S, stream
	| false::true::stream -> Some P, stream
	| false::false::true::b::stream -> let i, stream = BinLoad.int stream in Some(X(b, i)), stream
	| false::false::false::stream -> None, stream
	| _ -> assert false

let binload_elem2 = function
	| true::stream -> Some(S, S), stream
	| false::true::false::stream -> Some(S, P), stream
	| false::true::true ::stream -> Some(P, S), stream
	| false::false::true::false::b::stream ->
		let i, stream = BinLoad.int stream in
		Some(S, X(b, i)), stream
	| false::false::true::true ::b::stream ->
		let i, stream = BinLoad.int stream in
		Some(X(b, i), S), stream
	| false::false::false::true::false::b::stream ->
		let i, stream = BinLoad.int stream in
		Some(P, X(b, i)), stream
	| false::false::false::true::true ::b::stream ->
		let i, stream = BinLoad.int stream in
		Some(X(b, i), P), stream
	| false::false::false::false::true::b::b'::stream ->
		let i, stream = BinLoad.int stream in
		let i', stream = BinLoad.int stream in
		Some(X(b, i), X(b', i')), stream
	| false::false::false::false::false::stream -> None, stream
	| _ -> assert false


let bindump_block block stream =
	block.neg::block.shift::(BinDump.none_list bindump_elem block.sub stream)

let binload_block = function
	| neg::shift::stream ->
		let sub, stream = BinLoad.none_list binload_elem stream in
		{ neg; shift; sub }, stream
	| _ -> assert false

let bindump_edge x = bindump_block x [] |> Bitv.L.of_bool_list
let binload_edge stream =
	let x, stream = binload_block (Bitv.L.to_bool_list stream) in
	assert(stream = []);
	x

let block_dummydump block =
	(if block.neg then "-" else "+")^
	(if block.shift then "-" else "+")^"["^
	(StrUtil.catmap ", " (function
		| S -> "S"
		| P -> "P"
		| X(b, i) -> "X("^(if b then "1" else "0")^", "^(string_of_int i)^")") block.sub)^" ]"


let bindump_block2 block stream =
	block.negX::block.negY::block.shiftX::block.shiftY::(BinDump.none_list bindump_elem2 block.subXY stream)

let bindump_node x = bindump_block2 x [] |> Bitv.L.of_bool_list

let binload_block2 = function
	| negX::negY::shiftX::shiftY::stream ->
		let subXY, stream = BinLoad.none_list binload_elem2 stream in
		{negX; negY; shiftX; shiftY; subXY}, stream
	| _ -> assert false

let binload_node stream =
	let x, stream = binload_block2 (Bitv.L.to_bool_list stream) in
	assert(stream = []);
	x

let node_split block =
	let subX, subY = List.split block.subXY in
	{
		neg = block.negX;
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
	let rec aux0 = function
		| [] -> true
		| 0::tail -> aux0 tail
		| _::tail -> false
	in
	let rec aux1 = function
		| [] -> true
		| 0::tail -> aux0 tail
		| _::tail -> aux1 tail
	in
	aux1 (Array.to_list cnt)

let is_const block =
	if List.for_all (function P -> true | _ -> false) block.sub
	then Some block.neg
	else None

let is_root (block, i) = is_const block

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

let in_block block x =
	let hasS, maxX = classify block in
	match maxX with
	| None -> if hasS then None else (Some block.neg)
	| Some maxX ->
	(
		match List.fold_left (fun opmin -> function (X(b, i), b') when b = b' -> Tools.opmin i opmin | _ -> opmin) None (List.combine block.sub x) with
		| None -> if hasS then None else (Some block.neg)
		| Some i -> Some(block.neg <> block.shift <> (mod2 i))
	)


	


let block_to_pretty block =
	let _, maxX = classify block in
	let pretty_x iB tB = match iB, tB with
		| false, false -> "1"
		| true , false -> "0"
		| false, true  -> "I"
		| true , true  -> "O"
	in
	let floor = (if block.neg then "-" else "+")^(StrUtil.catmap "" (function S -> "S" | P -> "P" | X(b, 0) -> pretty_x b block.shift | X _ -> ".") block.sub) in
	match maxX with
	| None
	| Some 0 -> floor
	| Some n ->
		let uppers = MyList.init n (fun i -> let i = i+1 in " "^(StrUtil.catmap "" (function X(b, j) -> if i < j then "." else if j = i then (pretty_x b (block.shift <> (mod2 i))) else " " | _ -> " ") block.sub)) in
		String.concat "\n" (List.rev (floor::uppers))

let check block =
	(check_0 block)&&(
	let hasS, maxX = classify block in
	match maxX with
	| None -> block.shift = false
	| Some maxX ->
	(
		if hasS
		then true
		else (
			(block.shift <> (mod2 maxX)) && (
			let n = MyList.count (function X(_, i) when i = maxX -> true | _ -> false) block.sub in
			assert(n>=1);
			if (maxX = 0) && (n = 1)
			then (List.for_all (function X(true, _) -> false | _ -> true) block.sub)
			else (n > 1)
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
					sub		= List.map (function X(b, i) when i = maxX -> X(not b, i-1) | x -> x) block.sub;
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
(* TODO : fix this case {neg = true; shift = false; sub = [X (false, 0); X (false, 1)]} *)
				reduce {
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
	negX   = false;
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
	
let compose_block blockC blockc =
	let hasS, maxX = classify blockC in
	match maxX with
	| None ->
	(
		let sub = (let rec aux carry = function
			| ([], []) -> List.rev carry
			| ([], _) -> ignore(blockC); ignore(blockc); assert false
			| (S::x', y::y') -> aux (y::carry) (x', y')
			| (S::_, []) -> assert false
			| ((X _)::x' , _) -> assert false
			| (P::x', y') -> aux (P::carry) (x', y') in aux [] (blockC.sub, blockc.sub)) in
		reduce {
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
		reduce {
			neg		= blockC_neg;
			shift	= blockC_shift;
			sub		= sub;
		}
	)

let compose bC (bc, ic) = (compose_block bC bc, ic)

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
	let xX, xXY, xY = List.fold_left (fun (xX, xXY, xY) -> function X(b, 0), X(b', 0) when b <> b' -> (xX, xXY+1, xY) | X _, X _ -> (xX+1, xXY, xY+1) | X _, _ -> (xX+1, xXY, xY) | _, X _ -> (xX, xXY, xY+1) | _ -> (xX, xXY, xY)) (0, 0, 0) blockXY.subXY in
	let sX, sY = List.fold_left (fun (sX, sY) -> fun (x, y) -> (sX || (x = S), sY || (y = S))) (false, false) blockXY.subXY in
	let uX = ( xX = 0 ) && ( not sX ) (* x is a singleton *)
	and uY = ( xY = 0 ) && ( not sY ) (* y is a singleton *) in
	if ( blockXY.negY <> blockXY.shiftX <> blockXY.shiftY ) && xXY = 1 && (uX || uY)
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
			else if uX
			then
			(
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
			else (assert false)
		))
	)
	else Utils.MNode (blockC, (blockXY, iX, iY))


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
	(*print_string"block: "; print_string(block_dummydump block); print_newline();*)
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
			let x', y' = node_pull_node getid node in
			(compose b' x', compose b' y'))
		| P ->	Utils.MEdge ((b', i), (b', i))
		| X(b, j) ->
		(
			let ethen, eelse = pull_S j b' in
			(*print_string"ethen: "; print_string(block_dummydump ethen); print_newline();
			print_string"eelse: "; print_string(block_dummydump eelse); print_newline();*)
			let ethen = (ethen, Utils.Leaf ())
			and eelse = (eelse, i) in
			(*print_string"b: "; print_string(if b then "true" else "false"); print_newline();*)
			Utils.MEdge (Tools.cswap b (ethen, eelse))
		)

let get_root b (block, _) = ({neg = b; shift = false; sub = List.map (fun _ -> P) block.sub}, Utils.Leaf())

let neg (block, i) = ({neg = not block.neg; shift = block.shift; sub= block.sub}, i)
let cneg b (block, i) = ({neg = block.neg <> b; shift = block.shift; sub = block.sub}, i)

let merge_P_and (ex, ix) (ey, iy) =
	let a, bc = List.split(List.map (function (P, P) -> P, None | (x, y) -> S, Some(x, y)) (List.combine ex.sub ey.sub)) in
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

let solve_xor_0 (ex, ix) (ey, iy) =
	let _, _, max_xy, _ = compare_subs ex.sub ey.sub in
	match max_xy with
	| None ->
	(
		let subC, subXY = List.split(List.map (function(P, P) -> P, None | (X(b, i), X(b', i')) -> assert(b=b' && i=i'); X(b, i), None | (x, y) -> S, Some(x, y)) (List.combine ex.sub ey.sub)) in
		let subX, subY = List.split(MyList.list_of_oplist subXY) in
		let blockC = {
			neg = ex.neg <> ex.shift;
			shift = ex.shift <> ey.shift;
			sub  = subC;
		}
		and blockX = reduce {
			neg = false;
			shift = ex.shift;
			sub = subX;
		}
		and blockY = reduce {
			neg = false;
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
		let subC, subXY = List.split(List.map (function(P, P) -> P, None | (X(b, i), X(b', i')) when b = b' && i = i' && i <= max_xy -> X(b, i), None | (x, y) -> S, Some(x, y)) (List.combine ex.sub ey.sub)) in
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

let solve_and getid ((ex, ix) as x) ((ey, iy) as y) =
	match is_root x with
	| Some b -> Utils.MEdge ( if b then y else x )
	| None -> match is_root y with
	| Some b -> Utils.MEdge ( if b then x else y)
	| None ->
	if (CpGops.cmpid getid (ix, iy) = None) && (ex.shift = ey.shift) && (ex.sub = ey.sub)
	then Utils.MEdge (if ex.neg = ey.neg then x (* = y *) else get_root false x)
	else Utils.MNode (merge_P_and x y)


let solve_xor getid ((ex, ix) as x) ((ey, iy) as y) =
	match is_root x with
	| Some b -> Utils.MEdge ( cneg b y )
	| None -> match is_root y with
	| Some b -> Utils.MEdge ( cneg b x )
	| None ->
	if (CpGops.cmpid getid (ix, iy) = None) && (ex.shift = ey.shift) && (ex.sub = ey.sub)
	then Utils.MEdge (get_root (ex.neg <> ey.neg) x )
	else Utils.MNode (solve_xor_0 x y)

let bindump_tacx (ttag, block) stream =
	let stream = bindump_block2 block stream in
	match ttag with
	| CpTypes.Cons -> false::false::stream
	| CpTypes.And  -> false::true ::stream
	| CpTypes.Xor  -> true ::false::stream

let bindump_tacx x = bindump_tacx x [] |> Bitv.L.of_bool_list

let binload_tacx = function
	| b0::b1::stream ->
	(
		let block, stream = binload_block2 stream in
		((match b0, b1 with
		| false, false -> CpTypes.Cons
		| false, true  -> CpTypes.And
		| true , false -> CpTypes.Xor
		| true , true  -> assert false), block), stream
	)
	| _ -> assert false

let binload_tacx stream =
	let x, stream = binload_tacx (Bitv.L.to_bool_list stream) in
	assert(stream = []);
	x

let node_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (bindump_node block, x, y))

let tacx_push_cons gid x y = match solve_cons gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (bindump_tacx (CpTypes.Cons, block), x, y))

let node_push_and gid (x, y) = match solve_and gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (bindump_node block, x, y))

let tacx_push_and gid x y = match solve_and gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (bindump_tacx (CpTypes.And, block), x, y))

let node_push_xor gid (x, y) = match solve_xor gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (bindump_node block, x, y))

let tacx_push_xor gid x y = match solve_xor gid x y with
	| Utils.MEdge e -> Utils.MEdge e
	| Utils.MNode (e, (block, x, y)) -> Utils.MNode (e, (bindump_tacx (CpTypes.Xor, block), x, y))


let tacx_split (ttag, block) =
	let subX, subY = List.split block.subXY in
	let ex = {
		neg = block.negX;
		shift = block.shiftX;
		sub = subX;
	}
	and ey = {
		neg = block.negY;
		shift = block.shiftY;
		sub = subY;
	}
	in
	(ttag, ex, ey)

let tacx_pull_node _ (c, ix, iy) =
	let t, ex, ey = tacx_split (binload_tacx c) in
	(t, (ex, ix), (ey, iy))

let tacx_pull gid e = assert false

let tacx_push gid = CpTypes.(function
	| Cons -> tacx_push_cons gid
	| And  -> tacx_push_and  gid
	| Xor  -> tacx_push_xor  gid)
	
