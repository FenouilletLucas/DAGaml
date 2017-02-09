module type MODULE_UBDAG =
sig
  module H:Udag.UDAG_HEADER

  type ident

  type tree  = (H.leaf, pnode) Utils.gnode
  and  node  = H.node * tree * tree
  and  pnode

  val get_ident : pnode -> ident

  val equal_tree : tree -> tree -> bool
  val cmp_tree   : tree -> tree -> bool option
  val equal_node : node -> node -> bool
  val cmp_node   : node -> node -> bool option

  type manager

  val makeman : int -> manager

  val newman : unit -> manager
  val push : manager -> node -> pnode
  val pull : manager -> pnode -> node

end


module UBDAG(H0:Udag.UDAG_HEADER) : MODULE_UBDAG with
    type H.node = H0.node
  and type H.leaf = H0.leaf
=
struct
  type ident = int

  module H = H0
  type tree  = (H.leaf, pnode) Utils.gnode
  and  node  = (H.node * tree * tree)
  and  pnode = ident

  let get_ident pnode = pnode.ident
  
  let equal_tree x y = match x, y with
    | Utils.(Leaf x, Leaf y) -> x = y
    | Utils.(Node x, Node y) -> x = y
    | _ -> false

  let cmp x y =
    (* Some false => x < y
     * None       => x = y
     * Some true  => x > y
     *)
    if x = y
    then None
    else Some ( x > y )

  let cmp_tree x y = match x, y with (* Leaf < Node *)
    | Utils.(Leaf x, Leaf y) -> cmp x y
    | Utils.(Node x, Node y) -> cmp x y
    | Utils.Node _, Utils.Leaf _ -> Some true
    | Utils.Leaf _, Utils.Node _ -> Some false

  let equal_node (d, t0, t1) (d', t0', t1') =
    (d = d')&&(equal_tree t0 t0')&&(equal_tree t1 t1')

  let cmp_node (d, t0, t1) (d', t0', t1') =
      match cmp d d' with
      | Some x  -> Some x
      | None    -> match cmp_tree t0 t0' with
      | Some x  -> Some x
      | None    -> cmp_tree t1 t1'

  (* let dump man ed *)

  type manager = {
    unique = (node, pnode) H2Table.t;
  }

  let makeman hsize = {
    unique = H2Table.create hsize;
  }

  let default_newman_hsize = 10000

  let newman () = makeman default_newman_hsize
  let push man node = H2Table.push man.unique node

  let pull man pnode = H2Table.pull man.unique pnode


end

