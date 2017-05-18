// Benchmark "pm1" written by ABC on Tue May 16 16:07:52 2017

module pm1 ( 
    a, b, c, d, e, g, h, i, j, k, l, m, n, o, p, q,
    c0, d0, r, s, t, u, v, w, x, y, z, a0, b0  );
  input  a, b, c, d, e, g, h, i, j, k, l, m, n, o, p, q;
  output c0, d0, r, s, t, u, v, w, x, y, z, a0, b0;
  wire n30, n31, n32, n33, n34, n36, n37, n38, n40, n41, n42, n44, n45, n46,
    n50, n51, n52, n53, n54, n56, n57, n59, n61, n62;
  assign n30 = a & ~l;
  assign n31 = m & n30;
  assign n32 = ~m & ~n;
  assign n33 = n30 & n32;
  assign n34 = n & n31;
  assign a0 = n33 | n34;
  assign n36 = n & a0;
  assign n37 = c & d;
  assign n38 = e & n37;
  assign s = m | ~n;
  assign n40 = b & k;
  assign n41 = ~n38 & n40;
  assign n42 = ~s & n40;
  assign x = n41 | n42;
  assign n44 = ~b & ~a0;
  assign n45 = n31 & n44;
  assign n46 = n36 & x;
  assign c0 = n45 | n46;
  assign d0 = ~k & n36;
  assign r = b | ~n32;
  assign n50 = g & h;
  assign n51 = i & n50;
  assign n52 = j & n51;
  assign n53 = k & n52;
  assign n54 = m & n53;
  assign t = ~n | ~n54;
  assign n56 = k & n;
  assign n57 = s & n56;
  assign u = ~t | ~n57;
  assign n59 = ~n38 & ~d0;
  assign b0 = n36 & n59;
  assign n61 = a0 & ~b0;
  assign n62 = ~d0 & n61;
  assign z = ~n31 | n62;
  assign v = ~p;
  assign w = ~o;
  assign y = ~q;
endmodule


