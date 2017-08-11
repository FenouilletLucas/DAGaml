assert(Array.length Sys.argv > 2);
(* TODO: display --help *)

let file = Sys.argv.(1) in
let pure_cp, edges = Cp.GroBdd.loadfile file in
let pure_nni = Cpx.GroBdd.newman () in
let evaman, mapcalc = Cpx.PURE_OF_CP.newman pure_cp pure_nni in

let edges = mapcalc edges in
StrTree.tree_print print_string [Cpx.PURE_OF_CP.dump_stats evaman];

let file = Sys.argv.(2) in
ignore(Cpx.GroBdd.dumpfile pure_nni edges file);

if(Array.length Sys.argv > 3)
then
(
    let strman = Udag.String.newman() in
    let stredges = Cpx.GroBdd.to_dot pure_nni strman edges in
    Udag.String.to_dot_file strman stredges Sys.argv.(3)
);

exit 0;
