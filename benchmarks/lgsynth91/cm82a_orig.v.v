// Benchmark "CM82" written by ABC on Tue May 16 16:07:47 2017

module CM82 ( 
    a, b, c, d, e,
    f, g, h  );
  input  a, b, c, d, e;
  output f, g, h;
  wire n9, n10, n11, n12, n13, n15, n16, n17, n18, n19, n20, n21, n22, n23,
    n24, n26, n27, n28, n29;
  assign n9 = b & ~c;
  assign n10 = ~b & c;
  assign n11 = ~n9 & ~n10;
  assign n12 = a & n11;
  assign n13 = ~a & ~n11;
  assign f = n12 | n13;
  assign n15 = d & ~e;
  assign n16 = ~d & e;
  assign n17 = ~n15 & ~n16;
  assign n18 = ~b & ~c;
  assign n19 = ~a & ~c;
  assign n20 = ~a & ~b;
  assign n21 = ~n19 & ~n20;
  assign n22 = ~n18 & n21;
  assign n23 = ~n17 & ~n22;
  assign n24 = n17 & n22;
  assign g = n23 | n24;
  assign n26 = d & e;
  assign n27 = e & n22;
  assign n28 = d & n22;
  assign n29 = ~n27 & ~n28;
  assign h = n26 | ~n29;
endmodule


