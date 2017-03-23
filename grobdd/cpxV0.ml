let strdump_node = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_node = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> CpxV0Gops.binload_node >> CpxV0Gops.node_split)

let strdump_tacx = Extra.(Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_tacx = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> CpxV0Gops.binload_tacx >> CpxV0Gops.tacx_split)

let strdump_edge = Extra.(CpxV0Gops.bindump_edge >> Bitv.L.to_hexa_string >> StrTree.of_string)
let strload_edge = Extra.(StrTree.to_string >> Bitv.L.of_hexa_string >> CpxV0Gops.binload_edge)

let dot_of_edge_aux color block =
	"[label = \""^(CpxV0Gops.block_to_pretty block)^"\"; color=\""^color^"\"];"

let dot_of_edge = dot_of_edge_aux "black"

let dot_of_node node =
	let e0, e1 = CpxV0Gops.binload_node node |> CpxV0Gops.node_split in
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
		| Utils.MNode f -> Utils.MNode (fun (node, i1, i2) -> f (CpxV0Gops.binload_node node, i1, i2))
	let compose _ = CpxV0Gops.compose
	
	let pull_node gid (n, i0, i1) = CpxV0Gops.node_pull_node gid (CpxV0Gops.binload_node n, i0, i1)
	
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
		Udag.StrTree.dumpfile strman stredges target
	
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

let push_pass = CpxV0Gops.push_P

let no = CpxV0Gops.neg

let is_root = CpxV0Gops.is_root

let get_root = CpxV0Gops.get_root

let (=??) (ex, ix) (ey, iy) = match ix, iy with
	| Utils.Leaf (), Utils.Leaf () -> ex = ey
	| Utils.Node nx, Utils.Node ny -> (nx == ny) && (ex = ey)
	| _ -> false

module AND_M : GroBdd.MODELE_IBOP =
struct
	type t = Bitv.t
	let compare = Pervasives.compare
	type transform = CpxV0Types.edge_state
	let compose = CpxV0Gops.compose
	let decomp x y c = CpxV0Gops.((binload_node c, x, y) |> node_pull_node ())
	let solver = CpxV0Gops.node_push_and
end;;

module XOR_M : GroBdd.MODELE_IBOP =
struct
	type t = Bitv.t
	let compare = Pervasives.compare
	type transform = CpxV0Types.edge_state
	let compose = CpxV0Gops.compose
	let decomp x y c = CpxV0Gops.((binload_node c, x, y) |> node_pull_node ())
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
	let compose _ = CpxV0Gops.compose
	
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
		let do_node (a, c, x) = Extra.(CpxV0Gops.binload_tacx >> CpxV0Gops.tacx_split >> (fun (tag, edgeX, edgeY) ->
			let merge = NniTypes.(match tag with CpTypes.And -> a | CpTypes.Cons -> c | CpTypes.Xor -> x) in
			Utils.MNode (fun nodeX nodeY -> merge (CpxV0Gops.compose edgeX nodeX) (CpxV0Gops.compose edgeY nodeY))))
		let do_edge _ = CpxV0Gops.compose
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
		let do_node (a, c, x) = Extra.(CpxV0Gops.binload_tacx >> CpxV0Gops.tacx_split >> (fun (tag, edgeX, edgeY) ->
			let merge = CpTypes.(match tag with And -> a | Cons -> c | Xor -> x) in
			Utils.MNode (fun nodeX nodeY -> merge (CpxV0Gops.compose edgeX nodeX) (CpxV0Gops.compose edgeY nodeY))))
		let do_edge _ = CpxV0Gops.compose
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
				TACX.push extra tag (compose edgeX nodeX) (compose edgeY nodeY)) in
			(result : (xnode, xnode -> xnode -> xnode) Utils.merge)))

		let do_edge _ e = CpxV0Gops.compose (cpx_of_cp e)
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
			match CpxV0Gops.classify block |> snd with
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
		let do_node ()    = Extra.(CpxV0Gops.binload_node >> CpxV0Gops.node_split >> CpxV0Types.(fun (blockX, blockY) ->
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

(*

module AllSat =
struct
	module AllSat_VISITOR =
	struct
		type xnode = (bool option list list) * (bool option list list)
		type xedge = (bool option list list)
		type extra = unit

		let cswap b (x, y) = if b then (y, x) else (x, y)
		let p = function CpTypes.P -> true | _ -> false
		let compose =
			let rec aux carry = function
			  | ([], []) -> List.rev carry
			  | (CpTypes.S::x', y::y') -> aux (y::carry) (x', y')
			  | (CpTypes.P::x', y') -> aux (None::carry) (x', y')
			  | _ -> assert false
			in function
			  | None	-> fun deco elem -> aux [] (deco, elem)
			  | Some b	-> fun deco elem -> aux [Some b] (deco, elem)

		let shift deco (x, y) = (List.map (compose (Some false) deco) x, List.map (compose (Some true) deco) y)
		let add (x, y) (x', y') = (x@x', y@y')

		let do_leaf (():extra) (():GroBdd.M.leaf) = (([], [[]]):xnode)
		let do_node ()    = Extra.(CpxV0Gops.binload_node >> CpxV0Gops.node_split >> (fun ((bX, lX), (bY, lY)) ->
			Utils.MNode (fun x y -> add (shift lX (cswap bX x)) (shift lY (cswap bY y)))))
		let do_edge (():extra) ((b, l):GroBdd.M.edge) ((x, y):xnode) =
			let x = if b then y else x in
			List.map (compose None l) x
	end

	module AllSat = GroBdd.NODE_VISITOR(AllSat_VISITOR)

	let newman man =
		AllSat.newman man ()
	
	let dump_stat = AllSat.dump_stat
	
end

module Eval =
struct
	module Eval_VISITOR =
	struct
		type pars = bool option list
		type back = GroBdd.M.edge

		let pars gid pars ((be, le), ie) =
			let lb, lpe = List.split(List.map2(fun p e -> match p, e with
				| None, CpTypes.P -> Some CpTypes.P, None
				| None, CpTypes.S -> Some CpTypes.S, Some(None, CpTypes.S)
				| Some _, CpTypes.P -> None, None
				| Some b, CpTypes.S -> Some CpTypes.S, Some(Some b, CpTypes.S)) pars le) in
			let lb = MyList.list_of_oplist lb
			and pars, le = List.split(MyList.list_of_oplist lpe) in
			if List.for_all (function None -> true | Some _ -> false) pars
			then Utils.MStop (CpxV0Gops.compose (false, lb) ((be, le), ie))
			else match pars with
				| [] -> assert false
				| h::t -> match h with
					| None       -> Utils.MPull ((false, lb), t, t)
					| Some false -> Utils.Go0 ((false, lb), t)
					| Some true	 -> Utils.Go1 ((false, lb), t)

		let back = CpxV0Gops.compose
	end

end

*)
