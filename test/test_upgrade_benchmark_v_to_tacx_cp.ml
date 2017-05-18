let file_in = Sys.argv.(1)
and file_out = Sys.argv.(2);;

(* STEP 1: verilog parsing [START]*)

type token =
	| Kwd of string
	| Sym of char
	| Ident of string

type module_tacx = {
	tacx_name : string;
	tacx_input: string list;
	tacx_man  : Cp.TACX.manager;
	tacx_edges: (string * Cp.TACX.edge) list;
}

let my_lexer stream : token Stream.t =
	let is_space = function ' ' | '\t' | '\n' -> true | _ -> false in
	let rec spaces () = match Stream.peek stream with
	| None -> ()
	| Some head -> if is_space head then (Stream.junk stream; spaces ()) else ()
	in
	let is_symbol = function '=' | '~' | '&' | '|' | '^' | '(' | ')' | ';' | ',' -> true | _ -> false in
	let word () =
		let rec aux s = match Stream.peek stream with
			| None -> StrUtil.implode (List.rev s)
			| Some c ->
			( if is_space c || is_symbol c
				then (StrUtil.implode (List.rev s))
				else (Stream.junk stream; aux (c::s))
			)
		in
		let w = aux [] in match w with
		| "assign"
		| "module"
		| "endmodule"
		| "input"
		| "output"
		| "wire"
		| "1'd0"		-> Kwd w
		| _				-> Ident w
	in
	let rec aux x : token option=
		spaces ();
		print_string " ";
		match Stream.peek stream with
		| None -> None
		| Some head ->
		Some (
			assert(not(is_space head));
			if is_symbol head
			then (Stream.junk stream; Sym head)
			else (word ())
		)
	in
	Stream.from aux
;;

type uop = PNot | PNop
type bop = PAnd | POr | PIff | PImp | PXor
type expr =
	| PVar of string
	| PUop of (uop * expr)
	| PBop of (bop * expr * expr)

let pstring x = print_string x; print_string " "; flush stdout;;
let pchar x = print_char x; print_char ' '; flush stdout;;

let rec parse_leaf stream = match Stream.next stream with
	| Ident var -> pstring var; PVar var
	| Sym '(' ->
	(
		pstring "(";
		let expr = parse_expr stream in
		PUop (PNop, expr)
	)
	| Sym '~' ->
	(
		pstring "~";
		let expr = parse_leaf stream in
		PUop (PNot, expr)
	)
	| _ -> assert false

and     parse_expr stream =
	let first = parse_leaf stream in
	match Stream.next stream with
	| Sym ';' -> pstring "\n"; first
	| Sym ')' -> pstring ")"; first
	| Sym '&' ->
	(
		pstring "&";
		let second = parse_expr stream in
		PBop (PAnd, first, second)
	)
	| Sym '|' ->
	(
		pstring "|";
		let second = parse_expr stream in
		PBop (POr, first, second)
	)
	| Sym '^' ->
	(
		pstring "^";
		let second = parse_expr stream in
		PBop (PXor, first, second)
	)
	| x -> assert false
;;

type module_v = {
	name   : string;
	params : string list;
	input  : string list;
	output : string list;
	wire   : string list;
	assign : (string * expr) list;
}

let parse_ident stream = match Stream.next stream with
	| Ident name -> name
	| _ -> assert false
;;

let rec parse_coma_list stream =
	let rec aux carry = match Stream.peek stream with
	| None -> assert false
	| Some head -> match head with
		| Sym ',' ->
		(
			Stream.junk stream;
			let ident = parse_ident stream in
			aux (ident::carry)
		)
		| _ -> List.rev carry
	in
	match Stream.next stream with
	| Ident ident -> aux [ident]
	| _ -> assert false
;;

let parse_braket_list stream = match Stream.next stream with
	| Sym '(' ->
	(
		let liste = parse_coma_list stream in
		match Stream.next stream with
		| Sym ')' -> liste
		| _ -> assert false
(*parse_coma_list stream*)
	)
	| _ -> assert false
;;

let parse_semicolon stream = match Stream.next stream with
	| Sym ';' -> ()
	| _ -> assert false
	

let parse_semicolon_list stream =
	let liste = parse_coma_list stream in
	parse_semicolon stream;
	liste
;;


let parse_kwd stream = match Stream.next stream with
	| Kwd kwd -> kwd
	| _ -> assert false
;;

let parse_sym stream = match Stream.next stream with
	| Sym sym -> sym
	| _ -> assert false
;;

let parse_assign stream =
	let ident = parse_ident stream in
	assert('=' = parse_sym stream);
	let expr = parse_expr stream in
	(ident, expr)
;;	

let parse_module_aux mymodule stream =
	let rec aux mymodule = match Stream.next stream with
	| Kwd "endmodule" -> mymodule
	| Kwd "input" ->
	(
		let liste = parse_semicolon_list stream in
		aux {
			name    = mymodule.name;
			params  = mymodule.params;
			input   = mymodule.input @ liste; 
			output  = mymodule.output;
			wire    = mymodule.wire;
			assign  = mymodule.assign;
		}
	)
	| Kwd "output" ->
	(
		let liste = parse_semicolon_list stream in
		aux {
			name    = mymodule.name;
			params  = mymodule.params;
			input   = mymodule.input; 
			output  = mymodule.output @ liste;
			wire    = mymodule.wire;
			assign  = mymodule.assign
		}
	)
	| Kwd "wire" ->
	(
		let liste = parse_semicolon_list stream in
		aux {
			name    = mymodule.name;
			params  = mymodule.params;
			input   = mymodule.input; 
			output  = mymodule.output;
			wire    = mymodule.wire @ liste;
			assign  = mymodule.assign
		}
	)
	| Kwd "assign" ->
	(
		let assign = parse_assign stream in
		aux {
			name    = mymodule.name;
			params  = mymodule.params;
			input   = mymodule.input; 
			output  = mymodule.output;
			wire    = mymodule.wire;
			assign  = mymodule.assign @ [assign];
		}
	)
	| _ -> assert false
	in aux mymodule
;;

let parse_module stream =
	let rec aux () = match Stream.next stream with
	| Kwd "module" ->
	(
		let name = parse_ident stream in
		let params = parse_braket_list stream in
		parse_semicolon stream;
		let mymodule = parse_module_aux {name=name; params=params; input=[]; output=[]; wire=[]; assign=[]} stream in
		print_newline();
		mymodule;
	)
	| _ -> aux ()
	in aux ()
;;

let my_verilog = parse_module (my_lexer (Stream.of_channel (open_in file_in)));;
(* STEP 1: verilog parsing [DONE] *)


(* STEP 2: from verilog to Cp.TACX *)

let upgrade mymodule =
	let man = Cp.TACX.newman() in
(*	let ( *! ) = Cp.( *! ) man *)
	let ( &! ) = Cp.( &! ) man
	and ( ^! ) = Cp.( ^! ) man in
	let neg = Cp.no in
	let inputs = Oops.list_make_n_var man (List.length mymodule.input) in
	let assoc = Hashtbl.create 10000 in
	List.iter2 (fun name func -> Hashtbl.add assoc name func) mymodule.input inputs;
	let rec eval = function
		| PVar ident -> Hashtbl.find assoc ident
		| PUop (uop, expr) ->
		(
			let func = eval expr in
			match uop with
			| PNop ->     func
			| PNot -> neg func 
		)
		| PBop (bop, exprX, exprY) ->
		(
			let funcX = eval exprX
			and funcY = eval exprY in
			match bop with
			| PAnd  -> funcX &! funcY
			| POr	-> neg((neg funcX)&!(neg funcY))
			| PImp	-> neg(funcX &! (neg funcY))
			| PIff	-> neg(funcX ^! funcY)
			| PXor	-> funcX ^! funcY
		)
	in
	List.iter (fun (name, expr) -> Hashtbl.add assoc name (eval expr)) mymodule.assign;
	let edges = List.map (fun name -> (name, Hashtbl.find assoc name)) mymodule.output in
	{
		tacx_name = mymodule.name;
		tacx_man  = man;
		tacx_input= mymodule.input;
		tacx_edges= edges
	}
;;

let my_tacx = upgrade my_verilog;;

Cp.TACX.dumpfile my_tacx.tacx_man (List.map (fun (name, edge) -> edge) my_tacx.tacx_edges) file_out;;

exit 0;;
