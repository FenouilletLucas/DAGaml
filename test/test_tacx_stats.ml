assert(Array.length Sys.argv > 2);
(* TODO: display --help *)

let file = Sys.argv.(2) in
match Sys.argv.(1) with
| "--cp" ->
(
let tacx, edges = Cp.TACX.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Cp.TACX.dump_stat tacx]
)
| "--cpx" ->
(
let tacx, edges = Cpx.TACX.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Cpx.TACX.dump_stat tacx]
)
| "--nni" ->
(
let tacx, edges = Nni.TACX.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Nni.TACX.dump_stat tacx]
)
| "--bryant" -> assert false
(*
let tacx, edges = Bryant.TACX.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Bryant.TACX.dump_stat tacx]
*)
| "--zdd" -> assert false
(*
let tacx, edges = Zdd.TACX.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_string";"; print_newline();
StrTree.tree_print print_string [Zdd.TACX.dump_stat tacx]
*)
| _ -> assert false;;

exit 0;
