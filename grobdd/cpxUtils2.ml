(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open CpxTypes2

let (=>) (x:bool) (y:bool) : bool = (x <= y)
(*
assert((false => false) = true )
assert((false => true ) = true )
assert((true  => false) = false)
assert((true  => true ) = true )
*)

let make_nP n = MyList.make n P
let make_nS n = MyList.make n S

let isS		= function S -> true		| _ -> false
let isntS = function S -> false		| _ -> true
let isP		= function P -> true		|	_ -> false
let isntP = function P -> false		| _ -> true
let isX		= function X _ -> true	| _ -> false
let isntX = function X _ -> false	| _ -> true


let hasS block = match block.block with
	| C0 | Id _ -> false
	| SPX (_, tag, _) -> tag.hasS

let block_split (blockX, blockY) : block * block = (blockX, blockY)

let block_merge blockX blockY = (blockX, blockY)

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

let block_spx_is_const liste = List.for_all isP

let block_is_const block = match block.block with
	| C0 -> Some block.neg
	| _	 -> None

let edge_is_const (block, i) =
	assert(i = Utils.Leaf ());
	block_is_const block

let block_c0_to_block_spx arity =
	(false, {hasS = false; hasP = arity > 0; maxX = None}, make_nP arity )

let block_id_to_block_spx arity x =
		assert(arity > x);
		(true,  {hasS = false; hasP = arity > 1; maxX = Some 0}, (make_nP x)@((X(true, 0))::(make_nP (arity-x-1))))

let block_choice_to_block_spx arity = function
	| C0 -> block_c0_to_block_spx arity
	| Id x	-> block_id_to_block_spx arity x
	| SPX (shift, tag, liste) ->
		(shift, tag, liste)

let push_S_block block =
	let (shift, tag, liste) = block_choice_to_block_spx block.arity block.block in
	let tag = {hasS = true; hasP = tag.hasP; maxX = tag.maxX} in
	{neg = block.neg; arity = block.arity+1; block = SPX(shift, tag, S::liste)}

let push_S_edge (block, node) = (push_S_block block, node)

let push_P_block_choice = function
	| C0 -> C0
	| Id x -> Id (x+1)
	| SPX (shift, tag, liste) ->
		let tag = {hasS = tag.hasS; hasP = true; maxX = tag.maxX} in
		SPX (shift, tag, P::liste)

let push_P_block block = {neg = block.neg; arity = block.arity+1; block = push_P_block_choice block.block}

let push_P_node (block, node) = (push_P_block block, node)

let minicheck_spx = List.for_all (function X(_, i) when i < 0 -> false | _ -> true)

let get_spx_tag_from_block_spx liste =
	let hasS, hasP, maxX = List.fold_left (fun (hasS, hasP, maxX) -> function
		| S			-> (true, hasP, maxX					)
		| P			-> (hasS, true, maxX					)
		| X(b, i)	-> (hasS, hasP, Tools.opmax i maxX	)
	) (false, false, None) liste in
	{hasS; hasP; maxX}

let check_spx_tag tag liste : bool =
	(if tag.hasS then (List.exists isS liste) else (List.for_all isntS liste))&&
	(if tag.hasP then (List.exists isP liste) else (List.for_all isntP liste))&&
	(match tag.maxX with
		| None -> List.for_all isntX liste
		| Some 0 ->
		(
			(List.for_all (function X(_, i) -> i = 0 | _ -> true) liste)&&
			(List.exists isX liste)
		)	
		| Some maxX ->
		(
			(List.for_all (function X(_, i) -> (0<=i)&&(i<=maxX) | _ -> true ) liste)&&
			(List.exists (function X(_, i) when i = maxX -> true | _ -> false) liste)
		)	
	)

let get_spx_tag arity = function
	| C0		-> {hasS = false; hasP = arity > 0; maxX = None}
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
		| None -> if tag.hasS then None else Some false
		| Some i -> Some(shift <> mod2 i)
	)

let in_block_choice block sigma = match block with
	| C0 -> Some false
	| Id x -> Some(List.nth sigma x)
	| SPX block_spx -> in_block_spx block_spx sigma

let in_block block sigma = match in_block_choice block.block sigma with
	| None -> None
	| Some bool -> Some (block.neg <> bool)

let spx_is_contig (_, tag, liste) next_is_leaf : bool = match tag.maxX with
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

let assert_block_spx arity (shift, tag, liste) next_is_leaf  =
	assert(arity = List.length liste);
	assert(check_spx_tag tag liste);
	assert(next_is_leaf => (not tag.hasS));
	match tag.maxX with
		| None -> assert((not shift)&&(not next_is_leaf))
		| Some 0 ->
			assert(next_is_leaf => (shift && (MyList.count isX liste > 1)))
		| Some maxX ->
		assert(
			(0 <= maxX) && (maxX < arity) &&
			(next_is_leaf => (((mod2 maxX) <> shift)))
		)
	;
	assert(spx_is_contig (shift, tag, liste) next_is_leaf);
	()

let check_block_spx arity (shift, tag, liste) next_is_leaf : bool =
	(arity = List.length liste)&&
	(check_spx_tag tag liste)&&
	(next_is_leaf => (not tag.hasS))&&
	(match tag.maxX with
		| None -> (not shift)&&(not next_is_leaf)
		| Some 0 ->
			(next_is_leaf => (shift && (MyList.count isX liste > 1)))
		| Some maxX ->
			(0 <= maxX) && (maxX < arity) &&
			(next_is_leaf => (((mod2 maxX) <> shift)))
	)&&
	(spx_is_contig (shift, tag, liste) next_is_leaf)

let assert_block_choice arity next_is_leaf = function
	| C0 -> ()
	| Id x -> assert ((x >= 0) && (x < arity)); ()
	| SPX block_spx -> assert_block_spx arity block_spx next_is_leaf; ()

let check_block_choice arity next_is_leaf = function
	| C0 -> true
	| Id x -> (x >= 0) && (x < arity)
	| SPX block_spx -> check_block_spx arity block_spx next_is_leaf

let assert_block block next_is_leaf =
	assert(0 <= block.arity);
	assert_block_choice block.arity next_is_leaf block.block;
	()

let check_block block next_is_leaf =
	assert(0 <= block.arity);
	assert(check_block_choice block.arity next_is_leaf block.block);
	()

let check_block block next_is_leaf =
	(0 <= block.arity) &&
	(check_block_choice block.arity next_is_leaf block.block)

let check_node (block, node) = check_block block (Utils.gnode_is_leaf node)


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
				else if maxX = 0
					then (Error {neg; arity; block = C0})
					else
					(
						let liste = List.map (function X(_, i) when i = maxX -> P | x -> x) liste in
						Ok (shift, {hasS = false; hasP = true; maxX = Some (maxX-1)}, liste)
					)
				) with
			| Error block -> block
			| Ok (shift, tag, liste) ->
			(
				(* check that the last line is not reduced to a single element *)
				let maxX = Tools.unop tag.maxX in
				if MyList.count (function X(_, i) when i = maxX -> true | _ -> false) liste = 1
				then if maxX = 0
					then
					(
						let x, neg' = MyList.ifind (function X(b, j) -> assert(j=0); Some b | _ -> None) liste |> Tools.unop in
						{neg = (neg = neg'); arity; block = Id x}
					)
					else
					(
						let tag = {hasS = tag.hasS; hasP = tag.hasP; maxX = Some(maxX-1)} in
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
	| SPX block_spx -> reduce_block_spx neg arity next_is_leaf block_spx

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

let count_nS_spx = MyList.count isS

let count_nS_block_choice = function
	| C0 | Id _ -> 0
	| SPX(_, _, liste) -> count_nS_spx liste

let count_nS_block block = count_nS_block_choice block.block
let count_nS_edge (block, node) = count_nS_block block

let make_block_S n =
	assert(n>=0);
	{neg = false; arity = n; block = SPX(false, {hasS = n > 0; hasP = false; maxX = None}, make_nS n)}

let make_block2_S n =
	let block = make_block_S n in
	(block, block)

let cmake_nSS block = make_block2_S (count_nS_block block)
let cmake_nS  block = make_block_S  (count_nS_block block)

let tacx_split (ttag, block) =
	let blockX, blockY = block_split block in
	(ttag, blockX, blockY)

let compose_block_spx_spx (shift, tag, liste) (shift', tag', liste') =
	let compose shiftX spxC spxc =
		let rec aux carry = function
			| ([]   , []   ) -> List.rev carry
			| ([]   , _    ) -> assert false
			| (S::x', y::y') -> aux ((match y with X(b, i) -> X(b, shiftX+i) | y -> y)::carry) (x', y')
			| (S::_ , []	 ) -> assert false
			| (x::x', y'   ) -> aux (x::carry) (x', y')
		in
		aux [] (spxC, spxc)
	in
	let compose0 spxC spxc =
		let rec aux carry = function
			| ([]   , []   ) -> List.rev carry
			| ([]   , _    ) -> assert false
			| (S::x', y::y') -> aux (y::carry) (x', y')
			| (S::_ , []	 ) -> assert false
			| (x::x', y'   ) -> aux (x::carry) (x', y')
		in
		aux [] (spxC, spxc)
	in
	let maxX, liste = match tag.maxX with
	| None ->
	(
		assert(shift = false);
		(tag'.maxX, compose0 liste liste')
	)
	| Some maxX ->
	(
		match tag'.maxX with
		| None ->
		(
			assert(shift' = false);
			(tag.maxX, compose0 liste liste')
		)
		| Some maxX' ->
		(
			let shiftX = if (shift <> (mod2 maxX)) = shift' then maxX else (maxX+1) in
			(Some(shiftX+maxX'), compose shiftX liste liste')
		)
	)
	in
	let tag = {hasS = tag'.hasS; hasP = tag.hasP || tag'.hasP; maxX} in
	(shift, tag, liste)

let compose_block blockC blockc next_is_leaf =
	assert(count_nS_block blockC = blockc.arity);
	match blockC.block with
	| C0 | Id _ -> assert false
	| SPX(shift, tag, liste) ->
	match tag.maxX with
	| None ->
	(
		(* no need for reduction *)
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
			(* blockC is SPX but only one S and no X *)
			let y = MyList.index isS liste |> Tools.unop in
			{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = Id (y+x)}
		)
		| SPX(shift', tag', liste') -> 
		(
			let block_spx = compose_block_spx_spx (shift <> blockc.neg, tag, liste) (shift', tag', liste') in
			{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = SPX block_spx}
		)
	)
	| Some maxX ->
	(
		(* needs reduction *)
		let blockCc = match blockc.block with
		| C0 ->
		(
			assert(next_is_leaf);
			{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = SPX(shift <> blockc.neg, tag, liste)}
		)
		| Id x ->
		(
			assert(next_is_leaf);
			let (shift', tag', liste') = block_id_to_block_spx blockc.arity x in
			let block_spx = compose_block_spx_spx (shift <> blockc.neg, tag, liste) (shift', tag', liste') in
			{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = SPX block_spx}
		)
		| SPX(shift', tag', liste') ->
		(
			let block_spx = compose_block_spx_spx (shift <> blockc.neg, tag, liste) (shift', tag', liste') in
			{neg = blockC.neg <> blockc.neg; arity = blockC.arity; block = SPX block_spx}
		)
		in
		reduce_block blockCc next_is_leaf
	)

let compose_edge blockC (blockc, nodec) = (compose_block blockC blockc (Utils.gnode_is_leaf nodec), nodec)

let get_root b (block, _) = ({neg = b; arity = block.arity; block = C0}, Utils.Leaf())

let neg (block, node) = ({neg = not block.neg; arity = block.arity; block = block.block}, node)
let cneg b (block, node) = ({neg = b <> block.neg; arity = block.arity; block = block.block}, node)
