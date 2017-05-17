// Benchmark "decod" written by ABC on Tue May 16 16:07:48 2017

module decod ( 
    a, b, c, d, e,
    f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u  );
  input  a, b, c, d, e;
  output f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  wire n22, n23, n24, n26, n28, n31, n34, n37, n38, n40;
  assign n22 = a & e;
  assign n23 = d & n22;
  assign n24 = b & c;
  assign f = n23 & n24;
  assign n26 = ~d & n22;
  assign g = n24 & n26;
  assign n28 = b & ~c;
  assign h = n23 & n28;
  assign i = n26 & n28;
  assign n31 = ~b & c;
  assign j = n23 & n31;
  assign k = n26 & n31;
  assign n34 = ~b & ~c;
  assign l = n23 & n34;
  assign m = n26 & n34;
  assign n37 = ~a & e;
  assign n38 = d & n37;
  assign n = n24 & n38;
  assign n40 = ~d & n37;
  assign o = n24 & n40;
  assign p = n28 & n38;
  assign q = n28 & n40;
  assign r = n31 & n38;
  assign s = n31 & n40;
  assign t = n34 & n38;
  assign u = n34 & n40;
endmodule


