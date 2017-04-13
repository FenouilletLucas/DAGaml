let option dump opx stream = match opx with
	| None -> false::stream
	| Some x -> true::(dump x stream)

let bool x stream = x :: stream
let bool_list x stream = x @ stream

let bitv x stream = bool_list (Bitv.L.to_bool_list x) stream


let sized_list dump =
	let rec aux stream = function
		| []			-> stream
		| head::tail	-> aux (dump head stream) tail
	in aux

let none_list dump liste stream =
	let rec aux stream = function
		| []			-> stream
		| head::tail	-> aux (dump (Some head) stream) tail

	in aux (dump None stream) liste

let int n stream =
	assert(n>=0);
	let rec aux c0 c1 = function
		| 0 -> c0@[true]@c1@stream
		| n -> aux (false::c0) ((n mod 2 = 1)::c1) (n/2)
	in aux [] [] n
