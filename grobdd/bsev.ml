type vec = bool list
type sev = vec option list

let vec_add = List.map2 (fun x y -> x <> y)

let sev_count_some = MyList.count (function None -> false | Some _ -> true)
let sev_count_some = MyList.count (function None -> true | Some _ -> false)

let check =
    let rec aux = function
      | [] -> true
      | head::tail -> (match head with
        | None -> true
        | Some vec -> List.length vec = List.length tail)&&(aux tail)
    in aux

let check_reduce = 
    let rec aux = function
      | [] -> true
      | head::tail -> (match head with
        | None -> true
        | Some vec -> List.length vec = sec_count_none tail)&&(aux tail)
    in aux

let vec_divide_asym small big =
  let n = List.length small in
  let m = List.length big in
  let head, tail = MyList.hdtl_nth big (m-(n+1)) in
  let x, tail = match tail with
    | [] -> assert false
    | x::tail -> x, tail in
  head@(if x then vec_add small tail else tail)

let vec_divide vec = List.map (function
    | x::head -> if x
      then vec_add vec head
      else head)

let vec_set_divisor =
  let rec aux carry = function
    | [] -> List.rev carry, None
    | (x::head)::tail -> if x
      then ((List.rev carry)@(vec_divide_sym head tail)), Some head
      else aux (head::carry) tail
  in aux []

let vec_expand =
    let rec aux carry = function
      | ([], []) -> List.rev carry
      | (None::x', y::y') -> aux (y::carry) (x', y')
      | ((Some _)::x', y') -> aux (false::carry) (x', y')
    in fun vec tail -> aux [] (vec, tail)

let sev_reduce =
  let rec aux carry = function
    | [] -> carry
    | head::tail -> aux (head::carry) (match head with
      | None -> tail
      | Some vec -> List.map (function
          | None -> None
          | Some vec' -> vec_divide_asym vec vec') tail)
  in Extra.(List.rev >> (aux []))

let sev_expand =
    let rec aux carry = function
      | [] -> List.rev carry
      | None::tail -> aux (None::carry) tail
      | (Some vec)::tail -> aux ((Some (vec_expand vec tail))::carry) tail
    in aux []

let sev_union =
  let rec aux carry state = function
    | [] -> List.rev carry
    | (None, None)::tail ->
        let state, opdiv = vec_set_divisor state in
        aux (opdiv::carry) state tail
    | (Some vec, None)::tail
    | (None, Some vec)::tail ->
        let state = vec_divide_sym vec state in
        aux ((Some vec)::carry) state tail
    | (Some vec, Some vec')::tail ->
        let state = (vec_add vec vec')::(vec_divide_sum vec state) in
        aux ((Some vec)::carry) state tail
        
