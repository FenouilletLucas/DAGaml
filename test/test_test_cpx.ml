open CpxV0Types
open CpxV0Gops

let x = Extra.(Bitv.L.of_hexa_string >> binload_node ) Sys.argv.(1);;
let x0, x1 = node_split x;;
let x01 = solve_cons (fun x -> x) (x0, Utils.Leaf()) (x1, Utils.Leaf());;
assert false
