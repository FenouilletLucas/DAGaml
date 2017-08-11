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
