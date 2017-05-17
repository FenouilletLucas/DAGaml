// Benchmark "CM42" written by ABC on Tue May 16 16:07:47 2017

module CM42 ( 
    a, b, c, d,
    e, f, g, h, i, j, k, l, m, n  );
  input  a, b, c, d;
  output e, f, g, h, i, j, k, l, m, n;
  wire n15, n16, n18, n20, n22, n24, n29, n30;
  assign n15 = ~c & ~d;
  assign n16 = ~a & ~b;
  assign e = ~n15 | ~n16;
  assign n18 = a & ~b;
  assign f = ~n15 | ~n18;
  assign n20 = ~a & b;
  assign g = ~n15 | ~n20;
  assign n22 = a & b;
  assign h = ~n15 | ~n22;
  assign n24 = ~d & ~n15;
  assign i = ~n16 | ~n24;
  assign j = ~n18 | ~n24;
  assign k = ~n20 | ~n24;
  assign l = ~n22 | ~n24;
  assign n29 = ~b & ~c;
  assign n30 = d & n29;
  assign m = a | ~n30;
  assign n = ~a | ~n30;
endmodule


