(* All Right Reserved

   Copyright (c) 2017 Joan Thibault & Lucas Fenouillet
*)

(* Data Structure  *)
type node = int
type graph = {nodes : node list; edges : node list array } (* G = (V, E)*)

(* Exemples  *)
let ex_E = [| 
	[0;2;4];
	[0;1];
	[1;2;3];
	[3];
	[0;4] 
|]

let ex_G = {nodes = [0;1;2;3;4]; edges = ex_E}

let ex_X = [2;3]

(* Tools *)

let sorted : 'a list -> bool =
(* return true iff the input list is sorted *)
(* Time Complexity O(n) *)
	let rec aux x = function
		| [] -> true
		| y::t -> (x<y)&&(aux y t)
	in function
	| [] -> true
	| x::t -> (0<=x)&&(aux x t)

let sort_uniq : int list -> int list = List.sort_uniq Pervasives.compare

let inter lX lY =
(* return [lX] inter [lY] *)
(* Time Complexity O(nX+nY) *)
	let rec aux carry = function
		| ([], _) | (_, []) ->
			(List.rev carry)
		| (x::x', y::y') -> if x = y
			then (aux (x::carry) (x', y'))
			else (aux carry (if x < y
			then (x', y::y')
			else (x::x', y')))
	in aux [] (lX, lY)

let nointer lX lY =
(* returns (lX inter lY) = emptyset *)
(* Time Complexity O(nX+nY) *)
	let rec aux = function
		| ([], _) | (_, []) -> false
		| (x::x', y::y') ->
			(x<>y)&&(aux (if x < y
			then (x', y::y')
			else (x::x', y')))
	in aux (lX, lY)

let subset_of lX lY =
(* return true iff [lX] is a subset of [lY] *)
(* Time Complexity O(nX+nY) *)
	let rec aux = function
		| ([], _) -> true
		| (_, []) -> false
		| (x::x', y::y') -> if x = y
			then (aux (x', y'))
			else ((x<y)&&(aux (x', y::y')))
	in aux (lX, lY)

let union lX lY : _ list =
(* merges two already sorted list and returns a sorted list *)
(* removes duplicates *)
(* Time Complexity O(nX + nY) *)
	let rec aux carry = function
	| ([], l) | (l, []) -> (List.rev carry)@l
	| (x::x', y::y') -> if x = y
		then aux (x::carry) (x', y')
		else if x < y
		then aux (x::carry) (x', y::y')
		else aux (y::carry) (x::x', y')
	in
	aux [] (lX, lY)

let check graph =
(* returns true iff the graph [graph] is properly formed *)
(* Time Complexity O(n^2) *)
	let check_nodes nodes =
		(sorted nodes)&&(subset_of nodes graph.nodes)
	in
	(sorted graph.nodes)&&
	(
		let seq = Array.map (fun nodes -> nodes = []) graph.edges in
		List.iter (fun node -> seq.(node) <- true) graph.nodes;
		Array.for_all (fun x -> x) seq
	)&&
	(Array.for_all check_nodes graph.edges)

let reduce graph =
(* remove replicates *)
(* Time Complexity O(n^2.log(n)) *)
{
	nodes = List.sort_uniq Pervasives.compare graph.nodes;
	edges = Array.map (List.sort_uniq Pervasives.compare) graph.edges
}


let minus lX lY =
(* returns [lX] - [lY] *)
(* Time Complexity O(nX+nY) *)
	let rec aux carry = function
		| ([], _) -> []
		| (x, []) -> (List.rev carry)@x
		| (x::x', y::y') -> if x = y
			then (aux carry (x', y'))
			else if x < y
			then (aux (x::carry) (x', y::y'))
			else (aux carry (x', y'))
	in aux [] (lX, lY)

(* specific tools for graphs *)

let voisins graph set =
(* returns the neighbourhood of [set] in [graph] *)
(* Time Complexity O( #edges( set - * ) + n ) = O(n^2)
	with #edges( set - * ) is the number of edges linked to set
*)
	let vect = Array.make (Array.length graph.edges) false in
	let set x = vect.(x) <- true in
	List.iter (fun x -> List.iter set graph.edges.(x)) graph.nodes;
	let temp0 = Array.mapi (fun i x -> if x then (Some i) else None) vect in
	let temp1 = Array.to_list temp0 in
	let temp2 = MyList.unop temp1 in
	temp2

let _ = voisins ex_G ex_X (* [1;2;3] *)

let voisins_strict graph set =
(* returns the strict neighbourhood of [set] in [graph] *)
(* Time Complexity O(n^2) *)
	minus (voisins graph set) set

let _ = voisins_strict ex_G ex_X

let cost_S graph set =
(* Cost of S *)
(* Time Complexity O(n^2) *)
	let voisins = voisins graph set in
	let card_Nx = List.length voisins in
	BigInt.(shift_left unit card_Nx)

let _ = cost_S ex_G ex_X   (* 2^3 = 8 *) 

let function_S graph set =
(* apply S *)
(* Time Complexity O(n^2) *)
	let edges = Array.copy graph.edges in
	(* removes nodes in [set] from [graph] *)
	let nodes = minus graph.nodes set in

	(* removes obsolete edges *)
	List.iter (fun node -> edges.(node) <- []) set;
	
	let voisins = voisins_strict graph set in
	(* removes obsolete edges, add clique between nodes of the strict neighbourhood *)
	List.iter (fun node -> edges.(node) <- inter (union edges.(node) voisins) nodes) voisins;
	
	(cost_S graph set, {nodes; edges})

let _ = function_S ex_G ex_X

let function_SS g seq =
(* SS(g, Xk::X(k-1):: ... ::X1::X0) *)
	List.fold_right (fun x (c, g) -> let c', g' = function_S g x in (BigInt.(c+c'), g')) seq (BigInt.zero, g)

let _ = function_SS ex_G [ex_X]
