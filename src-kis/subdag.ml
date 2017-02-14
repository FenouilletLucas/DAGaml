open Utils

module type MODELE = sig
  type leaf
  type edge
  type node

  type 't gn = (leaf, 't) Utils.gnode
  type 't n = node * 't gn * 't gn
  type 't e = edge * 't gn

  val push : 't e -> 't e -> ('t e, (edge * 't n)) merge
  val pull : 't e -> ('t e, 't n) unmerge

  val pull_node : 't n -> 't e * 't e
  val compose : edge -> 't e -> 't e  

  val dump_leaf : (leaf -> StrTree.tree) option
  val load_leaf : (StrTree.tree -> 't e) option
  val dot_of_leaf : (leaf -> string) option

  val dump_edge : (edge -> StrTree.tree) option
  val load_edge : (StrTree.tree -> edge) option
  val dot_of_edge : (edge -> string) option

  val dump_node : (node -> StrTree.tree) option
  val load_node : (StrTree.tree -> edge * edge) option
  val dot_of_node : (int -> node -> string) option

end


module MODULE(M0:MODELE)
(*:MODULE_SUBDAG with
    type M.node = M0.node
  and type M.edge = M0.edge
  and type M.leaf = M0.leaf *)
=
(* M = Modele *)
struct
  module M = M0
  module MODELE =
  struct
    type leaf = M0.leaf
    type edge = M0.edge
    type node = M0.node

    type 't gn = (leaf, 't) Utils.gnode
    type 't n = node * 't gn * 't gn
    type 't e = edge * 't gn

    let push = M0.push
    let pull = M0.pull
    let pull_node = M0.pull_node
    let compose = M0.compose

    let dump_leaf = None
    let load_leaf = None
    let dot_of_leaf = None

    let dump_edge = None
    let load_edge = None
    let dot_of_edge = None

    let dump_node = None
    let load_node = None
    let dot_of_node = None

  end
  module G = Ubdag.UBDAG(MODELE)

  type edge = M.edge * G.tree

  type manager = G.manager

  let newman = G.newman
  let makeman = G.makeman

  let push_leaf (e:M.edge) (l:M.leaf) = ((e, ((Utils.Leaf l):G.tree)):edge)
  let pull_node man (n:G.pnode) = M.pull_node G.get_ident (G.pull man n)

  let push man x y = match M.push G.get_ident x y with
    | MEdge e -> e
    | MNode (e, (n:G.node)) -> (e, Utils.Node (G.push man (n:G.node)))

  let pull man ((_, n)as e) = match M.pull G.get_ident e with
    | MEdge (x, y) -> (x, y)
    | MNode f -> match n with
      | Utils.Leaf _ -> assert false
      | Utils.Node p -> f(G.pull man p)

  let compose = M.compose G.get_ident

  module type MODELE_NODE_VISITOR =
  sig
    type xnode
    type xedge
    type extra

    val do_leaf : extra -> M.leaf -> xnode
    val do_node : extra -> M.node -> (xnode, xnode -> xnode -> xnode) Utils.merge
    val do_edge : extra -> M.edge -> xnode -> xedge

  end

  module NODE_VISITOR(MV:MODELE_NODE_VISITOR)=
  struct
    type memo = {
      man  : manager;
      extra : D0.extra;
      calc : edge -> D0.xedge;
      memoLeaf: ( M.leaf, MV.xnode) MemoTable.t;
      memoEdge: (   edge, MV.xedge) MemoTable.t;
      memoNode: (G.pnode, MV.xnode) MemoTable.t;
    }

    let makeman man extra hsize =
      let memoLeaf, applyLeaf = MemoTable.create hsize
      and memoEdge, applyEdge = MemoTable.create hsize
      and memoNode, applyNode = MemoTable.create hsize in
      (*HERE*)
      let rec calcrec = function
        | Utils.Leaf leaf -> calcleaf leaf
        | Utils.Node node -> calcnode node
      and    calcedge edge = applyEdge (fun (edge, gnode) -> D0.do_edge extra edge (calcrec gnode)) edge
      and    calcleaf leaf = applyLeaf (D0.do_leaf extra) leaf
      and    calcnode node = applyNode (fun node ->
        let (node:M.node), (nx:G.tree), (ny:G.tree) = G.pull man node in
        match D0.do_node extra node with
        | Utils.MEdge xnode -> xnode
        | Utils.MNode merger -> merger (calcrec nx) (calcrec ny)) node
      in
      {
        man  = man;
        extra = extra;
        calc = calcedge;
        memoLeaf = memoLeaf;
        memoEdge = memoEdge;
        memoNode = memoNode;
      }, calcedge
    let newman man extra = makeman man extra 10000
    let calc man = man.calc
    let dump_stat man = Tree.Node [
      Tree.Node [Tree.Leaf "memo leaf:"; MemoTable.dump_stat man.memoLeaf];
      Tree.Node [Tree.Leaf "memo edge:"; MemoTable.dump_stat man.memoEdge];
      Tree.Node [Tree.Leaf "memo node:"; MemoTable.dump_stat man.memoNode]
    ]
  end

  module type MODELE_EDGE_VISITOR =
  sig
    type xedge
    type extra

    val do_leaf: extra -> M.edge -> M.leaf -> xedge
    val do_node: extra -> M.edge -> (xedge, (xedge -> xedge -> xedge)) Utils.merge
  end


  module EDGE_VISITOR(MV:MODELE_EDGE_VISITOR) =
  struct

    type memo = {
      man     : manager;
      extra   : D0.extra;
      calc    : edge -> MV.xedge;
      memoLeaf: (M.edge * M.leaf,  MV.xedge) MemoTable.t;
      memoNode: (M.edge * G.pnode, MV.xedge) MemoTable.t;
    }

    let makeman man extra hsize=
      let memoLeaf, applyLeaf = MemoTable.create hsize
      and memoNode, applyNode = MemoTable.create hsize in
      let rec calcrec (edge, gnode) = match gnode with
        | Utils.Leaf leaf -> applyLeaf funLeaf (edge, leaf)
        | Utils.Node node -> applyNode funNode (edge, node)
      and funLeaf (edge, leaf) = MV.do_leaf extra edge leaf
      and funNode (edge, node) = match MV.do_node extra edge with
        | Utils.MEdge xedge -> xedge
        | Utils.MNode merger ->
        (
          let edge0, edge1 = pull_node man node in
          merger (calcrec edge0) (calcrec edge1)
        )
      in
      ({
        man  = man;
        extra = extra;
        calc = calcrec;
        memoLeaf = memoLeaf;
        memoNode = memoNode;
      }, calcrec)

    let newman man extra = makeman man extra 10000
    let calc man = man.calc
    let dump_stat man = Tree.Node [
      Tree.Node [Tree.Leaf "man edge leaf:"; MemoTable.dump_stat man.memoLeaf];
      Tree.Node [Tree.Leaf "man edge node:"; MemoTable.dump_stat man.memoNode];
    ]

  end

  module type MODELE_EUOP =
  (* External Unary OPerator *)
  sig
    include Map.OrderedType
    (* t = compact *)
    type transform
    type extern
    type t1
    type t2
    type extra
    val compose : extra -> transform -> extern -> extern
    val  decomp : extra -> G.tree -> t -> t1 * t2 * edge
    val  solver : extra -> t2 -> edge  -> (extern, (transform * (t * G.tree))) Utils.merge
    val  merger : extra -> t1 -> extern -> extern -> extern
  end

  module EUOP(D0:MODELE_EUOP) =
  (* External Unary OPerator *)
  struct
    type ld = M.leaf * D0.t
    module BLD : Map.OrderedType with
      type t = ld
    =
    struct
      type t = ld
      let compare (x, t) (x', t') = match Pervasives.compare x x' with 0 -> (D0.compare t t') | x -> x
    end
    module MEMO0 = Ubdag.M0T(BLD)

    module MEMO1 = G.M1T(D0)
    type memo = {
      man  : manager;
      extra : D0.extra;
      calc : D0.t2 -> edge -> D0.extern;
      memo0  : D0.extern MEMO0.manager;
      memo1  : D0.extern MEMO1.manager;
    }

    let makeman man extra hsize=
      let memo0  = MEMO0.makeman hsize in
      let apply0 : (ld -> D0.extern) -> ld -> D0.extern = MEMO0.apply memo0 in
      let memo1  = MEMO1.makeman hsize in
      let apply1 = MEMO1.apply memo1
      and pull = pull man in
      let rec calcrec t2 x = match D0.solver extra t2 x with
      | Utils.MEdge f -> f
      | Utils.MNode (t, (c, n)) -> D0.compose extra t (match n with
        | Leaf (l:M.leaf) -> (((apply0:(ld->D0.extern)->ld->D0.extern) (fun0:ld->D0.extern) ((l, c):ld)):D0.extern)
        | Node (n:G.pnode) -> (apply1 fun1 (n:G.pnode) c))
      and fun0 ((l, c):ld) = calc c (Leaf l)
      and fun1 n c = calc c (Node n)
      and calc compact node =
        let (t1:D0.t1), (t2:D0.t2), (edge:edge) = D0.decomp extra node compact in
        let f0, f1 = pull edge in
        ((D0.merger extra t1 (calcrec t2 f0) (calcrec t2 f1)):D0.extern)
      in
      ({
        man  = man;
        extra = extra;
        calc = calcrec;
        memo0 = memo0;
        memo1 = memo1;
      }, calcrec)

    let newman man extra = makeman man extra 10000
    let calc man = man.calc
    let dump_stat man = Tree.Node [
      Tree.Node [Tree.Leaf "memo0:"; MEMO0.dump_stat man.memo0];
      Tree.Node [Tree.Leaf "memo1:"; MEMO1.dump_stat man.memo1];
    ]

  end

  module MODELE_DUMP_EDGE : MODELE_EDGE_VISITOR with
      type xedge = Udag.StrTree.edge_t
    and type extra = Udag.StrTree.manager
  =
  struct
    type xedge = Udag.StrTree.edge_t
    type extra = Udag.StrTree.manager

    let dump_edge = match M.dump_edge with
      | None -> (fun _ -> Tree.Node [])
      | Some x -> x
    and dump_leaf = match M.dump_leaf with
      | None -> (fun _ -> Tree.Node [])
      | Some x -> x

    let do_leaf extra edge leaf =
      ((dump_edge edge, Udag.StrTree.Leaf (dump_leaf leaf)):Udag.StrTree.edge_t)

    let do_node extra edge =
      let merger edge0 edge1 =
        ((dump_edge edge, Udag.StrTree.NodeRef (Udag.StrTree.push extra (Tree.Node [], [edge0; edge1]))):Udag.StrTree.edge_t)
      in ((Utils.MNode merger):(xedge, (xedge -> xedge -> xedge))Utils.merge)

  end
  
  module MODELE_DUMP_NODE : MODELE_NODE_VISITOR with
      type xnode = Udag.StrTree.next_t
    and type xedge = Udag.StrTree.edge_t
    and type extra = Udag.StrTree.manager

  =
  struct
    type xnode = Udag.StrTree.next_t
    type xedge = Udag.StrTree.edge_t
    type extra = Udag.StrTree.manager

    let dump_leaf = match M.dump_leaf with
      | Some f -> f
      | None -> (fun _ -> assert false)

    let dump_node = match M.dump_node  with
      | Some f -> f
      | None -> (fun _ -> assert false)

    let dump_edge = match M.dump_edge with
      | Some f -> f
      | None -> (fun _ -> assert false)

    let do_leaf extra leaf = Udag.StrTree.Leaf (dump_leaf leaf)
    let do_node extra node : (xnode, xnode -> xnode -> xnode) Utils.merge =
      let node = dump_node node in
      Utils.MNode(fun son0 son1 -> Udag.StrTree.NodeRef (Udag.StrTree.push extra (node, [(Tree.Node[], son0); (Tree.Node[], son1)])))

    let do_edge (extra:extra) edge son = (Tree.Node [dump_edge edge], son)

  end

  (* module DUMP_EDGE = NODE_VISITOR(MODELE_DUMP_EDGE) *)
  module DUMP_NODE = NODE_VISITOR(MODELE_DUMP_NODE)

  let dump man dump_man : edge list -> MODELE_DUMP_NODE.xedge list =
    let man, calc = DUMP_NODE.makeman man dump_man 10000 in
    List.map calc

  module MODELE_LOAD_NODE : Udag.StrTree.MODELE_VISITOR with
      type xedge = edge
    and type xnode = edge
    and type extra = manager
  =
  struct
    type xedge = edge
    type xnode = edge
    type extra = manager

    let unop default = function Some x -> x | None -> default

    let load_leaf = unop (fun _ -> assert false) M.load_leaf
    let load_edge = unop (fun _ -> assert false) M.load_edge
    let load_node = unop (fun _ -> assert false) M.load_node

    let do_leaf _ leaf = load_leaf leaf
    let do_edge _ = function
      | Tree.Node [] -> (fun xnode -> xnode)
      | Tree.Node [edge] -> (fun xnode -> compose (load_edge edge) xnode)
      |  _ -> assert false
    let do_node man node xedgelist =
      let edgex, edgey = load_node node in
      match xedgelist with
      | [edge0; edge1] -> push man (compose edgex edge0) (compose edgey edge1)
      | _ -> assert false
  end

  module LOAD = Udag.StrTree.VISITOR(MODELE_LOAD_NODE)

  let load man dump_man =
    let man, calc = LOAD.newman dump_man man in
    List.map calc

  module type MODELE_IUOP =
  sig
    include Map.OrderedType
    (* t = compact *)
    type transform
    type t1
    type t2
    val compose : transform -> edge -> edge
    val  decomp : G.tree -> t -> t1 * t2 * edge
    val  solver : t2 -> edge -> (edge, (transform * (t*G.tree))) Utils.merge
    val  merger : t1 -> edge -> edge -> edge
  end


  module IUOP(D0:MODELE_IUOP) =
  (* Internal Unary OPerator *)
  struct
    module MY_MODELE_EUOP : MODELE_EUOP with
        type t = D0.t
      and type transform = D0.transform
      and type extern = edge
      and type t1 = D0.t1
      and type t2 = D0.t2
      and type extra = unit
    =
    struct
      type t = D0.t
      let compare = D0.compare
      type transform = D0.transform
      type extern = edge
      type t1 = D0.t1
      type t2 = D0.t2
      type extra = unit
      let compose () = D0.compose
      let  decomp () = D0.decomp
      let  solver () = D0.solver
      let  merger () = D0.merger
    end

    module MY_EUOP = EUOP(MY_MODELE_EUOP)

    type memo = MY_EUOP.memo

    let makeman  man = MY_EUOP.makeman man (():MY_MODELE_EUOP.extra)
    let newman man  = MY_EUOP.newman man ()
    let dump_stat  = MY_EUOP.dump_stat
    let calc    = MY_EUOP.calc
  end

  module type MODELE_IBOP =
  (* Internal Binary OPerator *)
  sig
    include Map.OrderedType
    (* t = compact *)
    type transform
    val compose : transform -> edge -> edge
    val  decomp : G.tree -> G.tree -> t -> edge * edge
    val  solver : (G.pnode -> G.ident) -> edge * edge -> (edge, (transform * (t*G.tree*G.tree))) Utils.merge
  end

  module IBOP(D0:MODELE_IBOP) =
  (* Internal Binary OPerator *)
  struct
    type lld = (M.leaf * M.leaf) * D0.t
    module LLD : Map.OrderedType with type t = lld =
    struct
      type t = lld
      let compare (x, t) (x', t') = match Pervasives.compare x x' with 0 -> (D0.compare t t') | x -> x
    end
    module MEMO0 = Ubdag.M0T(LLD)

    type bld = (bool * M.leaf) * D0.t
    (* true = Node * Leaf, false = Leaf * Node *)
    module BLD : Map.OrderedType with type t = bld =
    struct
      type t = bld
      let compare (x, t) (x', t') = match Pervasives.compare x x' with 0 -> (D0.compare t t') | x -> x
    end
    module MEMO1 = G.M1T(BLD)

    module MEMO2 = G.M2T(D0)
    type memo = {
      man  : manager;
      calc : edge -> edge -> edge;
      memo0  : edge MEMO0.manager;
      memo1  : edge MEMO1.manager;
      memo2  : edge MEMO2.manager;
    }

    let makeman man hsize=
      let memo0  = MEMO0.makeman hsize in
      let apply0 = MEMO0.apply memo0 in
      let memo1  = MEMO1.makeman hsize in
      let apply1 = MEMO1.apply memo1 in
      let memo2  = MEMO2.makeman hsize in
      let apply2 = MEMO2.apply memo2 in
      let push = push man
      and pull = pull man in
        let rec calcrec (x:edge) (y:edge) = match D0.solver G.get_ident (x, y) with
        | Utils.MEdge f -> f
        | Utils.MNode (t, (c, n1, n2)) -> D0.compose t (match n1, n2 with
          | Leaf l1, Leaf l2 ->   apply0 fun0 ((l1, l2), c)
          | Leaf (l:M.leaf ) , Node (n:G.pnode)  ->   apply1 fun1 n ((false, l), (c:D0.t))
          | Node (n:G.pnode) , Leaf (l:M.leaf )  ->   apply1 fun1 n ((true,  l), c)
          | Node n1, Node n2 ->   apply2 fun2 n1 n2 c)
        and fun0 ((l1, l2), c) = calc c (Leaf l1) (Leaf l2)
        and fun1 n ((b, l), c) = if b
          then calc c (Node n) (Leaf l)
          else calc c (Leaf l) (Node n)
        and fun2 n n' c = calc c (Node n) (Node n')
        and calc compact nx ny =
          let fx, fy = D0.decomp nx ny compact in
          let fx0, fx1 = pull fx
          and fy0, fy1 = pull fy in
          let f0 = calcrec fx0 fy0
          and f1 = calcrec fx1 fy1 in
          push f0 f1
      in
      {
        man  = man;
        calc = calcrec;
        memo0 = memo0;
        memo1 = memo1;
        memo2 = memo2;
      }, calcrec
    let newman man = makeman man 10000
    let calc man = man.calc
    let dump_stat man = Tree.Node [
      Tree.Node [Tree.Leaf "memo0:"; MEMO0.dump_stat man.memo0];
      Tree.Node [Tree.Leaf "memo1:"; MEMO1.dump_stat man.memo1];
      Tree.Node [Tree.Leaf "memo2:"; MEMO2.dump_stat man.memo2]
    ]
  end
end
