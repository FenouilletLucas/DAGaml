module T = Cp.TACX_CP;;

let man = T.newman();;

let ( *! ) = Cp.( *! ) man
and ( &! ) = Cp.( &! ) man
and ( ^! ) = Cp.( ^! ) man;;

let make_const  b n = Cp.TACX_CP.push_leaf (b, MyList.ntimes Types.P n) ();;

let make_ident b n = (make_const b n) *! (make_const (not b) n);;

let push_pass = Cp.push_pass;;

let ( =?? ) = Cp.( =?? );;

let no = Cp.no;;

let c0 = make_const false 0;;
let c1 = make_const true 0;;
let x1 = make_ident false 0;; (* function x -> x *)
let nx1 = make_ident true 0;; (* function x -> -x *)
let x01 = x1 *! x1;; (* function x y -> y *)
let nx01 = nx1 *! nx1;; (* function x y -> -y *)
let x10 = make_ident false 1;;
let nx10 = make_ident true 1;;


let (=!!) = Cp.( =?? );;

assert(c0 &! c0 =!! c0);;
assert(c0 &! c1 =!! c0);;
assert(c1 &! c0 =!! c0);;
assert(c1 &! c1 =!! c1);;

assert(c0 ^! c0 =!! c0);;
assert(c0 ^! c1 =!! c1);;
assert(c1 ^! c0 =!! c1);;
assert(c1 ^! c1 =!! c0);;

assert(nx01 ^! nx10 =!! x01 ^! x10);;

let dump_man = Udag.StrTree.newman ();;

let edges = [nx01; nx10; nx01 ^! nx10; x01; x10; x01 ^! x10];;


let strman = Udag.String.newman ();;
let stredges = Cp.TACX_CP.to_dot man strman edges;;

let stredges = Udag.String.to_dot_file strman stredges "test.dot";;

let dump_edges = T.dump man dump_man edges;;

let dump_edges = Udag.StrTree.dump dump_man dump_edges;;

StrTree.tree_print print_string [dump_edges];;
StrTree.dumpfile [dump_edges] "test.cp.tacx";;

let groman = Cp.newman ();;

let evaman, mapcalc = Cp.EVAL.newman man groman;;

let eval_edges = mapcalc edges;;

let dump_edges = Cp.GroBdd_CP.dump groman dump_man eval_edges;;
let dump_edges = Udag.StrTree.dump dump_man dump_edges;;

StrTree.tree_print print_string [dump_edges];;
StrTree.dumpfile [dump_edges] "test.cp.pure";;

(*StrTree.tree_print print_string [AND.dump_stat and_man; XOR.dump_stat xor_man];;*)

exit 0;;
