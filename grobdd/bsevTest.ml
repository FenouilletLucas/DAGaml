let entropy_sev =
	let rec aux i carry = function
		| [] -> carry
		| head::tail -> if head
			then (aux (i+1) carry tail)
			else (aux i (carry+i) tail)
	in aux 0 0

let dummydump_sev sev =
	"["^(StrUtil.catmap "; " (function None -> "None" | Some v -> "Some ("^(StrUtil.catmap "" (function true -> "1" | false -> "0") v)^")") sev )^"]"

let binload_sev : bool list -> bool list -> bool list option list =
	let rec aux i carry matx = function
		| [] -> carry
		| head::tail -> if head
			then aux (i+1) (None::carry) matx tail
			else
			(
				let v, matx = MyList.hdtl_nth i matx in
				aux i ((Some v)::carry) matx tail
			)
	in aux 0 [] (* matx *) (* main *)

let main = [true; false]
and matx = [true]

let entr = entropy_sev main
let () =
	print_string "entropy = "; print_int entr; print_newline();
	assert(List.length matx = entr);;


let strdump_sev =
	let iuniq_elem n =
		let rec aux carry = function
			| ([], []) -> (MyList.ntimes " " n)@("+"::(List.rev carry))
			| (None::x', y::y') -> aux ((if y then "+" else " ")::carry) (x', y')
			| ((Some _)::x', y') -> aux (" "::carry) (x', y')
			| _ -> assert false
		in fun vec tail -> aux [] (tail, vec)
	in
	let rec aux n floor matrix = function
		| [] -> String.concat "\n" ((List.map (String.concat "") ((List.rev matrix)@[List.rev floor])))
		| head::tail -> match head with
			| None		-> aux (n+1) ("_"::floor) matrix tail
			| Some v	-> aux (n+1) ("I"::floor) ((iuniq_elem n v tail)::matrix) tail
	in
	aux 0 [] []
;;

let sev = binload_sev matx main;;

print_newline();
print_string (dummydump_sev sev);
print_newline();
print_string (strdump_sev sev);
print_newline();;

open IterExtra

let gen_vec' size next	=
	Iter.gen_bool $^ size $+ next

let gen_vec  size		= gen_vec' size Iter.stop

let gen_sev' size	=
	(gen_vec size) $@++ (fun vect ->
		gen_vec (entropy_sev vect) $$+ (fun matx ->
			binload_sev matx vect
			))
;;

let gen_sev  size	= gen_sev' size Iter.stop
;;

let gen_rinni' =
	let last : _ -> _ =
		let rec aux some carry = function
			| [] -> assert false
			| [x] -> (x, if some then Some (List.rev carry) else None)
			| x::x' -> aux (some||x) (x::carry) x'
		in aux false []
	in
	fun size ->	(gen_vec size) $@++	(fun vect ->
		let vect = true::vect in
		let m = MyList.count_true vect in
		(gen_vec (entropy_sev vect)) $$+	(fun matx ->
			let sev = binload_sev matx vect in
			let sev, last = MyList.last sev in
			assert(last = None);
			let sev : (bool * ( (bool list) option ) ) option list = List.map (function None -> None | Some v -> Some (last v)) sev in
			sev
											)
									)

let gen_uniq size = gen_uniq' size Iter.stop

let gen_ripair' =
	let merge =
		let rec aux carry = function
			| ([], []) -> List.rev carry
			| ((None, None)::x', y::y') -> aux ((NniGops.ISS y)::carry) (x', y')
			| (x::x', y') -> let head = NniGops.(match x with
				| (None, Some v)	-> ISP v
				| (Some v, None)	-> IPS v
				| (Some v, Some v') -> IPP (v, v')) in aux (head::carry) (x', y')
		in fun uXY v -> aux [] (uXY, v)
	in 
	fun size ->
	let gu = gen_uniq size in
	gu $* gu $@++ (fun (uX, uY) ->
		let uXY = List.combine uX uY in
		let m = MyList.count (function (None, None) -> true | _ -> false) uXY in
		let funmap = merge uXY in
		gen_vect m $$+ funmap)

let gen_ripair size = gen_ripair size Iter.stop

let gen_riuniq' size : NniTypes.edge_state Iter.next =
	(gen_vec size) $@++ (fun vect ->
		let vect = true::vect in
		let m = MyList.count_true vect in
		gen_vec (entropy_sev vect) $@++ (fun matx ->
			let funmap = NniGops.uniq_of_rsev_rvec (binload_sev matx vect) in
			(gen_vec m) $$+ funmap
			))
;;

let gen_riuniq  size	= gen_riuniq' size Iter.stop
;;

let gen_riuniq_comp' size =
	(gen_riuniq size) $@++ (fun ((_, uniq) as nni) ->
		let size' : int = NniGops.count_s uniq in
		(gen_riuniq size') $$+ (fun nni' -> (nni, nni')))
;;

let gen_riuniq_comp size = gen_riuniq_comp' size Iter.stop
;;

let gen_riuniq_comp_comp' size =
	(gen_riuniq size) $@++ (fun ((_, uniq) as nni) ->
		let size' : int = NniGops.count_s uniq in
		(gen_riuniq size') $@++ (fun ((_, uniq') as nni') ->
			let size'' : int = NniGops.count_s uniq' in
			(gen_riuniq size'') $$+ (fun nni'' -> (nni, nni', nni''))))
;;

let gen_riuniq_comp_comp size = gen_riuniq_comp_comp' size Iter.stop
;;

let n = 4;;

let g  = n $< gen_sev;;
let g2 = n $< (fun n -> let g = gen_sev n in (g$*g));;
let g3 = n $< (fun n -> let g = gen_sev n in ((g$*g)$*g));;

print_string "TEST 0 : strdump_sev"; print_newline();;
Iter.iter (fun sev -> ignore(strdump_sev sev);) g;;

let print_sev sev =
	try
		print_string(strdump_sev sev);
	with _ -> print_string(dummydump_sev sev);
	print_newline();
;;

print_string "TEST 1 : sev = reduce(expand(sev))"; print_newline();;
Iter.iter (fun sev -> assert(sev = Bsev.sev_reduce (Bsev.sev_expand sev));) g;;


print_string "TEST 2 : A U B = B U A"; print_newline();;
Iter.iter	(fun (sevA, sevB) ->
	let sevA' = Bsev.sev_expand sevA
	and sevB' = Bsev.sev_expand sevB in
	let sevAB = Bsev.sev_union sevA' sevB' |> Bsev.sev_reduce
	and sevBA = Bsev.sev_union sevB' sevA' |> Bsev.sev_reduce in
	if not(sevAB = sevBA)
	then
	(
		print_newline();
		print_string "sevA:";
		print_newline();
		print_sev sevA;
		print_newline();
		print_string "sevB:";
		print_newline();
		print_sev sevB;
		print_newline();
		print_string "sevAB:";
		print_newline();
		print_sev sevAB;
		print_newline();
		print_string "sevBA:";
		print_newline();
		print_sev sevBA;
		print_newline();
		assert(false);
	)
			) g2;;

print_string "TEST 2.1 : A = A U A"; print_newline();;
Iter.iter	(fun sevA ->
	let sevA' = Bsev.sev_expand sevA in
	let sevAA = Bsev.sev_union sevA' sevA' |> Bsev.sev_reduce in
	if not(sevA = sevAA)
	then
	(
		print_newline();
		print_string "sevA:";
		print_newline();
		print_sev sevA;
		print_newline();
		print_string "sevAA:";
		print_newline();
		print_sev sevAA;
		print_newline();
		assert(false);
	)
			) g;;


print_string "TEST 2.2 : (A U B) U C = A U (B U C)"; print_newline();;
Iter.iter	(fun ((sevA, sevB), sevC) ->
	let sevA' = Bsev.sev_expand sevA
	and sevB' = Bsev.sev_expand sevB
	and sevC' = Bsev.sev_expand sevC in
	let (+) = Bsev.sev_union in
	let sev1 = (sevA' + sevB') + sevC' |> Bsev.sev_reduce
	and sev2 = sevA' + (sevB' + sevC') |> Bsev.sev_reduce in
	if not(sev1 = sev2)
	then
	(
		print_newline();
		print_string "sevA:";
		print_newline();
		print_sev sevA;
		print_newline();
		print_string "sevB:";
		print_newline();
		print_sev sevB;
		print_newline();
		print_string "sev1 = (A+B)+C :";
		print_newline();
		print_sev sev1;
		print_newline();
		print_string "sev2 = A+(B+C) :";
		print_newline();
		print_sev sev2;
		print_newline();
		assert(false);
	)
			) g3;;

let gnni = n $< gen_riuniq;;
let gnni2 = n $< (fun n -> let g = gen_riuniq n in (g$*g));;

print_string "TEST 3 : NniGops.strdump_edge [terminate]"; print_newline();;
Iter.iter (fun nni -> ignore(NniGops.strdump_edge nni)) gnni;;


let print_nni nni =
	try
		print_string(NniGops.strdump_edge nni);
	with _ -> print_string "PRINTING FAILURE";
	print_newline();;


print_string "TEST 3.1 : NniGops.uniq_check"; print_newline();;
Iter.iter (fun nni -> assert(NniGops.edge_check nni);) gnni;;

print_string "TEST 3.2 : nni = binload(bindump(nni))"; print_newline();;
Iter.iter NniGops.(fun nni ->
	let nni' = bindump_edge nni in
	let nni'' = binload_edge nni' in
	if nni <> nni''
	then
	(
		print_string "nni:"; print_newline();
		print_nni nni;
		print_newline();
		print_string "nni' = bindump(nni):"; print_newline();
		print_string (Bitv.L.to_string nni');
		print_newline();
		print_string "nni'' = binload(nni'):"; print_newline();
		print_nni nni'';
		print_newline();
		assert false;
	);) gnni;;

print_string "TEST 4 : NniGops.solve_*_* [terminate]"; print_newline();;
Iter.iter NniGops.(fun (nniA, nniB) ->
	ignore(solve_cons_1 nniA nniB);
	ignore(solve_and_1	nniA nniB);
	ignore(solve_xor_1	nniA nniB);
	ignore(solve_cons_0 nniA nniB);)
		gnni2;;

print_string "TEST 5 : NniGops.compose [terminate]"; print_newline();;
Iter.iter NniGops.(fun (nniA, nniB) ->
	ignore(NniGops.compose nniA (nniB, ()));)
		(n $< gen_riuniq_comp);;

print_string "TEST 5.1 : A o (B o C) = (A o B) o C"; print_newline();;
Iter.iter NniGops.(fun (nniA, nniB, nniC) ->
	let ( * ) x y = let z, () = NniGops.compose x (y, ()) in z in
	let ab = nniA * nniB
	and bc = nniB * nniC in
	let abc1 = ab * nniC
	and abc2 = nniA * bc in
	if not(abc1 = abc2)
	then
	(
		print_newline();
		print_string "nniA:";
		print_newline();
		print_nni nniA;
		print_newline();
		print_string "nniB:";
		print_newline();
		print_nni nniB;
		print_newline();
		print_string "nniC:";
		print_newline();
		print_nni nniC;
		print_newline();
		print_string "ab = A o B :";
		print_newline();
		print_nni ab;
		print_newline();
		print_string "abc1 = (A o B) o C :";
		print_newline();
		print_nni abc1;
		print_newline();
		print_string "bc = B o C :";
		print_newline();
		print_nni abc2;
		print_newline();
		print_string "abc2 = A o (B o C) :";
		print_newline();
		print_nni abc2;
		print_newline();
		assert(false);
	);)
		(n $< gen_riuniq_comp_comp);;
