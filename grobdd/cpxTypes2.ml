(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

type elem =
	| S (* significant variable *)
	| P (* useless variable *)
	| X of (bool * int) (* if x then (i [2] XOR shift XOR neg) else ... *)

type spx_tag = {hasS : bool; hasP : bool; maxX : int option}

type block_choice =
	| C0
	| Id  of int
	| SPX of (bool * spx_tag * (elem list))

type block = {
	neg		: bool;
	arity	: int;
	block	: block_choice;
}

type block2 = block * block

type op_tag = CpTypes.op_tag
type ttag   = CpTypes.ttag

type edge_state = block
type node_state = block2
type node_and_state = block2
type node_xor_state = block2
type tacx_state = op_tag * block2

type node_cstate = Bitv.t
type edge_cstate = Bitv.t
type tacx_cstate = Bitv.t

type 'a edge = edge_state * (unit, 'a) Utils.gnode
type 'a node = node_state * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
type 'a tacx = tacx_state * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode


type 'a cedge = edge_cstate * (unit, 'a) Utils.gnode
type 'a cnode = node_cstate * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
type 'a ctacx = tacx_cstate * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
