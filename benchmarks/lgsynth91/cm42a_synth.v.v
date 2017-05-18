// Benchmark "CM42" written by ABC on Tue May 16 16:07:47 2017

module CM42 ( 
    a, b, c, d,
    e, f, g, h, i, j, k, l, m, n  );
  input  a, b, c, d;
  output e, f, g, h, i, j, k, l, m, n;
  wire n15, n16, n18, n20, n23, n26, n29, n31;
  assign n15 = ~b & ~c;
  assign n16 = ~a & ~d;
  assign e = ~n15 | ~n16;
  assign n18 = a & ~d;
  assign f = ~n15 | ~n18;
  assign n20 = b & ~c;
  assign g = ~n16 | ~n20;
  assign h = ~n18 | ~n20;
  assign n23 = ~b & c;
  assign i = ~n16 | ~n23;
  assign j = ~n18 | ~n23;
  assign n26 = b & c;
  assign k = ~n16 | ~n26;
  assign l = ~n18 | ~n26;
  assign n29 = ~a & d;
  assign m = ~n15 | ~n29;
  assign n31 = a & d;
  assign n = ~n15 | ~n31;
endmodule


