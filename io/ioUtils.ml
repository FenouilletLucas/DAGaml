type module_tacx = {
	tacx_name : string;
	tacx_input: string list;
	tacx_man  : Cp.TACX.manager;
	tacx_edges: (string * Cp.TACX.edge) list;
}

type module_tacxB = {
	tacxB_name : string;
	tacxB_input: string list;
	tacxB_man  : CpB.TACX.G1.manager;
	tacxB_edges: (string * CpB.TACX.G0.edge') list;
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
