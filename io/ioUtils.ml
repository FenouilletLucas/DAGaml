type module_tacx = {
	tacx_name : string;
	tacx_input: string list;
	tacx_man  : Cp.TACX.manager;
	tacx_edges: (string * Cp.TACX.edge) list;
}

let rec tee stream =
	let rec aux x =
		try
		(
			let char = Stream.next stream in
			print_char char; flush stdout;
			Some char
		)
		with _ -> None
	in Stream.from aux
