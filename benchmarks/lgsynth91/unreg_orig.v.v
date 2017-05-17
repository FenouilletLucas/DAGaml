// Benchmark "unreg" written by ABC on Tue May 16 16:07:53 2017

module unreg ( 
    g0, h0, i0, j0, k0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q,
    s, t, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0,
    l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0, a1  );
  input  g0, h0, i0, j0, k0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o,
    p, q, s, t, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0;
  output l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0, a1;
  wire n53, n54, n55, n56, n57, n58, n60, n61, n62, n63, n64, n65, n67, n68,
    n69, n70, n71, n72, n74, n75, n76, n77, n78, n79, n81, n82, n83, n84,
    n85, n86, n88, n89, n90, n91, n92, n93, n95, n96, n97, n98, n99, n100,
    n102, n103, n104, n105, n106, n107, n109, n110, n111, n112, n113, n114,
    n116, n117, n118, n119, n120, n121, n123, n124, n125, n126, n127, n128,
    n130, n131, n132, n133, n134, n135, n137, n138, n139, n140, n141, n142,
    n144, n145, n146, n147, n148, n149, n151, n152, n153, n154, n155, n156,
    n158, n159, n160, n161, n162, n163;
  assign n53 = t & w;
  assign n54 = ~d & ~t;
  assign n55 = ~s & ~n54;
  assign n56 = ~n53 & n55;
  assign n57 = ~u & ~v;
  assign n58 = u & n56;
  assign l0 = n57 | n58;
  assign n60 = t & x;
  assign n61 = ~c & ~t;
  assign n62 = ~s & ~n61;
  assign n63 = ~n60 & n62;
  assign n64 = ~u & ~w;
  assign n65 = u & n63;
  assign m0 = n64 | n65;
  assign n67 = t & y;
  assign n68 = ~b & ~t;
  assign n69 = ~s & ~n68;
  assign n70 = ~n67 & n69;
  assign n71 = ~u & ~x;
  assign n72 = u & n70;
  assign n0 = n71 | n72;
  assign n74 = ~a & ~t;
  assign n75 = ~q & t;
  assign n76 = ~s & ~n75;
  assign n77 = ~n74 & n76;
  assign n78 = ~u & ~y;
  assign n79 = u & n77;
  assign o0 = n78 | n79;
  assign n81 = t & a0;
  assign n82 = ~h & ~t;
  assign n83 = ~s & ~n82;
  assign n84 = ~n81 & n83;
  assign n85 = ~u & ~z;
  assign n86 = u & n84;
  assign p0 = n85 | n86;
  assign n88 = t & b0;
  assign n89 = ~g & ~t;
  assign n90 = ~s & ~n89;
  assign n91 = ~n88 & n90;
  assign n92 = ~u & ~a0;
  assign n93 = u & n91;
  assign q0 = n92 | n93;
  assign n95 = t & c0;
  assign n96 = ~f & ~t;
  assign n97 = ~s & ~n96;
  assign n98 = ~n95 & n97;
  assign n99 = ~u & ~b0;
  assign n100 = u & n98;
  assign r0 = n99 | n100;
  assign n102 = t & v;
  assign n103 = ~e & ~t;
  assign n104 = ~s & ~n103;
  assign n105 = ~n102 & n104;
  assign n106 = ~u & ~c0;
  assign n107 = u & n105;
  assign s0 = n106 | n107;
  assign n109 = t & e0;
  assign n110 = ~l & ~t;
  assign n111 = ~s & ~n110;
  assign n112 = ~n109 & n111;
  assign n113 = ~u & ~d0;
  assign n114 = u & n112;
  assign t0 = n113 | n114;
  assign n116 = t & f0;
  assign n117 = ~k & ~t;
  assign n118 = ~s & ~n117;
  assign n119 = ~n116 & n118;
  assign n120 = ~u & ~e0;
  assign n121 = u & n119;
  assign u0 = n120 | n121;
  assign n123 = g0 & t;
  assign n124 = ~j & ~t;
  assign n125 = ~s & ~n124;
  assign n126 = ~n123 & n125;
  assign n127 = ~u & ~f0;
  assign n128 = u & n126;
  assign v0 = n127 | n128;
  assign n130 = t & z;
  assign n131 = ~i & ~t;
  assign n132 = ~s & ~n131;
  assign n133 = ~n130 & n132;
  assign n134 = ~g0 & ~u;
  assign n135 = u & n133;
  assign w0 = n134 | n135;
  assign n137 = i0 & t;
  assign n138 = ~p & ~t;
  assign n139 = ~s & ~n138;
  assign n140 = ~n137 & n139;
  assign n141 = ~h0 & ~u;
  assign n142 = u & n140;
  assign x0 = n141 | n142;
  assign n144 = j0 & t;
  assign n145 = ~o & ~t;
  assign n146 = ~s & ~n145;
  assign n147 = ~n144 & n146;
  assign n148 = ~i0 & ~u;
  assign n149 = u & n147;
  assign y0 = n148 | n149;
  assign n151 = k0 & t;
  assign n152 = ~n & ~t;
  assign n153 = ~s & ~n152;
  assign n154 = ~n151 & n153;
  assign n155 = ~j0 & ~u;
  assign n156 = u & n154;
  assign z0 = n155 | n156;
  assign n158 = t & d0;
  assign n159 = ~m & ~t;
  assign n160 = ~s & ~n159;
  assign n161 = ~n158 & n160;
  assign n162 = ~k0 & ~u;
  assign n163 = u & n161;
  assign a1 = n162 | n163;
endmodule


