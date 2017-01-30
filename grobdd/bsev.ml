type vec = bool list
type sev = vec option list

let vec_add = List.map2 (fun x y -> x <> y)

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
	| x::head -> if x
		then vec_add vec head
		else head
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

let sev_union =
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
	in fun sevX sevY -> aux [] [] (List.combine sevX sevY)

let sev_inter =
	let postmain n =
		let rec aux0 carry = function
			| []		-> (List.rev carry)@(MyList.ntimes None (n-(List.length carry)))
			| [[]::_]	-> List.rev carry
			| state		->
				let state, opdiv = vec_set_divisor state in
				aux (opdiv::carry) state
		in aux0 []
	in
	let state_add (xX, (yX, y'X)) (xY, (yY, y'Y)) =
		(vec_add xX xY, (vec_add yX yY, vec_add y'X y'Y))
	in
	let state_pull = function
		| (x::xX, (y::yX, y'X)) ->
			x, (xX, (yX, y::y'X))
		| _ -> assert false
	in
	let state_end = function
		| ([], ([], vect)) -> List.rev vect
		| _ -> assert false
	in
	let state_divide vec = List.map (function
		| head::tail ->
			let x, head = state_pull in if x
			then state_add vec head
			else head
		| [] -> assert false) vec
	in
	let state_divisor =
		let rec aux carry = function
			| [] -> List.rev carry, None
			| head::tail ->
				let x, head = state_pull in if x
				then ((List.rev carry)@(vec_divide_sym head tail)), Some head
				else aux (head::carry) tail
		in aux []
	in
	let main sevXY =
		let n = List.length sevXY in
		let state_of_vect_L vec =
			let i = List.length vec in
			(vec, (vec, true::(MyList.ntimes false (n-(i+1)))))
		and state_of_vect_R vec =
			let i = List.length vect in
			(vec, (MyList.ntimes false i , MyList.ntimes false (n-i)))
		and state_of_vect_LR vecL vecR =
			let i = List.length vect in
			(vec_add vecL vecR, (vecL, true::(MyList.ntimes false (n-(i+1)))))
		in
		let rec aux state = function
			| [] -> (match state with
				| []	-> MyList.ntimes None n
				| state	-> postmain n (List.map state_end state))
			| head::tail -> let state = (match head with
				| None, None ->
					let state, _ = state_divisor state in
					state
				| Some vec, None ->
					state_divide (state_of_vect_L vec) state in
				| None, Some vec ->
					state_divide (state_of_vect_R vec) state in
				| Some vecL, Some vecR ->
					let vecR  = state_of_vect_L  vecR
					and vecLR = state_of_vect_LR vecL vecR in
					(vecLR::(state_divide vecR state))
				)
				in aux state tail
		in aux [] (List.combine sevX sevY)
	in
	let premain =
		let rec preaux i = function
			| [] -> MyList.ntimes
			| head::tail -> match head with
				| Some x, Some y -> (MyList.ntimes None i)@(main (head::tail))
				| _ -> aux (i+1) tail
		in fun sevX sevY -> preaux 0 (List.combine sevX sevY)
	in
	premain

let sev_make_norm n m =
	let x = MyList.ntimes false n in
	let y = x@(true::x)@[true] in
	MyList.init m (fun i ->
		let z = y@(MyList.ntimes false (n-(i+1))) in
		assert(List.length z + i + 1 = 3 * n);
		Some z)

let sev_make_norm_cons n =
	let z = sev_make_norm (n+1) (n+1) in
	let z = z@(MyList.ntimes None (2*(n+1))) in
	assert(List.length z = 3*(n+1));
	z

let sev_make_norm_and n =
	let z = sev_make_norm (n+1) n in
	let z = z@(MyList.ntimes None (2*(n+1)+1)) in
	assert(List.length z = 3*(n+1));
	z

let sev_make_norm_xor n =
	let z = sev_make_norm (n+1) n in
	let nf = MyList.ntimes false n in
	let nf1 = nf@[true] in
	let nn = MyList.ntimes None n in
	let z = z@((Some (nf@(false::nf1)))::nn)@((Some nf1)::(nn@[None])) in
	assert(List.length z = 3*(n+1));
	z

let sev_cat_special sevX sevY =
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
	sevX@(None::@sevY)@(MyList.ntimes None (n+2)) in


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
			| Some vect	-> (false::(vec_add vect carry))) tail
	in fun sev vec -> aux [] (List.rev(List.combine sev vec))

let sev_reduce_cons n (sevX, vecX) (sevY, vecY) =
	let sevA = sev_cat_special sevX sevY in
	let sevB = sev_make_norm_cons n in
	let sev = sev_union sevA sevB in
	let vec = vecX@vecY@(MyList.ntimes false (n+1) in
	let vec = sev_vec_divide sev vec in
	sev, vec_extract_cons vec

let sev_reduce_and n (sevX, vecX) (sevY, vecY) =
	let sevA = sev_cat_special sevX sevY in
	let sevB = sev_make_norm_and n in
	let sev = sev_union sevA sevB in
	let vec = vecX@vecY@(MyList.ntimes false (n+1) in
	let vec = sev_vec_divide sev vec in
	sev, vec_extract_and vec

let sev_reduce_xor n (sevX, vecX) (sevY, vecY) =
	let sevA = sev_cat_special sevX sevY in
	let sevB = sev_make_norm_xor n in
	let sev = sev_union sevA sevB in
	let vec = vecX@vecY@(MyList.ntimes false (n+1) in
	let vec = sev_vec_divide sev vec in
	sev, vec_extract_xor vec



let sev_vec_reduce =
	let rec aux carry = function
		| [] -> carry
		| (opv, x)::tail -> aux (match opv with
			| None		-> (x::carry)
			| Some vect	-> (vec_add vect carry)) tail
	in fun sev vec -> aux [] (List.rev(List.combine sev vec))
