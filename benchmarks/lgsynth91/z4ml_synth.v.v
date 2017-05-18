// Benchmark "z4ml" written by ABC on Tue May 16 16:07:54 2017

module z4ml ( 
    \1 , 2, 3, 4, 5, 6, 7,
    24, 25, 26, 27  );
  input  \1 , 2, 3, 4, 5, 6, 7;
  output 24, 25, 26, 27;
  wire n12, n13, n14, n15, n16, n17, n19, n20, n21, n22, n23, n24, n25, n26,
    n28, n29, n30, n31, n32, n33, n35, n36, n37, n38, n39, n40, n41, n42,
    n43, n44, n45, n46;
  assign n12 = ~2 & ~5;
  assign n13 = ~\1  & ~4;
  assign n14 = \1  & 4;
  assign n15 = ~n13 & ~n14;
  assign n16 = ~7 & n15;
  assign n17 = 7 & ~n15;
  assign 27 = n16 | n17;
  assign n19 = 4 & 7;
  assign n20 = \1  & ~27;
  assign n21 = ~n19 & ~n20;
  assign n22 = ~3 & ~6;
  assign n23 = 3 & 6;
  assign n24 = ~n22 & ~n23;
  assign n25 = n21 & n24;
  assign n26 = ~n21 & ~n24;
  assign 26 = n25 | n26;
  assign n28 = 6 & ~n21;
  assign n29 = ~n12 & n28;
  assign n30 = 3 & ~26;
  assign n31 = ~n12 & n30;
  assign n32 = 2 & 5;
  assign n33 = ~n31 & ~n32;
  assign 24 = n29 | ~n33;
  assign n35 = ~26 & n32;
  assign n36 = ~n21 & n35;
  assign n37 = 2 & 3;
  assign n38 = 5 & n37;
  assign n39 = 6 & n38;
  assign n40 = ~26 & ~24;
  assign n41 = ~n21 & n40;
  assign n42 = n23 & ~24;
  assign n43 = ~n12 & ~24;
  assign n44 = ~n42 & ~n43;
  assign n45 = ~n41 & n44;
  assign n46 = ~n39 & n45;
  assign 25 = n36 | ~n46;
endmodule


