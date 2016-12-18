module T = Cp.TACX_CP;;

let man = T.newman();;

let ( *! ) = Cp.( *! ) man
and ( &! ) = Cp.( &! ) man
and ( ^! ) = Cp.( ^! ) man;;

let man = Cp.newman();;

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


let (=!!) (ex, ix) (ey, iy) = match ix, iy with
	| Utils.Leaf (), Utils.Leaf () -> ex = ey
	| Utils.Node nx, Utils.Node ny -> (nx == ny) && (ex = ey)
	| _ -> false
;;

assert(c0 &! c0 =!! c0);;
assert(c0 &! c1 =!! c0);;
assert(c1 &! c0 =!! c0);;
assert(c1 &! c1 =!! c1);;

assert(c0 ^! c0 =!! c0);;
assert(c0 ^! c1 =!! c1);;
assert(c1 ^! c0 =!! c1);;
assert(c1 ^! c1 =!! c0);;

assert(nx01 ^! nx10 =!! x01 ^! x10);;

(*StrTree.tree_print print_string [AND.dump_stat and_man; XOR.dump_stat xor_man];;*)

exit 0;;
