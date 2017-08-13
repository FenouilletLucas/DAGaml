(* All Right Reserved

   Copyright (c) 2017 Joan Thibault
*)

let dump_leaf = BinDump.unit
let load_leaf = BinLoad.unit

let dump_next' dump_ident next stream = Utils.dump_gnode dump_leaf dump_ident next stream
let load_next' load_ident      stream = Utils.load_gnode load_leaf load_ident      stream

module GroBdd =
struct
	module M0 =
	struct
		type leaf = unit
		type edge = CpTypes.edge_state
		type node = unit

		type 'i next' = (leaf, 'i) Utils.gnode
		type 'i edge' = edge * 'i next'
		type 'i node' = node * 'i edge' * 'i edge'

		let dump_leaf = dump_leaf
		let load_leaf = load_leaf

		let dump_edge = CpBDumpLoad.bindump_edge
		let load_edge = CpBDumpLoad.binload_edge

		let dump_node = BinDump.unit
		let load_node = BinLoad.unit

		let dump_next' = dump_next'
		let load_next' = load_next'

		let dump_edge' dump_ident edge stream =
			BinDump.pair dump_edge (dump_next' dump_ident) edge stream
		let load_edge' load_ident      stream =
			BinLoad.pair load_edge (load_next' load_ident)      stream

		let dump_node' dump_ident node stream =
			BinUbdag.default_dump_node CpBDumpLoad.bindump_node dump_node dump_ident node stream
		let load_node' load_ident      stream =
			BinUbdag.default_load_node CpBDumpLoad.binload_node load_node load_ident      stream

		let __check_reverse__ = true

	end

	module M1 =
	struct
		module M = M0

		let compose = CpBGops.compose
		let push_node = CpBGops.solve_cons
		let pull_node = CpBGops.node_pull
	end

	include BinUbdagTC.STDIO(M1)

	module TO_DOT_MODELE =
	struct
		module M = G0

		let string_of_leaf () = "L0"

		let string_of_pos = function
			| None       -> "black"
			| Some false -> "red"
			| Some true  -> "green"

		let string_of_edge pos edge =
			"[label = \""^(CpBDumpLoad.strdump_edge edge)^"\"; color=\""^(string_of_pos pos)^"\"];"
		let string_of_node _ = ""
	end

	module TO_DOT = BinUbdag.TO_DOT(TO_DOT_MODELE)

	let dotfile = TO_DOT.dotfile

	module AND_M =
	struct
		module M = G1
		
		let solver node =
			let edge, merge = CpBGops.solve_and node in
			(
				edge,
				match merge with
					| Utils.MEdge next -> Utils.M3Edge next
					| Utils.MNode node -> Utils.M3Node node
			)

	end

	module AND = BinUbdagTC.BINOP(AND_M)

	module XOR_M =
	struct
		module M = G1
		
		let solver node =
			let edge, merge = CpBGops.solve_xor node in
			(
				edge,
				match merge with
					| Utils.MEdge next -> Utils.M3Edge next
					| Utils.MNode node -> Utils.M3Node node
			)

	end

	module XOR = BinUbdagTC.BINOP(XOR_M)


	type manager = {
		cons : G1.manager;
		and_ : AND.manager;
		xor_ : XOR.manager;
		solve_cons :                  G0.node' -> G0.edge';
		solve_and  :                  G0.node' -> G0.edge';
		solve_xor  :                  G0.node' -> G0.edge';
		solve_tacx : TacxTypes.tag -> G0.node' -> G0.edge';
	}

	let push man = man.solve_cons

	let makeman hsize =
		let cons = G1.makeman hsize in
		let and_ = AND.makeman cons hsize
		and xor_ = XOR.makeman cons hsize in
		let solve_cons = G1.push cons
		and solve_and  = AND.map and_
		and solve_xor  = XOR.map xor_ in
		let solve_tacx = TacxTypes.(function
			| And  -> solve_and
			| Cons -> solve_cons
			| Xor  -> solve_xor
		) in
		{cons; and_; xor_; solve_cons; solve_and; solve_xor; solve_tacx}

    let default_newman_hsize = 10000

	let newman () = makeman default_newman_hsize

	module PEVAL_MODELE =
	struct
		module M = G1

		type peval = bool option list

		let dump_peval = BinDump.list (BinDump.option BinDump.bool)
		let load_peval = BinLoad.list (BinLoad.option BinLoad.bool)

		type next = peval option * M.G.ident

		type next' = next M.M.M.next'
		type edge' = next M.M.M.edge'
		type node' = next M.M.M.node'

		let eval_edge : peval -> edge' -> edge' = CpBGops.assign 
		let eval_node : peval -> node' -> (edge', node') Utils.merge  = function
			| [] -> assert false
			| head::peval -> match head with
				| None       -> fun ((), edge0, edge1) ->
					Utils.MNode((), eval_edge peval edge0, eval_edge peval edge1)
				| Some false -> fun((), edge0, _) ->
					Utils.MEdge(eval_edge peval edge0)
				| Some true  -> fun((), _, edge1) ->
					Utils.MEdge(eval_edge peval edge1)
	end

	module PEVAL = BinUbdagTC.PEVAL(PEVAL_MODELE)

	module CntSat_MODELE =
	struct
		module M = G0

		type xnode  = BigInt.big_int * BigInt.big_int
		type xnode' = xnode
		type xedge  = BigInt.big_int
		type extra  = unit

		let dump_xnode x = x
		let load_xnode x = x

		type next' = (unit -> xnode) M.M.next'
		type edge' = (unit -> xnode) M.M.edge'
		type node' = (unit -> xnode) M.M.node'

		let cswap b (x, y) = if b then (y, x) else (x, y)
		let add (x, y) (x', y') = (BigInt.(+) x x', BigInt.(+) y y')
		let shift n (x, y) = (BigInt.shift_left x n, BigInt.shift_left y n)
		let p = function CpTypes.P -> true | _ -> false

		let rec_next = function
			| Utils.Leaf () -> (BigInt.zero, BigInt.unit)
			| Utils.Node node -> node()

		let rec_edge ((b, l), next) =
			cswap b (shift (MyList.count p l) (rec_next next))

		let map_node () ((), edge0, edge1) =
			add (rec_edge edge0) (rec_edge edge1)

		let map_edge () edge = rec_edge edge |> fst
	end

	module CntSat = BinUbdag.EXPORT(CntSat_MODELE)

	module AllSat_MODELE =
	struct
		module M = G0

		type xnode  = (bool option list list) * (bool option list list)
		type xnode' = xnode
		type xedge  = (bool option list list)
		type extra  = unit

		let dump_xnode x = x
		let load_xnode x = x

		type next' = (unit -> xnode) M.M.next'
		type edge' = (unit -> xnode) M.M.edge'
		type node' = (unit -> xnode) M.M.node'

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

		let rec_next : next' -> xnode = function
			| Utils.Leaf () -> ([], [[]])
			| Utils.Node node -> node()

		let rec_edge side ((neg, sub), next) : xnode =
			let if0, if1 = rec_next next in
			let if0 = List.map (compose side sub) if0
			and if1 = List.map (compose side sub) if1 in
			cswap neg (if0, if1)

		let add (x0, y0) (x1, y1) = (x0@x1, y0@y1)
		
		let map_node () ((), edge0, edge1) : xnode=
			add (rec_edge (Some false) edge0) (rec_edge (Some true) edge1)

		let map_edge () edge : xedge = rec_edge None edge |> fst
	end

	module AllSat = BinUbdag.EXPORT(AllSat_MODELE)

end

module TACX =
struct

	module M0 =
	struct
		type leaf = unit
		type edge = CpTypes.edge_state
		type node = TacxTypes.tag

		type 'i next' = (leaf, 'i) Utils.gnode
		type 'i edge' = edge * 'i next'
		type 'i node' = node * 'i edge' * 'i edge'

		let dump_leaf = dump_leaf
		let load_leaf = load_leaf

		let dump_edge = CpBDumpLoad.bindump_edge
		let load_edge = CpBDumpLoad.binload_edge

		let dump_node = TacxTypes.bindump_tag
		let load_node = TacxTypes.binload_tag

		let dump_next' = dump_next'
		let load_next' = load_next'

		let dump_edge' dump_ident edge stream =
			BinDump.pair CpBDumpLoad.bindump_edge (dump_next' dump_ident) edge stream
		let load_edge' load_ident      stream =
			BinLoad.pair CpBDumpLoad.binload_edge (load_next' load_ident)      stream

		let dump_node' dump_ident node stream =
			BinUbdag.default_dump_node CpBDumpLoad.bindump_tacx BinDump.unit dump_ident node stream
		let load_node' load_ident      stream =
			BinUbdag.default_load_node CpBDumpLoad.binload_tacx BinLoad.unit load_ident      stream

		let __check_reverse__ = true

	end

	module M1 =
	struct
		module M = M0
		
		let push_node = CpBGops.solve_tacx

		let compose = CpBGops.compose


	end

	include BinUbdagT.STDIO(M1)

	module TO_DOT_MODELE =
	struct
		module M = G0

		let string_of_leaf () = "L0"

		let string_of_pos = function
			| None       -> "black"
			| Some false -> "red"
			| Some true  -> "green"

		let string_of_edge pos edge =
			"[label = \""^(CpBDumpLoad.strdump_edge edge)^"\"; color=\""^(string_of_pos pos)^"\"];"
		let string_of_node = TacxTypes.strdump_tag
	end

	module TO_DOT = BinUbdag.TO_DOT(TO_DOT_MODELE)

	let dotfile = TO_DOT.dotfile

	module COMPILE_MODELE =
	struct
		module M = G0
	
		type extra  = GroBdd.manager
		type xnode  = GroBdd.G0.edge'
		type xnode' = Bitv.t
		type xedge  = GroBdd.G0.edge'

		let dump_xnode = GroBdd.G0.push_edge'
		let load_xnode = GroBdd.G0.pull_edge'

		type next' = (unit -> xnode) M.M.next'
		type edge' = (unit -> xnode) M.M.edge'
		type node' = (unit -> xnode) M.M.node'

		let rec_edge (edge, next) = match next with
			| Utils.Leaf leaf -> (edge, Utils.Leaf leaf)
			| Utils.Node node -> GroBdd.M1.compose edge (node())

		let map_node man (tag, edge0, edge1) =
			man.GroBdd.solve_tacx tag ((), rec_edge edge0, rec_edge edge1)
		let map_edge man edge = rec_edge edge
	end

	module COMPILE = BinUbdag.EXPORT(COMPILE_MODELE)

	type manager = {
		grobdd : GroBdd.manager;
		tacx : G1.manager;
		push : G0.node' -> G0.edge';
		man : COMPILE.manager;
		map : G0.edge' -> GroBdd.G0.edge';
	}

	let makeman grobdd hsize =
		let tacx = G1.makeman hsize in
		let push = G1.push tacx in
		let man = COMPILE.makeman tacx grobdd hsize in
		let map = COMPILE.rec_edge man in
		{grobdd; tacx; push; man; map}

end

let newman = GroBdd.newman

let make_const b n = ((b, MyList.ntimes CpTypes.P n), Utils.Leaf ())

let make_ident man b n = GroBdd.push man ((), make_const b n, make_const (not b) n)

let arity ((_, l), _) = List.length l

let push_pass ((b, l), i) = ((b, CpTypes.P::l), i)

let no ((b, l), i) = ((not b, l), i)
let cno b' ((b, l), i) = ((b' <> b, l), i)

let is_root = function
	| ((b, _), Utils.Leaf ()) -> Some b
	| _ -> None 

let get_root b ((_, l), _) = ((b, MyList.ntimes CpTypes.P (List.length l)), Utils.Leaf ())

let ( *! ) man x y = man.TACX.push (TacxTypes.Cons, x, y)
let ( &! ) man x y = man.TACX.push (TacxTypes.And , x, y)
and ( ^! ) man x y = man.TACX.push (TacxTypes.Xor , x, y)

(*
module PURE_TO_BRYANT =
struct
	module CONS_VISITOR =
	struct
		type xedge = Bryant.GroBdd.edge
		type xresi = int
		type extra = Bryant.GroBdd.manager

		let do_edge _ ((b, l), i) = match i with
			| Utils.Leaf () ->
			(
				assert(List.for_all (function CpTypes.P -> true | _ -> false) l);
				Utils.MEdge ((b, (List.length l, 0)), Utils.Leaf())
			)
			| Utils.Node n ->
			(
				let rec aux carry = function
					| [] -> assert false
					| head::tail as liste -> match head with
						| CpTypes.P -> aux (1+carry) tail
						| _			-> carry, liste
				in 
				let shift, l = aux 0 l in
				Utils.MNode (shift, ((b, l), Utils.Node n))
			)

		let push = Bryant.GroBdd.push

		let compose _ (shift:xresi) ((b, (x, y)), i) = ((b, (shift+x, y)), i)
	end

	include GroBdd.CONS_VISITOR(CONS_VISITOR)

end

module PURE_TO_ZDD =
struct
	module CONS_VISITOR =
	struct
		type xedge = Zdd.GroBdd.edge
		type xresi = unit
		type extra = Zdd.GroBdd.manager

		let do_edge _ ((b, l), i) = match i with
			| Utils.Leaf () ->
			(
				assert(List.for_all (function CpTypes.P -> true | _ -> false) l);
				Utils.MEdge ((List.length l, 0), Utils.Leaf b)
			)
			| Utils.Node n ->
			(
				Utils.MNode ((), ((b, l), Utils.Node n))
			)

		let push = Zdd.GroBdd.push

		let compose _ () edge = edge
	end

	include GroBdd.CONS_VISITOR(CONS_VISITOR)

end
*)
