open IterExtra

let n = (int_of_string Sys.argv.(1));;

let file = Sys.argv.(2);;
let err_file = Sys.argv.(3);;

module T = CpxV0.GroBdd;;

let man = T.newman ();;

let ( *! ) = T.push man;;

let and_man, ( &! ) = CpxV0.AND.newman man;;
let xor_man, ( ^! ) = CpxV0.XOR.newman man;;

let make_bool b = CpxV0.make_const b 0;;

let gen_bnb =
	let gen_bool = Iter.gen_bool $$ make_bool in
	let rec aux (lx: T.edge Iter.iter) = function
		| 0 ->	lx
		| n ->	( aux (lx $* lx $$ (fun (x, y) -> x *! y)) (n-1) )
	in (fun n -> assert(n>=0); aux gen_bool n)
;;


let count s n f (i, x) =
	if i mod n = 0 then (print_string s; print_int i; print_string "\r"; flush stdout);
	f x
;;

let gn = gen_bnb n;;
let gn2 = gn $* gn;;
let gn22 = gn2 $* gn2;;

print_string "TEST 1.0 : cons is reversible"; print_newline();;
CpxV0.GroBdd.dumpfile man (gn |> Iter.enumerate 0 $$ (count "T:1.0 : " 10000 (fun x -> x)) |> Iter.to_list) file;;
print_newline();;


print_string "TEST 2.0 : and primitives are consistent"; print_newline();;

Iter.iter (fun (x, y) -> assert((make_bool x) &! (make_bool y) = (make_bool (x&&y)));) (Iter.gen_bool $* Iter.gen_bool);;
print_string "TEST 2.1 : and is consistant"; print_newline();;
gn22 |> Iter.enumerate 0 $$ (count "T:2.0 : " 10000 (fun ((x0, x1), (y0, y1)) ->
	let x01 = x0 *! x1
	and y01 = y0 *! y1
	and xy0 = x0 &! y0
	and xy1 = x1 &! y1 in
	let calcX = x01 &! y01
	and calcY = xy0 *! xy1 in
	assert(calcX = calcY);
	)) |> Iter.iter ignore;;
print_newline();;
print_string "TEST 3.0 : xor is consistant"; print_newline();;
gn22 |> Iter.enumerate 0 $$ (count "T:2.0 : " 10000 (fun ((x0, x1), (y0, y1)) ->
	let x01 = x0 *! x1
	and y01 = y0 *! y1
	and xy0 = x0 ^! y0
	and xy1 = x1 ^! y1 in
	let calcX = x01 ^! y01
	and calcY = xy0 *! xy1 in
	if (calcX <> calcY)
	then
	(
		let edges = [x0; x1; y0; y1; x01; y01; xy0; xy1; calcX; calcY] in
		(*let strman = Udag.String.newman () in
		let stredges = CpxV0.GroBdd.to_dot man strman edges in
		Udag.String.to_dot_file strman stredges err_file;*)
		ignore(CpxV0.GroBdd.dumpfile man edges err_file);
		assert false;
	);
	)) |> Iter.iter ignore;;
print_newline();;
