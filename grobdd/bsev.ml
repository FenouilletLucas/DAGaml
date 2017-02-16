type vec = bool list
type sev = vec option list

let vec_add = List.map2 (fun x y -> x <> y)

let vec_cadd = function
	| true -> vec_add
	| false -> fun x _ -> x

let sev_count_some : sev -> int = MyList.count (function None -> false | Some _ -> true)
let sev_count_none : sev -> int = MyList.count (function None -> true | Some _ -> false)

let check =
	let rec aux = function
		| [] -> true
		| head::tail -> (match head with
			| None -> true
			| Some vec -> List.length vec = List.length tail)&&(aux tail)
	in aux

let check_reduce = 
	let rec aux = function
		| [] -> true
		| head::tail -> (match head with
			| None -> true
			| Some vec -> List.length vec = sev_count_none tail)&&(aux tail)
	in aux

let vec_divide_asym small big =
	let n = List.length small in
	let m = List.length big in
	let head, tail = MyList.hdtl_nth (m-(n+1)) big in
	let x, tail = match tail with
		| [] -> assert false
		| x::tail -> x, tail in
	head@(if x then vec_add small tail else tail)

let vec_divide_sym vec = List.map (function
	| x::head -> vec_cadd x head vec
	| [] -> assert false)

let vec_set_divisor =
	let rec aux carry = function
		| [] -> List.rev carry, None
		| (x::head)::tail -> if x
			then ((List.rev carry)@(vec_divide_sym head tail)), Some head
			else aux (head::carry) tail
		| []::_ -> assert false
	in aux []

let vec_expand =
	let rec aux carry = function
		| ([], []) -> List.rev carry
		| (None::x', y::y') -> aux (y::carry) (x', y')
		| ((Some _)::x', y') -> aux (false::carry) (x', y')
		| _ -> assert false
	in fun vec tail -> aux [] (tail, vec)

let sev_reduce =
	let rec aux carry = function
		| [] -> carry
		| head::tail -> aux (head::carry) (match head with
			| None -> tail
			| Some vec -> List.map (function
				| None -> None
				| Some vec' -> Some(vec_divide_asym vec vec')) tail)
	in Extra.(List.rev >> (aux []))

let sev_expand =
	let rec aux carry = function
		| [] -> List.rev carry
		| head::tail -> aux ((match head with
			| None		-> None
			| Some vec	-> Some (vec_expand vec tail))::carry) tail
	in aux []

let sev_union = (* : expand -> expand -> expand *)
	let rec aux carry state = function
		| [] -> List.rev carry
		| head::tail -> match head with
			| None, None ->
				let state, opdiv = vec_set_divisor state in
				aux (opdiv::carry) state tail
			| Some vec, None
			| None, Some vec ->
				let state = vec_divide_sym vec state in
				aux ((Some vec)::carry) state tail
			| Some vec, Some vec' ->
				let state = (vec_add vec vec')::(vec_divide_sym vec state) in
				aux ((Some vec)::carry) state tail
	in fun sevX sevY ->
		assert(check sevX);
		assert(check sevY);
		aux [] [] (List.combine sevX sevY)

let sev_make_norm n m =
	let x = MyList.ntimes false n in
	assert(List.length x = n);
	let y = x@(true::x)@[true] in
	assert(List.length y = 2*(n+1));
	MyList.init m (fun i ->
		let z = y@(MyList.ntimes false (n-i)) in
		assert(List.length z + i + 1 = 3 * (n+1));
		Some z)

let sev_make_norm_cons n =
	let z = sev_make_norm n (n+1) in
	let z = z@(MyList.ntimes None (2*(n+1))) in
	assert(List.length z = 3*(n+1));
	z

let sev_make_norm_and n =
	let z = sev_make_norm n n in
	let z = z@(MyList.ntimes None (2*(n+1)+1)) in
	assert(List.length z = 3*(n+1));
	z

let sev_make_norm_xor n =
	let z = sev_make_norm n n in
	let nf = MyList.ntimes false n in
	let nf1 = nf@[true] in
	let nn = MyList.ntimes None n in
	let z = z@((Some (nf@(false::nf1)))::nn)@((Some nf1)::(nn@[None])) in
	assert(List.length z = 3*(n+1));
	z

let sev_cat_special n sevX sevY =
	let x = MyList.ntimes false (2*(n+1)) in
	let sevX = List.map (function
		| None -> None
		| Some vect -> Some (vect@x)) sevX
	in
	let y = MyList.ntimes false (n+1) in
	let sevY = List.map (function
		| None -> None
		| Some vect -> Some (vect@y)) sevY
	in
	let z = sevX@sevY@(MyList.ntimes None (n+1)) in
	assert(List.length z = 3*(n+1));
	z


let vec_extract_cons n vect =
	let _, vect = MyList.hdtl_nth (n+1) vect in
	let vY, vect = MyList.hdtl_nth n vect in
	let bY, vect = MyList.hdtl vect in
	let vXY, vect = MyList.hdtl_nth n vect in
	let bXY, vect = MyList.hdtl vect in
	assert(List.length vect = 0);
	((bY, vY), (bXY, vXY))

let vec_extract_and n vect =
	let _, vect = MyList.hdtl_nth n vect in
	let bX, vect = MyList.hdtl vect in
	let vY, vect = MyList.hdtl_nth n vect in
	let bY, vect = MyList.hdtl vect in
	let vXY, vect = MyList.hdtl_nth n vect in
	let bXY, vect = MyList.hdtl vect in
	assert(List.length vect = 0);
	(bX, (bY, vY), (bXY, vXY))

let vec_extract_xor n vect =
	let _, vect = MyList.hdtl_nth (n+1) vect in
	let vY, vect = MyList.hdtl_nth n vect in
	let _, vect = MyList.hdtl vect in
	let vXY, vect = MyList.hdtl_nth n vect in
	let bXY, vect = MyList.hdtl vect in
	assert(List.length vect = 0);
	(vY, (bXY, vXY))

let sev_vec_divide =
	let rec aux carry = function
		| [] -> carry
		| (opv, x)::tail -> aux (match opv with
			| None		-> (x::carry)
			| Some vect	-> (false::(vec_cadd x carry vect))) tail
	in fun sev vec -> aux [] (List.rev(List.combine sev vec))

let sev_diff sev minus =
	assert(check sev);
	let sevm = MyList.opmap2 (fun s -> function
		| None -> Some s
		| Some _ -> match s with
			| Some _ -> None
			| None -> assert false) (sev_reduce sev) minus |> sev_expand in
	assert(check sevm);
	sevm

let sev_vec_reduce =
	let rec aux carry = function
		| [] -> carry
		| (opv, x)::tail -> aux (match opv with
			| None		-> (x::carry)
			| Some vect	-> vec_cadd x carry vect) tail
	in fun sev vec -> aux [] (List.rev(List.combine sev vec))

let sev_vec_shrink =
	let rec aux carry = function
		| [] -> carry
		| (opv, x)::tail -> aux (match opv with
			| None		-> (x::carry)
			| Some _	-> assert(not x); carry) tail
	in fun sev vec -> aux [] (List.rev(List.combine sev vec))

let sev_union_meta sev_make_norm_meta n sevX sevY =
	assert(check sevX);
	assert(check sevY);
	assert(List.length sevX = n+1);
	assert(List.length sevY = n+1);
	let sevA = sev_cat_special n sevX sevY in
	assert(List.length sevA = 3*(n+1));
	assert(check sevA);
	let sevB = sev_make_norm_meta n in
	assert(List.length sevB = 3*(n+1));
	assert(check sevB);
	sev_union sevA sevB

let sev_vec_shrink sev (sevX, vecX) =
	assert(List.length sevX = List.length vecX);
	assert(List.length sev  = List.length vecX);
	(sev_diff sevX sev, sev_vec_shrink sev vecX)

let sev_inter_meta	sev_make_norm_meta vec_extract_meta (sevX, vecX) (sevY, vecY) =
	assert(check sevX);
	assert(check sevY);
	let n = List.length sevX - 1 in
	assert(n>=0);
	assert(List.length vecX = n+1);
	assert(List.length sevY = n+1);
	assert(List.length vecY = n+1);
	let sev = sev_union_meta sev_make_norm_meta n sevX sevY in
	let _, inter = MyList.hdtl_nth (2*(n+1)) sev in
	let sevX, vecX = sev_vec_shrink inter (sevX, vecX)
	and sevY, vecY = sev_vec_shrink inter (sevY, vecY) in
	assert(check sevX);
	assert(check sevY);
	let n = List.length sevX - 1 in
	assert(n>=0);
	assert(List.length sevY = n+1);
	assert(List.length vecX = n+1);
	assert(List.length vecY = n+1);
	let f = sevX > sevY in
	print_string "f3: "; StrUtil.print_bool f; print_newline(); flush stdout;
	let (sevX, vecX), (sevY, vecY) = Tools.cswap f ((sevX, vecX), (sevY, vecY)) in
	assert(check sevX);
	assert(check sevY);
	let sev = sev_union_meta sev_make_norm_meta n sevX sevY in
	let vec = vecX@vecY@(MyList.ntimes false (n+1)) in
	let vec = sev_vec_divide sev vec in
	f, sev_reduce inter, vec_extract_meta n vec
	

let sev_inter_cons =
	sev_inter_meta sev_make_norm_cons vec_extract_cons

let sev_inter_and =
	sev_inter_meta sev_make_norm_and vec_extract_and

let sev_inter_xor =
	sev_inter_meta sev_make_norm_xor vec_extract_xor

