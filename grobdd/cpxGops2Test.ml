(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open IterExtra
open CpxTypes2
open CpxTypes2Test
open CpxUtils2
open CpxDumpLoad2
open CpxGops2

let _ =
	let n = int_of_string(Sys.argv.(1)) in

	print_string "TEST 3.1 : solve_cons"; print_newline();

	let reversible ((block0, node0) as edge0) ((block1, node1) as edge1) =
		match (solve_cons edge0 edge1 : (_, _) Utils.merge) with
		| Utils.MEdge edge01 ->
		( match node_pull edge01 with
			| Utils.MEdge (edge0', edge1') -> assert((edge0 = edge0')&&(edge1 = edge1'))
			| Utils.MNode _ -> assert false
		)
		| Utils.MNode (edge01, (node, node0', node1')) ->
		(
			assert(node0' = node0);
			assert(node1' = node1);
			(
				let nils = Utils.gnode_is_leaf node0', Utils.gnode_is_leaf node1' in
				let stream = bindump_node node nils in
				let node' = binload_node nils stream in
				assert(node' = node)
			);
			match node_pull (edge01, Utils.Node 3) with
				| Utils.MEdge _ -> assert false
				| Utils.MNode f ->
				(
					let edge0', edge1' = f (node, node0', node1') in
					assert(edge0 = edge0' && edge1 = edge1')
				)
		);
		()
	in

	Iter.iter (fun (block0, block1) ->
		if (check_block block0 false)
		then
		(
			if (check_block block1 false)
			then (reversible (block0, Utils.Node 0) (block1, Utils.Node 1));
			if (check_block block1 true)
			then (reversible (block0, Utils.Node 0) (block1, Utils.Leaf ()))
		);
		if (check_block block0 true)
		then
		(
			if (check_block block1 false)
			then (reversible (block0, Utils.Leaf()) (block1, Utils.Node 1));
			if (check_block block1 true)
			then (reversible (block0, Utils.Leaf()) (block1, Utils.Leaf ()))
		)
	) ((gen_block_checked n) $* (gen_block_checked n))
;;

	(*

	print_string "TEST 3.2 : solve_cons using in_block"; print_newline();;

	let compatible_test_3_2 ((ex, ix) as x) ((ey, iy) as y) =
		match solve_cons (fun x -> x) x y with
		| Utils.MEdge (exy, ixy) ->
		(
			Iter.iter (fun vec ->
				assert(in_block exy (false::vec) = in_block ex vec);
				assert(in_block exy (true ::vec) = in_block ey vec);
				()
			) (gen_vec n)
		)
		| Utils.MNode (e, (xy, ix', iy')) ->
		(
			let ok = function
				| None -> fun _ -> true
				| Some x -> function None -> false | Some y -> x = y
			in
			Iter.iter (fun vec ->
				assert(ok (in_block e (false::vec)) (in_block ex vec));
				assert(ok (in_block e (true ::vec)) (in_block ey vec));
				()
			) (gen_vec n)
		);
		()
	;;

	Iter.iter (fun (ex, ey) ->
		let ix = if List.exists (function S -> true | _ -> false) ex.sub
			then Utils.Node 1
			else Utils.Leaf ()
		and iy, iy' = if List.exists (function S -> true | _ -> false) ey.sub
			then Utils.Node 1 , Utils.Node 2
			else Utils.Leaf (), Utils.Leaf ()
		in
		let x = (ex, ix)
		and y = (ey, iy)
		and y' = (ey, iy') in
		compatible_test_3_2 x y;
		compatible_test_3_2 x y')
		((gen_block_checked n) $* (gen_block_checked n));

	print_string "TEST 4.1 : check assign & compose compatibility"; print_newline();;

	let gen_assign n = (Iter.of_list [None; Some false; Some true]) $^ n;;

	Iter.iter (fun blockC ->
		let nS = count_nS blockC.sub in
		if nS > 0 then(
		Iter.iter (fun set ->
			let set = (Some set) in
			let (blockC', identC'), set' = assign set (blockC, Utils.Node 1) in
			match identC' with
			| Utils.Leaf () -> ()
			| Utils.Node x -> assert(x=1);
			(
				Iter.iter (fun blockc ->
					let identc = if count_nS blockc.sub = 0
						then (Utils.Leaf ())
						else (Utils.Node 0) in
					let (blockc', identc'), (set'' : bool option list option)= assign set' (blockc, identc) in
					let blockC'c' = compose blockC' (blockc', identc') in
					let blockCc = compose blockC (blockc, identc) in
					let blockCc', (set'3 : bool option list option) = assign set blockCc in
					assert(blockC'c' = blockCc' && set'' = set'3);
				) (gen_block_checked nS)
			)
		) (gen_assign n))
	) (gen_block_checked n);;

	print_string "TEST 4.2 : check assign using solve_cons"; print_newline();;
	(*
	let node_assign set blockC (block, ix, iy) =
		let (blockC', ident), set' = assign set (blockC, Utils.Node 3) in
		match ident with
		| Utils.Leaf () -> ; Utils.MEdge ((blockC', Utils.Leaf()), set')
		| Utils.Node node ->
		(
			let edge0, edge1 = node_split (block, ix, iy) in
			match set' with
			| None -> Utils.MEdge (blockC', Utils.Node node)
			| Some [] -> assert false
			| Some(head::tail) -> match head with
				| None ->
				(
					let edge0', set0' = assign tail edge0
					and edge1', set1' = assign tail edge1 in
					match solve_cons (fun x -> x) edge0' edge1' with
					| Utils.

				)
				| Some false ->
				(
					let edge0', set0' = assign tail edge0 in
				)
				| Some true  ->
				(
					let edge1', set1' = assign tail edge1 in
				)
		)
	*)
	let compatible_test_4_2 ((e0, i0) as x0) ((e1, i1) as x1) =
		match solve_cons (fun x -> x) x0 x1 with
		| Utils.MEdge ((e01, i01) as x01) ->
		(
			Iter.iter (fun set ->
				let pe_set_x0 = assign (Some set) x0
				and pe_set_x1 = assign (Some set) x1
				and pe_0set_x01 = assign (Some((Some false)::set)) x01
				and pe_1set_x01 = assign (Some((Some true )::set)) x01 in
	(*			and pe_Nset_x01 = assign (Some( None       ::set)) x01 in *)
	(*			let pe_set_x0_pe_set_x1 = pe_set_x0 *! pe_set_x1 in *)
				assert(pe_set_x0 = pe_0set_x01);
				assert(pe_set_x1 = pe_1set_x01);
	(*			assert(pe_Nset_x01 = pe_set_x0_pe_set_x1); *)
				()
			) (gen_assign n)
		)
		| Utils.MNode (e, (xy, ix', iy')) ->
		(
			()
		);
		()
	;;

	Iter.iter (fun (ex, ey) ->
		let ix = if List.exists (function S -> true | _ -> false) ex.sub
			then Utils.Node 1
			else Utils.Leaf ()
		and iy, iy' = if List.exists (function S -> true | _ -> false) ey.sub
			then Utils.Node 1 , Utils.Node 2
			else Utils.Leaf (), Utils.Leaf ()
		in
		let x = (ex, ix)
		and y = (ey, iy)
		and y' = (ey, iy') in
		compatible_test_3_2 x y;
		compatible_test_3_2 x y')
		((gen_block_checked n) $* (gen_block_checked n));

	*)
