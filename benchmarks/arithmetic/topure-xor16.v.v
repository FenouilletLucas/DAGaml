// Benchmark "xor16" written by ABC on Sat Apr 23 20:18:02 2016

module xor16 ( 
    a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
    x  );
  input  a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
    a15;
  output x;
  wire n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
    n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
    n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
    n60, n61;
  assign n18 = ~a11 & a12;
  assign n19 = a11 & ~a12;
  assign n20 = ~n18 & ~n19;
  assign n21 = a3 & a5;
  assign n22 = ~a3 & ~a5;
  assign n23 = ~n21 & ~n22;
  assign n24 = n20 & n23;
  assign n25 = ~n20 & ~n23;
  assign n26 = ~n24 & ~n25;
  assign n27 = ~a9 & a10;
  assign n28 = a9 & ~a10;
  assign n29 = ~n27 & ~n28;
  assign n30 = a2 & a4;
  assign n31 = ~a2 & ~a4;
  assign n32 = ~n30 & ~n31;
  assign n33 = ~n29 & n32;
  assign n34 = n29 & ~n32;
  assign n35 = ~n33 & ~n34;
  assign n36 = n26 & n35;
  assign n37 = ~n26 & ~n35;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~a14 & a15;
  assign n40 = a14 & ~a15;
  assign n41 = ~n39 & ~n40;
  assign n42 = a0 & a1;
  assign n43 = ~a0 & ~a1;
  assign n44 = ~n42 & ~n43;
  assign n45 = n41 & n44;
  assign n46 = ~n41 & ~n44;
  assign n47 = ~n45 & ~n46;
  assign n48 = ~a8 & a13;
  assign n49 = a8 & ~a13;
  assign n50 = ~n48 & ~n49;
  assign n51 = a6 & a7;
  assign n52 = ~a6 & ~a7;
  assign n53 = ~n51 & ~n52;
  assign n54 = ~n50 & n53;
  assign n55 = n50 & ~n53;
  assign n56 = ~n54 & ~n55;
  assign n57 = ~n47 & n56;
  assign n58 = n47 & ~n56;
  assign n59 = ~n57 & ~n58;
  assign n60 = n38 & ~n59;
  assign n61 = ~n38 & n59;
  assign x = ~n60 & ~n61;
endmodule


