// Benchmark "lzd_8" written by ABC on Sat Apr 23 20:17:56 2016

module lzd_8 ( 
    a0, a1, a2, a3, a4, a5, a6, a7,
    z0, z1, z2  );
  input  a0, a1, a2, a3, a4, a5, a6, a7;
  output z0, z1, z2;
  wire n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n25, n26,
    n27, n29;
  assign n12 = a2 & ~a3;
  assign n13 = ~a4 & ~n12;
  assign n14 = ~a5 & ~n13;
  assign n15 = ~a6 & ~n14;
  assign n16 = ~a7 & ~n15;
  assign n17 = ~a2 & ~a3;
  assign n18 = a0 & ~a1;
  assign n19 = ~a6 & ~a7;
  assign n20 = ~a4 & ~a5;
  assign n21 = n19 & n20;
  assign n22 = n18 & n21;
  assign n23 = n17 & n22;
  assign z0 = n16 | n23;
  assign n25 = ~a0 & ~a1;
  assign n26 = n17 & ~n25;
  assign n27 = n20 & ~n26;
  assign z1 = n19 & ~n27;
  assign n29 = n17 & n25;
  assign z2 = n21 & ~n29;
endmodule


