module T = CpB;;

let file = Sys.argv.(1) in
let tacx, edges = T.TACX.loadfile file in
let pure = T.newman () in
let evaman = T.TACX.COMPILE.newman tacx pure in
let mapcalc = List.map (T.TACX.COMPILE.rec_edge evaman) in

let edges = mapcalc edges in
StrTree.tree_print print_string [
	Tree.Node [
		Tree.Leaf "TACX:";
		Tree.Node [ T.TACX.G1.dump_stats tacx ];
		Tree.Leaf "TOTAL:";
		Tree.Node [ T.GroBdd.G1.dump_stats pure.T.GroBdd.cons ];
	];
	T.TACX.COMPILE.dump_stats evaman];

(*let cntman, cntsat = T.CntSat.newman pure in 
print_string "CntSat = [";
List.iter Extra.(cntsat >> (fun x -> BigInt.print x; print_string "; ")) edges;
print_string "];";
print_newline();
*)

let file = Sys.argv.(2) in
T.GroBdd.dumpfile pure.T.GroBdd.cons edges file;

(*StrTree.tree_print print_string [Tree.Node[Tree.Leaf "FINAL:"; Tree.Node[Udag.StrTree.dump_stats strman]]];*)


exit 0;;
