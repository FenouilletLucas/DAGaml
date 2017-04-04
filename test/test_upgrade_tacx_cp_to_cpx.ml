assert(Array.length Sys.argv > 2);
(* TODO: display --help *)

let file = Sys.argv.(1) in
let tacx_cp, edges = Cp.TACX.loadfile file in
let tacx_nni = Cpx.TACX.newman () in
let evaman, mapcalc = Cpx.TACX_OF_CP.newman tacx_cp tacx_nni in

let edges = mapcalc edges in
StrTree.tree_print print_string [Cpx.TACX_OF_CP.dump_stat evaman];

let file = Sys.argv.(2) in
Cpx.TACX.dumpfile tacx_nni edges file;

exit 0;
