(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

let mp_of_bool = function
	| true	-> "-"
	| false	-> "+"
let mp_char_of_bool = function
	| true	-> '-'
	| false -> '+'
let pm_of_bool = function
	| true	-> "+"
	| false	-> "-"
let pm_char_of_bool = function
	| true	-> '+'
	| false -> '-'
let bool_of_pm = function
	| "+" -> true
	| "-" -> false
	| _ -> assert false
let bool_of_mp = function
	| "+" -> false
	| "-" -> true
	| _ -> assert false
let bool_of_pm_char = function
	| '+' -> true
	| '-' -> false
	| _ -> assert false
let bool_of_mp_char = function
	| '+' -> false
	| '-' -> true
	| _ -> assert false

let consensus0 f x y =
	let xy, xy' = List.split(List.map f (List.combine x y)) in
	xy, MyList.list_of_oplist xy'

let consensus f x y =
	let xy, xy' = List.split(List.map f (List.combine x y)) in
	xy, List.split(MyList.list_of_oplist xy')

let consensus2 f x y =
	let xy, xy' = List.split(List.map f (List.combine x y)) in
	let x', y' = List.split xy' in
	xy, (MyList.unop x'), (MyList.unop y')

let consensus3 f x y =
	let x', y' = List.split(List.map f (List.combine x y)) in
	(MyList.unop x', MyList.unop y')

let compose s lC lc =
	let rec aux carry = function
		| [] -> (function
			| [] -> []
			| _ -> assert false
		)
		| x::x' -> if x = s
			then (function
				| []     -> assert false
				| y::y'  -> aux (y::carry) x' y'
			)
			else (fun y' -> aux (x::carry) x' y')
	in aux [] lC lc

type peval = bool option list

let compose_peval : peval -> peval -> peval = fun pevalC pevalc -> compose None pevalc pevalC

let compose_opeval opevalC opevalc = match (opevalC, opevalc) with
	| Some pevalC, Some pevalc -> Some(compose_peval pevalC pevalc)
	| Some peval, None
	| None, Some peval -> Some peval
	| None, None -> None
	

