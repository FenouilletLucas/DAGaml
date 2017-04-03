(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open CpTypes

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
let bool_of_pm_char = function
	| '+' -> true
	| '-' -> false
	| _ -> assert false

let bindump_ttag carry = function
	| TAnd (b0, b1) -> false::b0   ::b1   ::carry
	| TCons b		-> true ::false::b    ::carry
	| TXor			-> true ::true ::carry

let binload_ttag = function
	| false::b0   ::b1   ::carry -> (TAnd (b0, b1)), carry
	| true ::false::b    ::carry -> (TCons b      ), carry
	| true ::true ::carry        -> (TXor         ), carry
	| _ -> assert false


let strdump_ttag carry = function
	| TAnd (b0, b1) -> "A"::(pm_of_bool b0)::(pm_of_bool b1)::carry
	| TCons b		-> "C"::(pm_of_bool b)::carry
	| TXor			-> "X"::carry

let binload_ttag = function
	| "A"::b0::b1::carry -> (TAnd (bool_of_pm b0, bool_of_pm b1), carry)
	| "C"::b::carry -> (TCons (bool_of_pm b), carry)
	| "X"::carry -> (TXor, carry)
	| _ -> assert false
	
