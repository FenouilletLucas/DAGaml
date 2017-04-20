assert(Array.length Sys.argv > 1);
(* TODO: display --help *)

let file = Sys.argv.(2) in
match Sys.argv.(1) with
| "--cp" ->
(
let tacx, edges = Cp.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Cp.GroBdd.dump_stat tacx]
)
| "--cpx" ->
(
let tacx, edges = Cpx.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Cpx.GroBdd.dump_stat tacx]
)
| "--nni" ->
(
let tacx, edges = Nni.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Nni.GroBdd.dump_stat tacx]
)
| "--bryant" ->
(
let tacx, edges = Bryant.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Bryant.GroBdd.dump_stat tacx]
)
| "--zdd" ->
(
let tacx, edges = Zdd.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Zdd.GroBdd.dump_stat tacx]
)
| _ -> assert false;;

exit 0;
