// Benchmark "lzd_16" written by ABC on Sat Apr 23 20:17:58 2016

module lzd_16 ( 
    a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
    z0, z1, z2, z3  );
  input  a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
    a15;
  output z0, z1, z2, z3;
  wire n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
    n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
    n49, n50, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
    n65, n66, n67, n68, n69, n71, n72;
  assign n21 = ~a14 & ~a15;
  assign n22 = ~a12 & ~a13;
  assign n23 = n21 & n22;
  assign n24 = ~a9 & ~a11;
  assign n25 = ~a10 & n24;
  assign n26 = ~a8 & n25;
  assign n27 = n23 & n26;
  assign n28 = ~a5 & ~a7;
  assign n29 = ~a6 & n28;
  assign n30 = ~a4 & n29;
  assign n31 = n27 & n30;
  assign n32 = ~a3 & n31;
  assign n33 = ~a2 & n32;
  assign n34 = a0 & n33;
  assign n35 = ~a1 & n34;
  assign n36 = a2 & n32;
  assign n37 = ~n35 & ~n36;
  assign n38 = a12 & ~a13;
  assign n39 = ~a14 & ~n38;
  assign n40 = ~a15 & ~n39;
  assign n41 = a8 & n25;
  assign n42 = a10 & ~a11;
  assign n43 = ~n41 & ~n42;
  assign n44 = n23 & ~n43;
  assign n45 = ~n40 & ~n44;
  assign n46 = a4 & n27;
  assign n47 = n29 & n46;
  assign n48 = ~a7 & n27;
  assign n49 = a6 & n48;
  assign n50 = ~n47 & ~n49;
  assign n51 = n45 & n50;
  assign z0 = ~n37 | ~n51;
  assign n53 = a1 & n33;
  assign n54 = a9 & ~a11;
  assign n55 = ~a10 & n54;
  assign n56 = n22 & ~n55;
  assign n57 = ~n41 & n56;
  assign n58 = n21 & ~n57;
  assign n59 = a5 & ~a6;
  assign n60 = n48 & n59;
  assign n61 = ~n58 & ~n60;
  assign n62 = ~n47 & n61;
  assign n63 = ~n34 & n62;
  assign z1 = n53 | ~n63;
  assign n65 = a3 & n31;
  assign n66 = ~n53 & ~n65;
  assign n67 = n23 & ~n26;
  assign n68 = ~n36 & ~n67;
  assign n69 = ~n34 & n68;
  assign z2 = ~n66 | ~n69;
  assign n71 = n27 & ~n30;
  assign n72 = n66 & ~n71;
  assign z3 = ~n37 | ~n72;
endmodule


