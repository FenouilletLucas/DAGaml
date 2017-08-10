(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

type invar = bool * (Bitv.t option)

type uniq_elem =
	| S of bool
	| P of invar

type pair_elem =
	| SS of bool
	| SP of invar
	| PS of invar
	| PP of invar * invar

type uniq = uniq_elem list
type pair = pair_elem list

type edge_state = bool * uniq
type node_state = bool * pair
type node_and_state = bool * bool * pair
type node_xor_state =               pair
type tacx_state = TacxTypes.ttag * pair

type node_cstate = Bitv.t
type edge_cstate = Bitv.t
type tacx_cstate = Bitv.t

type 'a edge = edge_state * (unit, 'a) Utils.gnode
type 'a node = node_state * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
type 'a tacx = tacx_state * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode


type 'a cedge = edge_cstate * (unit, 'a) Utils.gnode
type 'a cnode = node_cstate * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
type 'a ctacx = tacx_cstate * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
