open Subdag

module UnitH : MODELE_SUBDAG with
		type node = unit
	and	type edge = unit
	and type leaf = unit
=
struct
	
	type node = unit
	type edge = unit
	type leaf = unit

	type 't gn = (leaf, 't) Utils.gnode
	type 't n = node * 't gn * 't gn	
	type 't e = edge * 't gn

	let push _ (((), nx):'t e) (((), ny): 't e) = Utils.MNode ((():edge), (((), nx, ny):'t n))
	let pull _ (((), nx):'t e) = match nx with
		| Utils.Leaf ()	-> assert false
		| Utils.Node n	-> Utils.RNode (fun (((), nx, ny):'t n) -> (((), nx):'t e), (((), ny): 't e))
	let pull_node _ (((), nx, ny):'t n) = ((((), nx):'t e), (((), ny):'t e))
	let compose _ (():edge) (x:'t e)  = x
	
end;;

module T = SUBDAG(UnitH);;

let man = T.newman();;

let x = T.push_leaf (():UnitH.edge) (():UnitH.leaf);;
let y = T.push man x x;;
let z = T.push man x y;;
let z' = T.push man y x;;

assert(T.pull man z' = (y, x));;
assert(T.pull man z  = (x, y));;
assert(T.pull man y  = (x, x));;
assert(x = ((), Utils.Leaf ()));;

module IBA_M : T.MODELE_IBOP =
struct
	type t = unit
	let compare () () = 0
	type transform = unit
	let compose () x = x
	let decomp x y () = (((), x), ((), y))
	let solver = function
		| (((), Utils.Leaf ()):T.edge), ((), y)
		| ((), y), (((), Utils.Leaf ()):T.edge) -> Utils.MEdge ((), y)
		| ((), x), ((), y) -> Utils.MNode ((), ((), x, y))
end;;

module IBA = T.IBOP(IBA_M);;

let iba_man, iba = IBA.newman man;;
let xy = iba x y;;
let yy = iba y y;;
StrTree.tree_print print_string [IBA.dump_stat iba_man];;

exit 0;;
