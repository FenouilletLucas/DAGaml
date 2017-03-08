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
  module M : MODELE = M0
  module MODELE =
  struct
    type leaf = M.leaf
    type edge = M.edge
    type node = M.node

    type 't gn = (leaf, 't) Utils.gnode
    type 't n = node * 't gn * 't gn
    type 't e = edge * 't gn

    let push = M.push
    let pull = M.pull
    let pull_node = M.pull_node
    let compose = M.compose

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
  let pull_node man (n:G.pnode) = M.pull_node  (G.pull man n)

  let push man x y = match M.push  x y with
    | MEdge e -> e
    | MNode (e, (n:G.node)) -> (e, Utils.Node (G.push man (n:G.node)))

  let pull man ((_, n)as e) = match M.pull  e with
    | MEdge (x, y) -> (x, y)
    | MNode f -> match n with
      | Utils.Leaf _ -> assert false
      | Utils.Node p -> f(G.pull man p)

  let compose = M.compose 

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
      extra : MV.extra;
      calc : edge -> MV.xedge;
      memoLeaf: ( M.leaf, MV.xnode) MemoTable.t;
      memoEdge: (   edge, MV.xedge) MemoTable.t;
      memoNode: (G.pnode, MV.xnode) MemoTable.t;
    }

    let makeman man extra hsize =
      let memoLeaf, applyLeaf = MemoTable.make hsize
      and memoEdge, applyEdge = MemoTable.make hsize
      and memoNode, applyNode = MemoTable.make hsize in
      (*HERE*)
      let rec calcrec = function
        | Utils.Leaf leaf -> calcleaf leaf
        | Utils.Node node -> calcnode node
      and    calcedge edge = applyEdge (fun (edge, gnode) -> MV.do_edge extra edge (calcrec gnode)) edge
      and    calcleaf leaf = applyLeaf (MV.do_leaf extra) leaf
      and    calcnode node = applyNode (fun node ->
        let (node:M.node), (nx:G.tree), (ny:G.tree) = G.pull man node in
        match MV.do_node extra node with
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
      extra   : MV.extra;
      calc    : edge -> MV.xedge;
      memoLeaf: (M.edge * M.leaf,  MV.xedge) MemoTable.t;
      memoNode: (M.edge * G.pnode, MV.xedge) MemoTable.t;
    }

    let makeman man extra hsize=
      let memoLeaf, applyLeaf = MemoTable.make hsize
      and memoNode, applyNode = MemoTable.make hsize in
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
    type t
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

  module EUOP(MV:MODELE_EUOP) =
  (* External Unary OPerator *)
  struct

    type memo = {
      man   : manager;
      extra : MV.extra;
      calc  : MV.t2 -> edge -> MV.extern;
      memo  : (MV.t * G.tree, MV.extern) MemoTable.t;
    }

    let makeman man extra hsize=
      let memo, apply = MemoTable.make hsize
      and pull = pull man in
      let rec calcrec t2 x = match MV.solver extra t2 x with
        | Utils.MEdge f -> f
        | Utils.MNode (t, (c, n)) -> MV.compose extra t (apply (fun (compact, node) ->
            let t1, t2, edge = MV.decomp extra node compact in
            let f0, f1 = pull edge in
            (MV.merger extra t1 (calcrec t2 f0) (calcrec t2 f1))) (c, n))
      in
      ({
        man  = man;
        extra = extra;
        calc = calcrec;
        memo = memo;
      }, calcrec)

    let newman man extra = makeman man extra 10000
    let calc man = man.calc
    let dump_stat man = Tree.Node [
      Tree.Node [Tree.Leaf "memo:"; MemoTable.dump_stat man.memo];
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


  module IUOP(MV:MODELE_IUOP) =
  (* Internal Unary OPerator *)
  struct
    module MY_MODELE_EUOP : MODELE_EUOP with
        type t = MV.t
      and type transform = MV.transform
      and type extern = edge
      and type t1 = MV.t1
      and type t2 = MV.t2
      and type extra = unit
    =
    struct
      type t = MV.t
      let compare = MV.compare
      type transform = MV.transform
      type extern = edge
      type t1 = MV.t1
      type t2 = MV.t2
      type extra = unit
      let compose () = MV.compose
      let  decomp () = MV.decomp
      let  solver () = MV.solver
      let  merger () = MV.merger
    end

    module MY_EUOP = EUOP(MY_MODELE_EUOP)

    type memo = MY_EUOP.memo

    let makeman  man  = MY_EUOP.makeman man (():MY_MODELE_EUOP.extra)
    let newman man    = MY_EUOP.newman man ()
    let dump_stat     = MY_EUOP.dump_stat
    let calc          = MY_EUOP.calc
  end

  module type MODELE_IBOP =
  (* Internal Binary OPerator *)
  sig
    type compact
    type cblock = compact * G.tree * G.tree
    type transform
    val compose : transform -> edge -> edge
    val  decomp : cblock -> edge * edge
    val  solver : edge * edge -> (edge, transform * cblock) Utils.merge
  end

  module IBOP(MV:MODELE_IBOP) =
  (* Internal Binary OPerator *)
  struct
    type memo = {
      man  : manager;
      calc : edge -> edge -> edge;
      memo : (edge * edge, edge) MemoTable.t;
    }

    let makeman man hsize=
      let memo, apply = MemoTable.make hsize in
      let push = push man
      and pull = pull man in
        let rec calcrec (x:edge) (y:edge) = match MV.solver (x, y) with
          | Utils.MEdge f -> f
          | Utils.MNode (tra, blk) -> MV.compose tra (reccalc blk)
        and     reccalc blk =
          let fx, fy = MV.decomp blk in
          let fx0, fx1 = pull fx
          and fy0, fy1 = pull fy in
          let f0 = calcrec fx0 fy0
          and f1 = calcrec fx1 fy1 in
          push f0 f1
      in
      {
        man   = man;
        calc  = calcrec;
        memo  = memo;
      }, calcrec
    let newman man = makeman man 10000
    let calc man = man.calc
    let dump_stat man = Tree.Node [
      Tree.Node [Tree.Leaf "memo:"; MemoTable.dump_stat man.memo]
    ]
  end
end
