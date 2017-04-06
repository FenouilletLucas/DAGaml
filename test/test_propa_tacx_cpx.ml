assert(Array.length Sys.argv > 2);
(* TODO: display --help *)

let file_in = Sys.argv.(1) in
let file_out = Sys.argv.(2) in

let tacx, edges = Cpx.TACX.loadfile file_in in
let pman, propa = Cpx.TACX_PROPA.newman tacx in
let edges = List.map propa edges in

StrTree.tree_print print_string [Cpx.TACX_PROPA.dump_stat pman];

Cpx.TACX.dumpfile tacx edges file_out;

if(Array.length Sys.argv > 3)
then
(
    let strman = Udag.String.newman() in
    let stredges = Cpx.TACX.to_dot tacx strman edges in
    Udag.String.to_dot_file strman stredges Sys.argv.(3)
);

exit 0;
