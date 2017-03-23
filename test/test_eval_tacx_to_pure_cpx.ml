let file = Sys.argv.(1) in
let tacx, edges = CpxV0.TACX.loadfile file in
let pure = CpxV0.newman () in
let evaman, mapcalc = CpxV0.EVAL.newman tacx pure in

let edges = mapcalc edges in
StrTree.tree_print print_string [CpxV0.EVAL.dump_stat evaman];

let cntman, cntsat = CpxV0.CntSat.newman pure in 
print_string "CntSat = [";
List.iter Extra.(cntsat >> (fun x -> BigInt.print x; print_string "; ")) edges;
print_string "];";
print_newline();

let file = Sys.argv.(2) in
CpxV0.GroBdd.dumpfile pure edges file;


exit 0;
