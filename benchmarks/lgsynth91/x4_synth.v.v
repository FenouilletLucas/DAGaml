// Benchmark "x4" written by ABC on Tue May 16 16:07:54 2017

module x4 ( 
    a, b, g, h, i, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, a0, a1,
    a2, b0, b1, b2, c0, c1, c2, d0, d1, d2, e0, e1, e2, f0, f1, f2, g0, g1,
    g2, h0, h1, h2, i0, i1, i2, j1, j2, k0, k1, k2, l0, l1, l2, m0, m1, m2,
    n0, n1, n2, o0, o1, o2, p0, p1, p2, q0, q1, q2, r0, r1, r2, s0, s1, s2,
    t0, t1, t2, u0, u1, u2, v0, v1, v2, w0, w1, x0, x1, y0, y1, z0, z1,
    a3, a4, a5, b3, b4, b5, c3, c4, c5, d3, d4, d5, e3, e4, e5, f3, f4, f5,
    g3, g4, g5, h3, h4, h5, i3, i4, i5, j3, j4, j5, k3, k4, k5, l3, l4, l5,
    m3, m4, m5, n3, n4, n5, o3, o4, o5, p3, p4, q3, q4, r3, r4, s3, s4, t3,
    t4, u3, u4, v3, v4, w2, w3, w4, x2, x3, x4, y2, y3, y4, z2, z3, z4  );
  input  a, b, g, h, i, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z,
    a0, a1, a2, b0, b1, b2, c0, c1, c2, d0, d1, d2, e0, e1, e2, f0, f1, f2,
    g0, g1, g2, h0, h1, h2, i0, i1, i2, j1, j2, k0, k1, k2, l0, l1, l2, m0,
    m1, m2, n0, n1, n2, o0, o1, o2, p0, p1, p2, q0, q1, q2, r0, r1, r2, s0,
    s1, s2, t0, t1, t2, u0, u1, u2, v0, v1, v2, w0, w1, x0, x1, y0, y1, z0,
    z1;
  output a3, a4, a5, b3, b4, b5, c3, c4, c5, d3, d4, d5, e3, e4, e5, f3, f4,
    f5, g3, g4, g5, h3, h4, h5, i3, i4, i5, j3, j4, j5, k3, k4, k5, l3, l4,
    l5, m3, m4, m5, n3, n4, n5, o3, o4, o5, p3, p4, q3, q4, r3, r4, s3, s4,
    t3, t4, u3, u4, v3, v4, w2, w3, w4, x2, x3, x4, y2, y3, y4, z2, z3, z4;
  wire n166, n167, n168, n169, n170, n171, n172, n173, n174, n176, n177,
    n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
    n190, n191, n192, n194, n195, n197, n198, n199, n200, n202, n203, n204,
    n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
    n218, n219, n221, n222, n224, n225, n226, n227, n228, n229, n230, n232,
    n233, n235, n236, n237, n238, n239, n240, n242, n243, n244, n245, n247,
    n249, n250, n251, n252, n253, n254, n255, n256, n257, n259, n260, n261,
    n262, n263, n264, n265, n267, n268, n269, n270, n272, n273, n274, n275,
    n276, n277, n278, n280, n281, n282, n283, n285, n286, n287, n288, n289,
    n291, n292, n293, n294, n296, n297, n298, n301, n302, n303, n304, n305,
    n306, n308, n309, n310, n311, n312, n313, n314, n317, n318, n319, n320,
    n322, n323, n324, n325, n328, n329, n330, n331, n333, n334, n335, n336,
    n337, n338, n339, n342, n343, n344, n345, n347, n348, n349, n350, n351,
    n352, n353, n354, n357, n358, n359, n360, n362, n363, n364, n367, n368,
    n369, n370, n372, n373, n374, n375, n376, n379, n380, n381, n382, n384,
    n385, n386, n389, n390, n391, n392, n394, n395, n396, n399, n400, n401,
    n402, n405, n406, n407, n408, n411, n412, n413, n414, n417, n418, n419,
    n420, n423, n424, n425, n426, n429, n430, n431, n432, n434, n435, n437,
    n438, n439, n440, n442, n443, n444, n446, n447, n448, n449, n451, n452,
    n453, n454, n456, n457, n459, n460, n461, n462, n464, n465, n467, n468,
    n469, n470;
  assign n166 = ~q2 & ~r2;
  assign n167 = o2 & ~p2;
  assign n168 = n166 & n167;
  assign n169 = e1 & ~n2;
  assign n170 = n168 & n169;
  assign n171 = ~c1 & ~n170;
  assign n172 = ~c1 & n170;
  assign n173 = h1 & n171;
  assign n174 = q0 & n172;
  assign a4 = n173 | n174;
  assign n176 = e1 & ~m0;
  assign n177 = ~i0 & n176;
  assign n178 = ~i & h0;
  assign n179 = ~h & n178;
  assign n180 = ~g & n179;
  assign n181 = g0 & ~n180;
  assign n182 = m1 & v2;
  assign n183 = n181 & n182;
  assign n184 = n177 & ~n183;
  assign n185 = ~i0 & n182;
  assign n186 = n181 & n185;
  assign n187 = ~n176 & ~n183;
  assign n188 = ~i0 & n187;
  assign n189 = i2 & n184;
  assign n190 = c0 & n186;
  assign n191 = h2 & n188;
  assign n192 = ~n190 & ~n191;
  assign a5 = n189 | ~n192;
  assign n194 = i1 & n171;
  assign n195 = r0 & n172;
  assign b4 = n194 | n195;
  assign n197 = j2 & n184;
  assign n198 = d0 & n186;
  assign n199 = i2 & n188;
  assign n200 = ~n198 & ~n199;
  assign b5 = n197 | ~n200;
  assign n202 = n2 & ~p2;
  assign n203 = e1 & n202;
  assign n204 = ~o2 & n203;
  assign n205 = r2 & n204;
  assign n206 = ~i & ~q2;
  assign n207 = n205 & ~n206;
  assign n208 = ~h0 & ~i0;
  assign n209 = ~t2 & n208;
  assign n210 = n207 & n209;
  assign n211 = h0 & ~i0;
  assign n212 = t2 & n211;
  assign n213 = n207 & n212;
  assign n214 = ~i0 & s2;
  assign n215 = ~n207 & n214;
  assign n216 = ~n213 & ~n215;
  assign c3 = n210 | ~n216;
  assign n218 = j1 & n171;
  assign n219 = s0 & n172;
  assign c4 = n218 | n219;
  assign n221 = e0 & n186;
  assign n222 = j2 & n188;
  assign c5 = n221 | n222;
  assign n224 = ~c1 & g0;
  assign n225 = v2 & n224;
  assign n226 = ~n183 & n225;
  assign n227 = ~c1 & f0;
  assign n228 = v2 & n227;
  assign n229 = ~c1 & k0;
  assign n230 = ~n228 & ~n229;
  assign d3 = n226 | ~n230;
  assign n232 = k1 & n171;
  assign n233 = t0 & n172;
  assign d4 = n232 | n233;
  assign n235 = b & ~u0;
  assign n236 = ~u2 & ~n235;
  assign n237 = ~c1 & k2;
  assign n238 = ~c1 & ~k2;
  assign n239 = ~n236 & n238;
  assign n240 = n236 & n237;
  assign d5 = n239 | n240;
  assign n242 = ~c1 & l0;
  assign n243 = ~c1 & ~n168;
  assign n244 = n203 & n243;
  assign n245 = n166 & n244;
  assign e3 = n242 | n245;
  assign n247 = ~c1 & l1;
  assign e4 = n245 | n247;
  assign n249 = l2 & m2;
  assign n250 = ~k2 & n249;
  assign n251 = l2 & n238;
  assign n252 = ~n250 & n251;
  assign n253 = ~l2 & ~d5;
  assign n254 = n237 & n253;
  assign n255 = l2 & d5;
  assign n256 = ~n250 & n255;
  assign n257 = ~n254 & ~n256;
  assign e5 = n252 | ~n257;
  assign n259 = g0 & v2;
  assign n260 = ~i0 & ~n259;
  assign n261 = n180 & ~n260;
  assign n262 = ~m1 & ~n260;
  assign n263 = ~i0 & ~n262;
  assign n264 = ~n261 & n263;
  assign n265 = m0 & n260;
  assign f3 = ~n264 | n265;
  assign n267 = ~g & ~h;
  assign n268 = n260 & n267;
  assign n269 = n250 & n268;
  assign n270 = m1 & n260;
  assign f4 = n269 | n270;
  assign n272 = l2 & ~m2;
  assign n273 = ~d5 & n272;
  assign n274 = n237 & n273;
  assign n275 = ~c1 & ~l2;
  assign n276 = m2 & n275;
  assign n277 = m2 & e5;
  assign n278 = ~n276 & ~n277;
  assign f5 = n274 | ~n278;
  assign n280 = ~c1 & ~i0;
  assign n281 = n204 & n280;
  assign n282 = n166 & n281;
  assign n283 = n0 & n280;
  assign g3 = n282 | n283;
  assign n285 = i & n185;
  assign n286 = n183 & n285;
  assign n287 = ~o1 & n184;
  assign n288 = n1 & n188;
  assign n289 = ~n287 & ~n288;
  assign g4 = n286 | ~n289;
  assign n291 = ~c1 & n250;
  assign n292 = ~c1 & e1;
  assign n293 = ~c1 & d1;
  assign n294 = ~n292 & ~n293;
  assign x3 = n291 | ~n294;
  assign n296 = ~n2 & x3;
  assign n297 = ~c1 & n2;
  assign n298 = ~x3 & n297;
  assign g5 = n296 | n298;
  assign h3 = o0 & n280;
  assign n301 = ~n180 & ~n260;
  assign n302 = n185 & n301;
  assign n303 = o1 & n187;
  assign n304 = ~p1 & ~n187;
  assign n305 = ~i0 & ~n304;
  assign n306 = ~n303 & n305;
  assign h4 = n302 | ~n306;
  assign n308 = o2 & x3;
  assign n309 = ~c1 & o2;
  assign n310 = ~x3 & n309;
  assign n311 = n2 & ~o2;
  assign n312 = x3 & n311;
  assign n313 = ~n2 & n308;
  assign n314 = ~n312 & ~n313;
  assign h5 = n310 | ~n314;
  assign i3 = p0 & n280;
  assign n317 = q1 & n184;
  assign n318 = k & n186;
  assign n319 = p1 & n188;
  assign n320 = ~n318 & ~n319;
  assign i4 = n317 | ~n320;
  assign n322 = ~c1 & ~o2;
  assign n323 = ~h5 & ~n322;
  assign n324 = n202 & n308;
  assign n325 = p2 & ~n323;
  assign i5 = n324 | n325;
  assign j3 = q0 & n280;
  assign n328 = r1 & n184;
  assign n329 = l & n186;
  assign n330 = q1 & n188;
  assign n331 = ~n329 & ~n330;
  assign j4 = n328 | ~n331;
  assign n333 = p2 & ~q2;
  assign n334 = ~h5 & n333;
  assign n335 = n308 & n334;
  assign n336 = q2 & ~n323;
  assign n337 = ~p2 & q2;
  assign n338 = x3 & n337;
  assign n339 = ~n336 & ~n338;
  assign j5 = n335 | ~n339;
  assign k3 = r0 & n280;
  assign n342 = s1 & n184;
  assign n343 = m & n186;
  assign n344 = r1 & n188;
  assign n345 = ~n343 & ~n344;
  assign k4 = n342 | ~n345;
  assign n347 = p2 & q2;
  assign n348 = ~r2 & ~h5;
  assign n349 = n347 & n348;
  assign n350 = n308 & n349;
  assign n351 = ~c1 & r2;
  assign n352 = ~n347 & n351;
  assign n353 = r2 & i5;
  assign n354 = ~n352 & ~n353;
  assign k5 = n350 | ~n354;
  assign l3 = s0 & n280;
  assign n357 = t1 & n184;
  assign n358 = n & n186;
  assign n359 = s1 & n188;
  assign n360 = ~n358 & ~n359;
  assign l4 = n357 | ~n360;
  assign n362 = b1 & ~i0;
  assign n363 = ~n176 & n362;
  assign n364 = n1 & n177;
  assign l5 = n363 | n364;
  assign m3 = t0 & n280;
  assign n367 = u1 & n184;
  assign n368 = o & n186;
  assign n369 = t1 & n188;
  assign n370 = ~n368 & ~n369;
  assign m4 = n367 | ~n370;
  assign n372 = l1 & s2;
  assign n373 = ~c1 & t2;
  assign n374 = ~n372 & n373;
  assign n375 = ~c1 & ~t2;
  assign n376 = n372 & n375;
  assign m5 = n374 | n376;
  assign n3 = b & ~i0;
  assign n379 = v1 & n184;
  assign n380 = p & n186;
  assign n381 = u1 & n188;
  assign n382 = ~n380 & ~n381;
  assign n4 = n379 | ~n382;
  assign n384 = ~u0 & n3;
  assign n385 = ~i0 & u2;
  assign n386 = ~n250 & n385;
  assign n5 = n384 | n386;
  assign o3 = a & ~i0;
  assign n389 = w1 & n184;
  assign n390 = q & n186;
  assign n391 = v1 & n188;
  assign n392 = ~n390 & ~n391;
  assign o4 = n389 | ~n392;
  assign n394 = ~f0 & v2;
  assign n395 = n260 & n394;
  assign n396 = n207 & n260;
  assign o5 = n395 | n396;
  assign p3 = ~i0 & v0;
  assign n399 = x1 & n184;
  assign n400 = r & n186;
  assign n401 = w1 & n188;
  assign n402 = ~n400 & ~n401;
  assign p4 = n399 | ~n402;
  assign q3 = ~i0 & w0;
  assign n405 = y1 & n184;
  assign n406 = s & n186;
  assign n407 = x1 & n188;
  assign n408 = ~n406 & ~n407;
  assign q4 = n405 | ~n408;
  assign r3 = ~i0 & x0;
  assign n411 = z1 & n184;
  assign n412 = t & n186;
  assign n413 = y1 & n188;
  assign n414 = ~n412 & ~n413;
  assign r4 = n411 | ~n414;
  assign s3 = ~i0 & y0;
  assign n417 = a2 & n184;
  assign n418 = u & n186;
  assign n419 = z1 & n188;
  assign n420 = ~n418 & ~n419;
  assign s4 = n417 | ~n420;
  assign t3 = ~i0 & z0;
  assign n423 = b2 & n184;
  assign n424 = v & n186;
  assign n425 = a2 & n188;
  assign n426 = ~n424 & ~n425;
  assign t4 = n423 | ~n426;
  assign u3 = a1 & ~i0;
  assign n429 = c2 & n184;
  assign n430 = w & n186;
  assign n431 = b2 & n188;
  assign n432 = ~n430 & ~n431;
  assign u4 = n429 | ~n432;
  assign n434 = f0 & v2;
  assign n435 = ~n207 & n264;
  assign v3 = n434 | ~n435;
  assign n437 = d2 & n184;
  assign n438 = x & n186;
  assign n439 = c2 & n188;
  assign n440 = ~n438 & ~n439;
  assign v4 = n437 | ~n440;
  assign n442 = ~g0 & ~m1;
  assign n443 = v2 & n442;
  assign n444 = ~n260 & n443;
  assign w3 = ~n180 & n444;
  assign n446 = e2 & n184;
  assign n447 = y & n186;
  assign n448 = d2 & n188;
  assign n449 = ~n447 & ~n448;
  assign w4 = n446 | ~n449;
  assign n451 = f2 & n184;
  assign n452 = z & n186;
  assign n453 = e2 & n188;
  assign n454 = ~n452 & ~n453;
  assign x4 = n451 | ~n454;
  assign n456 = f1 & n171;
  assign n457 = o0 & n172;
  assign y3 = n456 | n457;
  assign n459 = g2 & n184;
  assign n460 = a0 & n186;
  assign n461 = f2 & n188;
  assign n462 = ~n460 & ~n461;
  assign y4 = n459 | ~n462;
  assign n464 = g1 & n171;
  assign n465 = p0 & n172;
  assign z3 = n464 | n465;
  assign n467 = h2 & n184;
  assign n468 = b0 & n186;
  assign n469 = g2 & n188;
  assign n470 = ~n468 & ~n469;
  assign z4 = n467 | ~n470;
  assign a3 = ~j1;
  assign b3 = ~k1;
  assign w2 = ~f1;
  assign x2 = ~g1;
  assign y2 = ~h1;
  assign z2 = ~i1;
endmodule


