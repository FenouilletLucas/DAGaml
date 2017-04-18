// Benchmark "rca_64" written by ABC on Sat Apr 23 20:18:03 2016

module rca_64 ( 
    a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7, a8, b8,
    a9, b9, a10, b10, a11, b11, a12, b12, a13, b13, a14, b14, a15, b15,
    a16, b16, a17, b17, a18, b18, a19, b19, a20, b20, a21, b21, a22, b22,
    a23, b23, a24, b24, a25, b25, a26, b26, a27, b27, a28, b28, a29, b29,
    a30, b30, a31, b31, a32, b32, a33, b33, a34, b34, a35, b35, a36, b36,
    a37, b37, a38, b38, a39, b39, a40, b40, a41, b41, a42, b42, a43, b43,
    a44, b44, a45, b45, a46, b46, a47, b47, a48, b48, a49, b49, a50, b50,
    a51, b51, a52, b52, a53, b53, a54, b54, a55, b55, a56, b56, a57, b57,
    a58, b58, a59, b59, a60, b60, a61, b61, a62, b62, a63, b63,
    s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
    s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29,
    s30, s31, s32, s33, s34, s35, s36, s37, s38, s39, s40, s41, s42, s43,
    s44, s45, s46, s47, s48, s49, s50, s51, s52, s53, s54, s55, s56, s57,
    s58, s59, s60, s61, s62, s63, s64  );
  input  a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7,
    a8, b8, a9, b9, a10, b10, a11, b11, a12, b12, a13, b13, a14, b14, a15,
    b15, a16, b16, a17, b17, a18, b18, a19, b19, a20, b20, a21, b21, a22,
    b22, a23, b23, a24, b24, a25, b25, a26, b26, a27, b27, a28, b28, a29,
    b29, a30, b30, a31, b31, a32, b32, a33, b33, a34, b34, a35, b35, a36,
    b36, a37, b37, a38, b38, a39, b39, a40, b40, a41, b41, a42, b42, a43,
    b43, a44, b44, a45, b45, a46, b46, a47, b47, a48, b48, a49, b49, a50,
    b50, a51, b51, a52, b52, a53, b53, a54, b54, a55, b55, a56, b56, a57,
    b57, a58, b58, a59, b59, a60, b60, a61, b61, a62, b62, a63, b63;
  output s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
    s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29,
    s30, s31, s32, s33, s34, s35, s36, s37, s38, s39, s40, s41, s42, s43,
    s44, s45, s46, s47, s48, s49, s50, s51, s52, s53, s54, s55, s56, s57,
    s58, s59, s60, s61, s62, s63, s64;
  wire n194, n195, n197, n198, n199, n200, n201, n203, n204, n205, n206,
    n207, n208, n210, n211, n212, n213, n214, n215, n217, n218, n219, n220,
    n221, n222, n224, n225, n226, n227, n228, n229, n231, n232, n233, n234,
    n235, n236, n238, n239, n240, n241, n242, n243, n245, n246, n247, n248,
    n249, n250, n252, n253, n254, n255, n256, n257, n259, n260, n261, n262,
    n263, n264, n266, n267, n268, n269, n270, n271, n273, n274, n275, n276,
    n277, n278, n280, n281, n282, n283, n284, n285, n287, n288, n289, n290,
    n291, n292, n294, n295, n296, n297, n298, n299, n301, n302, n303, n304,
    n305, n306, n308, n309, n310, n311, n312, n313, n315, n316, n317, n318,
    n319, n320, n322, n323, n324, n325, n326, n327, n329, n330, n331, n332,
    n333, n334, n336, n337, n338, n339, n340, n341, n343, n344, n345, n346,
    n347, n348, n350, n351, n352, n353, n354, n355, n357, n358, n359, n360,
    n361, n362, n364, n365, n366, n367, n368, n369, n371, n372, n373, n374,
    n375, n376, n378, n379, n380, n381, n382, n383, n385, n386, n387, n388,
    n389, n390, n392, n393, n394, n395, n396, n397, n399, n400, n401, n402,
    n403, n404, n406, n407, n408, n409, n410, n411, n413, n414, n415, n416,
    n417, n418, n420, n421, n422, n423, n424, n425, n427, n428, n429, n430,
    n431, n432, n434, n435, n436, n437, n438, n439, n441, n442, n443, n444,
    n445, n446, n448, n449, n450, n451, n452, n453, n455, n456, n457, n458,
    n459, n460, n462, n463, n464, n465, n466, n467, n469, n470, n471, n472,
    n473, n474, n476, n477, n478, n479, n480, n481, n483, n484, n485, n486,
    n487, n488, n490, n491, n492, n493, n494, n495, n497, n498, n499, n500,
    n501, n502, n504, n505, n506, n507, n508, n509, n511, n512, n513, n514,
    n515, n516, n518, n519, n520, n521, n522, n523, n525, n526, n527, n528,
    n529, n530, n532, n533, n534, n535, n536, n537, n539, n540, n541, n542,
    n543, n544, n546, n547, n548, n549, n550, n551, n553, n554, n555, n556,
    n557, n558, n560, n561, n562, n563, n564, n565, n567, n568, n569, n570,
    n571, n572, n574, n575, n576, n577, n578, n579, n581, n582, n583, n584,
    n585, n586, n588, n589, n590, n591, n592, n593, n595, n596, n597, n598,
    n599, n600, n602, n603, n604, n605, n606, n607, n609, n610, n611, n612,
    n613, n614, n616, n617, n618, n619, n620, n621, n623, n624, n625, n626,
    n627, n628, n630, n631, n632, n633, n634, n635;
  assign n194 = a0 & b0;
  assign n195 = ~a0 & ~b0;
  assign s0 = ~n194 & ~n195;
  assign n197 = a1 & b1;
  assign n198 = ~a1 & ~b1;
  assign n199 = ~n197 & ~n198;
  assign n200 = n194 & n199;
  assign n201 = ~n194 & ~n199;
  assign s1 = ~n200 & ~n201;
  assign n203 = ~n197 & ~n200;
  assign n204 = a2 & b2;
  assign n205 = ~a2 & ~b2;
  assign n206 = ~n204 & ~n205;
  assign n207 = ~n203 & n206;
  assign n208 = n203 & ~n206;
  assign s2 = ~n207 & ~n208;
  assign n210 = ~n204 & ~n207;
  assign n211 = a3 & b3;
  assign n212 = ~a3 & ~b3;
  assign n213 = ~n211 & ~n212;
  assign n214 = ~n210 & n213;
  assign n215 = n210 & ~n213;
  assign s3 = ~n214 & ~n215;
  assign n217 = ~n211 & ~n214;
  assign n218 = a4 & b4;
  assign n219 = ~a4 & ~b4;
  assign n220 = ~n218 & ~n219;
  assign n221 = ~n217 & n220;
  assign n222 = n217 & ~n220;
  assign s4 = ~n221 & ~n222;
  assign n224 = ~n218 & ~n221;
  assign n225 = a5 & b5;
  assign n226 = ~a5 & ~b5;
  assign n227 = ~n225 & ~n226;
  assign n228 = ~n224 & n227;
  assign n229 = n224 & ~n227;
  assign s5 = ~n228 & ~n229;
  assign n231 = ~n225 & ~n228;
  assign n232 = a6 & b6;
  assign n233 = ~a6 & ~b6;
  assign n234 = ~n232 & ~n233;
  assign n235 = ~n231 & n234;
  assign n236 = n231 & ~n234;
  assign s6 = ~n235 & ~n236;
  assign n238 = ~n232 & ~n235;
  assign n239 = a7 & b7;
  assign n240 = ~a7 & ~b7;
  assign n241 = ~n239 & ~n240;
  assign n242 = ~n238 & n241;
  assign n243 = n238 & ~n241;
  assign s7 = ~n242 & ~n243;
  assign n245 = ~n239 & ~n242;
  assign n246 = a8 & b8;
  assign n247 = ~a8 & ~b8;
  assign n248 = ~n246 & ~n247;
  assign n249 = ~n245 & n248;
  assign n250 = n245 & ~n248;
  assign s8 = ~n249 & ~n250;
  assign n252 = ~n246 & ~n249;
  assign n253 = a9 & b9;
  assign n254 = ~a9 & ~b9;
  assign n255 = ~n253 & ~n254;
  assign n256 = ~n252 & n255;
  assign n257 = n252 & ~n255;
  assign s9 = ~n256 & ~n257;
  assign n259 = ~n253 & ~n256;
  assign n260 = a10 & b10;
  assign n261 = ~a10 & ~b10;
  assign n262 = ~n260 & ~n261;
  assign n263 = ~n259 & n262;
  assign n264 = n259 & ~n262;
  assign s10 = ~n263 & ~n264;
  assign n266 = ~n260 & ~n263;
  assign n267 = a11 & b11;
  assign n268 = ~a11 & ~b11;
  assign n269 = ~n267 & ~n268;
  assign n270 = ~n266 & n269;
  assign n271 = n266 & ~n269;
  assign s11 = ~n270 & ~n271;
  assign n273 = ~n267 & ~n270;
  assign n274 = a12 & b12;
  assign n275 = ~a12 & ~b12;
  assign n276 = ~n274 & ~n275;
  assign n277 = ~n273 & n276;
  assign n278 = n273 & ~n276;
  assign s12 = ~n277 & ~n278;
  assign n280 = ~n274 & ~n277;
  assign n281 = a13 & b13;
  assign n282 = ~a13 & ~b13;
  assign n283 = ~n281 & ~n282;
  assign n284 = ~n280 & n283;
  assign n285 = n280 & ~n283;
  assign s13 = ~n284 & ~n285;
  assign n287 = ~n281 & ~n284;
  assign n288 = a14 & b14;
  assign n289 = ~a14 & ~b14;
  assign n290 = ~n288 & ~n289;
  assign n291 = ~n287 & n290;
  assign n292 = n287 & ~n290;
  assign s14 = ~n291 & ~n292;
  assign n294 = ~n288 & ~n291;
  assign n295 = a15 & b15;
  assign n296 = ~a15 & ~b15;
  assign n297 = ~n295 & ~n296;
  assign n298 = ~n294 & n297;
  assign n299 = n294 & ~n297;
  assign s15 = ~n298 & ~n299;
  assign n301 = ~n295 & ~n298;
  assign n302 = a16 & b16;
  assign n303 = ~a16 & ~b16;
  assign n304 = ~n302 & ~n303;
  assign n305 = ~n301 & n304;
  assign n306 = n301 & ~n304;
  assign s16 = ~n305 & ~n306;
  assign n308 = ~n302 & ~n305;
  assign n309 = a17 & b17;
  assign n310 = ~a17 & ~b17;
  assign n311 = ~n309 & ~n310;
  assign n312 = ~n308 & n311;
  assign n313 = n308 & ~n311;
  assign s17 = ~n312 & ~n313;
  assign n315 = ~n309 & ~n312;
  assign n316 = a18 & b18;
  assign n317 = ~a18 & ~b18;
  assign n318 = ~n316 & ~n317;
  assign n319 = ~n315 & n318;
  assign n320 = n315 & ~n318;
  assign s18 = ~n319 & ~n320;
  assign n322 = ~n316 & ~n319;
  assign n323 = a19 & b19;
  assign n324 = ~a19 & ~b19;
  assign n325 = ~n323 & ~n324;
  assign n326 = ~n322 & n325;
  assign n327 = n322 & ~n325;
  assign s19 = ~n326 & ~n327;
  assign n329 = ~n323 & ~n326;
  assign n330 = a20 & b20;
  assign n331 = ~a20 & ~b20;
  assign n332 = ~n330 & ~n331;
  assign n333 = ~n329 & n332;
  assign n334 = n329 & ~n332;
  assign s20 = ~n333 & ~n334;
  assign n336 = ~n330 & ~n333;
  assign n337 = a21 & b21;
  assign n338 = ~a21 & ~b21;
  assign n339 = ~n337 & ~n338;
  assign n340 = ~n336 & n339;
  assign n341 = n336 & ~n339;
  assign s21 = ~n340 & ~n341;
  assign n343 = ~n337 & ~n340;
  assign n344 = a22 & b22;
  assign n345 = ~a22 & ~b22;
  assign n346 = ~n344 & ~n345;
  assign n347 = ~n343 & n346;
  assign n348 = n343 & ~n346;
  assign s22 = ~n347 & ~n348;
  assign n350 = ~n344 & ~n347;
  assign n351 = a23 & b23;
  assign n352 = ~a23 & ~b23;
  assign n353 = ~n351 & ~n352;
  assign n354 = ~n350 & n353;
  assign n355 = n350 & ~n353;
  assign s23 = ~n354 & ~n355;
  assign n357 = ~n351 & ~n354;
  assign n358 = a24 & b24;
  assign n359 = ~a24 & ~b24;
  assign n360 = ~n358 & ~n359;
  assign n361 = ~n357 & n360;
  assign n362 = n357 & ~n360;
  assign s24 = ~n361 & ~n362;
  assign n364 = ~n358 & ~n361;
  assign n365 = a25 & b25;
  assign n366 = ~a25 & ~b25;
  assign n367 = ~n365 & ~n366;
  assign n368 = ~n364 & n367;
  assign n369 = n364 & ~n367;
  assign s25 = ~n368 & ~n369;
  assign n371 = ~n365 & ~n368;
  assign n372 = a26 & b26;
  assign n373 = ~a26 & ~b26;
  assign n374 = ~n372 & ~n373;
  assign n375 = ~n371 & n374;
  assign n376 = n371 & ~n374;
  assign s26 = ~n375 & ~n376;
  assign n378 = ~n372 & ~n375;
  assign n379 = a27 & b27;
  assign n380 = ~a27 & ~b27;
  assign n381 = ~n379 & ~n380;
  assign n382 = ~n378 & n381;
  assign n383 = n378 & ~n381;
  assign s27 = ~n382 & ~n383;
  assign n385 = ~n379 & ~n382;
  assign n386 = a28 & b28;
  assign n387 = ~a28 & ~b28;
  assign n388 = ~n386 & ~n387;
  assign n389 = ~n385 & n388;
  assign n390 = n385 & ~n388;
  assign s28 = ~n389 & ~n390;
  assign n392 = ~n386 & ~n389;
  assign n393 = a29 & b29;
  assign n394 = ~a29 & ~b29;
  assign n395 = ~n393 & ~n394;
  assign n396 = ~n392 & n395;
  assign n397 = n392 & ~n395;
  assign s29 = ~n396 & ~n397;
  assign n399 = ~n393 & ~n396;
  assign n400 = a30 & b30;
  assign n401 = ~a30 & ~b30;
  assign n402 = ~n400 & ~n401;
  assign n403 = ~n399 & n402;
  assign n404 = n399 & ~n402;
  assign s30 = ~n403 & ~n404;
  assign n406 = ~n400 & ~n403;
  assign n407 = a31 & b31;
  assign n408 = ~a31 & ~b31;
  assign n409 = ~n407 & ~n408;
  assign n410 = ~n406 & n409;
  assign n411 = n406 & ~n409;
  assign s31 = ~n410 & ~n411;
  assign n413 = ~n407 & ~n410;
  assign n414 = a32 & b32;
  assign n415 = ~a32 & ~b32;
  assign n416 = ~n414 & ~n415;
  assign n417 = ~n413 & n416;
  assign n418 = n413 & ~n416;
  assign s32 = ~n417 & ~n418;
  assign n420 = ~n414 & ~n417;
  assign n421 = a33 & b33;
  assign n422 = ~a33 & ~b33;
  assign n423 = ~n421 & ~n422;
  assign n424 = ~n420 & n423;
  assign n425 = n420 & ~n423;
  assign s33 = ~n424 & ~n425;
  assign n427 = ~n421 & ~n424;
  assign n428 = a34 & b34;
  assign n429 = ~a34 & ~b34;
  assign n430 = ~n428 & ~n429;
  assign n431 = ~n427 & n430;
  assign n432 = n427 & ~n430;
  assign s34 = ~n431 & ~n432;
  assign n434 = ~n428 & ~n431;
  assign n435 = a35 & b35;
  assign n436 = ~a35 & ~b35;
  assign n437 = ~n435 & ~n436;
  assign n438 = ~n434 & n437;
  assign n439 = n434 & ~n437;
  assign s35 = ~n438 & ~n439;
  assign n441 = ~n435 & ~n438;
  assign n442 = a36 & b36;
  assign n443 = ~a36 & ~b36;
  assign n444 = ~n442 & ~n443;
  assign n445 = ~n441 & n444;
  assign n446 = n441 & ~n444;
  assign s36 = ~n445 & ~n446;
  assign n448 = ~n442 & ~n445;
  assign n449 = a37 & b37;
  assign n450 = ~a37 & ~b37;
  assign n451 = ~n449 & ~n450;
  assign n452 = ~n448 & n451;
  assign n453 = n448 & ~n451;
  assign s37 = ~n452 & ~n453;
  assign n455 = ~n449 & ~n452;
  assign n456 = a38 & b38;
  assign n457 = ~a38 & ~b38;
  assign n458 = ~n456 & ~n457;
  assign n459 = ~n455 & n458;
  assign n460 = n455 & ~n458;
  assign s38 = ~n459 & ~n460;
  assign n462 = ~n456 & ~n459;
  assign n463 = a39 & b39;
  assign n464 = ~a39 & ~b39;
  assign n465 = ~n463 & ~n464;
  assign n466 = ~n462 & n465;
  assign n467 = n462 & ~n465;
  assign s39 = ~n466 & ~n467;
  assign n469 = ~n463 & ~n466;
  assign n470 = a40 & b40;
  assign n471 = ~a40 & ~b40;
  assign n472 = ~n470 & ~n471;
  assign n473 = ~n469 & n472;
  assign n474 = n469 & ~n472;
  assign s40 = ~n473 & ~n474;
  assign n476 = ~n470 & ~n473;
  assign n477 = a41 & b41;
  assign n478 = ~a41 & ~b41;
  assign n479 = ~n477 & ~n478;
  assign n480 = ~n476 & n479;
  assign n481 = n476 & ~n479;
  assign s41 = ~n480 & ~n481;
  assign n483 = ~n477 & ~n480;
  assign n484 = a42 & b42;
  assign n485 = ~a42 & ~b42;
  assign n486 = ~n484 & ~n485;
  assign n487 = ~n483 & n486;
  assign n488 = n483 & ~n486;
  assign s42 = ~n487 & ~n488;
  assign n490 = ~n484 & ~n487;
  assign n491 = a43 & b43;
  assign n492 = ~a43 & ~b43;
  assign n493 = ~n491 & ~n492;
  assign n494 = ~n490 & n493;
  assign n495 = n490 & ~n493;
  assign s43 = ~n494 & ~n495;
  assign n497 = ~n491 & ~n494;
  assign n498 = a44 & b44;
  assign n499 = ~a44 & ~b44;
  assign n500 = ~n498 & ~n499;
  assign n501 = ~n497 & n500;
  assign n502 = n497 & ~n500;
  assign s44 = ~n501 & ~n502;
  assign n504 = ~n498 & ~n501;
  assign n505 = a45 & b45;
  assign n506 = ~a45 & ~b45;
  assign n507 = ~n505 & ~n506;
  assign n508 = ~n504 & n507;
  assign n509 = n504 & ~n507;
  assign s45 = ~n508 & ~n509;
  assign n511 = ~n505 & ~n508;
  assign n512 = a46 & b46;
  assign n513 = ~a46 & ~b46;
  assign n514 = ~n512 & ~n513;
  assign n515 = ~n511 & n514;
  assign n516 = n511 & ~n514;
  assign s46 = ~n515 & ~n516;
  assign n518 = ~n512 & ~n515;
  assign n519 = a47 & b47;
  assign n520 = ~a47 & ~b47;
  assign n521 = ~n519 & ~n520;
  assign n522 = ~n518 & n521;
  assign n523 = n518 & ~n521;
  assign s47 = ~n522 & ~n523;
  assign n525 = ~n519 & ~n522;
  assign n526 = a48 & b48;
  assign n527 = ~a48 & ~b48;
  assign n528 = ~n526 & ~n527;
  assign n529 = ~n525 & n528;
  assign n530 = n525 & ~n528;
  assign s48 = ~n529 & ~n530;
  assign n532 = ~n526 & ~n529;
  assign n533 = a49 & b49;
  assign n534 = ~a49 & ~b49;
  assign n535 = ~n533 & ~n534;
  assign n536 = ~n532 & n535;
  assign n537 = n532 & ~n535;
  assign s49 = ~n536 & ~n537;
  assign n539 = ~n533 & ~n536;
  assign n540 = a50 & b50;
  assign n541 = ~a50 & ~b50;
  assign n542 = ~n540 & ~n541;
  assign n543 = ~n539 & n542;
  assign n544 = n539 & ~n542;
  assign s50 = ~n543 & ~n544;
  assign n546 = ~n540 & ~n543;
  assign n547 = a51 & b51;
  assign n548 = ~a51 & ~b51;
  assign n549 = ~n547 & ~n548;
  assign n550 = ~n546 & n549;
  assign n551 = n546 & ~n549;
  assign s51 = ~n550 & ~n551;
  assign n553 = ~n547 & ~n550;
  assign n554 = a52 & b52;
  assign n555 = ~a52 & ~b52;
  assign n556 = ~n554 & ~n555;
  assign n557 = ~n553 & n556;
  assign n558 = n553 & ~n556;
  assign s52 = ~n557 & ~n558;
  assign n560 = ~n554 & ~n557;
  assign n561 = a53 & b53;
  assign n562 = ~a53 & ~b53;
  assign n563 = ~n561 & ~n562;
  assign n564 = ~n560 & n563;
  assign n565 = n560 & ~n563;
  assign s53 = ~n564 & ~n565;
  assign n567 = ~n561 & ~n564;
  assign n568 = a54 & b54;
  assign n569 = ~a54 & ~b54;
  assign n570 = ~n568 & ~n569;
  assign n571 = ~n567 & n570;
  assign n572 = n567 & ~n570;
  assign s54 = ~n571 & ~n572;
  assign n574 = ~n568 & ~n571;
  assign n575 = a55 & b55;
  assign n576 = ~a55 & ~b55;
  assign n577 = ~n575 & ~n576;
  assign n578 = ~n574 & n577;
  assign n579 = n574 & ~n577;
  assign s55 = ~n578 & ~n579;
  assign n581 = ~n575 & ~n578;
  assign n582 = a56 & b56;
  assign n583 = ~a56 & ~b56;
  assign n584 = ~n582 & ~n583;
  assign n585 = ~n581 & n584;
  assign n586 = n581 & ~n584;
  assign s56 = ~n585 & ~n586;
  assign n588 = ~n582 & ~n585;
  assign n589 = a57 & b57;
  assign n590 = ~a57 & ~b57;
  assign n591 = ~n589 & ~n590;
  assign n592 = ~n588 & n591;
  assign n593 = n588 & ~n591;
  assign s57 = ~n592 & ~n593;
  assign n595 = ~n589 & ~n592;
  assign n596 = a58 & b58;
  assign n597 = ~a58 & ~b58;
  assign n598 = ~n596 & ~n597;
  assign n599 = ~n595 & n598;
  assign n600 = n595 & ~n598;
  assign s58 = ~n599 & ~n600;
  assign n602 = ~n596 & ~n599;
  assign n603 = a59 & b59;
  assign n604 = ~a59 & ~b59;
  assign n605 = ~n603 & ~n604;
  assign n606 = ~n602 & n605;
  assign n607 = n602 & ~n605;
  assign s59 = ~n606 & ~n607;
  assign n609 = ~n603 & ~n606;
  assign n610 = a60 & b60;
  assign n611 = ~a60 & ~b60;
  assign n612 = ~n610 & ~n611;
  assign n613 = ~n609 & n612;
  assign n614 = n609 & ~n612;
  assign s60 = ~n613 & ~n614;
  assign n616 = ~n610 & ~n613;
  assign n617 = a61 & b61;
  assign n618 = ~a61 & ~b61;
  assign n619 = ~n617 & ~n618;
  assign n620 = ~n616 & n619;
  assign n621 = n616 & ~n619;
  assign s61 = ~n620 & ~n621;
  assign n623 = ~n617 & ~n620;
  assign n624 = a62 & b62;
  assign n625 = ~a62 & ~b62;
  assign n626 = ~n624 & ~n625;
  assign n627 = ~n623 & n626;
  assign n628 = n623 & ~n626;
  assign s62 = ~n627 & ~n628;
  assign n630 = ~n624 & ~n627;
  assign n631 = a63 & b63;
  assign n632 = ~a63 & ~b63;
  assign n633 = ~n631 & ~n632;
  assign n634 = ~n630 & n633;
  assign n635 = n630 & ~n633;
  assign s63 = ~n634 & ~n635;
  assign s64 = n631 | n634;
endmodule


