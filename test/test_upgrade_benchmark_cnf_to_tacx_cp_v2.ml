let file_in = Sys.argv.(1)
and file_out = Sys.argv.(2);;

(* STEP 1: verilog parsing [START]*)

type token =
	| Str of string
	| Int of int

type module_cnf = {
	input  : int;
	clauses : (bool * int) list list;
}

type module_tacx = {
	tacx_name : string;
	tacx_input: string list;
	tacx_man  : Cp.TACX.manager;
	tacx_edges: (string * Cp.TACX.edge) list;
}

let my_lexer stream : token Stream.t =
	let is_space = function ' ' | '\t' | '\n' -> true | _ -> false in
	let rec rmline () =
		try match Stream.next stream with
			| '\n' -> ()
			|  _   -> rmline ()
		with _ -> ()
	in
	let rec spaces () = match Stream.peek stream with
	| None -> ()
	| Some head -> if is_space head then (Stream.junk stream; spaces ()) else ()
	in
	let word () =
		let rec aux s = match Stream.peek stream with
			| None -> StrUtil.implode (List.rev s)
			| Some c ->
			( if is_space c
				then (StrUtil.implode (List.rev s))
				else (Stream.junk stream; aux (c::s))
			)
		in
		let w = aux [] in
		try Int(int_of_string w)
		with _ -> Str w
	in
	let mrmc = ref true in
	let rec rmc () = match Stream.peek stream with
		| Some 'c' -> rmline(); rmc ()
		| _ -> ()
	in
	let rec aux x : token option=
		if !mrmc then (mrmc:=false; rmc());
		spaces ();
		match Stream.peek stream with
		| None -> None
		| Some head ->
		(
			assert(not(is_space head));
			Some(word())
		)
	in
	Stream.from aux
;;

let rec tee stream =
	let rec aux x =
		try
		(
			let char = Stream.next stream in
			print_char char; flush stdout;
			Some char
		)	
		with _ -> None
	in Stream.from aux

let pstring x = print_string x; print_string " "; flush stdout;;
(* let pstring x = ();; *)
let pchar x = print_char x; print_char ' '; flush stdout;;
(* let pchar x = ();; *)

let parse_clause stream =
	let rec aux carry = match Stream.next stream with
	| Int x -> if x = 0 then List.rev carry else aux ((if x < 0 then (true, -x-1) else (false, x-1))::carry)
	| _ -> assert false
	in aux []

let parse_str stream = match Stream.next stream with
	| Str x -> x
	| _ -> assert false
;;

let parse_int stream = match Stream.next stream with
	| Int x -> x
	| _ -> assert false
;;

let parse_module stream =
	let rec aux nclause carry =
		if nclause = 0
		then (List.rev carry)
		else aux (nclause-1) ((parse_clause stream)::carry)
	in
	assert(parse_str stream = "p");
	assert(parse_str stream = "cnf");
	let input = parse_int stream in
	let nbclauses = parse_int stream in
	let clauses = aux nbclauses [] in
	{input; clauses}
;;

let tee stream = stream

let my_cnf = parse_module (my_lexer (tee(Stream.of_channel (open_in file_in))));;
(* STEP 1: CNF parsing [DONE] *)


(* STEP 2: from CNF to Cp.TACX *)

type tree = Const of bool | Node of tree * tree * tree

let set ((b, x):bool * int) =
	let rec aux carry = function
		| [] -> Some (List.rev carry)
		| (b', y)::tail when x = y -> if b = b' then None else (aux carry tail)
		| head::tail -> aux (head::carry) tail
	in aux []


let simplify llist =
	let rec aux c1 c2 cN = function
		| [] -> Ok ((List.rev c1)@(List.rev c2)@(List.rev cN))
		| []::tail -> Error false
		| [x]::tail -> aux ([x]::c1) c2 cN (MyList.opmap (set x) tail) 
(*		| [x]::tail -> aux ([x]::c1) c2 cN tail *)
		| [x; y]::tail -> aux c1 ([x; y]::c2) cN tail
		| head::tail -> aux c1 c2 (head::cN) tail
	in match llist with
	| [] -> Error true
	| llist -> aux [] [] [] llist

let split3 x =
	let where =
		let rec aux carry = function
			| [] -> (None, List.rev carry)
			| (b, y)::tail when x = y -> (Some b, (List.rev carry)@tail)
			| head::tail -> aux (head::carry) tail
		in aux []
	in
	let rec aux c0 c1 cX = function
		| [] -> (c0, c1, cX)
		| head::tail -> let sel, head' = where head in match sel with
			| Some false -> aux (head'::c0) c1 cX tail
			| Some true  -> aux c0 (head'::c1) cX tail
			| None       -> aux c0 c1 (head'::cX) tail
	in aux [] [] []


let init_union_find n = Array.init n (fun x -> x)

let rec find array x =
	if array.(x) = x
	then x
	else
	(
		let x' = find array (array.(x)) in
		array.(x) <- x';
		x'
	)

let union array x y =
	let x' = find array x
	and y' = find array y in
	if x' < y'
	then array.(x') <- y'
	else if y' < x'
	then array.(y') <- x'
	else ()

let andsplit xmax llist =
	let array = init_union_find xmax in
	List.iter (function [] -> assert false | x::tail -> List.iter (union array x) tail) llist ;
	let count = Array.make xmax 0 in
	Array.iter (fun i -> count.(i) <- count.(i)+1) array;
	let coupe = Array.init xmax (fun _ -> []) in
	List.iter (function [] -> assert false | (x::_) as clause -> (let x' = find array x in coupe.(x') <- clause::(coupe.(x')))) llist;
	let return = ref [] in
	Array.iter (function [] -> () | list -> return := (list::(!return))) coupe;
	List.map List.rev !return;

let treefy man xmax llist =
	let ( *! ) = Cp.( *! ) man
	and ( &! ) = Cp.( &! ) man in
	let rec simp x llist =	
		assert(x <= xmax);
		match simplify llist with
		| Error bool -> Cp.make_const bool (xmax-x)
		| Ok llist -> Oops.vec_et (&!)
	and		split llist =
		let if0, if1, ifX = split3 x llist in
		let if0 = recsplit3 (x+1) if0
		and if1 = recsplit3 (x+1) if1
		and ifX = recsplit3 (x+1) ifX in
		(Cp.no ((Cp.no if1) *! (Cp.no if0))) &! (Cp.push_pass ifX)
	in recsplit3 0 llist


let upgrade mymodule =
	let man = Cp.TACX.newman() in
	{
		tacx_name = "CNF";
		tacx_man  = man;
		tacx_input= MyList.init mymodule.input string_of_int;
		tacx_edges= ["OUT", treefy man mymodule.input mymodule.clauses]
	}
;;

let my_tacx = upgrade my_cnf;;

Cp.TACX.dumpfile my_tacx.tacx_man (List.map (fun (name, edge) -> edge) my_tacx.tacx_edges) file_out;;

exit 0;;
