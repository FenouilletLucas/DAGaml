// Benchmark "traffic_cl" written by ABC on Tue May 16 16:07:51 2017

module traffic_cl ( 
    a, b, c, d, e,
    f  );
  input  a, b, c, d, e;
  output f;
  wire n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;
  assign n7 = b & c;
  assign n8 = e & n7;
  assign n9 = a & c;
  assign n10 = e & n9;
  assign n11 = a & b;
  assign n12 = e & n11;
  assign n13 = c & n11;
  assign n14 = ~d & ~n13;
  assign n15 = ~n12 & n14;
  assign n16 = ~n10 & n15;
  assign f = n8 | ~n16;
endmodule


