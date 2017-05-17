// Benchmark "lal" written by ABC on Tue May 16 16:07:51 2017

module lal ( 
    a, b, c, d, e, f, g, h, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y,
    z, a0,
    k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, b0, c0, d0, e0, f0, g0, h0, i0,
    j0  );
  input  a, b, c, d, e, f, g, h, j, k, l, m, n, o, p, q, r, s, t, u, v,
    w, x, y, z, a0;
  output k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, b0, c0, d0, e0, f0, g0, h0,
    i0, j0;
  wire n46, n47, n49, n50, n52, n53, n54, n56, n57, n58, n59, n60, n61, n63,
    n64, n65, n66, n67, n68, n69, n70, n72, n73, n74, n75, n77, n78, n79,
    n81, n82, n83, n84, n86, n87, n88, n90, n91, n92, n93, n94, n95, n98,
    n99, n100, n101, n102, n104, n106, n107, n108, n109, n110, n111, n112,
    n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
    n125, n126, n127;
  assign n46 = e & f;
  assign n47 = ~h & n46;
  assign k0 = ~q & n47;
  assign n49 = ~h & ~q;
  assign n50 = ~k0 & n49;
  assign l0 = ~s & n50;
  assign n52 = ~t & ~l0;
  assign n53 = n50 & n52;
  assign n54 = t & l0;
  assign m0 = n53 | n54;
  assign n56 = s & t;
  assign n57 = u & n56;
  assign n58 = n50 & ~n57;
  assign n59 = n56 & n58;
  assign n60 = u & n50;
  assign n61 = ~n57 & n60;
  assign n0 = n59 | n61;
  assign n63 = u & ~v;
  assign n64 = t & ~v;
  assign n65 = s & ~v;
  assign n66 = ~n64 & ~n65;
  assign n67 = ~n63 & n66;
  assign n68 = n57 & ~n67;
  assign n69 = v & ~n57;
  assign n70 = n50 & ~n68;
  assign o0 = n69 | ~n70;
  assign n72 = ~v & ~w;
  assign n73 = n57 & n72;
  assign n74 = w & ~n68;
  assign n75 = n50 & ~n73;
  assign p0 = n74 | ~n75;
  assign n77 = ~x & n73;
  assign n78 = x & ~n73;
  assign n79 = n50 & ~n77;
  assign q0 = n78 | ~n79;
  assign n81 = ~x & ~y;
  assign n82 = n73 & n81;
  assign n83 = y & ~n77;
  assign n84 = n50 & ~n82;
  assign r0 = n83 | ~n84;
  assign n86 = z & ~n82;
  assign n87 = ~z & n82;
  assign n88 = n50 & ~n87;
  assign s0 = n86 | ~n88;
  assign n90 = ~a0 & s0;
  assign n91 = n82 & n90;
  assign n92 = a0 & ~n82;
  assign n93 = a0 & ~s0;
  assign n94 = n50 & ~n93;
  assign n95 = ~n92 & n94;
  assign t0 = n91 | ~n95;
  assign b0 = j & ~r;
  assign n98 = w & x;
  assign n99 = z & n98;
  assign n100 = n67 & n99;
  assign n101 = y & z;
  assign n102 = ~a0 & ~n101;
  assign e0 = ~n100 & n102;
  assign n104 = ~h & ~e0;
  assign c0 = n46 | ~n104;
  assign n106 = d & ~j;
  assign n107 = ~n & n106;
  assign n108 = ~d & ~j;
  assign n109 = n & n108;
  assign n110 = c & ~j;
  assign n111 = ~m & n110;
  assign n112 = ~c & ~j;
  assign n113 = m & n112;
  assign n114 = b & ~j;
  assign n115 = ~l & n114;
  assign n116 = ~b & ~j;
  assign n117 = l & n116;
  assign n118 = a & ~j;
  assign n119 = ~k & n118;
  assign n120 = ~a & ~j;
  assign n121 = k & n120;
  assign n122 = ~n119 & ~n121;
  assign n123 = ~n117 & n122;
  assign n124 = ~n115 & n123;
  assign n125 = ~n113 & n124;
  assign n126 = ~n111 & n125;
  assign n127 = ~n109 & n126;
  assign f0 = n107 | ~n127;
  assign g0 = ~j & ~o;
  assign h0 = ~j & p;
  assign i0 = ~g | j;
  assign j0 = ~e0;
  assign d0 = r;
endmodule


