// Benchmark "traffic_cl" written by ABC on Tue May 16 16:07:51 2017

module traffic_cl ( 
    a, b, c, d, e,
    f  );
  input  a, b, c, d, e;
  output f;
  wire n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  assign n7 = ~c & ~d;
  assign n8 = ~e & n7;
  assign n9 = ~b & ~d;
  assign n10 = ~e & n9;
  assign n11 = ~a & ~d;
  assign n12 = ~e & n11;
  assign n13 = ~c & n9;
  assign n14 = ~c & n11;
  assign n15 = ~b & n11;
  assign n16 = ~n14 & ~n15;
  assign n17 = ~n13 & n16;
  assign n18 = ~n12 & n17;
  assign n19 = ~n10 & n18;
  assign f = ~n8 & n19;
endmodule


