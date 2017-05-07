// Benchmark "rca_8" written by ABC on Sat Apr 23 20:17:57 2016

module rca_8 ( 
    a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7,
    s0, s1, s2, s3, s4, s5, s6, s7, s8  );
  input  a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7;
  output s0, s1, s2, s3, s4, s5, s6, s7, s8;
  wire n26, n27, n29, n30, n31, n32, n33, n35, n36, n37, n38, n39, n40, n42,
    n43, n44, n45, n46, n47, n49, n50, n51, n52, n53, n54, n56, n57, n58,
    n59, n60, n61, n63, n64, n65, n66, n67, n68, n70, n71, n72, n73, n74,
    n75;
  assign n26 = a0 & b0;
  assign n27 = ~a0 & ~b0;
  assign s0 = ~n26 & ~n27;
  assign n29 = a1 & b1;
  assign n30 = ~a1 & ~b1;
  assign n31 = ~n29 & ~n30;
  assign n32 = n26 & n31;
  assign n33 = ~n26 & ~n31;
  assign s1 = ~n32 & ~n33;
  assign n35 = ~n29 & ~n32;
  assign n36 = a2 & b2;
  assign n37 = ~a2 & ~b2;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~n35 & n38;
  assign n40 = n35 & ~n38;
  assign s2 = ~n39 & ~n40;
  assign n42 = ~n36 & ~n39;
  assign n43 = a3 & b3;
  assign n44 = ~a3 & ~b3;
  assign n45 = ~n43 & ~n44;
  assign n46 = ~n42 & n45;
  assign n47 = n42 & ~n45;
  assign s3 = ~n46 & ~n47;
  assign n49 = ~n43 & ~n46;
  assign n50 = a4 & b4;
  assign n51 = ~a4 & ~b4;
  assign n52 = ~n50 & ~n51;
  assign n53 = ~n49 & n52;
  assign n54 = n49 & ~n52;
  assign s4 = ~n53 & ~n54;
  assign n56 = ~n50 & ~n53;
  assign n57 = a5 & b5;
  assign n58 = ~a5 & ~b5;
  assign n59 = ~n57 & ~n58;
  assign n60 = ~n56 & n59;
  assign n61 = n56 & ~n59;
  assign s5 = ~n60 & ~n61;
  assign n63 = ~n57 & ~n60;
  assign n64 = a6 & b6;
  assign n65 = ~a6 & ~b6;
  assign n66 = ~n64 & ~n65;
  assign n67 = ~n63 & n66;
  assign n68 = n63 & ~n66;
  assign s6 = ~n67 & ~n68;
  assign n70 = ~n64 & ~n67;
  assign n71 = a7 & b7;
  assign n72 = ~a7 & ~b7;
  assign n73 = ~n71 & ~n72;
  assign n74 = ~n70 & n73;
  assign n75 = n70 & ~n73;
  assign s7 = ~n74 & ~n75;
  assign s8 = n71 | n74;
endmodule


