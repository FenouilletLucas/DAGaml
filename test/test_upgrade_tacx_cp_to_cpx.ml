assert(Array.length Sys.argv > 2);
(* TODO: display --help *)

let file = Sys.argv.(1) in
let tacx_cp, edges = Cp.TACX.loadfile file in
let tacx_nni = CpxV0.TACX.newman () in
let evaman, mapcalc = CpxV0.TACX_OF_CP.newman tacx_cp tacx_nni in

let edges = mapcalc edges in
StrTree.tree_print print_string [CpxV0.TACX_OF_CP.dump_stat evaman];

let file = Sys.argv.(2) in
CpxV0.TACX.dumpfile tacx_nni edges file;

exit 0;
