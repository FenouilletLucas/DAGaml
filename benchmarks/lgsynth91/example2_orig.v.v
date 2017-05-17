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
    n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
    n176, n178, n179, n182, n183, n186, n187, n189, n190, n191, n192, n193,
    n194, n195, n196, n198, n199, n200, n201, n202, n203, n204, n205, n206,
    n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
    n219, n220, n221, n223, n224, n225, n226, n227, n229, n230, n231, n232,
    n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n245,
    n246, n247, n248, n249, n250, n251, n253, n254, n255, n257, n258, n259,
    n260, n262, n263, n264, n265, n266, n268, n269, n270, n271, n274, n275,
    n276, n277, n279, n281, n282, n283, n284, n287, n288, n289, n290, n292,
    n293, n294, n295, n296, n299, n300, n301, n302, n305, n306, n309, n310,
    n311, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
    n325, n326, n327, n328, n329, n330, n331, n333, n334, n337, n339, n340,
    n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
    n355, n356, n358, n359, n361, n362, n363, n364, n366, n367, n368, n369,
    n370, n371, n372, n373, n374, n375, n376, n378, n379, n382, n383, n384,
    n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n397,
    n398, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
    n413, n414, n417, n418, n420, n421, n425, n426, n429, n430, n431, n433,
    n434, n438, n439, n442, n443, n446, n447, n450, n451;
  assign n152 = p0 & w0;
  assign n153 = l0 & ~p0;
  assign a3 = n152 | n153;
  assign n155 = ~e2 & ~f2;
  assign n156 = e2 & f2;
  assign n157 = ~n155 & ~n156;
  assign n158 = g2 & ~n157;
  assign n159 = ~g2 & n157;
  assign n160 = ~n158 & ~n159;
  assign n161 = h2 & n160;
  assign n162 = ~h2 & ~n160;
  assign n163 = ~n161 & ~n162;
  assign n164 = a2 & b2;
  assign n165 = ~b & c2;
  assign n166 = ~f & n165;
  assign n167 = n164 & n166;
  assign n168 = ~r0 & n167;
  assign n169 = ~h2 & n168;
  assign n170 = n157 & n169;
  assign n171 = h2 & n168;
  assign n172 = ~n157 & n171;
  assign n173 = ~n170 & ~n172;
  assign n174 = ~n163 & n167;
  assign n175 = r0 & n174;
  assign n176 = n173 & ~n175;
  assign a4 = l1 & ~n176;
  assign n178 = p0 & v0;
  assign n179 = m0 & ~p0;
  assign b3 = n178 | n179;
  assign b4 = m1 & ~n176;
  assign n182 = p0 & u0;
  assign n183 = n0 & ~p0;
  assign c3 = n182 | n183;
  assign c4 = n1 & ~n176;
  assign n186 = p0 & t0;
  assign n187 = o0 & ~p0;
  assign d3 = n186 | n187;
  assign n189 = e2 & ~h2;
  assign n190 = ~e2 & h2;
  assign n191 = ~n189 & ~n190;
  assign n192 = ~g2 & ~h2;
  assign n193 = n155 & n192;
  assign n194 = a2 & ~b2;
  assign n195 = b2 & ~c2;
  assign n196 = ~b & b1;
  assign l2 = n195 & n196;
  assign n198 = f & l2;
  assign n199 = ~a2 & n198;
  assign n200 = ~b & ~b1;
  assign n201 = n195 & n200;
  assign n202 = f & n201;
  assign n203 = ~a2 & n202;
  assign n204 = ~b & n194;
  assign n205 = c2 & n204;
  assign n206 = n193 & n205;
  assign n207 = ~n191 & n206;
  assign n208 = d2 & n207;
  assign n209 = ~q0 & n208;
  assign n210 = ~p1 & n209;
  assign n211 = q0 & n208;
  assign n212 = p1 & n211;
  assign n213 = n191 & n205;
  assign n214 = y1 & n213;
  assign n215 = q1 & n213;
  assign n216 = q & n199;
  assign n217 = i & n203;
  assign n218 = ~n216 & ~n217;
  assign n219 = ~n215 & n218;
  assign n220 = ~n214 & n219;
  assign n221 = ~n212 & n220;
  assign d4 = n210 | ~n221;
  assign n223 = ~a2 & b2;
  assign n224 = y1 & n165;
  assign n225 = n223 & n224;
  assign n226 = p1 & n165;
  assign n227 = n194 & n226;
  assign k2 = n225 | n227;
  assign n229 = s0 & ~x1;
  assign n230 = d2 & n229;
  assign n231 = e2 & n230;
  assign n232 = f2 & n231;
  assign n233 = ~g2 & n232;
  assign n234 = h2 & n233;
  assign n235 = a2 & ~r0;
  assign n236 = ~n234 & n235;
  assign n237 = f & b2;
  assign n238 = ~b & n237;
  assign n239 = n236 & n238;
  assign n240 = ~c2 & n238;
  assign n241 = ~n239 & ~n240;
  assign n242 = ~q0 & k2;
  assign n243 = n191 & n242;
  assign e3 = ~n241 | n243;
  assign n245 = ~b & n191;
  assign n246 = c2 & n245;
  assign n247 = n194 & n246;
  assign n248 = r1 & n247;
  assign n249 = j & n203;
  assign n250 = r & n199;
  assign n251 = ~n249 & ~n250;
  assign e4 = n248 | ~n251;
  assign n253 = ~f & g;
  assign n254 = ~c2 & n253;
  assign n255 = a & ~b;
  assign f3 = n254 | ~n255;
  assign n257 = s1 & n247;
  assign n258 = k & n203;
  assign n259 = s & n199;
  assign n260 = ~n258 & ~n259;
  assign f4 = n257 | ~n260;
  assign n262 = ~b & g;
  assign n263 = ~f & n262;
  assign n264 = ~s0 & n263;
  assign n265 = n164 & n264;
  assign n266 = ~c2 & n264;
  assign g3 = n265 | n266;
  assign n268 = t1 & n247;
  assign n269 = l & n203;
  assign n270 = t & n199;
  assign n271 = ~n269 & ~n270;
  assign g4 = n268 | ~n271;
  assign h3 = g & ~n173;
  assign n274 = u1 & n247;
  assign n275 = m & n203;
  assign n276 = u & n199;
  assign n277 = ~n275 & ~n276;
  assign h4 = n274 | ~n277;
  assign n279 = ~b & ~n164;
  assign m2 = n165 | n279;
  assign n281 = p0 & m2;
  assign n282 = b1 & p0;
  assign n283 = h & ~p0;
  assign n284 = ~n282 & ~n283;
  assign i2 = n281 | ~n284;
  assign i3 = t0 & ~n173;
  assign n287 = v1 & n247;
  assign n288 = n & n203;
  assign n289 = v & n199;
  assign n290 = ~n288 & ~n289;
  assign i4 = n287 | ~n290;
  assign n292 = ~b & ~a2;
  assign n293 = ~b2 & n292;
  assign n294 = ~b & n164;
  assign n295 = ~b & ~c2;
  assign n296 = ~n294 & ~n295;
  assign j2 = n293 | ~n296;
  assign j3 = u0 & ~n173;
  assign n299 = w1 & n247;
  assign n300 = o & n203;
  assign n301 = w & n199;
  assign n302 = ~n300 & ~n301;
  assign j4 = n299 | ~n302;
  assign k3 = v0 & ~n173;
  assign n305 = p & n203;
  assign n306 = x & n199;
  assign k4 = n305 | n306;
  assign l3 = w0 & ~n173;
  assign n309 = ~d2 & g2;
  assign n310 = h2 & n309;
  assign n311 = n167 & n310;
  assign l4 = n155 & n311;
  assign m3 = x0 & ~n173;
  assign n314 = ~a2 & c2;
  assign n315 = ~n191 & n314;
  assign n316 = ~q0 & n315;
  assign n317 = ~y1 & n316;
  assign n318 = q0 & n315;
  assign n319 = y1 & n318;
  assign n320 = c2 & ~n164;
  assign n321 = ~n191 & n320;
  assign n322 = ~n193 & n321;
  assign n323 = ~d2 & n321;
  assign n324 = n191 & n320;
  assign n325 = z1 & n324;
  assign n326 = ~a2 & ~b2;
  assign n327 = n255 & ~n326;
  assign n328 = ~n325 & n327;
  assign n329 = ~n323 & n328;
  assign n330 = ~n322 & n329;
  assign n331 = ~n319 & n330;
  assign m4 = n317 | ~n331;
  assign n333 = o1 & p0;
  assign n334 = y & ~p0;
  assign n2 = n333 | n334;
  assign n3 = y0 & ~n173;
  assign n337 = ~d & n255;
  assign n4 = e & n337;
  assign n339 = n1 & p0;
  assign n340 = z & ~p0;
  assign o2 = n339 | n340;
  assign o3 = z0 & ~n173;
  assign n343 = n165 & n237;
  assign n344 = a2 & n343;
  assign n345 = ~r0 & n344;
  assign n346 = n234 & n345;
  assign n347 = p0 & n295;
  assign n348 = ~r0 & n347;
  assign n349 = n194 & n348;
  assign n350 = ~p0 & n344;
  assign n351 = r0 & n350;
  assign n352 = n223 & n295;
  assign n353 = ~f & n295;
  assign n354 = ~n352 & ~n353;
  assign n355 = ~n351 & n354;
  assign n356 = ~n349 & n355;
  assign o4 = n346 | ~n356;
  assign n358 = m1 & p0;
  assign n359 = a0 & ~p0;
  assign p2 = n358 | n359;
  assign n361 = g & n167;
  assign n362 = ~n163 & n361;
  assign n363 = r0 & n362;
  assign n364 = a1 & ~n173;
  assign p3 = n363 | n364;
  assign n366 = n236 & n237;
  assign n367 = ~f & ~c2;
  assign n368 = ~n366 & ~n367;
  assign n369 = ~b & a2;
  assign n370 = p0 & n369;
  assign n371 = n237 & n370;
  assign n372 = ~c2 & n370;
  assign n373 = n195 & n369;
  assign n374 = ~b & ~n368;
  assign n375 = ~n373 & ~n374;
  assign n376 = ~n372 & n375;
  assign p4 = n371 | ~n376;
  assign n378 = l1 & p0;
  assign n379 = b0 & ~p0;
  assign q2 = n378 | n379;
  assign q3 = b1 & ~n176;
  assign n382 = ~b & ~n191;
  assign n383 = ~d2 & n382;
  assign n384 = c2 & n383;
  assign n385 = n194 & n384;
  assign n386 = ~n193 & n382;
  assign n387 = c2 & n386;
  assign n388 = n194 & n387;
  assign n389 = n223 & n383;
  assign n390 = n223 & n386;
  assign n391 = ~b & n195;
  assign n392 = ~n374 & ~n391;
  assign n393 = ~n390 & n392;
  assign n394 = ~n389 & n393;
  assign n395 = ~n388 & n394;
  assign q4 = n385 | ~n395;
  assign n397 = k1 & p0;
  assign n398 = c0 & ~p0;
  assign r2 = n397 | n398;
  assign r3 = c1 & ~n176;
  assign n401 = n191 & n223;
  assign n402 = n191 & n194;
  assign n403 = ~f & n164;
  assign n404 = ~n402 & ~n403;
  assign n405 = ~n401 & n404;
  assign n406 = d2 & n165;
  assign n407 = n193 & n406;
  assign n408 = n223 & n407;
  assign n409 = n194 & n407;
  assign n410 = ~n405 & n406;
  assign n411 = ~n409 & ~n410;
  assign r4 = n408 | ~n411;
  assign n413 = j1 & p0;
  assign n414 = d0 & ~p0;
  assign s2 = n413 | n414;
  assign s3 = d1 & ~n176;
  assign n417 = n165 & ~n405;
  assign n418 = e2 & n417;
  assign s4 = ~n241 | n418;
  assign n420 = i1 & p0;
  assign n421 = e0 & ~p0;
  assign t2 = n420 | n421;
  assign t3 = e1 & ~n176;
  assign t4 = f2 & n417;
  assign n425 = h1 & p0;
  assign n426 = f0 & ~p0;
  assign u2 = n425 | n426;
  assign u3 = f1 & ~n176;
  assign n429 = f & n391;
  assign n430 = ~a2 & n429;
  assign n431 = g2 & n417;
  assign u4 = n430 | n431;
  assign n433 = g1 & p0;
  assign n434 = g0 & ~p0;
  assign v2 = n433 | n434;
  assign v3 = g1 & ~n176;
  assign v4 = h2 & n417;
  assign n438 = a1 & p0;
  assign n439 = h0 & ~p0;
  assign w2 = n438 | n439;
  assign w3 = h1 & ~n176;
  assign n442 = p0 & z0;
  assign n443 = i0 & ~p0;
  assign x2 = n442 | n443;
  assign x3 = i1 & ~n176;
  assign n446 = p0 & y0;
  assign n447 = j0 & ~p0;
  assign y2 = n446 | n447;
  assign y3 = j1 & ~n176;
  assign n450 = p0 & x0;
  assign n451 = k0 & ~p0;
  assign z2 = n450 | n451;
  assign z3 = k1 & ~n176;
endmodule


