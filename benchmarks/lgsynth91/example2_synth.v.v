// Benchmark "example2.blif" written by ABC on Tue May 16 16:07:49 2017

module \example2.blif  ( 
    a, b, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y,
    z, a0, a1, a2, b0, b1, b2, c0, c1, c2, d0, d1, d2, e0, e1, e2, f0, f1,
    f2, g0, g1, g2, h0, h1, h2, i0, i1, j0, j1, k0, k1, l0, l1, m0, m1, n0,
    n1, o0, o1, p0, p1, q0, q1, r0, r1, s0, s1, t0, t1, u0, u1, v0, v1, w0,
    w1, x0, x1, y0, y1, z0, z1,
    a3, a4, b3, b4, c3, c4, d3, d4, e3, e4, f3, f4, g3, g4, h3, h4, i2, i3,
    i4, j2, j3, j4, k2, k3, k4, l2, l3, l4, m2, m3, m4, n2, n3, n4, o2, o3,
    o4, p2, p3, p4, q2, q3, q4, r2, r3, r4, s2, s3, s4, t2, t3, t4, u2, u3,
    u4, v2, v3, v4, w2, w3, x2, x3, y2, y3, z2, z3  );
  input  a, b, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v,
    w, x, y, z, a0, a1, a2, b0, b1, b2, c0, c1, c2, d0, d1, d2, e0, e1, e2,
    f0, f1, f2, g0, g1, g2, h0, h1, h2, i0, i1, j0, j1, k0, k1, l0, l1, m0,
    m1, n0, n1, o0, o1, p0, p1, q0, q1, r0, r1, s0, s1, t0, t1, u0, u1, v0,
    v1, w0, w1, x0, x1, y0, y1, z0, z1;
  output a3, a4, b3, b4, c3, c4, d3, d4, e3, e4, f3, f4, g3, g4, h3, h4, i2,
    i3, i4, j2, j3, j4, k2, k3, k4, l2, l3, l4, m2, m3, m4, n2, n3, n4, o2,
    o3, o4, p2, p3, p4, q2, q3, q4, r2, r3, r4, s2, s3, s4, t2, t3, t4, u2,
    u3, u4, v2, v3, v4, w2, w3, x2, x3, y2, y3, z2, z3;
  wire n152, n153, n155, n156, n157, n158, n159, n160, n161, n162, n163,
    n164, n165, n166, n167, n168, n169, n170, n171, n172, n174, n175, n178,
    n179, n182, n183, n185, n186, n187, n188, n189, n190, n191, n192, n193,
    n194, n195, n196, n198, n199, n200, n201, n202, n203, n204, n205, n207,
    n208, n209, n210, n212, n213, n214, n215, n216, n217, n218, n219, n220,
    n221, n222, n223, n224, n225, n226, n227, n228, n229, n231, n232, n233,
    n234, n236, n237, n238, n240, n241, n242, n243, n245, n246, n247, n248,
    n249, n250, n251, n253, n254, n255, n256, n259, n260, n261, n262, n264,
    n266, n267, n268, n269, n272, n273, n274, n275, n277, n278, n279, n282,
    n283, n284, n285, n288, n289, n292, n293, n294, n297, n298, n299, n300,
    n301, n303, n304, n307, n309, n310, n313, n314, n315, n316, n317, n318,
    n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
    n331, n332, n334, n335, n337, n338, n339, n341, n342, n343, n344, n345,
    n346, n347, n348, n349, n350, n352, n353, n356, n357, n358, n359, n360,
    n361, n363, n364, n367, n368, n369, n370, n372, n373, n376, n378, n379,
    n383, n384, n387, n388, n389, n391, n392, n396, n397, n400, n401, n404,
    n405, n408, n409;
  assign n152 = p0 & w0;
  assign n153 = l0 & ~p0;
  assign a3 = n152 | n153;
  assign n155 = ~e2 & ~f2;
  assign n156 = e2 & f2;
  assign n157 = ~n155 & ~n156;
  assign n158 = h2 & ~n157;
  assign n159 = ~h2 & n157;
  assign n160 = ~n158 & ~n159;
  assign n161 = ~g2 & ~n160;
  assign n162 = g2 & n160;
  assign n163 = ~n161 & ~n162;
  assign n164 = a2 & b2;
  assign n165 = ~b & c2;
  assign n166 = ~f & n165;
  assign n167 = n164 & n166;
  assign n168 = ~r0 & n167;
  assign n169 = ~n160 & n168;
  assign n170 = ~n163 & n167;
  assign n171 = r0 & n170;
  assign n172 = ~n169 & ~n171;
  assign a4 = l1 & ~n172;
  assign n174 = p0 & v0;
  assign n175 = m0 & ~p0;
  assign b3 = n174 | n175;
  assign b4 = m1 & ~n172;
  assign n178 = p0 & u0;
  assign n179 = n0 & ~p0;
  assign c3 = n178 | n179;
  assign c4 = n1 & ~n172;
  assign n182 = p0 & t0;
  assign n183 = o0 & ~p0;
  assign d3 = n182 | n183;
  assign n185 = a2 & ~b2;
  assign n186 = n165 & n185;
  assign n187 = ~e2 & h2;
  assign n188 = e2 & ~h2;
  assign n189 = ~n187 & ~n188;
  assign n190 = n186 & n189;
  assign n191 = ~b & b2;
  assign n192 = f & n191;
  assign n193 = ~a2 & ~b1;
  assign n194 = ~c2 & n193;
  assign n195 = n192 & n194;
  assign n196 = b1 & ~c2;
  assign l2 = n191 & n196;
  assign n198 = f & l2;
  assign n199 = ~a2 & n198;
  assign n200 = y1 & n190;
  assign n201 = q1 & n190;
  assign n202 = q & n199;
  assign n203 = i & n195;
  assign n204 = ~n202 & ~n203;
  assign n205 = ~n201 & n204;
  assign d4 = n200 | ~n205;
  assign n207 = ~a2 & b2;
  assign n208 = p1 & n186;
  assign n209 = y1 & n165;
  assign n210 = n207 & n209;
  assign k2 = n208 | n210;
  assign n212 = a2 & ~r0;
  assign n213 = ~n156 & n212;
  assign n214 = ~h2 & n212;
  assign n215 = g2 & n212;
  assign n216 = ~d2 & n212;
  assign n217 = ~r0 & x1;
  assign n218 = a2 & n217;
  assign n219 = ~r0 & ~s0;
  assign n220 = a2 & n219;
  assign n221 = ~n218 & ~n220;
  assign n222 = ~n216 & n221;
  assign n223 = ~n215 & n222;
  assign n224 = ~n214 & n223;
  assign n225 = ~n213 & n224;
  assign n226 = c2 & n225;
  assign n227 = n192 & ~n226;
  assign n228 = ~q0 & k2;
  assign n229 = n189 & n228;
  assign e3 = n227 | n229;
  assign n231 = r1 & n190;
  assign n232 = j & n195;
  assign n233 = r & n199;
  assign n234 = ~n232 & ~n233;
  assign e4 = n231 | ~n234;
  assign n236 = a & ~b;
  assign n237 = ~f & g;
  assign n238 = ~c2 & n237;
  assign f3 = ~n236 | n238;
  assign n240 = s1 & n190;
  assign n241 = k & n195;
  assign n242 = s & n199;
  assign n243 = ~n241 & ~n242;
  assign f4 = n240 | ~n243;
  assign n245 = ~s0 & n237;
  assign n246 = a2 & n245;
  assign n247 = n191 & n246;
  assign n248 = ~b & ~f;
  assign n249 = g & n248;
  assign n250 = ~s0 & n249;
  assign n251 = ~c2 & n250;
  assign g3 = n247 | n251;
  assign n253 = t1 & n190;
  assign n254 = l & n195;
  assign n255 = t & n199;
  assign n256 = ~n254 & ~n255;
  assign g4 = n253 | ~n256;
  assign h3 = g & n169;
  assign n259 = u1 & n190;
  assign n260 = m & n195;
  assign n261 = u & n199;
  assign n262 = ~n260 & ~n261;
  assign h4 = n259 | ~n262;
  assign n264 = ~b & ~n164;
  assign m2 = n165 | n264;
  assign n266 = p0 & m2;
  assign n267 = b1 & p0;
  assign n268 = h & ~p0;
  assign n269 = ~n267 & ~n268;
  assign i2 = n266 | ~n269;
  assign i3 = t0 & n169;
  assign n272 = v1 & n190;
  assign n273 = n & n195;
  assign n274 = v & n199;
  assign n275 = ~n273 & ~n274;
  assign i4 = n272 | ~n275;
  assign n277 = ~n185 & ~n207;
  assign n278 = ~b & n277;
  assign n279 = ~b & ~n165;
  assign j2 = n278 | n279;
  assign j3 = u0 & n169;
  assign n282 = w1 & n190;
  assign n283 = o & n195;
  assign n284 = w & n199;
  assign n285 = ~n283 & ~n284;
  assign j4 = n282 | ~n285;
  assign k3 = v0 & n169;
  assign n288 = p & n195;
  assign n289 = x & n199;
  assign k4 = n288 | n289;
  assign l3 = w0 & n169;
  assign n292 = ~d2 & g2;
  assign n293 = h2 & n292;
  assign n294 = n167 & n293;
  assign l4 = n155 & n294;
  assign m3 = x0 & n169;
  assign n297 = ~n189 & ~j2;
  assign n298 = z1 & ~j2;
  assign n299 = ~a2 & ~b2;
  assign n300 = n236 & ~n299;
  assign n301 = ~n298 & n300;
  assign m4 = n297 | ~n301;
  assign n303 = o1 & p0;
  assign n304 = y & ~p0;
  assign n2 = n303 | n304;
  assign n3 = y0 & n169;
  assign n307 = ~d & e;
  assign n4 = n236 & n307;
  assign n309 = n1 & p0;
  assign n310 = z & ~p0;
  assign o2 = n309 | n310;
  assign o3 = z0 & n169;
  assign n313 = b2 & ~r0;
  assign n314 = j2 & n313;
  assign n315 = n165 & n314;
  assign n316 = ~n167 & n315;
  assign n317 = n225 & n316;
  assign n318 = ~p0 & r0;
  assign n319 = b2 & n318;
  assign n320 = j2 & n319;
  assign n321 = n165 & n320;
  assign n322 = ~n167 & n321;
  assign n323 = p0 & ~r0;
  assign n324 = j2 & n323;
  assign n325 = n185 & n324;
  assign n326 = b2 & m2;
  assign n327 = ~n165 & n326;
  assign n328 = ~f & j2;
  assign n329 = ~n165 & n328;
  assign n330 = ~n327 & ~n329;
  assign n331 = ~n325 & n330;
  assign n332 = ~n322 & n331;
  assign o4 = n317 | ~n332;
  assign n334 = m1 & p0;
  assign n335 = a0 & ~p0;
  assign p2 = n334 | n335;
  assign n337 = g & r0;
  assign n338 = ~n172 & n337;
  assign n339 = a1 & n169;
  assign p3 = n338 | n339;
  assign n341 = ~b & p0;
  assign n342 = a2 & n341;
  assign n343 = ~n165 & n342;
  assign n344 = a2 & n192;
  assign n345 = ~n226 & n344;
  assign n346 = a2 & p0;
  assign n347 = n192 & n346;
  assign n348 = ~n165 & n248;
  assign n349 = ~n347 & ~n348;
  assign n350 = ~n345 & n349;
  assign p4 = n343 | ~n350;
  assign n352 = l1 & p0;
  assign n353 = b0 & ~p0;
  assign q2 = n352 | n353;
  assign q3 = b1 & ~n172;
  assign n356 = n165 & ~n189;
  assign n357 = ~n277 & n356;
  assign n358 = n192 & ~n225;
  assign n359 = ~n165 & n192;
  assign n360 = ~n358 & ~n359;
  assign n361 = ~n329 & n360;
  assign q4 = n357 | ~n361;
  assign n363 = k1 & p0;
  assign n364 = c0 & ~p0;
  assign r2 = n363 | n364;
  assign r3 = c1 & ~n172;
  assign n367 = n165 & n189;
  assign n368 = n207 & n367;
  assign n369 = ~n167 & ~n190;
  assign n370 = ~n368 & n369;
  assign r4 = d2 & ~n370;
  assign n372 = j1 & p0;
  assign n373 = d0 & ~p0;
  assign s2 = n372 | n373;
  assign s3 = d1 & ~n172;
  assign n376 = e2 & ~n370;
  assign s4 = n227 | n376;
  assign n378 = i1 & p0;
  assign n379 = e0 & ~p0;
  assign t2 = n378 | n379;
  assign t3 = e1 & ~n172;
  assign t4 = f2 & ~n370;
  assign n383 = h1 & p0;
  assign n384 = f0 & ~p0;
  assign u2 = n383 | n384;
  assign u3 = f1 & ~n172;
  assign n387 = ~a2 & ~c2;
  assign n388 = n192 & n387;
  assign n389 = g2 & ~n370;
  assign u4 = n388 | n389;
  assign n391 = g1 & p0;
  assign n392 = g0 & ~p0;
  assign v2 = n391 | n392;
  assign v3 = g1 & ~n172;
  assign v4 = h2 & ~n370;
  assign n396 = a1 & p0;
  assign n397 = h0 & ~p0;
  assign w2 = n396 | n397;
  assign w3 = h1 & ~n172;
  assign n400 = p0 & z0;
  assign n401 = i0 & ~p0;
  assign x2 = n400 | n401;
  assign x3 = i1 & ~n172;
  assign n404 = p0 & y0;
  assign n405 = j0 & ~p0;
  assign y2 = n404 | n405;
  assign y3 = j1 & ~n172;
  assign n408 = p0 & x0;
  assign n409 = k0 & ~p0;
  assign z2 = n408 | n409;
  assign z3 = k1 & ~n172;
endmodule


