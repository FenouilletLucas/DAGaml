(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open IterExtra
open CpxTypes2
open CpxTypes2Test
open CpxUtils2

let n = int_of_string(Sys.argv.(1));;

let _ = 
	print_string "TEST 1.0 : contig"; print_newline();
	(*Iter.iter (fun x -> print_string (dummydump x); print_newline()) (gen1 n);*)
	print_string "LENGTH = "; print_int (Iter.length (gen1 n)); print_newline();
	print_string "TEST 2.0 : block"; print_newline();
	(*Iter.iter (fun x -> print_string (block_dummydump x); print_newline()) (gen_block n);*)
	print_string "LENGTH = "; print_int (Iter.length (gen_block n)); print_newline();
	print_string "TEST 2.1 : reduced block are correct"; print_newline();
	Iter.iter (fun block0 ->
		let block2 = reduce_block block0 false in
		(assert_block block2 false);
		if not (hasS block0)
		then
		(
			let block1 = reduce_block block0 true in
			assert(check_block block1 true);
			assert(not(hasS block2));
			let block3 = reduce_block block2 true in
			assert(block1 = block3)
		);
	) (gen_block n);

	print_string "TEST 2.2 : reduce^2 = reduce1"; print_newline();
	Iter.iter (fun x ->
		let y0 = reduce_block x  false in
		let z0 = reduce_block y0 false in
		assert(y0 = z0);
		if not (hasS x)
		then
		(
			let y1 = reduce_block x  true in
			let z1 = reduce_block y1 true in
			assert(y1 = z1)
		)
		) (gen_block n);


	print_string "TEST 2.3 : reduce using in_block"; print_newline();
	Iter.iter (fun block0 ->
		let in0 = in_block block0 in
		if not(hasS block0)
		then
		(
			let block1 = reduce_block block0 true in
			let in1 = in_block block1 in
			if block0 <> block1 then
			(
				Iter.iter (fun vec -> assert(in0 vec = in1 vec)) (gen_vec n)
			)
		);
		let block2 = reduce_block block0 false in
		let in2 = in_block block2 in
		if block0 <> block2 then
		(
			Iter.iter (fun vec -> assert(in0 vec = in2 vec)) (gen_vec n)
		)
	) (gen_block n);

	print_string "TEST 3.0 : checked block"; print_newline();
	(*Iter.iter (fun x -> print_string (block_to_pretty x); print_newline(); print_newline()) (gen_block_checked n);*)
	print_string "LENGTH = "; print_int (Iter.length (gen_block_checked n)); print_newline();
	print_string "TEST 3.0.1 : reduce on correct block is identity"; print_newline();
	Iter.iter (fun block0 ->
		if (check_block block0 true)
		then (
			let block1 = reduce_block block0 true  in
			assert(block0 = block1)
		);
		if (check_block block0 false)
		then (
			let block2 = reduce_block block0 false in
			assert(block0 = block2)
		)
	) (gen_block n);;
