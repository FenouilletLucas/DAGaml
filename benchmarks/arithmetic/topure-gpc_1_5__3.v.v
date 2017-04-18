// Benchmark "gpc_1_5__3" written by ABC on Sat Apr 23 20:17:57 2016

module gpc_1_5__3 ( 
    a0, a1, a2, a3, a4, a5,
    z0, z1, z2  );
  input  a0, a1, a2, a3, a4, a5;
  output z0, z1, z2;
  wire n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n24,
    n25, n26, n27, n28, n29, n30, n32;
  assign n10 = a2 & a4;
  assign n11 = a3 & n10;
  assign n12 = ~a2 & ~a4;
  assign n13 = ~a3 & n12;
  assign n14 = ~a3 & ~n10;
  assign n15 = ~n12 & ~n14;
  assign n16 = ~n13 & ~n15;
  assign n17 = ~n11 & ~n16;
  assign n18 = a1 & ~n17;
  assign n19 = ~a1 & n17;
  assign n20 = ~n18 & ~n19;
  assign n21 = ~a0 & ~n20;
  assign n22 = a0 & n20;
  assign z0 = ~n21 & ~n22;
  assign n24 = ~a0 & ~n18;
  assign n25 = ~n19 & ~n24;
  assign n26 = a5 & n25;
  assign n27 = ~a5 & ~n25;
  assign n28 = ~n26 & ~n27;
  assign n29 = n15 & ~n28;
  assign n30 = ~n15 & n28;
  assign z1 = n29 | n30;
  assign n32 = ~n15 & ~n26;
  assign z2 = ~n27 & ~n32;
endmodule


