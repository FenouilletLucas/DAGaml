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
  wire n84, n85, n86, n87, n88, n89, n90, n92, n93, n94, n95, n96, n97, n98,
    n99, n100, n101, n102, n104, n105, n106, n107, n108, n110, n111, n112,
    n113, n114, n115, n116, n118, n119, n120, n121, n122, n123, n124, n126,
    n127, n128, n129, n130, n131, n132, n134, n135, n136, n137, n138, n140,
    n141, n142, n143, n144, n145, n146, n148, n149, n150, n151, n152, n154,
    n155, n156, n157, n158, n159, n160, n162, n163, n164, n165, n166, n168,
    n169, n170, n171, n172, n173, n174, n175, n176, n178, n179, n180, n181,
    n182, n184, n185, n186, n187, n188, n190, n191, n192, n193, n194, n196,
    n197, n198, n199, n200, n202, n203, n204, n205, n206, n208, n209, n210,
    n211, n212, n214, n215, n216, n217, n218, n220, n221, n222, n223, n224,
    n226, n227, n228, n229, n230, n232, n233, n234, n235, n237, n238, n239,
    n240, n241, n243, n244, n245, n246, n247, n249, n250, n251, n252, n253,
    n255, n256, n257, n258, n259, n261, n262, n263, n264, n265, n267, n268,
    n269, n270, n271, n273, n274, n275, n276, n277, n279, n280, n281, n282,
    n283, n285, n286, n287, n288, n289, n291, n292, n293, n294, n295, n296,
    n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n308, n309,
    n310, n311, n312, n314, n315, n316, n317, n318, n319, n320, n322, n323,
    n324, n325, n327, n328, n329, n330, n331, n332, n333;
  assign n84 = ~l & q;
  assign n85 = d & n84;
  assign n86 = i & ~l;
  assign n87 = d & n86;
  assign n88 = ~i & ~l;
  assign n89 = q & n88;
  assign n90 = ~n87 & ~n89;
  assign a1 = n85 | ~n90;
  assign n92 = k & ~l;
  assign n93 = ~p & n92;
  assign n94 = r0 & n93;
  assign n95 = ~l & q0;
  assign n96 = r0 & n95;
  assign n97 = ~l & p;
  assign n98 = q0 & n97;
  assign n99 = ~k & ~l;
  assign n100 = q0 & n99;
  assign n101 = ~n98 & ~n100;
  assign n102 = ~n96 & n101;
  assign a2 = n94 | ~n102;
  assign n104 = ~l & r;
  assign n105 = e & n104;
  assign n106 = e & n86;
  assign n107 = r & n88;
  assign n108 = ~n106 & ~n107;
  assign b1 = n105 | ~n108;
  assign n110 = s0 & n93;
  assign n111 = ~l & r0;
  assign n112 = s0 & n111;
  assign n113 = r0 & n97;
  assign n114 = r0 & n99;
  assign n115 = ~n113 & ~n114;
  assign n116 = ~n112 & n115;
  assign b2 = n110 | ~n116;
  assign n118 = ~l & t;
  assign n119 = s & n118;
  assign n120 = ~j & ~l;
  assign n121 = s & n120;
  assign n122 = j & ~l;
  assign n123 = t & n122;
  assign n124 = ~n121 & ~n123;
  assign c1 = n119 | ~n124;
  assign n126 = t0 & n93;
  assign n127 = ~l & s0;
  assign n128 = t0 & n127;
  assign n129 = s0 & n97;
  assign n130 = s0 & n99;
  assign n131 = ~n129 & ~n130;
  assign n132 = ~n128 & n131;
  assign c2 = n126 | ~n132;
  assign n134 = ~l & u;
  assign n135 = t & n134;
  assign n136 = t & n120;
  assign n137 = u & n122;
  assign n138 = ~n136 & ~n137;
  assign d1 = n135 | ~n138;
  assign n140 = u0 & n93;
  assign n141 = ~l & t0;
  assign n142 = u0 & n141;
  assign n143 = t0 & n97;
  assign n144 = t0 & n99;
  assign n145 = ~n143 & ~n144;
  assign n146 = ~n142 & n145;
  assign d2 = n140 | ~n146;
  assign n148 = ~l & v;
  assign n149 = u & n148;
  assign n150 = u & n120;
  assign n151 = v & n122;
  assign n152 = ~n150 & ~n151;
  assign e1 = n149 | ~n152;
  assign n154 = v0 & n93;
  assign n155 = ~l & u0;
  assign n156 = v0 & n155;
  assign n157 = u0 & n97;
  assign n158 = u0 & n99;
  assign n159 = ~n157 & ~n158;
  assign n160 = ~n156 & n159;
  assign e2 = n154 | ~n160;
  assign n162 = ~l & w;
  assign n163 = v & n162;
  assign n164 = v & n120;
  assign n165 = w & n122;
  assign n166 = ~n164 & ~n165;
  assign f1 = n163 | ~n166;
  assign n168 = a & k;
  assign n169 = ~l & n168;
  assign n170 = ~p & n169;
  assign n171 = v0 & n97;
  assign n172 = v0 & n99;
  assign n173 = a & ~l;
  assign n174 = v0 & n173;
  assign n175 = ~n172 & ~n174;
  assign n176 = ~n171 & n175;
  assign f2 = n170 | ~n176;
  assign n178 = ~l & x;
  assign n179 = w & n178;
  assign n180 = w & n120;
  assign n181 = x & n122;
  assign n182 = ~n180 & ~n181;
  assign g1 = n179 | ~n182;
  assign n184 = ~l & y;
  assign n185 = x & n184;
  assign n186 = x & n120;
  assign n187 = y & n122;
  assign n188 = ~n186 & ~n187;
  assign h1 = n185 | ~n188;
  assign n190 = ~l & z;
  assign n191 = y & n190;
  assign n192 = y & n120;
  assign n193 = z & n122;
  assign n194 = ~n192 & ~n193;
  assign i1 = n191 | ~n194;
  assign n196 = ~l & a0;
  assign n197 = z & n196;
  assign n198 = z & n120;
  assign n199 = a0 & n122;
  assign n200 = ~n198 & ~n199;
  assign j1 = n197 | ~n200;
  assign n202 = ~l & b0;
  assign n203 = a0 & n202;
  assign n204 = a0 & n120;
  assign n205 = b0 & n122;
  assign n206 = ~n204 & ~n205;
  assign k1 = n203 | ~n206;
  assign n208 = ~l & c0;
  assign n209 = b0 & n208;
  assign n210 = b0 & n120;
  assign n211 = c0 & n122;
  assign n212 = ~n210 & ~n211;
  assign l1 = n209 | ~n212;
  assign n214 = ~l & d0;
  assign n215 = c0 & n214;
  assign n216 = c0 & n120;
  assign n217 = d0 & n122;
  assign n218 = ~n216 & ~n217;
  assign m1 = n215 | ~n218;
  assign n220 = ~l & e0;
  assign n221 = d0 & n220;
  assign n222 = d0 & n120;
  assign n223 = e0 & n122;
  assign n224 = ~n222 & ~n223;
  assign n1 = n221 | ~n224;
  assign n226 = ~l & f0;
  assign n227 = e0 & n226;
  assign n228 = e0 & n120;
  assign n229 = f0 & n122;
  assign n230 = ~n228 & ~n229;
  assign o1 = n227 | ~n230;
  assign n232 = a & n226;
  assign n233 = a & n122;
  assign n234 = f0 & n120;
  assign n235 = ~n233 & ~n234;
  assign p1 = n232 | ~n235;
  assign n237 = ~l & h0;
  assign n238 = g0 & n237;
  assign n239 = g0 & n99;
  assign n240 = h0 & n92;
  assign n241 = ~n239 & ~n240;
  assign q1 = n238 | ~n241;
  assign n243 = ~l & i0;
  assign n244 = h0 & n243;
  assign n245 = h0 & n99;
  assign n246 = i0 & n92;
  assign n247 = ~n245 & ~n246;
  assign r1 = n244 | ~n247;
  assign n249 = ~l & j0;
  assign n250 = i0 & n249;
  assign n251 = i0 & n99;
  assign n252 = j0 & n92;
  assign n253 = ~n251 & ~n252;
  assign s1 = n250 | ~n253;
  assign n255 = ~l & k0;
  assign n256 = j0 & n255;
  assign n257 = j0 & n99;
  assign n258 = k0 & n92;
  assign n259 = ~n257 & ~n258;
  assign t1 = n256 | ~n259;
  assign n261 = ~l & l0;
  assign n262 = k0 & n261;
  assign n263 = k0 & n99;
  assign n264 = l0 & n92;
  assign n265 = ~n263 & ~n264;
  assign u1 = n262 | ~n265;
  assign n267 = ~l & m0;
  assign n268 = l0 & n267;
  assign n269 = l0 & n99;
  assign n270 = m0 & n92;
  assign n271 = ~n269 & ~n270;
  assign v1 = n268 | ~n271;
  assign n273 = ~l & m;
  assign n274 = f & n273;
  assign n275 = f & n86;
  assign n276 = m & n88;
  assign n277 = ~n275 & ~n276;
  assign w0 = n274 | ~n277;
  assign n279 = ~l & n0;
  assign n280 = m0 & n279;
  assign n281 = m0 & n99;
  assign n282 = n0 & n92;
  assign n283 = ~n281 & ~n282;
  assign w1 = n280 | ~n283;
  assign n285 = ~l & n;
  assign n286 = g & n285;
  assign n287 = g & n86;
  assign n288 = n & n88;
  assign n289 = ~n287 & ~n288;
  assign x0 = n286 | ~n289;
  assign n291 = ~l & ~p;
  assign n292 = n0 & n291;
  assign n293 = o0 & n292;
  assign n294 = n0 & n173;
  assign n295 = o0 & n294;
  assign n296 = o0 & n93;
  assign n297 = o0 & n169;
  assign n298 = p & n173;
  assign n299 = n0 & n298;
  assign n300 = p & n169;
  assign n301 = n0 & n99;
  assign n302 = ~n300 & ~n301;
  assign n303 = ~n299 & n302;
  assign n304 = ~n297 & n303;
  assign n305 = ~n296 & n304;
  assign n306 = ~n295 & n305;
  assign x1 = n293 | ~n306;
  assign n308 = ~l & o;
  assign n309 = h & n308;
  assign n310 = h & n86;
  assign n311 = o & n88;
  assign n312 = ~n310 & ~n311;
  assign y0 = n309 | ~n312;
  assign n314 = p0 & n93;
  assign n315 = ~l & o0;
  assign n316 = p0 & n315;
  assign n317 = o0 & n97;
  assign n318 = o0 & n99;
  assign n319 = ~n317 & ~n318;
  assign n320 = ~n316 & n319;
  assign y1 = n314 | ~n320;
  assign n322 = c & n97;
  assign n323 = c & n86;
  assign n324 = p & n88;
  assign n325 = ~n323 & ~n324;
  assign z0 = n322 | ~n325;
  assign n327 = q0 & n93;
  assign n328 = ~l & p0;
  assign n329 = q0 & n328;
  assign n330 = p0 & n97;
  assign n331 = p0 & n99;
  assign n332 = ~n330 & ~n331;
  assign n333 = ~n329 & n332;
  assign z1 = n327 | ~n333;
endmodule


