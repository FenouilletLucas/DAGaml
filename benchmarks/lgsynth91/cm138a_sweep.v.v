// Benchmark "CM138" written by ABC on Tue May 16 16:07:46 2017

module CM138 ( 
    a, b, c, d, e, f,
    g, h, i, j, k, l, m, n  );
  input  a, b, c, d, e, f;
  output g, h, i, j, k, l, m, n;
  wire n15, n16, n17, n18, n20, n21, n23, n24, n26, n27, n29, n31, n33, n35;
  assign n15 = ~e & ~f;
  assign n16 = d & n15;
  assign n17 = ~a & ~b;
  assign n18 = ~c & n17;
  assign g = ~n16 | ~n18;
  assign n20 = a & ~b;
  assign n21 = ~c & n20;
  assign h = ~n16 | ~n21;
  assign n23 = ~a & b;
  assign n24 = ~c & n23;
  assign i = ~n16 | ~n24;
  assign n26 = a & b;
  assign n27 = ~c & n26;
  assign j = ~n16 | ~n27;
  assign n29 = c & n17;
  assign k = ~n16 | ~n29;
  assign n31 = c & n20;
  assign l = ~n16 | ~n31;
  assign n33 = c & n23;
  assign m = ~n16 | ~n33;
  assign n35 = c & n26;
  assign n = ~n16 | ~n35;
endmodule


