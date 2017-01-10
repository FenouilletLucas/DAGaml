open NniTypes
open Extra

let strdump_invar = Bitv.L.to_bool_list ||>> (fun x -> if x then "+" else " ") 

let strdump_uniq_elem = function
	| S b			-> ((if b then "F" else "S"), None)
	| P (b, None)	-> ((if b then "A" else "P"), None)
	| P (b, Some i)	-> ((if b then "N" else "I"), Some(strdump_invar i))

let bindump_invar (b, opi) (stream:bool list) : bool list =
	let stream = BinDump.option BinDump.bitv stream opi in
	BinDump.bool stream b

let binload_invar i stream =
	let b, stream = BinLoad.bool stream in
	let opi, stream = BinLoad.option (BinLoad.bitv i) stream in
	(b, opi), stream

let bindump_uniq_elem carry = function
	| S b			-> false::b::carry
	| P (b, opi)	-> true::b::((match opi with None -> [false] | Some i -> true::(Bitv.L.to_bool_list i))@carry)

let binload_uniq_elem i = BinLoad.choice
	(fun stream -> let b, stream = BinLoad.bool stream in (S b, (i+1), stream))
	(fun stream -> let invar, stream = binload_invar i stream in (P invar, i , stream))

let bindump_uniq = (let rec fold stream = function
	| [] -> false::stream
	| head::tail -> fold (true::(bindump_uniq_elem stream head)) tail in fold []) >> Bitv.L.of_bool_list

let binload_uniq = Bitv.L.to_bool_list >> (
	let rec fold i carry = BinLoad.choice
		(fun stream -> carry)
		(fun stream ->
			let e, i, stream = binload_uniq_elem i stream in
			fold i (e::carry) stream)
	in fold 0 [])


let bindump_pair_elem carry = function
	| SS b -> false::b::carry
	| SP invar -> true::false::true::(bindump_invar invar carry)
	| PS invar -> true::false::false::(bindump_invar invar carry)
	| PP (invarX, invarY) -> true::true::(bindump_invar invarX (bindump_invar invarY carry))

let bindump_pair = (let rec fold carry = function
	| [] -> carry
	| head::tail -> fold (bindump_pair_elem carry head) tail in fold []) >> Bitv.L.of_bool_list

let binload_pair_elem i j = function
	| false::b::stream				-> (* SS *)
		(i+1, j+1, SS b, stream)
	| true::false::true::stream		-> (* SP *)
		let invar, stream = binload_invar j stream in
		(i+1, j, SP invar, stream)
	| true::false::false::stream	-> (* PS *)
		let invar, stream = binload_invar i stream in
		(i, j+1, PS invar, stream)
	| true::true::stream			-> (* PP *)
		let invarX, stream = binload_invar i stream in
		let invarY, stream = binload_invar j stream in
		(i, j, PP (invarX, invarY), stream)
	| _								->  assert false

let binload_pair = Bitv.L.to_bool_list >> (
	let rec fold i j carry = function
		| [] -> carry
		| stream ->
			let i, j, e, stream = binload_pair_elem i j stream in
			fold i j (e::carry) stream
	in fold 0 0 [])

let expand_uniq : uniq -> uniq=
	let aux0 =
		let rec aux carry = function
			| [], [] -> List.rev carry
			| (S _)::x', y::y' -> aux (y::carry) (x', y')
			| (P _)::x', y' -> aux (false::carry) (x', y')
			| _ -> assert false
		in
		fun vect uniq -> Bitv.L.of_bool_list (aux [] (uniq, (Bitv.L.to_bool_list vect)))
	in
	let aux =
		let rec aux carry = function
			| [] -> List.rev carry
			| head::tail -> match head with
				| S _ | P (_, None) -> aux (head::carry) tail
				| P (b, Some i) -> aux ((P (b, Some(aux0 i tail)))::carry) tail
		in aux []
	in aux

type iinvar = bool * (bool list option)

let iinvar_of_invar (b, opi) = (b, (match opi with
	| None -> None
	| Some i -> Some(Bitv.L.to_bool_list i)))

let invar_of_iinvar (b, opi) = (b, (match opi with
	| None -> None
	| Some i -> Some(Bitv.M.of_bool_list i)))

type iuniq_elem =
	| IS of bool
	| IP of iinvar

type iuniq = iuniq_elem list


let iuniq_of_uniq = List.map (function
	| S b -> IS b
	| P i -> IP (iinvar_of_invar i))

let uniq_of_iuniq = List.map (function
	| IS b -> S b
	| IP i -> P (invar_of_iinvar i))

type ipair_elem =
	| ISS of bool
	| IPS of iinvar
	| ISP of iinvar
	| IPP of iinvar * iinvar

type ipair = ipair_elem list

let ipair_of_pair = List.map (function
	| SS b -> ISS b
	| PS i -> IPS (iinvar_of_invar i)
	| SP i -> ISP (iinvar_of_invar i)
	| PP (ix, iy) -> IPP (iinvar_of_invar ix, iinvar_of_invar iy))

let pair_of_ipair = List.map (function
	| ISS b -> SS b
	| IPS i -> PS (invar_of_iinvar i)
	| ISP i -> SP (invar_of_iinvar i)
	| IPP (ix, iy) -> PP (invar_of_iinvar ix, invar_of_iinvar iy))

let add : bool list -> bool list -> bool list = List.map2 ( <> ) 

let reduce_iuniq =
	let aux0S b small =
		let n = List.length small in fun big -> (* could be speed-up by bringing this computation to bitv level of abstraction *)
		let m = List.length big in
		assert(m > n);
		let head, tail = MyList.hdtl_nth (m-(n+1)) big in
		assert(List.length tail = (n+1));
		match tail with
		| [] -> assert false
		| x::tail -> (b && x, head@(if x then (add small tail) else tail))
	in
	let aux0N b n big =
		let m = List.length big in
		assert(m > n);
		let head, tail = MyList.hdtl_nth (m-(n+1)) big in
		assert(List.length tail = (n+1));
		match tail with
		| [] -> assert false
		| x::tail -> (b && x, head@tail)
	in
	let aux0map f = List.map (function
		| IS b -> IS b
		| IP (b, None) -> IP (b, None)
		| IP (b, Some i) ->
			let b', i = f i in
			IP (b<>b', Some i)
		)
	in
	let aux1 : iuniq -> iuniq =
		let head_reduce = function
			| IS b -> IS b
			| IP (b, opi) -> IP (b, (match opi with
				| None -> None
				| Some i ->
					if List.exists (fun x -> x) i
						then Some i
						else None))
		in
		let rec aux carry : iuniq -> iuniq = function
			| [] -> List.rev carry
			| head::tail ->
				let head = head_reduce head in
				aux (head::carry) (match head with
					| IS _				-> tail
					| IP (b, None)		-> aux0map (aux0N b (List.length tail)) tail
					| IP (b, Some i)	-> aux0map (aux0S b i) tail)
		in aux []
	in
	aux1

let reduce_uniq = iuniq_of_uniq >> reduce_iuniq >> uniq_of_iuniq

let compose =
	let aux0 =
		let rec aux carry = function
			| ([], [])				-> List.rev carry
			| ((IS _)::x', y::y')	-> aux (y::carry) (x', y')
			| ((IP _)::x', y')		-> aux (false::carry) (x', y')
			| _						-> assert false
		in fun v tail -> aux [] (tail, v)
	in
	let rec aux carry = function
		| ([], [], (bp, [])) -> (bp, List.rev carry)
		| ((IS bx)::x', y::y', (bp, p::p')) ->
		(
			let bx = bx <> p in
			match y with
			| IS by -> aux ((IS (bx<>by))::carry) (x', y', (bp, p'))
			| IP (by, vy) ->
				let bp = bp <> (bx && by) in
				match vy with
				| None -> aux ((IP(by, None))::carry) (x', y', (bp, p'))
				| Some iy -> 
					let iy = aux0 iy x' in
					let bp, p' = if bx
						then (by<>bp, add p' iy)
						else (bp, p')
					in aux ((IP(by, Some iy))::carry) (x', y', (bp, p'))
			
		)
		| _ -> assert false
	in
	fun uniqC uniq ->
		let uniqC = iuniq_of_uniq (expand_uniq uniqC)
		and uniq  = iuniq_of_uniq (expand_uniq uniq) in
		let b, uniqX = aux [] (uniqC, uniq, (false, MyList.ntimes false (List.length uniqC))) in
		(b, uniqX |> reduce_iuniq |> uniq_of_iuniq)

let cons_primary uniqX uniqY =
	let uniqX = iuniq_of_uniq (expand_uniq uniqX)
	and uniqY = iuniq_of_uniq (expand_uniq uniqY) in
	let aux =
		let aux0 p (b, p') (ib, iopi) = if not p then (b, p') else
			(b<>ib, match iopi with
			| None -> p'
			| Some i -> add p' i)
		in
		let rec aux carryXY carryZ = function
			| ((bx, []), (by, []), [], []) -> (bx<>by, List.rev carryXY), (bx, List.rev carryZ)
			| ((bpx, px::px'), (bpy, py::py'), x::x', y::y') ->
			(
				match x, y with
				| IS bx, IS by ->
					let bx = bx <> px
					and by = by <> py in
					aux ((ISS (by<>bx))::carryXY) ((IS bx)::carryZ) ((bpx, px'), (bpy, py'), x', y')
				| IP ix, IP iy ->
					let bpx, px' = aux0 px (bpx, px') ix
					and bpy, py' = aux0 py (bpy, py') iy in
					if ix = iy
					then aux carryXY					((IP ix)::carryZ)		((bpx, px'), (bpy, py'), x', y')
					else aux ((IPP (ix, iy))::carryXY)	((IS false)::carryZ)	((bpx, px'), (bpy, py'), x', y')
				| IS bx, IP iy ->
					let bx = bx <> px in
					let bpy, py' = aux0 (py <> bx) (bpy, py') iy in
					aux ((ISP iy)::carryXY) ((IS bx)::carryZ) ((bpx, px'), (bpy, py'), x', y')
				| IP ix, IS by ->
					let by = by <> py in
					let bpx, px' = aux0 (px <> by) (bpx, px') ix in
					aux ((IPS ix)::carryXY) ((IS by)::carryZ) ((bpx, px'), (bpy, py'), x', y')
			)
			| _ -> assert false
		in fun uniqX uniqY ->
			let n = List.length uniqX in
			assert(List.length uniqY = n);
			let p = (false, MyList.ntimes false n) in
			aux [] [] (p, p, uniqX, uniqY)
	in
	let (bp, pair), (bu, uniq) = aux uniqX uniqY in
	((bp, pair_of_ipair pair), (bu, uniq_of_iuniq uniq))


(*
let cons_primaire uniqX uniqY =
	assert(List.length uniqX = List.length uniqY);
	let n = List.length uniqX in
	let phase = MyList.ntimes False n in
	let
	let aux0 =
		let rec aux carry = function
			| [], [] -> List.rev carry
			| (S b)::x, y::y' as yy ->
			(
				match x, y with
			)
	let rec aux carryXY carryZ= function
		| ([], [], []) -> List.rev carryXY, List.rev carryZ
		| (p::p', x::x', y::y') ->
		(
			match x, y with
			| S bx, S by -> aux ((SS (by<>bx))::carryXY) ((S (p<>bx))::carryZ) (p', x', y')
			| P ix, P iy -> if ix = iy
				then aux carryXY ((P ix)::carryZ) (p', x', y') (* ERROR: project ix back into absolute space *)
				else aux ((PP (ix, iy))::carryXY) ((S false)::carry (* ERROR: true if ix and iy are int the absolute space *)
		)
		| _ -> assert false
*)
