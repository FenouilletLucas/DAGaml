// Benchmark "b1" written by ABC on Tue May 16 16:07:44 2017

module b1 ( 
    a, b, c,
    d, e, f, g  );
  input  a, b, c;
  output d, e, f, g;
  wire n8, n9, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;
  assign n8 = ~a & ~b;
  assign n9 = a & b;
  assign e = ~n8 & ~n9;
  assign n11 = ~b & ~c;
  assign n12 = ~a & ~c;
  assign n13 = b & c;
  assign n14 = a & c;
  assign n15 = a & ~b;
  assign n16 = ~a & b;
  assign n17 = ~n15 & ~n16;
  assign n18 = ~n14 & n17;
  assign n19 = ~n13 & n18;
  assign n20 = ~n12 & n19;
  assign f = ~n11 & n20;
  assign g = ~c;
  assign d = c;
endmodule


