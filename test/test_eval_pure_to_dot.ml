let file = Sys.argv.(1) in
let pure, edges = Cp.GroBdd_CP.loadfile file in
let strman = Udag.String.newman () in
let stredges = Cp.GroBdd_CP.to_dot pure strman edges in
let file = Sys.argv.(2) in
Udag.String.to_dot_file strman stredges file;

exit 0;
