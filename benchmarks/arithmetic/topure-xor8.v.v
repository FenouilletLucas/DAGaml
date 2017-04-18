// Benchmark "xor8" written by ABC on Sat Apr 23 20:17:57 2016

module xor8 ( 
    a0, a1, a2, a3, a4, a5, a6, a7,
    x  );
  input  a0, a1, a2, a3, a4, a5, a6, a7;
  output x;
  wire n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
    n24, n25, n26, n27, n28, n29;
  assign n10 = a0 & a4;
  assign n11 = ~a0 & ~a4;
  assign n12 = ~n10 & ~n11;
  assign n13 = a5 & ~n12;
  assign n14 = ~a5 & n12;
  assign n15 = ~n13 & ~n14;
  assign n16 = ~a3 & a6;
  assign n17 = a3 & ~a6;
  assign n18 = ~n16 & ~n17;
  assign n19 = ~a2 & a7;
  assign n20 = a2 & ~a7;
  assign n21 = ~n19 & ~n20;
  assign n22 = a1 & n21;
  assign n23 = ~a1 & ~n21;
  assign n24 = ~n22 & ~n23;
  assign n25 = n18 & ~n24;
  assign n26 = ~n18 & n24;
  assign n27 = ~n25 & ~n26;
  assign n28 = ~n15 & ~n27;
  assign n29 = n15 & n27;
  assign x = ~n28 & ~n29;
endmodule


