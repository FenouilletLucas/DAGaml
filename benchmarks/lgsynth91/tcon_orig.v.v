// Benchmark "tcon" written by ABC on Tue May 16 16:07:52 2017

module tcon ( 
    a, b, c, d, e, f, g, h, i, k, l, m, n, o, p, q, r,
    c0, d0, e0, f0, g0, h0, s, t, u, v, w, x, y, z, a0, b0  );
  input  a, b, c, d, e, f, g, h, i, k, l, m, n, o, p, q, r;
  output c0, d0, e0, f0, g0, h0, s, t, u, v, w, x, y, z, a0, b0;
  wire n34, n35, n36, n37, n39, n40, n41, n42, n44, n45, n46, n47, n49, n50,
    n51, n52, n54, n55, n56, n57, n59, n60, n61, n62, n64, n65, n66, n67,
    n69, n70, n71, n72;
  assign n34 = c & m;
  assign n35 = c & i;
  assign n36 = ~i & m;
  assign n37 = ~n35 & ~n36;
  assign c0 = n34 | ~n37;
  assign n39 = d & n;
  assign n40 = d & i;
  assign n41 = ~i & n;
  assign n42 = ~n40 & ~n41;
  assign d0 = n39 | ~n42;
  assign n44 = e & o;
  assign n45 = e & i;
  assign n46 = ~i & o;
  assign n47 = ~n45 & ~n46;
  assign e0 = n44 | ~n47;
  assign n49 = f & p;
  assign n50 = f & i;
  assign n51 = ~i & p;
  assign n52 = ~n50 & ~n51;
  assign f0 = n49 | ~n52;
  assign n54 = g & q;
  assign n55 = g & i;
  assign n56 = ~i & q;
  assign n57 = ~n55 & ~n56;
  assign g0 = n54 | ~n57;
  assign n59 = h & r;
  assign n60 = h & i;
  assign n61 = ~i & r;
  assign n62 = ~n60 & ~n61;
  assign h0 = n59 | ~n62;
  assign n64 = a & k;
  assign n65 = a & i;
  assign n66 = ~i & k;
  assign n67 = ~n65 & ~n66;
  assign a0 = n64 | ~n67;
  assign n69 = b & l;
  assign n70 = b & i;
  assign n71 = ~i & l;
  assign n72 = ~n70 & ~n71;
  assign b0 = n69 | ~n72;
  assign s = k;
  assign t = l;
  assign u = m;
  assign v = n;
  assign w = o;
  assign x = p;
  assign y = q;
  assign z = r;
endmodule


