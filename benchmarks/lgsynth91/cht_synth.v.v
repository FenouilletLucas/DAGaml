// Benchmark "cht" written by ABC on Tue May 16 16:07:46 2017

module cht ( 
    a, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y,
    z, a0, b0, c0, d0, e0, f0, g0, h0, i0, j0, k0, l0, m0, n0, o0, p0, q0,
    r0, s0, t0, u0, v0,
    a1, a2, b1, b2, c1, c2, d1, d2, e1, e2, f1, f2, g1, h1, i1, j1, k1, l1,
    m1, n1, o1, p1, q1, r1, s1, t1, u1, v1, w0, w1, x0, x1, y0, y1, z0, z1  );
  input  a, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v,
    w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0, i0, j0, k0, l0, m0, n0, o0,
    p0, q0, r0, s0, t0, u0, v0;
  output a1, a2, b1, b2, c1, c2, d1, d2, e1, e2, f1, f2, g1, h1, i1, j1, k1,
    l1, m1, n1, o1, p1, q1, r1, s1, t1, u1, v1, w0, w1, x0, x1, y0, y1, z0,
    z1;
  wire n84, n85, n86, n87, n89, n90, n91, n92, n93, n95, n96, n98, n99, n101,
    n102, n103, n104, n106, n107, n109, n110, n112, n113, n115, n116, n118,
    n119, n121, n122, n124, n125, n127, n128, n130, n131, n133, n134, n136,
    n137, n139, n140, n142, n143, n145, n146, n148, n149, n151, n152, n154,
    n155, n157, n158, n159, n160, n162, n163, n165, n166, n168, n169, n171,
    n172, n174, n175, n177, n178, n180, n181, n183, n184, n186, n187, n188,
    n189, n190, n192, n193, n195, n196, n198, n199, n201, n202;
  assign n84 = i & ~l;
  assign n85 = ~i & ~l;
  assign n86 = d & n84;
  assign n87 = q & n85;
  assign a1 = n86 | n87;
  assign n89 = k & ~p;
  assign n90 = ~l & ~n89;
  assign n91 = ~l & n89;
  assign n92 = q0 & n90;
  assign n93 = r0 & n91;
  assign a2 = n92 | n93;
  assign n95 = e & n84;
  assign n96 = r & n85;
  assign b1 = n95 | n96;
  assign n98 = r0 & n90;
  assign n99 = s0 & n91;
  assign b2 = n98 | n99;
  assign n101 = j & ~l;
  assign n102 = ~j & ~l;
  assign n103 = t & n101;
  assign n104 = s & n102;
  assign c1 = n103 | n104;
  assign n106 = s0 & n90;
  assign n107 = t0 & n91;
  assign c2 = n106 | n107;
  assign n109 = u & n101;
  assign n110 = t & n102;
  assign d1 = n109 | n110;
  assign n112 = t0 & n90;
  assign n113 = u0 & n91;
  assign d2 = n112 | n113;
  assign n115 = v & n101;
  assign n116 = u & n102;
  assign e1 = n115 | n116;
  assign n118 = u0 & n90;
  assign n119 = v0 & n91;
  assign e2 = n118 | n119;
  assign n121 = w & n101;
  assign n122 = v & n102;
  assign f1 = n121 | n122;
  assign n124 = v0 & n90;
  assign n125 = a & n91;
  assign f2 = n124 | n125;
  assign n127 = x & n101;
  assign n128 = w & n102;
  assign g1 = n127 | n128;
  assign n130 = y & n101;
  assign n131 = x & n102;
  assign h1 = n130 | n131;
  assign n133 = z & n101;
  assign n134 = y & n102;
  assign i1 = n133 | n134;
  assign n136 = a0 & n101;
  assign n137 = z & n102;
  assign j1 = n136 | n137;
  assign n139 = b0 & n101;
  assign n140 = a0 & n102;
  assign k1 = n139 | n140;
  assign n142 = c0 & n101;
  assign n143 = b0 & n102;
  assign l1 = n142 | n143;
  assign n145 = d0 & n101;
  assign n146 = c0 & n102;
  assign m1 = n145 | n146;
  assign n148 = e0 & n101;
  assign n149 = d0 & n102;
  assign n1 = n148 | n149;
  assign n151 = f0 & n101;
  assign n152 = e0 & n102;
  assign o1 = n151 | n152;
  assign n154 = a & n101;
  assign n155 = f0 & n102;
  assign p1 = n154 | n155;
  assign n157 = ~k & ~l;
  assign n158 = k & ~l;
  assign n159 = g0 & n157;
  assign n160 = h0 & n158;
  assign q1 = n159 | n160;
  assign n162 = h0 & n157;
  assign n163 = i0 & n158;
  assign r1 = n162 | n163;
  assign n165 = i0 & n157;
  assign n166 = j0 & n158;
  assign s1 = n165 | n166;
  assign n168 = j0 & n157;
  assign n169 = k0 & n158;
  assign t1 = n168 | n169;
  assign n171 = k0 & n157;
  assign n172 = l0 & n158;
  assign u1 = n171 | n172;
  assign n174 = l0 & n157;
  assign n175 = m0 & n158;
  assign v1 = n174 | n175;
  assign n177 = f & n84;
  assign n178 = m & n85;
  assign w0 = n177 | n178;
  assign n180 = m0 & n157;
  assign n181 = n0 & n158;
  assign w1 = n180 | n181;
  assign n183 = g & n84;
  assign n184 = n & n85;
  assign x0 = n183 | n184;
  assign n186 = a & p;
  assign n187 = n158 & n186;
  assign n188 = n0 & n157;
  assign n189 = o0 & n91;
  assign n190 = ~n188 & ~n189;
  assign x1 = n187 | ~n190;
  assign n192 = h & n84;
  assign n193 = o & n85;
  assign y0 = n192 | n193;
  assign n195 = o0 & n90;
  assign n196 = p0 & n91;
  assign y1 = n195 | n196;
  assign n198 = c & n84;
  assign n199 = p & n85;
  assign z0 = n198 | n199;
  assign n201 = p0 & n90;
  assign n202 = q0 & n91;
  assign z1 = n201 | n202;
endmodule


