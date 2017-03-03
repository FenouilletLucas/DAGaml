let file = Sys.argv.(1) in
let tacx, edges = Nni.TACX_NNI.loadfile file in
let pure = Nni.newman () in
let evaman, mapcalc = Nni.EVAL.newman tacx pure in

let edges = mapcalc edges in
StrTree.tree_print print_string [Nni.EVAL.dump_stat evaman];

let cntman, cntsat = Nni.GroBdd_NNI_CntSat.newman pure in 
print_string "CntSat = [";
List.iter Extra.(cntsat >> (fun x -> BigInt.print x; print_string "; ")) edges;
print_string "];";
print_newline();

let file = Sys.argv.(2) in
Nni.GroBdd_NNI.dumpfile pure edges file;


exit 0;
