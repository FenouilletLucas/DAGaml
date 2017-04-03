module T = CpxV0;;

let file = Sys.argv.(1) in
let tacx, edges = T.TACX.loadfile file in
let pure = T.newman () in
let evaman, mapcalc = T.EVALE.newman tacx pure in

print_string "start computation"; print_newline();
let edges = mapcalc edges in
print_string "end of computation"; print_newline();
StrTree.tree_print print_string [
	Tree.Node [
		Tree.Leaf "TACX:";
		Tree.Node [ T.TACX.dump_stat tacx ];
		Tree.Leaf "TOTAL:";
		Tree.Node [ T.GroBdd.dump_stat pure ];
	];
	T.EVALE.dump_stat evaman];

let cntman, cntsat = T.CntSat.newman pure in 
print_string "CntSat = [";
List.iter Extra.(cntsat >> (fun x -> BigInt.print x; print_string "; ")) edges;
print_string "];";
print_newline();

let file = Sys.argv.(2) in
let strman = T.GroBdd.dumpfile pure edges file in

StrTree.tree_print print_string [Tree.Node[Tree.Leaf "FINAL:"; Tree.Node[Udag.StrTree.dump_stat strman]]];


exit 0;
