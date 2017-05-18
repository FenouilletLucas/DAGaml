// Benchmark "CM138" written by ABC on Tue May 16 16:07:46 2017

module CM138 ( 
    a, b, c, d, e, f,
    g, h, i, j, k, l, m, n  );
  input  a, b, c, d, e, f;
  output g, h, i, j, k, l, m, n;
  wire n15, n16, n17, n18, n20, n22, n25, n28;
  assign n15 = ~e & ~f;
  assign n16 = d & n15;
  assign n17 = ~a & n16;
  assign n18 = ~b & ~c;
  assign g = ~n17 | ~n18;
  assign n20 = a & n16;
  assign h = ~n18 | ~n20;
  assign n22 = b & ~c;
  assign i = ~n17 | ~n22;
  assign j = ~n20 | ~n22;
  assign n25 = ~b & c;
  assign k = ~n17 | ~n25;
  assign l = ~n20 | ~n25;
  assign n28 = b & c;
  assign m = ~n17 | ~n28;
  assign n = ~n20 | ~n28;
endmodule


