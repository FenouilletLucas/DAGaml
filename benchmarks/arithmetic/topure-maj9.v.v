// Benchmark "majority9" written by ABC on Sat Apr 23 20:17:59 2016

module majority9 ( 
    a1, a2, a3, a4, a5, a6, a7, a8, a9,
    x  );
  input  a1, a2, a3, a4, a5, a6, a7, a8, a9;
  output x;
  wire n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
    n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
    n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
    n53, n54, n55, n56, n57;
  assign n11 = ~a8 & ~a9;
  assign n12 = a3 & a4;
  assign n13 = a5 & n12;
  assign n14 = ~a1 & ~a2;
  assign n15 = n13 & ~n14;
  assign n16 = a1 & a2;
  assign n17 = ~a3 & ~a4;
  assign n18 = a5 & ~n17;
  assign n19 = ~n12 & ~n18;
  assign n20 = n16 & ~n19;
  assign n21 = ~n15 & ~n20;
  assign n22 = a6 & a7;
  assign n23 = ~n12 & n14;
  assign n24 = ~a3 & ~n16;
  assign n25 = ~n23 & ~n24;
  assign n26 = ~a4 & ~a5;
  assign n27 = a8 & a9;
  assign n28 = n14 & ~n27;
  assign n29 = ~n18 & n28;
  assign n30 = ~n26 & ~n29;
  assign n31 = ~n25 & ~n30;
  assign n32 = n22 & ~n31;
  assign n33 = n21 & ~n32;
  assign n34 = ~n11 & ~n33;
  assign n35 = ~a6 & ~a7;
  assign n36 = ~n11 & ~n35;
  assign n37 = ~n22 & ~n27;
  assign n38 = ~n36 & n37;
  assign n39 = ~n19 & ~n38;
  assign n40 = ~n16 & ~n39;
  assign n41 = ~n14 & ~n38;
  assign n42 = ~n13 & ~n41;
  assign n43 = ~a3 & n26;
  assign n44 = ~n42 & ~n43;
  assign n45 = ~n40 & n44;
  assign n46 = ~a3 & n14;
  assign n47 = ~n16 & ~n22;
  assign n48 = ~a5 & n47;
  assign n49 = ~n46 & ~n48;
  assign n50 = a4 & a5;
  assign n51 = n23 & ~n50;
  assign n52 = ~n17 & ~n51;
  assign n53 = ~n49 & ~n52;
  assign n54 = n27 & ~n53;
  assign n55 = n21 & ~n54;
  assign n56 = ~n35 & ~n55;
  assign n57 = ~n45 & ~n56;
  assign x = n34 | ~n57;
endmodule


