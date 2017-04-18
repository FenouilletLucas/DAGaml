// Benchmark "rca_4" written by ABC on Sat Apr 23 20:17:57 2016

module rca_4 ( 
    a0, b0, a1, b1, a2, b2, a3, b3,
    s0, s1, s2, s3, s4  );
  input  a0, b0, a1, b1, a2, b2, a3, b3;
  output s0, s1, s2, s3, s4;
  wire n14, n15, n17, n18, n19, n20, n21, n23, n24, n25, n26, n27, n28, n30,
    n31, n32, n33, n34, n35;
  assign n14 = a0 & b0;
  assign n15 = ~a0 & ~b0;
  assign s0 = ~n14 & ~n15;
  assign n17 = a1 & b1;
  assign n18 = ~a1 & ~b1;
  assign n19 = ~n17 & ~n18;
  assign n20 = n14 & n19;
  assign n21 = ~n14 & ~n19;
  assign s1 = ~n20 & ~n21;
  assign n23 = ~n17 & ~n20;
  assign n24 = a2 & b2;
  assign n25 = ~a2 & ~b2;
  assign n26 = ~n24 & ~n25;
  assign n27 = ~n23 & n26;
  assign n28 = n23 & ~n26;
  assign s2 = ~n27 & ~n28;
  assign n30 = ~n24 & ~n27;
  assign n31 = a3 & b3;
  assign n32 = ~a3 & ~b3;
  assign n33 = ~n31 & ~n32;
  assign n34 = ~n30 & n33;
  assign n35 = n30 & ~n33;
  assign s3 = ~n34 & ~n35;
  assign s4 = n31 | n34;
endmodule


