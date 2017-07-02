(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open CpxTypes2

let make_nP n = MyList.make n P
let make_nS n = MyList.make n S

let block_split (bX, bY) : block * block = (bX, bY)

let block_merge blockX blockY = (bX, bY)

let node_split (block, iX, iY) =
	let blockX, blockY = block_split block in
	(blockX, iX), (blockY, iY)

let node_merge (blockX, iX) (blockY, iY) =
	(block_merge blockX blockY, iX, iY)

(* return true if x is odd, false otherwise *)
let mod2 x = (x mod 2) = 1

let block_arity block = block.arity
let edge_arity (block, _) = block_arity block

(* check that a block is properly formed *)
(* TODO
	- check for trailing 0s
	- check that shift is set to 0 if their is no X elem
	- check for a single trailing 1
	- check for sub-normal case +/- I (if false then true else false)
*)

let block_spx_is_const block =
	if List.for_all (function P -> true | _ -> false) block.sub
	then Some block.neg
	else None

let block_is_const block = match block.block with
	| C0 -> Some block.neg
	| _			-> None

let edge_is_const (block, i) =
	assert(i = Utils.Leaf ());
	block_is_const block

let block_choice_to_block_spx arity = function
	| C0 ->
		(false, {hasS = false; hasP = arity > 0; maxX = None}, make_nP arity )
	| Id x	->
		assert(arity-x-1 >= 0);
		(true,  {hasS = false; hasP = arity > 1; maxX = Some 0}, (make_nP x)@((X(true, 0))::(make_nP (arity-x-1))))
	| SPX (shift, tag, liste) ->
		(shift, tag, liste)

let push_S_block block =
	let (shift, tag, liste) = block_choice_to_block_spx block.arity block.block in
	let tag = {hasS = true; hasP = tag.hasP; maxX = tag.maxX} in
	{neg = block.neg; arity = block.arity+1; block = (shift, tag, S::liste)}

let push_S_edge (block, node) = (push_S_block block, node)

let push_P_block_choice = function
	| C0
	| Id x -> Id (x+1)
	| SPX (shift, tag, liste) ->
		let tag = {hasS = tag.hasS; hasP = true; maxX = tag.maxX} in
		SPX (shift, tag, P::liste)

let push_P_block block = {neg = block.neg; arity = block.arity+1; block = push_P_block_choice block.block}

let push_P_node (block, node) = (

let minicheck_spx = List.for_all (function X(_, i) when i <= 0 -> false | _ -> true)

let get_spx_tag_from_block_spx liste =
	List.fold_left (fun (hasS, hasP, maxX) -> function
		| S			-> (true, hasP, maxX					)
		| P			-> (hasS, true, maxX					)
		| X(b, i)	-> (hasS, hasP, Tools.opmax i maxX	)
	) (false, false, None) liste

let check_spx_tag tag liste = List.for_all (function
	| S -> tag.hasS
	| P -> tag.hasP
	| X(_, i) -> (0 <= i)&&(match tag.maxX with None -> false | Some maxX -> i <= maxX)) liste

let get_spx_tag arity = function
	| C0 -> {hasS = false; hasP = arity > 0; maxX = None}
	| Id _	-> {hasS = false; hasP = arity > 1; maxX = None}
	| SPX (_, tag, liste) ->
		assert(check_spx_tag tag liste);
		tag

(**	Determine (if possible) the value of the function according to its top descriptor [block] for the valuation [x]
		Returns [None] otherwise
 **)

let in_block_spx (shift, tag, liste) sigma =
	match tag.maxX with
	| None -> (if tag.hasS then None else Some false)
		(* if no S and no X, then its a constant *)
	| Some maxX ->
	(
		match List.fold_left (fun opmin -> function
			| X(b, i), b' when b = b' ->
				Tools.opmin i opmin
			| _ -> opmin ) None (List.combine liste sigma) with
		| None -> if hasS then None else Some false
		| Some i -> Some(shift <> mod2 i)
	)

let in_block_choice block sigma = match block with
	| C0 -> Some false
	| Id x -> List.nth sigma x
	| SPX block_spx -> in_block_spx block_spx sigma

let in_block block sigma = match in_bloc_choice block.block sigma with
	| None -> None
	| Some bool -> Some (block.neg <> bool)

let spx_is_contig (_, tag, liste) next_is_leaf = match tag.maxX with
	(* checks that Xs are contiguous and that maxX(if not None) is really maxX *)
	| None -> true
	| Some maxX ->
	(
		let cnt = Array.make (maxX+1) 0 in
		let clk x = cnt.(x) <- cnt.(x) + 1 in
		List.iter (function X (_, x) -> clk x | _ -> ()) liste;
		(Array.for_all (fun x -> x > 0) cnt)&&(not(next_is_leaf && (cnt.(maxX) = 1)))
		(* check that the last line is not reduced to a single element *)
	)

let check_block_spx arity (shift, tag, liste) next_is_leaf =
	(arity = List.length liste)&&
	(check_spx_tag tag liste)&&
	(match maxX with
		| None -> tag.hasS
		| Some maxX ->
			(0 <= maxX) && (maxX < arity) &&
			(not(next_is_leaf && ((mod2 maxX) <> shift = false)))
	)&&
	(spx_is_contig arity liste next_is_leaf)

let check_block_choice arity next_is_leaf = function
	| C0 -> true
	| Id x -> (x >= 0) && (x < arity)
	| SPX block_spx -> check_block_spx arity block_spx next_is_leaf

let check_block block next_is_leaf =
	(0 <= block.arity) &&
	(check_block_choice arity block.block next_is_leaf)

let check_node (block, node) = check_block block (Utils.gnode_is_leaf node)

let (=>) (x:bool) y : bool = x <= y
assert((false => false) = true );
assert((false => true ) = true );
assert((true  => false) = false);
assert((true  => true ) = true );

let reduce_block_spx neg arity next_is_leaf (shift, tag, liste) =
	assert(List.length liste = arity);
	assert(minicheck_spx liste); (* just checks that Xs are positive *)
	let tag = get_spx_tag_from_block_spx liste in
	assert(next_is_leaf => (not tag.hasS));
	match tag.maxX with
	| None ->
		{neg; arity; block = (if next_is_leaf then C0 else SPX(false, tag, liste))}
	| Some maxX ->
	(
		(* check for contiguity *)
		let cnt = Array.make (maxX+1) 0 in
		let clk x = cnt.(x) <- cnt.(x) + 1 in
		List.iter (function X (_, x) -> clk x | _ -> ()) liste;
		let (shift, tag, liste) = if (Array.for_all (fun x -> x > 0) cnt)
			then (shift, tag, liste)
			else
			(
				(* Xs are not contiguous *)
				let minX = Tools.array_index (fun x -> x > 0) cnt |> Tools.unop in
				let shift = shift <> (mod2 minX) in
				let rec aux carry opt curr =
					assert(curr >= opt);
					if curr < maxX
					then if cnt.(curr) > 0
						then if mod2 (curr-opt) <> (mod2 minX)
							then (aux ((opt+1)::carry) (opt+1) (curr+1))
							else (aux (opt::carry) opt (curr+1))
						else (aux ((-1)::carry) opt (curr+1))
					else (carry |> List.rev |> Array.of_list)
				in
				let remap = aux (0::(if minX > 0 then (MyList.make (minX-1) (-1)) else [])) 0 (minX+1) in
				let liste = List.map (function S -> S | P -> P | X(b, i) -> X(b, remap.(i))) liste in
				let maxX = Array.fold_left max (-1) remap in
				assert(maxX >= 0);
				assert(List.exists (function X(_, i) when i = maxX -> true | _ -> false) liste);
				(shift, {hasS = tag.hasS; hasP = tag.hasP; maxX = Some maxX}, liste)
			)
		in
		let maxX = Tools.unop tag.maxX in
		if next_is_leaf
		then
		(
			assert(tag.hasS = false);
			(* check for a then 0 else 0 last line *)
			match (if shift <> (mod2 maxX)
				then (Ok (shift, tag, liste))
				else
					(
						let liste = List.map (function X(_, i) when i = maxX -> P | x -> x) liste in
						if maxX = 0
						then (Error {neg; arity; block = C0})
						else (Ok (shift, {hasS = false; hasP = tag.hasP; maxX = Some (maxX-1)}, liste))
					)
				) with
			| Error block -> block
			| Ok (shift, tag, liste) ->
			(
				(* check that the last line is not reduced to a single element *)
				if MyList.count (function X(_, i) when i = maxX -> true | _ -> false) liste = 1
				then if maxX = 0
					then
					(
						let x, neg' = match Tools.ifind (function X(b, j) -> assert(j=0); Some b) liste |> Tools.unop in
						{neg = (neg = neg'); arity; block = Id x}
					)
					else
					(
						let tag = {hasS = tag.hasS; hasP = hasP; maxX = Some(maxX-1)} in
						let liste = List.map (function X(b, i) when i = maxX -> X(not b, i-1) | x -> x) liste in
						{neg = not neg; arity; block = SPX(not shift, tag, liste)}
					)
				else {neg; arity; block = (SPX(shift, tag, liste))}
			)
			
		)
		else	{neg; arity; block = (SPX(shift, tag, liste))}
	)

let reduce_block_choice neg arity next_is_leaf = function
	| C0 -> {neg; arity; block = C0}
	| Id x -> assert(0 <= x && x < arity); {neg; arity; block = Id x}
	| SPX block_spx = reduce_block_spx neg arity block_spx next_is_leaf

let reduce_block block next_is_leaf =
	assert(0 <= block.arity);
	reduce_block_choice block.neg block.arity next_is_leaf block.block

let reduce_node (block, node) =
	reduce_block block (Utils.gnode_is_leaf node)

let push_X0_block_spx iB tB (* if, rank = 0, then *) neg arity (shift, tag, liste) next_is_leaf =
	match tag.maxX with
	| None ->
	(
		assert(not next_is_leaf); (* next_is_leaf => no S; no S + no X => only P; C0 *)
		assert(not shift);
		let tag = {hasS = tag.hasS; hasP = tag.hasP; maxX = Some 0} in
		{neg; arity = arity+1; block = SPX(tB <> neg, tag, (X(iB, 0))::liste)}
	)
	| Some maxX ->
	(
		if (tB <> neg <> shift) = false
		(* correct alignment *)
		then {neg; arity = arity+1; block = SPX(shift, tag, (X(iB, 0))::liste)}
		(* incorrect alignment *)
		else
		(
			let liste = List.map (function X(b, i) -> X(b, i+1) | x -> x) liste in
			let tag = {hasS = tag.hasS; hasP = tag.hasP; maxX = Some(maxX+1)} in
			{neg; arity = arity+1; block = SPX(not shift, tag, (X(iB, 0))::liste)}
		)
	)

let push_X0_block_choice iB tB (* if, rank = 0, then *) neg arity next_is_leaf = function
	| C0 ->
	(
		assert(next_is_leaf);
		if neg = tB
		then {neg; arity = arity+1; block = C0}
		else {neg = iB <> tB; arity = arity+1; block = Id 0}
	)
	| Id x ->
	(
		assert(next_is_leaf);
		let tag = {hasS = false; hasP = arity>1; maxX = Some 0} in
		let tB' = tB <> neg in
		let liste = (X(iB, 0))::((make_nP x)@((X(tB', 0))::(make_nP (arity-x-1)))) in
		{neg = not tB; arity = arity+1; block = SPX(tB', tag, liste)}
	)
	| SPX block_spx -> push_X0_block_spx iB tB neg arity block_spx next_is_leaf

let push_X0_block iB tB (* if, rank = 0, then *) block next_is_leaf =
	push_X0_block_choice iB tB block.neg block.arity next_is_leaf block.block

let count_nS_spx = MyList.count (function S -> true | _ -> false) 

let count_nS_block_choice = function
	| C0 | Id _ -> 0
	| SPX(_, _, liste) -> count_nS_spx liste

let count_nS_block block = count_nS_block_choice block.block
let count_nS_edge (block, node) = count_nS_block block

let make_block_S n = {neg = false; arity = b; block = SPX(false, {hasS = n > 0; hasP = false; maxX = None}, make_nS n}

let make_block2_S n =
	let block = make_block_S n in
	(block, block)

let cmake_nSS block = make_block2_S (count_nS block)
let cmake_nS  block = make_block_S  (count_nS block)

let tacx_split (ttag, block) =
	let blockX, blockY = block_split block in
	(ttag, blockX, blockY)

let compose_block blockC blockc next_is_leaf =
	assert(count_nS_block blockC = block.arity);
	match blockC.block with
	| C0 | Id x -> assert false
	| SPX(shift, tag, liste) ->
	match maxX with
	| None ->
	(
		assert(shift = false);
		match blockc.block with
		| C0 ->
		(
			assert(next_is_leaf);
			{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = SPX(shift <> blockc.neg, tag, liste)}
		)
		| Id x ->
		(
			assert(next_is_leaf);
			match tag.maxX with
			| None ->
			(
				(* blockC is SPX but only one S and no X *)
				let y = MyList.index (function S -> true) liste in
				{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = Id (y+x)}
			)
			| Some maxX ->
			(
				(* WIP *)
			)
		)
		| SPX(shift', tag', liste') ->
		(
			let tag = {hasS = tag'.hasS; hasP = tag.hasP || tag'.hasP; maxX = tag'.maxX} in
			let liste = (* WIP *)
			{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = SPX(shift', tag, liste)}
		)
	)
	| Some maxX ->
	(
		(* WIP *)
	)

let compose_block' blockC blockc =
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

let compose_block blockC blockc = compose_block' blockC blockc |> reduce

(*let compose bC (bc, ic) = (compose_block bC bc, ic)*)

let compose bC (bc, ic) = match ic with
	| Utils.Leaf () -> (compose_block  bC bc, ic)
	| Utils.Node _  -> (compose_block' bC bc, ic)

let get_root b (block, _) = ({neg = b; shift = false; sub = List.map (fun _ -> P) block.sub}, Utils.Leaf())

let neg (block, i) = ({neg = not block.neg; shift = block.shift; sub= block.sub}, i)
let cneg b (block, i) = ({neg = block.neg <> b; shift = block.shift; sub = block.sub}, i)
