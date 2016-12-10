type ('edge, 'node) merge =
	| MEdge of 'edge
	| MNode of 'node

type ('edge, 'node) unmerge =
	| REdge of 'edge * 'edge
	| RNode of ('node -> 'edge * 'edge)

type ('leaf, 'node) gnode =
	| Leaf of 'leaf
	| Node of 'node
