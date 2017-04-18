// Benchmark "gpc_0_6__3" written by ABC on Sat Apr 23 20:17:57 2016

module gpc_0_6__3 ( 
    a0, a1, a2, a3, a4, a5,
    z0, z1, z2  );
  input  a0, a1, a2, a3, a4, a5;
  output z0, z1, z2;
  wire n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
    n24, n25, n27, n28, n29, n30, n31, n32, n33, n35;
  assign n10 = a1 & a3;
  assign n11 = a2 & n10;
  assign n12 = ~a1 & ~a3;
  assign n13 = ~a2 & n12;
  assign n14 = ~a2 & ~n10;
  assign n15 = ~n12 & ~n14;
  assign n16 = ~n13 & ~n15;
  assign n17 = ~n11 & ~n16;
  assign n18 = a0 & ~n17;
  assign n19 = ~a0 & n17;
  assign n20 = ~n18 & ~n19;
  assign n21 = a4 & a5;
  assign n22 = ~a4 & ~a5;
  assign n23 = ~n21 & ~n22;
  assign n24 = ~n20 & n23;
  assign n25 = n20 & ~n23;
  assign z0 = n24 | n25;
  assign n27 = ~n19 & n23;
  assign n28 = ~n18 & ~n27;
  assign n29 = n15 & ~n28;
  assign n30 = ~n15 & n28;
  assign n31 = ~n29 & ~n30;
  assign n32 = ~n21 & ~n31;
  assign n33 = n21 & n31;
  assign z1 = ~n32 & ~n33;
  assign n35 = ~n21 & ~n29;
  assign z2 = ~n30 & ~n35;
endmodule


