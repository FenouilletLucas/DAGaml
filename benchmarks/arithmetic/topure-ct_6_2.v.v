// Benchmark "ct_6_2" written by ABC on Sat Apr 23 20:17:58 2016

module ct_6_2 ( 
    a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5,
    z0, z1, z2, z3, z4, z5  );
  input  a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5;
  output z0, z1, z2, z3, z4, z5;
  wire n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
    n33, n34, n36, n37, n38, n39, n40, n41, n42, n44, n45, n46, n47, n48,
    n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
    n63, n64, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n77, n78,
    n80;
  assign n19 = a1 & a3;
  assign n20 = a2 & n19;
  assign n21 = ~a1 & ~a3;
  assign n22 = ~a2 & n21;
  assign n23 = ~a2 & ~n19;
  assign n24 = ~n21 & ~n23;
  assign n25 = ~n22 & ~n24;
  assign n26 = ~n20 & ~n25;
  assign n27 = a0 & ~n26;
  assign n28 = ~a0 & n26;
  assign n29 = ~n27 & ~n28;
  assign n30 = a4 & a5;
  assign n31 = ~a4 & ~a5;
  assign n32 = ~n30 & ~n31;
  assign n33 = ~n29 & n32;
  assign n34 = n29 & ~n32;
  assign z0 = n33 | n34;
  assign n36 = ~n28 & n32;
  assign n37 = ~n27 & ~n36;
  assign n38 = n24 & ~n37;
  assign n39 = ~n24 & n37;
  assign n40 = ~n38 & ~n39;
  assign n41 = ~n30 & ~n40;
  assign n42 = n30 & n40;
  assign z1 = ~n41 & ~n42;
  assign n44 = b1 & b3;
  assign n45 = b2 & n44;
  assign n46 = ~b1 & ~b3;
  assign n47 = ~b2 & n46;
  assign n48 = ~b2 & ~n44;
  assign n49 = ~n46 & ~n48;
  assign n50 = ~n47 & ~n49;
  assign n51 = ~n45 & ~n50;
  assign n52 = b0 & ~n51;
  assign n53 = ~b0 & n51;
  assign n54 = ~n52 & ~n53;
  assign n55 = b4 & b5;
  assign n56 = ~b4 & ~b5;
  assign n57 = ~n55 & ~n56;
  assign n58 = ~n54 & n57;
  assign n59 = n54 & ~n57;
  assign n60 = ~n58 & ~n59;
  assign n61 = ~n30 & ~n38;
  assign n62 = ~n39 & ~n61;
  assign n63 = ~n60 & n62;
  assign n64 = n60 & ~n62;
  assign z2 = ~n63 & ~n64;
  assign n66 = ~n53 & n57;
  assign n67 = ~n52 & ~n66;
  assign n68 = n49 & ~n67;
  assign n69 = ~n49 & n67;
  assign n70 = ~n68 & ~n69;
  assign n71 = ~n55 & ~n70;
  assign n72 = n55 & n70;
  assign n73 = ~n71 & ~n72;
  assign n74 = n63 & n73;
  assign n75 = ~n63 & ~n73;
  assign z3 = ~n74 & ~n75;
  assign n77 = ~n55 & ~n68;
  assign n78 = ~n69 & ~n77;
  assign z5 = n74 & n78;
  assign n80 = ~n74 & ~n78;
  assign z4 = ~z5 & ~n80;
endmodule


