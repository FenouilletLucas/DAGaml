##NEXT NEXT
- separate versions which uses Ephemeron from version which do not, e.g. hsrc vs esrc
- implement trees & rename src -> dag
- implement an iterable version of each data structure ?
-- list -> iter (done)
-- tree -> iter-tree (doable)
-- dag  -> iter-dag (thinking in progress)
-- rdag -> iter-rdag
-- graph -> iter-graph
-- digraph -> iter-digraph


##TODO

#UDAG
- add a binary dump to UDAG
- NEXT: implement a version of UDAG which uses Ephemeron

#(S)UBDAG.ml
- add a binary dump to UBDAG
- NEXT: implement SUBDAG as an upgraded special case of taggedSUBDAG
	-- NB: ( taggedSUBDAG --> SUBDAG ) and ( SUBDAG --> notagSUBDAG )
- NEXT: implement a version of (S)UBDAG which does not uses Ephemeron

#Tools
- add binary tree
- add tree iterator
