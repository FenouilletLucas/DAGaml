// Benchmark "unreg" written by ABC on Tue May 16 16:07:53 2017

module unreg ( 
    k0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, s, t, u, v, w,
    x, y, z, a0, b0, c0, d0, e0, f0, g0, h0, i0, j0,
    l0, m0, n0, o0, p0, q0, r0, s0, a1, t0, u0, v0, w0, x0, y0, z0  );
  input  k0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, s, t, u,
    v, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0, i0, j0;
  output l0, m0, n0, o0, p0, q0, r0, s0, a1, t0, u0, v0, w0, x0, y0, z0;
  wire n53, n54, n55, n56, n57, n58, n59, n61, n62, n63, n64, n66, n67, n68,
    n69, n71, n72, n73, n74, n76, n77, n78, n79, n81, n82, n83, n84, n86,
    n87, n88, n89, n91, n92, n93, n94, n96, n97, n98, n99, n101, n102,
    n103, n104, n106, n107, n108, n109, n111, n112, n113, n114, n116, n117,
    n118, n119, n121, n122, n123, n124, n126, n127, n128, n129, n131, n132,
    n133, n134;
  assign n53 = ~s & u;
  assign n54 = t & n53;
  assign n55 = ~t & n53;
  assign n56 = ~w & n54;
  assign n57 = d & n55;
  assign n58 = ~u & ~v;
  assign n59 = ~n57 & ~n58;
  assign l0 = n56 | ~n59;
  assign n61 = ~x & n54;
  assign n62 = c & n55;
  assign n63 = ~u & ~w;
  assign n64 = ~n62 & ~n63;
  assign m0 = n61 | ~n64;
  assign n66 = ~y & n54;
  assign n67 = b & n55;
  assign n68 = ~u & ~x;
  assign n69 = ~n67 & ~n68;
  assign n0 = n66 | ~n69;
  assign n71 = a & n55;
  assign n72 = ~u & ~y;
  assign n73 = ~n71 & ~n72;
  assign n74 = q & n54;
  assign o0 = ~n73 | n74;
  assign n76 = ~a0 & n54;
  assign n77 = h & n55;
  assign n78 = ~u & ~z;
  assign n79 = ~n77 & ~n78;
  assign p0 = n76 | ~n79;
  assign n81 = ~b0 & n54;
  assign n82 = g & n55;
  assign n83 = ~u & ~a0;
  assign n84 = ~n82 & ~n83;
  assign q0 = n81 | ~n84;
  assign n86 = ~c0 & n54;
  assign n87 = f & n55;
  assign n88 = ~u & ~b0;
  assign n89 = ~n87 & ~n88;
  assign r0 = n86 | ~n89;
  assign n91 = ~v & n54;
  assign n92 = e & n55;
  assign n93 = ~u & ~c0;
  assign n94 = ~n92 & ~n93;
  assign s0 = n91 | ~n94;
  assign n96 = ~d0 & n54;
  assign n97 = m & n55;
  assign n98 = ~k0 & ~u;
  assign n99 = ~n97 & ~n98;
  assign a1 = n96 | ~n99;
  assign n101 = ~e0 & n54;
  assign n102 = l & n55;
  assign n103 = ~u & ~d0;
  assign n104 = ~n102 & ~n103;
  assign t0 = n101 | ~n104;
  assign n106 = ~f0 & n54;
  assign n107 = k & n55;
  assign n108 = ~u & ~e0;
  assign n109 = ~n107 & ~n108;
  assign u0 = n106 | ~n109;
  assign n111 = ~g0 & n54;
  assign n112 = j & n55;
  assign n113 = ~u & ~f0;
  assign n114 = ~n112 & ~n113;
  assign v0 = n111 | ~n114;
  assign n116 = ~z & n54;
  assign n117 = i & n55;
  assign n118 = ~u & ~g0;
  assign n119 = ~n117 & ~n118;
  assign w0 = n116 | ~n119;
  assign n121 = ~i0 & n54;
  assign n122 = p & n55;
  assign n123 = ~u & ~h0;
  assign n124 = ~n122 & ~n123;
  assign x0 = n121 | ~n124;
  assign n126 = ~j0 & n54;
  assign n127 = o & n55;
  assign n128 = ~u & ~i0;
  assign n129 = ~n127 & ~n128;
  assign y0 = n126 | ~n129;
  assign n131 = ~k0 & n54;
  assign n132 = n & n55;
  assign n133 = ~u & ~j0;
  assign n134 = ~n132 & ~n133;
  assign z0 = n131 | ~n134;
endmodule


