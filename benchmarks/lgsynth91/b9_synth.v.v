// Benchmark "b9" written by ABC on Tue May 16 16:07:44 2017

module b9 ( 
    g0, h0, i0, j0, k0, l0, a, b, c, d, e, f, g, h, i, j, k, l, m0, m, n,
    o, p, q, r, s, t, u, v, w, x, y, z, n0, o0, a0, b0, c0, d0, e0, f0,
    g1, h1, i1, j1, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0, a1, b1, c1,
    d1, e1, f1  );
  input  g0, h0, i0, j0, k0, l0, a, b, c, d, e, f, g, h, i, j, k, l, m0,
    m, n, o, p, q, r, s, t, u, v, w, x, y, z, n0, o0, a0, b0, c0, d0, e0,
    f0;
  output g1, h1, i1, j1, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0, a1, b1,
    c1, d1, e1, f1;
  wire n63, n64, n66, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n79,
    n80, n81, n82, n83, n84, n86, n87, n88, n89, n91, n92, n93, n94, n95,
    n96, n97, n98, n99, n100, n101, n103, n105, n106, n107, n109, n110,
    n111, n112, n113, n114, n115, n116, n118, n119, n120, n123, n124, n125,
    n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
    n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
    n151, n152, n154, n155, n156, n157, n158, n159, n160, n161, n163, n164,
    n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
    n177, n178, n179, n180, n181, n183, n184;
  assign n63 = b & w;
  assign n64 = x & n63;
  assign g1 = ~y & n64;
  assign n66 = ~j & ~e0;
  assign x0 = n0 & o0;
  assign n68 = d0 & x0;
  assign n69 = i & n68;
  assign n70 = ~b0 & c0;
  assign n71 = ~n68 & n70;
  assign n72 = n66 & n71;
  assign n73 = ~j0 & ~n69;
  assign n74 = n66 & n73;
  assign n75 = ~i & ~b0;
  assign n76 = n66 & n75;
  assign n77 = ~n74 & ~n76;
  assign j1 = n72 | ~n77;
  assign n79 = e & b0;
  assign n80 = ~n69 & n79;
  assign n81 = n66 & n80;
  assign n82 = c0 & ~n69;
  assign n83 = n66 & n82;
  assign n84 = ~j1 & ~n83;
  assign h1 = ~n81 & n84;
  assign n86 = j0 & ~c0;
  assign n87 = ~k0 & ~n86;
  assign n88 = ~e & x0;
  assign n89 = b0 & c0;
  assign v0 = ~l0 & ~n89;
  assign n91 = ~j0 & ~k;
  assign n92 = ~l0 & n91;
  assign n93 = n87 & n92;
  assign n94 = ~j0 & ~l0;
  assign n95 = ~n88 & n94;
  assign n96 = ~n88 & v0;
  assign n97 = ~b0 & ~n88;
  assign n98 = ~k & ~b0;
  assign n99 = ~n97 & ~n98;
  assign n100 = ~n96 & n99;
  assign n101 = ~n95 & n100;
  assign b1 = n93 | ~n101;
  assign n103 = ~p & ~b1;
  assign p0 = ~q | n103;
  assign n105 = b0 & ~n87;
  assign n106 = ~g0 & ~e0;
  assign n107 = ~n105 & n106;
  assign q0 = ~e | n107;
  assign n109 = e & ~i;
  assign n110 = ~b0 & n109;
  assign n111 = e & ~n86;
  assign n112 = ~c & ~d0;
  assign n113 = ~c & ~i;
  assign n114 = x0 & ~n113;
  assign n115 = ~n112 & n114;
  assign n116 = ~n111 & n115;
  assign r0 = n110 | ~n116;
  assign n118 = j0 & c0;
  assign n119 = b0 & ~n118;
  assign n120 = ~v0 & ~n119;
  assign s0 = ~v | ~n120;
  assign t0 = v | ~n120;
  assign n123 = a & d;
  assign n124 = ~r & n123;
  assign n125 = ~z & n124;
  assign n126 = ~f0 & n125;
  assign n127 = ~h0 & n126;
  assign n128 = p & n123;
  assign n129 = ~z & n128;
  assign n130 = ~f0 & n129;
  assign n131 = ~h0 & n130;
  assign n132 = d & ~r;
  assign n133 = ~f0 & n132;
  assign n134 = ~h0 & n133;
  assign n135 = ~m0 & n134;
  assign n136 = d & p;
  assign n137 = ~f0 & n136;
  assign n138 = ~h0 & n137;
  assign n139 = ~m0 & n138;
  assign n140 = ~o & n123;
  assign n141 = ~z & n140;
  assign n142 = d & ~o;
  assign n143 = ~m0 & n142;
  assign n144 = z & n142;
  assign n145 = ~n143 & ~n144;
  assign n146 = ~n141 & n145;
  assign n147 = ~n139 & n146;
  assign n148 = ~n135 & n147;
  assign n149 = ~n131 & n148;
  assign w0 = n127 | ~n149;
  assign n151 = l & a0;
  assign n152 = b0 & n151;
  assign y0 = i0 & n152;
  assign n154 = ~e & h;
  assign n155 = ~x0 & n154;
  assign n156 = n105 & n155;
  assign n157 = f & n88;
  assign n158 = ~n107 & n157;
  assign n159 = g & b0;
  assign n160 = l0 & n159;
  assign n161 = ~n158 & ~n160;
  assign z0 = n156 | ~n161;
  assign n163 = ~s & ~t;
  assign n164 = u & n163;
  assign n165 = b0 & n164;
  assign n166 = n118 & n165;
  assign n167 = l0 & n165;
  assign n168 = ~n166 & ~n167;
  assign n169 = c0 & n168;
  assign n170 = n87 & n169;
  assign n171 = n106 & n170;
  assign n172 = ~j0 & c0;
  assign n173 = n168 & n172;
  assign n174 = n106 & n173;
  assign n175 = ~b0 & n168;
  assign n176 = n106 & n175;
  assign n177 = ~n88 & n168;
  assign n178 = n & n168;
  assign n179 = ~n177 & ~n178;
  assign n180 = ~n176 & n179;
  assign n181 = ~n174 & n180;
  assign c1 = ~n171 & n181;
  assign n183 = m & a0;
  assign n184 = b0 & n183;
  assign e1 = i0 & n184;
  assign f1 = ~x & n63;
  assign i1 = ~h1;
  assign u0 = ~v0;
  assign d1 = ~c1;
  assign a1 = i1;
endmodule


