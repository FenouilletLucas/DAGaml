open IterExtra
open CpxV0Types
open CpxV0Gops


let check_contig m =
	let n = List.length m in
	let t = Array.make n 0 in
	List.iter (fun x -> t.(x) <- t.(x)+1) m;
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
	aux1 (Array.to_list t)
;;

List.iter print_string (MyList.init 10 string_of_int); print_newline();;

let dummydump m = "["^(StrUtil.catmap ", " string_of_int m)^" ]";;

let gen1 n = (Iter.range 0 n) $^ n |> (Iter.filter check_contig);;
let gen_contig = gen1 ;;

let gen_sub' n = (Iter.range 0 3) $^ n $@++ (fun vect ->
	let n2 = MyList.count(function 2 -> true | _ -> false) vect in
	(gen_contig n2) $* (Iter.gen_bool $^ n2) $$+ (fun (a, b) ->
		let rec f carry = function
			| ([], []) -> List.rev carry
			| (0::x, y) -> f (S::carry) (x, y)
			| (1::x, y) -> f (P::carry) (x, y)
			| (2::x, (i, b)::y) -> f(X(b, i)::carry) (x, y)
			| _ -> assert false
		in f [] (vect, List.combine a b)))
;;

let gen_sub n = gen_sub' n Iter.stop;;

let gen_block n = (Iter.gen_bool $* Iter.gen_bool $* gen_sub n) $$ (fun ((neg, shift), sub) -> {neg; shift; sub});;

let gen_block_checked n = gen_block n |> (Iter.filter check);;

let n = int_of_string(Sys.argv.(1));;

print_string "TEST 1.0 : contig"; print_newline();;
(*Iter.iter (fun x -> print_string (dummydump x); print_newline()) (gen1 n);*)
print_string "LENGTH = "; print_int (Iter.length (gen1 n)); print_newline();;
print_string "TEST 2.0 : block"; print_newline();;
(*Iter.iter (fun x -> print_string (block_dummydump x); print_newline()) (gen_block n);*)
print_string "LENGTH = "; print_int (Iter.length (gen_block n)); print_newline();;
print_string "TEST 2.1 : reduced block are correct"; print_newline();;
Iter.iter (fun x ->
	let y = reduce x in
	assert(check y)) (gen_block n);
print_string "TEST 2.2 : reduce^2 = reduce1"; print_newline();;
Iter.iter (fun x ->
	let y = reduce x in
	let z = reduce y in
	assert(y = z)) (gen_block n);
print_string "TEST 3.0 : checked block"; print_newline();;
(*Iter.iter (fun x -> print_string (block_to_pretty x); print_newline(); print_newline()) (gen_block_checked n);*)
print_string "LENGTH = "; print_int (Iter.length (gen_block_checked n)); print_newline();;
print_string "TEST 3.0.1 : reduce on correct block is identity"; print_newline();;
Iter.iter (fun x ->
	let y = reduce x in
	assert(x = y)) (gen_block_checked n);
print_string "TEST 3.0.2-1 : binDump/Load int"; print_newline();;
Iter.iter (fun x ->
	let y = BinDump.int x [] in
	let z, s = BinLoad.int y in
	assert(s = []);
	assert(z = x)) (Iter.range 0 256);
print_string "TEST 3.0.2 : binDump/Load checked block"; print_newline();;
Iter.iter (fun x ->
	let y = bindump_block x [] in
	let z, s = binload_block y in
	assert(s = []);
	assert(x = z)) (gen_block_checked n);
print_string "TEST 3.1 : solve_cons"; print_newline();;

let reversible ((ex, ix) as x) ((ey, iy) as y) =
	match solve_cons (fun x -> x) x y with
	| Utils.MEdge xy ->
	( match node_pull (fun x -> x) xy with
		| Utils.MEdge (x', y') -> assert((x = x')&&(y = y'))
		| Utils.MNode _ -> assert false
	)
	| Utils.MNode (e, (xy, ix', iy')) ->
	(
		(
			let xy' = bindump_block2 xy [] in
			let xy'', s = binload_block2 xy' in
			assert(s = []);
			assert(xy = xy'');
		);
		match node_pull (fun x -> x) (e, Utils.Node 3) with
			| Utils.MEdge _ -> assert false
			| Utils.MNode f -> let x', y' = f (xy, ix', iy') in
				assert(x = x' && y = y')
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
	reversible x y;
	reversible x y')
	((gen_block_checked n) $* (gen_block_checked n));
