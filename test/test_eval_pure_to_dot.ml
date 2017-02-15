let file_in = Sys.argv.(2) in
let file_out = Sys.argv.(3) in
let strman = Udag.String.newman () in

let stredges = match Sys.argv.(1) with
| "--nni" ->
(
	let pure, edges = Nni.GroBdd_NNI.loadfile file_in in
	Nni.GroBdd_NNI.to_dot pure strman edges
)
| "--cp" ->
(
	let pure, edges = Cp.GroBdd_CP.loadfile file_in in
	Cp.GroBdd_CP.to_dot pure strman edges
)
| _ -> assert false
in
Udag.String.to_dot_file strman stredges file_out;

exit 0;
