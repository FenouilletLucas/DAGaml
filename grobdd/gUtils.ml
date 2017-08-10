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

