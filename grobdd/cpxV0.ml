(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

let strdump_node = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_node = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> CpxV0DumpLoad.binload_node >> CpxV0Utils.block_split)

let strdump_tacx = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_tacx = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> CpxV0DumpLoad.binload_tacx >> CpxV0Utils.tacx_split)

let strdump_edge = Extra.(CpxV0DumpLoad.bindump_edge >> Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_edge = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> CpxV0DumpLoad.binload_edge)

let dot_of_edge_aux color block =
	"[label = \""^(CpxV0DumpLoad.block_to_pretty block)^"\"; color=\""^color^"\"];"

let dot_of_edge = dot_of_edge_aux "black"

let dot_of_node node =
	let e0, e1 = node |> CpxV0DumpLoad.binload_node |> CpxV0Utils.block_split in
	"", (dot_of_edge_aux "red" e0), (dot_of_edge_aux "green" e1)

let default_leaf = CpxV0Types.({neg = false; shift = false; sub = []}, Utils.Leaf ())

let strdump_leaf = (fun () -> Tree.Node [])
let strload_leaf = (function Tree.Node [] -> default_leaf | _ -> assert false)

module GroBdd_M : Subdag.MODELE with
		type node = CpxV0Types.node_cstate
	and	type edge = CpxV0Types.edge_state
	and type leaf = unit
=
struct
	
	type node = CpxV0Types.node_cstate
	type edge = CpxV0Types.edge_state
	type leaf = unit

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push : ('t -> 'i) -> 't e -> 't e -> ('t e, edge * 't n) Utils.merge = CpxV0Gops.node_push_cons
	let pull : ('t -> 'i) -> 't e -> ('t e * 't e, 't n -> ('t e * 't e)) Utils.merge = fun gid edge -> match CpxV0Gops.node_pull gid edge with
		| Utils.MEdge e -> Utils.MEdge e
		| Utils.MNode f -> Utils.MNode (fun (node, i1, i2) -> f (CpxV0DumpLoad.binload_node node, i1, i2))
	let compose = CpxV0Utils.compose
	
	let pull_node _ (n, i0, i1) = CpxV0Utils.node_split (CpxV0DumpLoad.binload_node n, i0, i1)
	
	let dump_node   = Some strdump_node
	let load_node   = Some strload_node
	let dot_of_node = Some dot_of_node
	
	let dump_edge   = Some strdump_edge
	let load_edge   = Some strload_edge
	let dot_of_edge = Some dot_of_edge

	let dump_leaf   = Some strdump_leaf
	let load_leaf   = Some strload_leaf
	let dot_of_leaf = Some (function () -> "[label = \"0\"];")
end

module GroBdd =
struct
	include Subdag.MODULE(GroBdd_M)
	let dumpfile man edges target =
		let strman = Udag.StrTree.newman() in
		let stredges = dump man strman edges in
		Udag.StrTree.dumpfile strman stredges target;
		strman
	
	let loadfile target =
		let strman, stredges = Udag.StrTree.loadfile target in
		let man = newman () in
		let edges = load man strman stredges in
		man, edges
end

let newman = GroBdd.newman

let make_const b n = GroBdd.push_leaf CpxV0Types.{neg = b; shift = false; sub = MyList.ntimes P n } ();;

let make_ident man b n = GroBdd.push man (make_const b n) (make_const (not b) n);;

let arity block = CpxV0Types.(List.length block.sub)

let push_pass = CpxV0Utils.push_P

let no = CpxV0Utils.neg

let is_root = CpxV0Utils.node_is_const

let get_root = CpxV0Utils.get_root

let (=??) (ex, ix) (ey, iy) = match ix, iy with
	| Utils.Leaf (), Utils.Leaf () -> ex = ey
	| Utils.Node nx, Utils.Node ny -> (nx == ny) && (ex = ey)
	| _ -> false

module AND_M : GroBdd.MODELE_IBOP =
struct
	type t = Bitv.t
	let compare = Pervasives.compare
	type transform = CpxV0Types.edge_state
	let compose = CpxV0Utils.compose
	let decomp x y c = (CpxV0DumpLoad.binload_node c, x, y) |> CpxV0Utils.node_split
	let solver = CpxV0Gops.node_push_and
end;;

module XOR_M : GroBdd.MODELE_IBOP =
struct
	type t = Bitv.t
	let compare = Pervasives.compare
	type transform = CpxV0Types.edge_state
	let compose = CpxV0Utils.compose
	let decomp x y c = (CpxV0DumpLoad.binload_node c, x, y) |> CpxV0Utils.node_split
	let solver = CpxV0Gops.node_push_xor
end;;

module AND = GroBdd.IBOP(AND_M);;
module XOR = GroBdd.IBOP(XOR_M);;


module TACX_M : TaggedSubdag.MODELE with
		type node = CpxV0Types.tacx_cstate
	and	type edge = CpxV0Types.edge_state
	and type leaf = unit
	and type tag  = CpTypes.op_tag
=
struct
	
	type node = CpxV0Types.tacx_cstate
	type edge = CpxV0Types.edge_state
	type leaf = unit
	type tag  = CpTypes.op_tag

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push = CpxV0Gops.tacx_push
	let pull = CpxV0Gops.tacx_pull
	let compose _ = CpxV0Utils.compose
	
	let pull_node = CpxV0Gops.tacx_pull_node
	
	let dump_node   = Some strdump_tacx
	let load_node   = Some strload_tacx
	let dot_of_node = None
	
	let dump_edge   = Some strdump_edge
	let load_edge   = Some strload_edge
	let dot_of_edge = Some dot_of_edge

	let dump_leaf   = Some strdump_leaf
	let load_leaf   = Some strload_leaf
	let dot_of_leaf = Some (fun () -> "0")

	let dot_of_tag = Some Extra.(CpTypes.(function And -> "A" | Cons -> "C" | Xor -> "X") >> (fun x -> "[label = \""^x^"\"];"))
end

module TACX =
struct
	include TaggedSubdag.MODULE(TACX_M)
	let dumpfile man edges target =
		let strman = Udag.StrTree.newman() in
		let stredges = dump man strman edges in
		Udag.StrTree.dumpfile strman stredges target
	
	let loadfile target =
		let strman, stredges = Udag.StrTree.loadfile target in
		let man = newman () in
		let edges = load man strman stredges in
		man, edges
end

let ( *! ) man x y = TACX.push man CpTypes.Cons x y
let ( &! ) man x y = TACX.push man CpTypes.And x y
and ( ^! ) man x y = TACX.push man CpTypes.Xor x y

module EVAL =
struct
	module EVAL_VISITOR =
	struct
		type xnode = GroBdd.edge
		type xedge = GroBdd.edge
		type cons = xedge -> xedge -> xedge
		type extra = cons * cons * cons (* (a, c, x) *)

		let do_leaf _ () = default_leaf
		let do_node (a, c, x) = Extra.(CpxV0DumpLoad.binload_tacx >> CpxV0Utils.tacx_split >> (fun (tag, edgeX, edgeY) ->
			let merge = NniTypes.(match tag with CpTypes.And -> a | CpTypes.Cons -> c | CpTypes.Xor -> x) in
			Utils.MNode (fun nodeX nodeY -> merge (CpxV0Utils.compose edgeX nodeX) (CpxV0Utils.compose edgeY nodeY))))
		let do_edge _ = CpxV0Utils.compose
	end

	module EVAL = TACX.NODE_VISITOR(EVAL_VISITOR)

	type manager = {
		grobdd : GroBdd.manager;
		andman : AND.manager;
		xorman : XOR.manager;
		theman : EVAL.manager;
		calc   : TACX.edge -> GroBdd.edge
	}

	let newman tacx man =
		let c = GroBdd.push man in
		let aman, a = AND.newman man
		and xman, x = XOR.newman man in
		let theman, calc = EVAL.newman tacx (a, c, x) in
		{
			grobdd = man;
			andman = aman;
			xorman = xman;
			theman = theman;
			calc = calc
		}, List.map calc
	
	let dump_stat man = Tree.Node [
(*		Tree.Node [Tree.Leaf "grobdd:"; GroBdd.dump_stat man.grobdd]; *)
		Tree.Node [Tree.Leaf "andman:"; AND.dump_stat man.andman];
		Tree.Node [Tree.Leaf "xorman:"; XOR.dump_stat man.xorman];
		Tree.Node [Tree.Leaf "theman:"; EVAL.dump_stat man.theman];
	]


end

module PURE_OF_TACX =
struct
	module VISITOR =
	struct
		type xnode = GroBdd.edge
		type xedge = GroBdd.edge
		type cons = xedge -> xedge -> xedge
		type extra = cons * cons * cons (* (a, c, x) *)

		let do_leaf _ () = default_leaf
		let do_node (a, c, x) = Extra.(CpxV0DumpLoad.binload_tacx >> CpxV0Utils.tacx_split >> (fun (tag, edgeX, edgeY) ->
			let merge = CpTypes.(match tag with And -> a | Cons -> c | Xor -> x) in
			Utils.MNode (fun nodeX nodeY -> merge (CpxV0Utils.compose edgeX nodeX) (CpxV0Utils.compose edgeY nodeY))))
		let do_edge _ = CpxV0Utils.compose
	end

	module EVAL = TACX.NODE_VISITOR(VISITOR)

	type manager = {
		grobdd : GroBdd.manager;
		andman : AND.manager;
		xorman : XOR.manager;
		theman : EVAL.manager;
		calc   : TACX.edge -> GroBdd.edge
	}

	let newman tacx man =
		let c = GroBdd.push man in
		let aman, a = AND.newman man
		and xman, x = XOR.newman man in
		let theman, calc = EVAL.newman tacx (a, c, x) in
		{
			grobdd = man;
			andman = aman;
			xorman = xman;
			theman = theman;
			calc = calc
		}, List.map calc
	
	let dump_stat man = Tree.Node [
(*		Tree.Node [Tree.Leaf "grobdd:"; GroBdd.dump_stat man.grobdd]; *)
		Tree.Node [Tree.Leaf "andman:"; AND.dump_stat man.andman];
		Tree.Node [Tree.Leaf "xorman:"; XOR.dump_stat man.xorman];
		Tree.Node [Tree.Leaf "theman:"; EVAL.dump_stat man.theman];
	]


end

module TACX_OF_CP =
struct
	module EVAL_VISITOR =
	struct
		type xnode = TACX.edge
		type xedge = TACX.edge
		type cons = xedge -> xedge -> xedge
		type extra = TACX.manager

		let do_leaf _ () = default_leaf
		let mu_cpx_of_cp = function
			| CpTypes.S -> CpxV0Types.S
			| CpTypes.P -> CpxV0Types.P
		let cpx_of_cp (b, u) = CpxV0Types.{neg = b; shift = false; sub = List.map mu_cpx_of_cp u}
		let do_node extra = Extra.(CpGops.binload_tacx >> CpGops.tacx_split >> (fun (tag, edgeX, edgeY) ->
			let edgeX = cpx_of_cp edgeX
			and edgeY = cpx_of_cp edgeY in
			let result = Utils.MNode CpxV0Gops.(fun nodeX nodeY ->
				TACX.push extra tag (CpxV0Utils.compose edgeX nodeX) (CpxV0Utils.compose edgeY nodeY)) in
			(result : (xnode, xnode -> xnode -> xnode) Utils.merge)))

		let do_edge _ e = CpxV0Utils.compose (cpx_of_cp e)
	end

	module EVAL = Cp.TACX.NODE_VISITOR(EVAL_VISITOR)

	type manager = {
		man_cp : Cp.TACX.manager;
		mannni : TACX.manager;
		theman : EVAL.manager;
		calc   : Cp.TACX.edge -> TACX.edge
	}

	let newman tacx_cp tacx_nni =
		let theman, calc = EVAL.newman tacx_cp tacx_nni in
		{
			man_cp = tacx_cp;
			mannni = tacx_nni;
			theman = theman;
			calc   = calc;
		}, List.map calc
	
	let dump_stat man = Tree.Node [
(*		Tree.Node [Tree.Leaf "grobdd:"; GroBdd.dump_stat man.grobdd]; *)
(*		Tree.Node [Tree.Leaf "man_cp:"; Cp.TACX.dump_stat man.man_cp]; *)
(*		Tree.Node [Tree.Leaf "mannni:"; TACX.dump_stat man.mannni]; *)
		Tree.Node [Tree.Leaf "theman:"; EVAL.dump_stat man.theman];
	]


end

module CntSat =
struct
	module CntSat_VISITOR =
	struct
		type xnode = BigInt.big_int * BigInt.big_int
		type xedge = BigInt.big_int
		type extra = unit

		let cswap b (x, y) = if b then (y, x) else (x, y)
		let add (x, y) (x', y') = (BigInt.(+) x x', BigInt.(+) y y')
		let shift n (x, y) = (BigInt.shift_left x n, BigInt.shift_left y n)
		let p block = CpxV0Types.(MyList.count (function P -> true | _ -> false) block.sub)

		let do_leaf () () = (BigInt.zero, BigInt.unit)
		let x block =
			match CpxV0Utils.classify block |> snd with
			| None -> (BigInt.zero, BigInt.zero)
			| Some maxX ->
				let liste = MyList.init (maxX+1) CpxV0Types.(fun i -> List.fold_left (fun (lvl, under) -> function
					| S -> (lvl, under+1)
					| P -> (lvl, under)
					| X(_, j) -> if i = j then (lvl+1, under) else if i < j then (lvl, under+1) else (lvl, under)) (0, 0) block.sub) in
				let liste = List.map (fun (lvl, under) -> BigInt.(shift_left (pow2 lvl - unit) under)) liste in
				let rec aux0 (if0, if1) = function
					| [] -> (if0, if1)
					| [x0] -> BigInt.(if0 + x0, if1)
					| x0::x1::tail -> aux0 BigInt.(if0 + x0, if1 + x1) tail
				in
				CpxV0Types.(Tools.cswap (not block.shift) (aux0 BigInt.(zero, zero) liste))
		let do_node ()    = Extra.(CpxV0DumpLoad.binload_node >> CpxV0Utils.block_split >> CpxV0Types.(fun (blockX, blockY) ->
			let nX = p blockX in
			let x01 = x blockX in
			let nY = p blockY in
			let y01 = x blockY in
			Utils.MNode (fun x y -> add (shift nX (cswap blockX.neg (add x01 x))) (shift nY (cswap blockY.neg (add y01 y))))))
		let do_edge () block x01 =
			let x0, x1 = add x01 (x block) in
			BigInt.shift_left (if block.CpxV0Types.neg then x1 else x0) (p block)

	end

	module CntSat = GroBdd.NODE_VISITOR(CntSat_VISITOR)

	let newman man =
		CntSat.newman man ()
	
	let dump_stat = CntSat.dump_stat
	
end

module AllSat =
struct
	module AllSat_VISITOR =
	struct
		type xnode = (bool option list list) * (bool option list list)
		type xedge = (bool option list list)
		type extra = unit

		let cswap b (x, y) = if b then (y, x) else (x, y)
		let x block =
			let _, maxX = CpxV0Utils.classify block in
			match maxX with
			| None -> ([], [])
			| Some maxX ->
				let llist = MyList.init (maxX+1) CpxV0Types.(fun i ->
					let rec aux0 chain = function
						| [] -> List.rev chain
						| head::tail -> match head with
							| P -> aux0 (None::chain) tail
							| S -> aux0 (None::chain) tail
							| X(b, j) -> if j < i
								then aux0 ((Some(not b))::chain) tail
								else aux0 (None::chain) tail
					in
					let rec aux carry chain = function
					| [] -> List.rev carry
					| head::tail -> match head with
						| P -> aux carry (None::chain) tail
						| S -> aux carry (None::chain) tail
						| X(b, j) ->
							if i = j
							then aux ((aux0 ((Some b)::chain) tail)::carry) ((Some(not b))::chain) tail
							else if i < j
							then aux carry (None::chain) tail
							else aux carry ((Some(not b))::chain) tail
					in aux [] [] block.sub) in
				let rec aux (if0, if1) = function
					| [] -> (if0, if1)
					| [x] -> (if0@x, if1)
					| x::y::tail -> aux (if0@x, if1@y) tail
				in
				let if01 = aux ([], []) llist in
				Tools.cswap block.CpxV0Types.shift if01

		let compose =
			let rec aux carry = CpxV0Types.(function
			  | ([], [])			 -> List.rev carry
			  | (S      ::x', y::y') -> aux (y            ::carry) (x', y')
			  | (P      ::x', y'   ) -> aux (None		  ::carry) (x', y')
			  | (X(b, _)::x', y'   ) -> aux ((Some(not b))::carry) (x', y')
			  | _ -> assert false)
			in fun block elem -> aux [] (block.CpxV0Types.sub, elem)

		let map_compose block (liste0, liste1) = (List.map (compose block) liste0, List.map (compose block) liste1)

		let map_push b (liste0, liste1) = (List.map (fun x -> (Some b)::x) liste0, List.map (fun x -> (Some b)::x) liste1)

		let add (x, y) (x', y') = (x@x', y@y')

		let shift block l01 = CpxV0Types.(cswap block.neg (add (x block) (map_compose block l01)))

		let do_leaf (():extra) (():GroBdd.M.leaf) = (([], [[]]):xnode)
		let do_node ()    = Extra.(CpxV0DumpLoad.binload_node >> CpxV0Utils.block_split >> CpxV0Types.(fun (blockX, blockY) ->
			Utils.MNode (fun lX lY -> add
				(map_push false (shift blockX lX))
				(map_push true  (shift blockY lY)))))
		let do_edge (():extra) (block:GroBdd.M.edge) (l01:xnode) = shift block l01 |> snd
	end

	module AllSat = GroBdd.NODE_VISITOR(AllSat_VISITOR)

	let newman man =
		AllSat.newman man ()
	
	let dump_stat = AllSat.dump_stat
	
end


module PartEval =
struct
	module Eval_VISITOR : GroBdd.MODELE_EVAL with
			type pars = bool option list option
		and type back = GroBdd.M.edge
	=
	struct
		type pars = bool option list option
		type back = GroBdd.M.edge

		let pars gid pars (ex, ix) =
			let (ex, ix), pars = CpxV0Gops.assign pars (ex, ix) in
			match pars with
			| None -> Utils.MStop (ex, ix)
			| Some [] -> assert false
			| Some (head::tail) -> match head with
				| None			-> Utils.MPull	(ex, (Some tail), (Some tail))
				| Some false	-> Utils.Go0	(ex, (Some tail))
				| Some true		-> Utils.Go1	(ex, (Some tail))

		let back = CpxV0Utils.compose
	end

	include GroBdd.EVAL(Eval_VISITOR)

end

module AND_ME : GroBdd.MODELE_IBOP_EVAL =
struct
	type compact = Bitv.t
	type residual = CpxV0Types.edge_state
	type eval = bool option list

	let solver gid x y = match CpxV0Gops.node_push_and gid (x, y) with
		| Utils.MEdge (edge, gtree) -> Utils.M3Edge (edge, (None, gtree))
		| Utils.MNode (r, (c, x, y)) -> Utils.M3Node (r, (c, (None, x), (None, y)))
	
	let decomp x y c = (CpxV0DumpLoad.binload_node c, x, y) |> CpxV0Utils.node_split

	let solver' gid c x' y' =
		let x, y = CpxV0DumpLoad.binload_node c |> CpxV0Utils.block_split in
		let x = match x' with
			| Utils.MNode gtree -> CpxV0Utils.node_reduce (x, gtree)
			| Utils.MEdge edge  -> CpxV0Utils.compose x edge
		and y = match y' with
			| Utils.MNode gtree -> CpxV0Utils.node_reduce (y, gtree)
			| Utils.MEdge edge  -> CpxV0Utils.compose y edge
		in solver gid x y
	
	let eval set (ex, ix) =
		let (ex, ix), set = CpxV0Gops.assign (Some set) (ex, ix) in
		(ex, (set, ix))
	
	let read = function
		| [] -> assert false
		| head::tail -> match head with
			| None		 -> Utils.MPull (tail, tail)
			| Some false -> Utils.Go0 tail
			| Some true  -> Utils.Go1 tail

	let compose = CpxV0Utils.compose
end;;

module XOR_ME : GroBdd.MODELE_IBOP_EVAL =
struct
	type compact = Bitv.t
	type residual = CpxV0Types.edge_state
	type eval = bool option list

	let solver gid x y = match CpxV0Gops.node_push_xor gid (x, y) with
		| Utils.MEdge (edge, gtree) -> Utils.M3Edge (edge, (None, gtree))
		| Utils.MNode (r, (c, x, y)) -> Utils.M3Node (r, (c, (None, x), (None, y)))
	
	let decomp x y c = (CpxV0DumpLoad.binload_node c, x, y) |> CpxV0Utils.node_split

	let solver' gid c x' y' =
		let x, y = CpxV0DumpLoad.binload_node c |> CpxV0Utils.block_split in
		let x = match x' with
			| Utils.MNode gtree -> CpxV0Utils.node_reduce (x, gtree)
			| Utils.MEdge edge  -> CpxV0Utils.compose x edge
		and y = match y' with
			| Utils.MNode gtree -> CpxV0Utils.node_reduce (y, gtree)
			| Utils.MEdge edge  -> CpxV0Utils.compose y edge
		in solver gid x y
	
	let eval set (ex, ix) =
		let (ex, ix), set = CpxV0Gops.assign (Some set) (ex, ix) in
		(ex, (set, ix))
	
	let read = function
		| [] -> assert false
		| head::tail -> match head with
			| None		 -> Utils.MPull (tail, tail)
			| Some false -> Utils.Go0 tail
			| Some true  -> Utils.Go1 tail

	let compose = CpxV0Utils.compose
end;;
module ANDE = GroBdd.IBOP_EVAL(AND_ME)
module XORE = GroBdd.IBOP_EVAL(XOR_ME)
