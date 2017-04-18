open GenLex

let file_in = Sys.argv.(0)
and file_out = Sys.argv.(1);;

let my_lexer stream =
	let kwds = ["assign"; "module"; "endmodule"; "input"; "output"; "wire"; "="; "~"; "&"; "|"; "("; ")"; ";", ","; "1'd0"] in
	make_lexer kwds stream
;;

type uop = PNot | PNop
type bop = PAnd | POr | PIff | PImp
type expr =
	| PVar of string
	| PUop of (uop * expr)
	| PBop of (uop * expr * expr)

let rec parse_leaf stream = match Stream.next stream with
	| Ident var -> PVar var
	| Kwd "(" ->
	(
		let expr = parse_expr stream in
		match Stream.next stream with
			| Kwd ")" -> PUop (Nop, expr)
			| _ -> assert false
	)
	| Kwd "~" ->
	(
		let expr = parse_leaf stream in
		PUop (PNot, expr)
	)
	| _ -> assert false

and     parse_expr stream =
	let first = parse_leaf stream in
	match Stream.next stream with
	| Kwd ";" -> first
	| Kwd "&" ->
	(
		let second = parse_expr stream in
		PBop (PAnd, first, second)
	)
	| Kwd "|" ->
	(
		let second = parse_expr stream in
		PBop (POr, first, second)
	)
	| _ -> assert false
;;

type module_v = {
	name   : string;
	params : string list;
	input  : string list;
	output : string list;
	wire   : string list;
	assign : (string * expr) list;
}

let rec parse_coma_list carry = match Stream.peek stream with
	| Ident ident ->
	(
		Stream.junk stream;
		match Stream.next with
			| Kwd "," -> parse_coma_list (ident::carry) stream
			| _ -> assert false
	)
	| _ -> List.rev carry
;;

let parse_braket_list stream = match Stream.next stream with
	| Kwd "(" ->
	(
		let liste = parse_coma_list stream in
		match Stream.next with
		| Kwd ")" -> liste
		| _ -> assert false
	)
	| _ -> assert false
;;

let parse_semicolon stream = match Stream.next stream with
	| Kwd ";" -> ()
	| _ -> assert false
	

let parse_semicolon_list stream =
	let liste = parse_coma_list stream in
	parse_semilcolon();
	liste
;;

let parse_ident stream = match Stream.next stream with
	| Ident name -> name
	| _ -> assert false
;;

let parse_kwd stream = match Stream.next stream with
	| Kwd kwd -> kwd
	| _ -> assert false
;;

let parse_assign stream =
	let ident = parse_ident stream in
	assert("=" = parse_kwd stream);
	let expr = parse_expr stream in
	(ident, expr)
;;	

let rec parse_module_aux mymodule stream = match Stream.next with
	| Kwd "endmodule" -> mymodule
	| Kwd "input" ->
	(
		let liste = parse_semicolon_list stream in
		let mymodule = {
			name    = mymodule.name;
			params  = mymodule.params;
			intput  = mymodule.input @ liste; 
			output  = mymodule.output;
			wire    = mymodule.wire;
			assigns = mymodule.assigns
		} in
		parse_module_aux mymodule stream
	)
	| Kwd "output" ->
	(
		let liste = parse_semicolon_list stream in
		let mymodule = {
			name    = mymodule.name;
			params  = mymodule.params;
			intput  = mymodule.input; 
			output  = mymodule.output @ liste;
			wire    = mymodule.wire;
			assigns = mymodule.assigns
		} in
		parse_module_aux mymodule stream
	)
	| Kwd "wire" ->
	(
		let liste = parse_semicolon_list stream in
		let mymodule = {
			name    = mymodule.name;
			params  = mymodule.params;
			intput  = mymodule.input; 
			output  = mymodule.output;
			wire    = mymodule.wire @ liste;
			assigns = mymodule.assigns
		} in
		parse_module_aux mymodule stream
	)
	| Kwd "assign" ->
	(
		let assign = parse_assign stream in
		let mymodule = {
			name    = mymodule.name;
			params  = mymodule.params;
			intput  = mymodule.input; 
			output  = mymodule.output;
			wire    = mymodule.wire;
			assigns = mymodule.assigns@[assign];
		} in
		parse_module_aux mymodule stream
	)
	| _ -> assert false


let rec parse_module stream = match Stream.next stream with
	| Kwd "module" ->
	(
		let name = parse_ident stream in
		let params = parse_braket_list stream in
		parse_semicolon stream;
		parse_module_aux {name=name; params=params; input=[]; output=[]; wire=[]; assign=[]}
	)
	| _ -> parse_module stream
