open IterExtra

let n = (int_of_string Sys.argv.(1));;

module T = Nni.GroBdd_NNI;;

let man = T.newman ();;

let ( *! ) = T.push man;;

let gen_bnb =
	let push (x, y) = x *! y in
	let ipush (i, xy) =
		if(i mod 1000 = 0) then	(
			print_int i;
			print_string "\r";
			flush stdout;
							);
		push xy
	in
	let rec aux (lx: T.edge Iter.iter) = function
		| 1 ->	Iter.to_list ((Iter.enumerate 0 (lx $* lx)) $$ ipush)
		| n ->	( aux (lx $* lx $$ push) (n-1) )
	in (fun n -> assert(n>0); (fun lx -> aux lx n))
;;

Nni.GroBdd_NNI.dumpfile man (gen_bnb n (Iter.gen_bool $$ (fun b -> Nni.make_const b 0))) Sys.argv.(2);;
print_newline();;
