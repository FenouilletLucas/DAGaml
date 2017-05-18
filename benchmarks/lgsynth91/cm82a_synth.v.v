// Benchmark "CM82" written by ABC on Tue May 16 16:07:47 2017

module CM82 ( 
    a, b, c, d, e,
    f, g, h  );
  input  a, b, c, d, e;
  output f, g, h;
  wire n9, n10, n11, n12, n13, n15, n16, n17, n18, n19, n20, n21, n23, n24;
  assign n9 = b & ~c;
  assign n10 = ~b & c;
  assign n11 = ~n9 & ~n10;
  assign n12 = a & n11;
  assign n13 = ~a & ~n11;
  assign f = n12 | n13;
  assign n15 = d & ~e;
  assign n16 = ~d & e;
  assign n17 = ~n15 & ~n16;
  assign n18 = ~c & n11;
  assign n19 = ~n13 & ~n18;
  assign n20 = n17 & n19;
  assign n21 = ~n17 & ~n19;
  assign g = n20 | n21;
  assign n23 = d & n17;
  assign n24 = ~n17 & n19;
  assign h = n23 | n24;
endmodule


