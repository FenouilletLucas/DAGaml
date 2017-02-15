assert(Array.length Sys.argv > 2);
(* TODO: display --help *)

let file = Sys.argv.(1) in
let tacx_cp, edges = Cp.TACX_CP.loadfile file in
let tacx_nni = Nni.TACX_NNI.newman () in
let evaman, mapcalc = Nni.TACX_NNI_OF_CP.newman tacx_cp tacx_nni in

let edges = mapcalc edges in
StrTree.tree_print print_string [Nni.TACX_NNI_OF_CP.dump_stat evaman];

let file = Sys.argv.(2) in
Nni.TACX_NNI.dumpfile tacx_nni edges file;

exit 0;
