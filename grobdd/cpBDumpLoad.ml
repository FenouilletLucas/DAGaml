(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

open CpTypes
open Extra

let strdump_uniq_elem = function
	| P -> "U"
	| S -> "S"

let strload_uniq_elem = function
	| 'U' -> P
	| 'S' -> S
	| _   -> assert false

let bindump_uniq_elem elem stream = match elem with
	| P -> false::stream
	| S -> true ::stream

let binload_uniq_elem = function
	| false::stream -> P, stream
	| true ::stream -> S, stream
	| _ -> assert false


let strdump_uniq = List.map strdump_uniq_elem
let strload_uniq = List.map strload_uniq_elem

let bindump_uniq = BinDump.list bindump_uniq_elem
let binload_uniq = BinLoad.list binload_uniq_elem

let bindump_pair_elem elem stream = match elem with
	| SP -> false::false::stream
	| PS -> false::true ::stream
	| SS -> true ::stream

let binload_pair_elem = function
	| false::false::stream -> SP, stream
	| false::true ::stream -> PS, stream
	| true ::stream        -> SS, stream
	| _ -> assert false

let merge_pair uniqX uniqY = List.map2 (fun x y -> match x, y with
	| P, P -> assert false
	| S, P -> SP
	| P, S -> PS
	| S, S -> SS) uniqX uniqY

let bindump_pair : CpTypes.pair BinUtils.dump = BinDump.list bindump_pair_elem
let binload_pair : CpTypes.pair BinUtils.load = BinLoad.list binload_pair_elem

let bindump_edge : CpTypes.edge_state BinUtils.dump =
	BinDump.pair BinDump.bool bindump_uniq
let binload_edge : CpTypes.edge_state BinUtils.load =
	BinLoad.pair BinLoad.bool binload_uniq

let bindump_node : _ BinUtils.dump =
	BinDump.trio BinDump.unit bindump_edge bindump_edge
let binload_node : _ BinUtils.load = 
	BinLoad.trio BinLoad.unit binload_edge binload_edge

let bindump_tacx = BinDump.trio TacxTypes.bindump_tag bindump_edge bindump_edge
let binload_tacx = BinLoad.trio TacxTypes.binload_tag binload_edge binload_edge
