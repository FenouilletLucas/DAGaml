// Benchmark "mul3" written by ABC on Sat Apr 23 20:17:57 2016

module mul3 ( 
    a0, b0, a1, b1, a2, b2,
    z0, z1, z2, z3, z4, z5  );
  input  a0, b0, a1, b1, a2, b2;
  output z0, z1, z2, z3, z4, z5;
  wire n14, n15, n16, n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
    n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n43, n44,
    n45, n46, n47;
  assign z0 = a0 & b0;
  assign n14 = b0 & a1;
  assign n15 = a0 & b1;
  assign n16 = n14 & n15;
  assign n17 = ~n14 & ~n15;
  assign z1 = ~n16 & ~n17;
  assign n19 = a0 & b2;
  assign n20 = a1 & b1;
  assign n21 = b0 & a2;
  assign n22 = n20 & n21;
  assign n23 = ~n20 & ~n21;
  assign n24 = ~n22 & ~n23;
  assign n25 = n19 & n24;
  assign n26 = ~n19 & ~n24;
  assign n27 = ~n25 & ~n26;
  assign n28 = n16 & n27;
  assign n29 = ~n16 & ~n27;
  assign z2 = ~n28 & ~n29;
  assign n31 = ~n22 & ~n25;
  assign n32 = b1 & a2;
  assign n33 = a1 & b2;
  assign n34 = n32 & n33;
  assign n35 = ~n32 & ~n33;
  assign n36 = ~n34 & ~n35;
  assign n37 = ~n31 & n36;
  assign n38 = n31 & ~n36;
  assign n39 = ~n37 & ~n38;
  assign n40 = n28 & n39;
  assign n41 = ~n28 & ~n39;
  assign z3 = ~n40 & ~n41;
  assign n43 = ~n37 & ~n40;
  assign n44 = a2 & ~n20;
  assign n45 = b2 & n44;
  assign n46 = ~n43 & n45;
  assign n47 = n43 & ~n45;
  assign z4 = ~n46 & ~n47;
  assign z5 = n34 | n46;
endmodule


