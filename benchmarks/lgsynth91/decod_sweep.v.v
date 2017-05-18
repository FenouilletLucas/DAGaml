// Benchmark "decod" written by ABC on Tue May 16 16:07:48 2017

module decod ( 
    a, b, c, d, e,
    f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u  );
  input  a, b, c, d, e;
  output f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  wire n22, n23, n24, n26, n27, n29, n30, n32, n33, n35, n37, n39, n41, n43;
  assign n22 = a & e;
  assign n23 = c & d;
  assign n24 = b & n23;
  assign f = n22 & n24;
  assign n26 = c & ~d;
  assign n27 = b & n26;
  assign g = n22 & n27;
  assign n29 = ~c & d;
  assign n30 = b & n29;
  assign h = n22 & n30;
  assign n32 = ~c & ~d;
  assign n33 = b & n32;
  assign i = n22 & n33;
  assign n35 = ~b & n23;
  assign j = n22 & n35;
  assign n37 = ~b & n26;
  assign k = n22 & n37;
  assign n39 = ~b & n29;
  assign l = n22 & n39;
  assign n41 = ~b & n32;
  assign m = n22 & n41;
  assign n43 = ~a & e;
  assign n = n24 & n43;
  assign o = n27 & n43;
  assign p = n30 & n43;
  assign q = n33 & n43;
  assign r = n35 & n43;
  assign s = n37 & n43;
  assign t = n39 & n43;
  assign u = n41 & n43;
endmodule


