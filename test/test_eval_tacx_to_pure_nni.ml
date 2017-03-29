module T = Nni;;

let file = Sys.argv.(1) in
let tacx, edges = T.TACX.loadfile file in
let pure = T.newman () in
let evaman, mapcalc = T.EVAL.newman tacx pure in

let edges = mapcalc edges in
StrTree.tree_print print_string [
	Tree.Node [
		Tree.Leaf "TACX:";
		Tree.Node [ T.TACX.dump_stat tacx ];
		Tree.Leaf "TOTAL:";
		Tree.Node [ T.GroBdd.dump_stat pure ];
	];
	T.EVAL.dump_stat evaman];

let cntman, cntsat = T.CntSat.newman pure in 
print_string "CntSat = [";
List.iter Extra.(cntsat >> (fun x -> BigInt.print x; print_string "; ")) edges;
print_string "];";
print_newline();

let file = Sys.argv.(2) in
let strman = T.GroBdd.dumpfile pure edges file in

StrTree.tree_print print_string [Tree.Node[Tree.Leaf "FINAL:"; Tree.Node[Udag.StrTree.dump_stat strman]]];


exit 0;
