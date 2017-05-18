// Benchmark "tcon" written by ABC on Tue May 16 16:07:53 2017

module tcon ( 
    a, b, c, d, e, f, g, h, i, k, l, m, n, o, p, q, r,
    c0, d0, e0, f0, g0, h0, s, t, u, v, w, x, y, z, a0, b0  );
  input  a, b, c, d, e, f, g, h, i, k, l, m, n, o, p, q, r;
  output c0, d0, e0, f0, g0, h0, s, t, u, v, w, x, y, z, a0, b0;
  wire n34, n35, n37, n38, n40, n41, n43, n44, n46, n47, n49, n50, n52, n53,
    n55, n56;
  assign n34 = ~i & m;
  assign n35 = c & i;
  assign c0 = n34 | n35;
  assign n37 = ~i & n;
  assign n38 = d & i;
  assign d0 = n37 | n38;
  assign n40 = ~i & o;
  assign n41 = e & i;
  assign e0 = n40 | n41;
  assign n43 = ~i & p;
  assign n44 = f & i;
  assign f0 = n43 | n44;
  assign n46 = ~i & q;
  assign n47 = g & i;
  assign g0 = n46 | n47;
  assign n49 = ~i & r;
  assign n50 = h & i;
  assign h0 = n49 | n50;
  assign n52 = ~i & k;
  assign n53 = a & i;
  assign a0 = n52 | n53;
  assign n55 = ~i & l;
  assign n56 = b & i;
  assign b0 = n55 | n56;
  assign s = k;
  assign t = l;
  assign u = m;
  assign v = n;
  assign w = o;
  assign x = p;
  assign y = q;
  assign z = r;
endmodule


