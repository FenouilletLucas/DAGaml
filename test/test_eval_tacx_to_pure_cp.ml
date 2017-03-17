let file = Sys.argv.(1) in
let tacx, edges = Cp.TACX.loadfile file in
let pure = Cp.newman () in
let evaman, mapcalc = Cp.PURE_OF_TACX.newman tacx pure in

let edges = mapcalc edges in
StrTree.tree_print print_string [Cp.PURE_OF_TACX.dump_stat evaman];

let cntman, cntsat = Cp.CntSat.newman pure in 
print_string "CntSat = [";
List.iter Extra.(cntsat >> (fun x -> BigInt.print x; print_string "; ")) edges;
print_string "];";
print_newline();

let file = Sys.argv.(2) in
Cp.GroBdd.dumpfile pure edges file;


exit 0;
