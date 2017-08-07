type ('edge, 'node) merge =
	| MEdge of 'edge
	| MNode of 'node

type ('return, 'node) pull_request = ('return, 'node -> 'return) merge

type ('edge, 'node) unmerge = ('edge * 'edge, 'node) pull_request

type ('tag, 'edge, 'node) unmerge_tagged = ('tag * 'edge * 'edge, 'node) pull_request

type ('leaf, 'node) gnode =
	| Leaf of 'leaf
	| Node of 'node

let gnode_is_leaf = function
	| Leaf _ -> true
	| Node _ -> false

type ('stop, 'left, 'right, 'both) binpull =
	| MStop of 'stop
	| Go0   of 'left
	| Go1   of 'right
	| MPull	of 'both

type ('return, 'edge, 'node) binpath = ('return, 'edge -> 'return, 'edge -> 'return, 'node -> 'return) binpull

type ('edge, 'cons, 'node) merge3 =
	| M3Edge of 'edge
	| M3Cons of 'cons
	| M3Node of 'node

let pnode_of_node = function
	| Leaf leaf -> Leaf leaf
	| Node node -> Node (None, node)

type ('edge, 'node, 'leaf, 'link) node =
	| TNode of ('node * (('edge, 'node, 'leaf, 'link) edge * ('edge, 'node, 'leaf, 'link) edge))
	| TLeaf of 'leaf
	| TLink of 'link
and  ('edge, 'node, 'leaf, 'link) edge = 'edge * ('edge, 'node, 'leaf, 'link) node

type ('pnode, 'tnode) pt_node =
	| PTree of 'pnode
	| TTree of 'tnode

type stream  = bool list
type 't dump = 't -> stream -> stream
type 't load = stream -> 't  * stream
