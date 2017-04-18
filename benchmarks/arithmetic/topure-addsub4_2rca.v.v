// Benchmark "addsub4_2rca" written by ABC on Sat Apr 23 20:17:58 2016

module addsub4_2rca ( 
    a0, b0, a1, b1, a2, b2, a3, b3, sign,
    s0, s1, s2, s3, s4  );
  input  a0, b0, a1, b1, a2, b2, a3, b3, sign;
  output s0, s1, s2, s3, s4;
  wire n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n30,
    n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n43, n44, n45,
    n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n60,
    n61, n62;
  assign n15 = a0 & b0;
  assign n16 = ~a0 & ~b0;
  assign s0 = ~n15 & ~n16;
  assign n18 = a1 & b1;
  assign n19 = ~a1 & ~b1;
  assign n20 = ~n18 & ~n19;
  assign n21 = a0 & ~b0;
  assign n22 = s0 & ~n21;
  assign n23 = sign & n22;
  assign n24 = ~sign & n15;
  assign n25 = ~n23 & ~n24;
  assign n26 = ~n20 & n25;
  assign n27 = n20 & ~n25;
  assign s1 = ~n26 & ~n27;
  assign n29 = a2 & b2;
  assign n30 = ~a2 & ~b2;
  assign n31 = ~n29 & ~n30;
  assign n32 = a1 & ~b1;
  assign n33 = ~n20 & ~n22;
  assign n34 = ~n32 & ~n33;
  assign n35 = sign & ~n34;
  assign n36 = n15 & ~n19;
  assign n37 = ~n18 & ~n36;
  assign n38 = ~sign & n37;
  assign n39 = ~n35 & ~n38;
  assign n40 = ~n31 & n39;
  assign n41 = n31 & ~n39;
  assign s2 = n40 | n41;
  assign n43 = a3 & b3;
  assign n44 = ~a3 & ~b3;
  assign n45 = ~n43 & ~n44;
  assign n46 = ~n30 & ~n37;
  assign n47 = ~n29 & ~n46;
  assign n48 = ~n45 & n47;
  assign n49 = n45 & ~n47;
  assign n50 = ~sign & ~n49;
  assign n51 = ~n48 & n50;
  assign n52 = a2 & ~b2;
  assign n53 = ~n31 & ~n34;
  assign n54 = ~n52 & ~n53;
  assign n55 = n45 & n54;
  assign n56 = ~n45 & ~n54;
  assign n57 = sign & ~n56;
  assign n58 = ~n55 & n57;
  assign s3 = n51 | n58;
  assign n60 = ~n43 & n50;
  assign n61 = a3 & ~b3;
  assign n62 = n57 & ~n61;
  assign s4 = ~n60 & ~n62;
endmodule


