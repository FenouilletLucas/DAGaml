let file = Sys.argv.(1) in
let tacx, edges = Cp.TACX_CP.loadfile file in
let pure = Cp.newman () in
let evaman, mapcalc = Cp.EVAL.newman tacx pure in
let edges = mapcalc edges in
let file = Sys.argv.(2) in
Cp.GroBdd_CP.dumpfile pure edges file;

exit 0;
