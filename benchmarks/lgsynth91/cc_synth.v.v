// Benchmark "cc" written by ABC on Tue May 16 16:07:46 2017

module cc ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, o, p, q, r, s, t, u, v,
    k0, l0, m0, n0, o0, p0, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0, i0,
    j0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, o, p, q, r, s, t, u, v;
  output k0, l0, m0, n0, o0, p0, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0,
    i0, j0;
  wire n42, n43, n44, n45, n46, n47, n49, n50, n51, n52, n54, n55, n57, n58,
    n60, n61, n63, n64, n67, n69, n70, n71, n75, n76, n78, n79, n80, n81;
  assign n42 = i & k;
  assign n43 = ~q & n42;
  assign n44 = m & n43;
  assign n45 = m & q;
  assign n46 = ~n42 & n45;
  assign n47 = c & n44;
  assign k0 = n46 | n47;
  assign n49 = m & ~n43;
  assign n50 = ~p & r;
  assign n51 = n49 & n50;
  assign n52 = d & n44;
  assign l0 = n51 | n52;
  assign n54 = s & n49;
  assign n55 = e & n44;
  assign m0 = n54 | n55;
  assign n57 = t & n49;
  assign n58 = f & n44;
  assign n0 = n57 | n58;
  assign n60 = u & n49;
  assign n61 = g & n44;
  assign o0 = n60 | n61;
  assign n63 = v & n49;
  assign n64 = h & n44;
  assign p0 = n63 | n64;
  assign w = l & v;
  assign n67 = ~p & q;
  assign x = n42 & n67;
  assign n69 = ~l & m;
  assign n70 = p & n69;
  assign n71 = ~l & n44;
  assign y = n70 | n71;
  assign z = m & x;
  assign f0 = i & j;
  assign n75 = o & n49;
  assign n76 = a & n44;
  assign i0 = n75 | n76;
  assign n78 = ~b & m;
  assign n79 = p & n78;
  assign n80 = p & n49;
  assign n81 = ~z & ~n80;
  assign j0 = n79 | ~n81;
  assign a0 = ~t;
  assign g0 = ~f0;
  assign b0 = u;
  assign c0 = q;
  assign d0 = s;
  assign e0 = r;
  assign h0 = p;
endmodule


