let file = Sys.argv.(1) in
let tacx, edges = Cp.TACX_CP.loadfile file in
let pure = Cp.newman () in
let evaman, mapcalc = Cp.EVAL.newman tacx pure in

let edges = mapcalc edges in
StrTree.tree_print print_string [Cp.EVAL.dump_stat evaman];

let cntman, cntsat = Cp.GroBdd_CP_CntSat.newman pure in 
print_string "CntSat = [";
List.iter Extra.(cntsat >> (fun x -> BigInt.print x; print_string "; ")) edges;
print_string "];";
print_newline();

let file = Sys.argv.(2) in
Cp.GroBdd_CP.dumpfile pure edges file;


exit 0;
