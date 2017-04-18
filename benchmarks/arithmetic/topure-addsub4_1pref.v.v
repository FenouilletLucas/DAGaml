// Benchmark "addsub4_1pref" written by ABC on Sat Apr 23 20:17:57 2016

module addsub4_1pref ( 
    a0, b0, a1, b1, a2, b2, a3, b3, sign,
    s0, s1, s2, s3, s4  );
  input  a0, b0, a1, b1, a2, b2, a3, b3, sign;
  output s0, s1, s2, s3, s4;
  wire n15, n16, n17, n18, n19, n20, n21, n22, n24, n25, n26, n27, n28, n29,
    n30, n31, n32, n34, n35, n36, n37, n38, n39, n40, n41, n42, n44, n45,
    n46, n47, n48, n49, n50, n51, n52;
  assign n15 = b0 & ~sign;
  assign n16 = ~b0 & sign;
  assign n17 = ~n15 & ~n16;
  assign n18 = a0 & ~n17;
  assign n19 = ~a0 & n17;
  assign n20 = ~n18 & ~n19;
  assign n21 = sign & n20;
  assign n22 = ~sign & ~n20;
  assign s0 = ~n21 & ~n22;
  assign n24 = ~n18 & ~n21;
  assign n25 = b1 & ~sign;
  assign n26 = ~b1 & sign;
  assign n27 = ~n25 & ~n26;
  assign n28 = a1 & ~n27;
  assign n29 = ~a1 & n27;
  assign n30 = ~n28 & ~n29;
  assign n31 = ~n24 & n30;
  assign n32 = n24 & ~n30;
  assign s1 = ~n31 & ~n32;
  assign n34 = ~n28 & ~n31;
  assign n35 = b2 & ~sign;
  assign n36 = ~b2 & sign;
  assign n37 = ~n35 & ~n36;
  assign n38 = a2 & ~n37;
  assign n39 = ~a2 & n37;
  assign n40 = ~n38 & ~n39;
  assign n41 = ~n34 & n40;
  assign n42 = n34 & ~n40;
  assign s2 = ~n41 & ~n42;
  assign n44 = ~n38 & ~n41;
  assign n45 = b3 & ~sign;
  assign n46 = ~b3 & sign;
  assign n47 = ~n45 & ~n46;
  assign n48 = a3 & ~n47;
  assign n49 = ~a3 & n47;
  assign n50 = ~n48 & ~n49;
  assign n51 = ~n44 & n50;
  assign n52 = n44 & ~n50;
  assign s3 = ~n51 & ~n52;
  assign s4 = n48 | n51;
endmodule


