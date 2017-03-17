assert(Array.length Sys.argv > 2);
(* TODO: display --help *)

let file = Sys.argv.(1) in
let tacx_cp, edges = Cp.TACX.loadfile file in
let tacx_nni = Nni.TACX.newman () in
let evaman, mapcalc = Nni.TACX_OF_CP.newman tacx_cp tacx_nni in

let edges = mapcalc edges in
StrTree.tree_print print_string [Nni.TACX_OF_CP.dump_stat evaman];

let file = Sys.argv.(2) in
Nni.TACX.dumpfile tacx_nni edges file;

exit 0;
