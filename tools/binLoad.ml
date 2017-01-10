let choice loadF loadT = function
	| b::stream -> (if b then loadT else loadF) stream
	| _			-> assert false

let option load = choice
	(fun stream -> None, stream)
	(fun stream ->
		let x, stream = load stream in
		Some x, stream)

let bitv size stream =
	let x, stream = MyList.hdtl_nth size stream in
	(Bitv.L.of_bool_list x), stream

let while_list func init =
	let rec aux carry state stream =
		let op_elem_op_state, stream = func stream in
		match op_elem_op_state with
			| None -> (List.rev carry), stream
			| Some (elem, op_state) -> match op_state with
				| None -> (List.rev (elem::carry)), stream
				| Some state -> aux (elem::carry) state stream
	in aux [] init

let sized_list load size next = 
	let rec aux size =
		let next = if size = 1 then next else aux (size-1) in
		fun carry -> load (fun x -> next (x::carry))
	in
	assert(size >= 0);
	if size = 0
	then next []
	else aux size []

let list load =
	let rec aux carry = function
		| false::stream	-> carry, stream
		| true::stream	->
			let elem, stream = load stream in
			aux (elem::carry) stream
		| _				-> assert false
	in aux []

let bool = function
	| b::stream -> b, stream
	| _			-> assert false
