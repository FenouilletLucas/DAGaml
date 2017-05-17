// Benchmark "b1" written by ABC on Tue May 16 16:07:44 2017

module b1 ( 
    a, b, c,
    d, e, f, g  );
  input  a, b, c;
  output d, e, f, g;
  wire n8, n9, n11, n12, n13, n14;
  assign n8 = a & ~b;
  assign n9 = ~a & b;
  assign e = n8 | n9;
  assign n11 = b & ~c;
  assign n12 = ~e & n11;
  assign n13 = ~a & c;
  assign n14 = ~e & n13;
  assign f = n12 | n14;
  assign g = ~c;
  assign d = c;
endmodule


