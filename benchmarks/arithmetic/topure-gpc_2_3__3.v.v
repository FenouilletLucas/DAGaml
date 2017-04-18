// Benchmark "gpc_2_3__3" written by ABC on Sat Apr 23 20:17:56 2016

module gpc_2_3__3 ( 
    a0, a1, a2, a3, a4,
    z0, z1, z2  );
  input  a0, a1, a2, a3, a4;
  output z0, z1, z2;
  wire n9, n10, n11, n12, n13, n14, n15, n17, n18, n19, n20, n21, n23;
  assign n9 = a0 & a2;
  assign n10 = a1 & n9;
  assign n11 = ~a0 & ~a2;
  assign n12 = ~a1 & n11;
  assign n13 = ~a1 & ~n9;
  assign n14 = ~n11 & ~n13;
  assign n15 = ~n12 & ~n14;
  assign z0 = n10 | n15;
  assign n17 = a4 & n14;
  assign n18 = a3 & n17;
  assign n19 = ~a4 & ~n14;
  assign n20 = ~a3 & n19;
  assign n21 = ~a3 & ~n17;
  assign z2 = ~n19 & ~n21;
  assign n23 = ~n20 & ~z2;
  assign z1 = n18 | n23;
endmodule


