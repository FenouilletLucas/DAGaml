assert(Array.length Sys.argv > 1);
(* TODO: display --help *)

let file = Sys.argv.(2) in
match Sys.argv.(1) with
| "--cp" ->
(
let pure, edges = Cp.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_newline();
let getsize, apply = Cp.GetSize.newman pure in
List.iter apply edges;
print_string "size = "; print_int (Cp.GetSize.get getsize); print_newline();
StrTree.tree_print print_string [Cp.GroBdd.dump_stat pure]
)
| "--cpx" ->
(
let pure, edges = Cpx.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_newline();
let getsize, apply = Cpx.GetSize.newman pure in
List.iter apply edges;
print_string "size = "; print_int (Cpx.GetSize.get getsize); print_newline();
StrTree.tree_print print_string [Cpx.GroBdd.dump_stat pure]
)
| "--nni" ->
(
let pure, edges = Nni.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_newline();
let getsize, apply = Nni.GetSize.newman pure in
List.iter apply edges;
print_string "size = "; print_int (Nni.GetSize.get getsize); print_newline();
StrTree.tree_print print_string [Nni.GroBdd.dump_stat pure]
)
| "--bryant" ->
(
let pure, edges = Bryant.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_newline();
let getsize, apply = Bryant.GetSize.newman pure in
List.iter apply edges;
print_string "size = "; print_int (Bryant.GetSize.get getsize); print_newline();
StrTree.tree_print print_string [Bryant.GroBdd.dump_stat pure]
)
| "--zdd" ->
(
let pure, edges = Zdd.GroBdd.loadfile file in
print_string "#edges = "; print_int (List.length edges); print_newline();
let getsize, apply = Zdd.GetSize.newman pure in
List.iter apply edges;
print_string "size = "; print_int (Zdd.GetSize.get getsize); print_newline();
StrTree.tree_print print_string [Zdd.GroBdd.dump_stat pure]
)
| _ -> assert false;;

exit 0;