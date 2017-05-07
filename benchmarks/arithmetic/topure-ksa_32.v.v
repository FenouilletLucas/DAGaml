// Benchmark "ksa_32" written by ABC on Sat Apr 23 20:18:02 2016

module ksa_32 ( 
    a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7, a8, b8,
    a9, b9, a10, b10, a11, b11, a12, b12, a13, b13, a14, b14, a15, b15,
    a16, b16, a17, b17, a18, b18, a19, b19, a20, b20, a21, b21, a22, b22,
    a23, b23, a24, b24, a25, b25, a26, b26, a27, b27, a28, b28, a29, b29,
    a30, b30, a31, b31,
    s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
    s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29,
    s30, s31, s32  );
  input  a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7,
    a8, b8, a9, b9, a10, b10, a11, b11, a12, b12, a13, b13, a14, b14, a15,
    b15, a16, b16, a17, b17, a18, b18, a19, b19, a20, b20, a21, b21, a22,
    b22, a23, b23, a24, b24, a25, b25, a26, b26, a27, b27, a28, b28, a29,
    b29, a30, b30, a31, b31;
  output s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
    s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29,
    s30, s31, s32;
  wire n98, n99, n101, n102, n103, n104, n105, n107, n108, n109, n110, n111,
    n112, n114, n115, n116, n117, n118, n119, n120, n121, n122, n124, n125,
    n126, n127, n128, n129, n130, n131, n132, n134, n135, n136, n137, n138,
    n139, n140, n141, n143, n144, n145, n146, n147, n148, n149, n150, n151,
    n153, n154, n155, n156, n157, n158, n159, n160, n162, n163, n164, n165,
    n166, n167, n168, n169, n170, n172, n173, n174, n175, n176, n177, n178,
    n179, n181, n182, n183, n184, n185, n186, n187, n188, n189, n191, n192,
    n193, n194, n195, n196, n197, n198, n200, n201, n202, n203, n204, n205,
    n206, n207, n209, n210, n211, n212, n213, n214, n215, n216, n218, n219,
    n220, n221, n222, n223, n224, n225, n227, n228, n229, n230, n231, n232,
    n233, n234, n236, n237, n238, n239, n240, n241, n242, n243, n245, n246,
    n247, n248, n249, n250, n251, n252, n254, n255, n256, n257, n258, n259,
    n260, n261, n263, n264, n265, n266, n267, n268, n269, n270, n272, n273,
    n274, n275, n276, n277, n278, n279, n281, n282, n283, n284, n285, n286,
    n287, n288, n290, n291, n292, n293, n294, n295, n296, n297, n299, n300,
    n301, n302, n303, n304, n305, n306, n308, n309, n310, n311, n312, n313,
    n314, n315, n317, n318, n319, n320, n321, n322, n323, n324, n326, n327,
    n328, n329, n330, n331, n332, n333, n335, n336, n337, n338, n339, n340,
    n341, n342, n344, n345, n346, n347, n348, n349, n350, n351, n353, n354,
    n355, n356, n357, n358, n359, n360, n362, n363, n364, n365, n366, n367,
    n368, n369, n371, n372, n373, n374, n375, n376, n377, n378, n380, n381;
  assign n98 = a0 & b0;
  assign n99 = ~a0 & ~b0;
  assign s0 = ~n98 & ~n99;
  assign n101 = a1 & b1;
  assign n102 = ~a1 & ~b1;
  assign n103 = ~n101 & ~n102;
  assign n104 = n98 & n103;
  assign n105 = ~n98 & ~n103;
  assign s1 = ~n104 & ~n105;
  assign n107 = ~n101 & ~n104;
  assign n108 = a2 & b2;
  assign n109 = ~a2 & ~b2;
  assign n110 = ~n108 & ~n109;
  assign n111 = ~n107 & n110;
  assign n112 = n107 & ~n110;
  assign s2 = ~n111 & ~n112;
  assign n114 = n104 & n110;
  assign n115 = ~n101 & ~n108;
  assign n116 = ~n109 & ~n115;
  assign n117 = ~n114 & ~n116;
  assign n118 = a3 & b3;
  assign n119 = ~a3 & ~b3;
  assign n120 = ~n118 & ~n119;
  assign n121 = n117 & ~n120;
  assign n122 = ~n117 & n120;
  assign s3 = ~n121 & ~n122;
  assign n124 = n111 & n120;
  assign n125 = n108 & ~n119;
  assign n126 = ~n118 & ~n125;
  assign n127 = ~n124 & n126;
  assign n128 = a4 & b4;
  assign n129 = ~a4 & ~b4;
  assign n130 = ~n128 & ~n129;
  assign n131 = n127 & ~n130;
  assign n132 = ~n127 & n130;
  assign s4 = ~n131 & ~n132;
  assign n134 = a5 & b5;
  assign n135 = ~a5 & ~b5;
  assign n136 = ~n134 & ~n135;
  assign n137 = ~n118 & ~n128;
  assign n138 = ~n122 & n137;
  assign n139 = ~n129 & ~n138;
  assign n140 = n136 & n139;
  assign n141 = ~n136 & ~n139;
  assign s5 = ~n140 & ~n141;
  assign n143 = n132 & n136;
  assign n144 = n128 & ~n135;
  assign n145 = ~n134 & ~n144;
  assign n146 = ~n143 & n145;
  assign n147 = a6 & b6;
  assign n148 = ~a6 & ~b6;
  assign n149 = ~n147 & ~n148;
  assign n150 = n146 & ~n149;
  assign n151 = ~n146 & n149;
  assign s6 = ~n150 & ~n151;
  assign n153 = a7 & b7;
  assign n154 = ~a7 & ~b7;
  assign n155 = ~n153 & ~n154;
  assign n156 = ~n134 & ~n147;
  assign n157 = ~n140 & n156;
  assign n158 = ~n148 & ~n157;
  assign n159 = n155 & n158;
  assign n160 = ~n155 & ~n158;
  assign s7 = ~n159 & ~n160;
  assign n162 = n151 & n155;
  assign n163 = n147 & ~n154;
  assign n164 = ~n153 & ~n163;
  assign n165 = ~n162 & n164;
  assign n166 = a8 & b8;
  assign n167 = ~a8 & ~b8;
  assign n168 = ~n166 & ~n167;
  assign n169 = n165 & ~n168;
  assign n170 = ~n165 & n168;
  assign s8 = ~n169 & ~n170;
  assign n172 = a9 & b9;
  assign n173 = ~a9 & ~b9;
  assign n174 = ~n172 & ~n173;
  assign n175 = ~n153 & ~n166;
  assign n176 = ~n159 & n175;
  assign n177 = ~n167 & ~n176;
  assign n178 = n174 & n177;
  assign n179 = ~n174 & ~n177;
  assign s9 = ~n178 & ~n179;
  assign n181 = n170 & n174;
  assign n182 = n166 & ~n173;
  assign n183 = ~n172 & ~n182;
  assign n184 = ~n181 & n183;
  assign n185 = a10 & b10;
  assign n186 = ~a10 & ~b10;
  assign n187 = ~n185 & ~n186;
  assign n188 = n184 & ~n187;
  assign n189 = ~n184 & n187;
  assign s10 = ~n188 & ~n189;
  assign n191 = a11 & b11;
  assign n192 = ~a11 & ~b11;
  assign n193 = ~n191 & ~n192;
  assign n194 = ~n172 & ~n185;
  assign n195 = ~n178 & n194;
  assign n196 = ~n186 & ~n195;
  assign n197 = n193 & n196;
  assign n198 = ~n193 & ~n196;
  assign s11 = ~n197 & ~n198;
  assign n200 = a12 & b12;
  assign n201 = ~a12 & ~b12;
  assign n202 = ~n200 & ~n201;
  assign n203 = ~n185 & ~n191;
  assign n204 = ~n189 & n203;
  assign n205 = ~n192 & ~n204;
  assign n206 = n202 & n205;
  assign n207 = ~n202 & ~n205;
  assign s12 = ~n206 & ~n207;
  assign n209 = a13 & b13;
  assign n210 = ~a13 & ~b13;
  assign n211 = ~n209 & ~n210;
  assign n212 = ~n191 & ~n200;
  assign n213 = ~n197 & n212;
  assign n214 = ~n201 & ~n213;
  assign n215 = ~n211 & ~n214;
  assign n216 = n211 & n214;
  assign s13 = ~n215 & ~n216;
  assign n218 = a14 & b14;
  assign n219 = ~a14 & ~b14;
  assign n220 = ~n218 & ~n219;
  assign n221 = ~n200 & ~n209;
  assign n222 = ~n206 & n221;
  assign n223 = ~n210 & ~n222;
  assign n224 = n220 & n223;
  assign n225 = ~n220 & ~n223;
  assign s14 = ~n224 & ~n225;
  assign n227 = a15 & b15;
  assign n228 = ~a15 & ~b15;
  assign n229 = ~n227 & ~n228;
  assign n230 = ~n209 & ~n218;
  assign n231 = ~n216 & n230;
  assign n232 = ~n219 & ~n231;
  assign n233 = ~n229 & ~n232;
  assign n234 = n229 & n232;
  assign s15 = ~n233 & ~n234;
  assign n236 = a16 & b16;
  assign n237 = ~a16 & ~b16;
  assign n238 = ~n236 & ~n237;
  assign n239 = ~n218 & ~n227;
  assign n240 = ~n224 & n239;
  assign n241 = ~n228 & ~n240;
  assign n242 = n238 & n241;
  assign n243 = ~n238 & ~n241;
  assign s16 = ~n242 & ~n243;
  assign n245 = a17 & b17;
  assign n246 = ~a17 & ~b17;
  assign n247 = ~n245 & ~n246;
  assign n248 = ~n227 & ~n236;
  assign n249 = ~n234 & n248;
  assign n250 = ~n237 & ~n249;
  assign n251 = ~n247 & ~n250;
  assign n252 = n247 & n250;
  assign s17 = ~n251 & ~n252;
  assign n254 = a18 & b18;
  assign n255 = ~a18 & ~b18;
  assign n256 = ~n254 & ~n255;
  assign n257 = ~n236 & ~n245;
  assign n258 = ~n242 & n257;
  assign n259 = ~n246 & ~n258;
  assign n260 = n256 & n259;
  assign n261 = ~n256 & ~n259;
  assign s18 = ~n260 & ~n261;
  assign n263 = a19 & b19;
  assign n264 = ~a19 & ~b19;
  assign n265 = ~n263 & ~n264;
  assign n266 = ~n245 & ~n254;
  assign n267 = ~n252 & n266;
  assign n268 = ~n255 & ~n267;
  assign n269 = ~n265 & ~n268;
  assign n270 = n265 & n268;
  assign s19 = ~n269 & ~n270;
  assign n272 = a20 & b20;
  assign n273 = ~a20 & ~b20;
  assign n274 = ~n272 & ~n273;
  assign n275 = ~n254 & ~n263;
  assign n276 = ~n260 & n275;
  assign n277 = ~n264 & ~n276;
  assign n278 = n274 & n277;
  assign n279 = ~n274 & ~n277;
  assign s20 = ~n278 & ~n279;
  assign n281 = a21 & b21;
  assign n282 = ~a21 & ~b21;
  assign n283 = ~n281 & ~n282;
  assign n284 = ~n263 & ~n272;
  assign n285 = ~n270 & n284;
  assign n286 = ~n273 & ~n285;
  assign n287 = ~n283 & ~n286;
  assign n288 = n283 & n286;
  assign s21 = ~n287 & ~n288;
  assign n290 = a22 & b22;
  assign n291 = ~a22 & ~b22;
  assign n292 = ~n290 & ~n291;
  assign n293 = ~n272 & ~n281;
  assign n294 = ~n278 & n293;
  assign n295 = ~n282 & ~n294;
  assign n296 = ~n292 & ~n295;
  assign n297 = n292 & n295;
  assign s22 = ~n296 & ~n297;
  assign n299 = a23 & b23;
  assign n300 = ~a23 & ~b23;
  assign n301 = ~n299 & ~n300;
  assign n302 = ~n281 & ~n290;
  assign n303 = ~n288 & n302;
  assign n304 = ~n291 & ~n303;
  assign n305 = ~n301 & ~n304;
  assign n306 = n301 & n304;
  assign s23 = ~n305 & ~n306;
  assign n308 = a24 & b24;
  assign n309 = ~a24 & ~b24;
  assign n310 = ~n308 & ~n309;
  assign n311 = ~n290 & ~n299;
  assign n312 = ~n297 & n311;
  assign n313 = ~n300 & ~n312;
  assign n314 = ~n310 & ~n313;
  assign n315 = n310 & n313;
  assign s24 = ~n314 & ~n315;
  assign n317 = a25 & b25;
  assign n318 = ~a25 & ~b25;
  assign n319 = ~n317 & ~n318;
  assign n320 = ~n299 & ~n308;
  assign n321 = ~n306 & n320;
  assign n322 = ~n309 & ~n321;
  assign n323 = n319 & n322;
  assign n324 = ~n319 & ~n322;
  assign s25 = ~n323 & ~n324;
  assign n326 = a26 & b26;
  assign n327 = ~a26 & ~b26;
  assign n328 = ~n326 & ~n327;
  assign n329 = ~n308 & ~n317;
  assign n330 = ~n315 & n329;
  assign n331 = ~n318 & ~n330;
  assign n332 = n328 & n331;
  assign n333 = ~n328 & ~n331;
  assign s26 = ~n332 & ~n333;
  assign n335 = a27 & b27;
  assign n336 = ~a27 & ~b27;
  assign n337 = ~n335 & ~n336;
  assign n338 = ~n317 & ~n326;
  assign n339 = ~n323 & n338;
  assign n340 = ~n327 & ~n339;
  assign n341 = ~n337 & ~n340;
  assign n342 = n337 & n340;
  assign s27 = ~n341 & ~n342;
  assign n344 = a28 & b28;
  assign n345 = ~a28 & ~b28;
  assign n346 = ~n344 & ~n345;
  assign n347 = ~n326 & ~n335;
  assign n348 = ~n332 & n347;
  assign n349 = ~n336 & ~n348;
  assign n350 = ~n346 & ~n349;
  assign n351 = n346 & n349;
  assign s28 = ~n350 & ~n351;
  assign n353 = a29 & b29;
  assign n354 = ~a29 & ~b29;
  assign n355 = ~n353 & ~n354;
  assign n356 = ~n335 & ~n344;
  assign n357 = ~n342 & n356;
  assign n358 = ~n345 & ~n357;
  assign n359 = ~n355 & ~n358;
  assign n360 = n355 & n358;
  assign s29 = ~n359 & ~n360;
  assign n362 = a30 & b30;
  assign n363 = ~a30 & ~b30;
  assign n364 = ~n362 & ~n363;
  assign n365 = ~n344 & ~n353;
  assign n366 = ~n351 & n365;
  assign n367 = ~n354 & ~n366;
  assign n368 = ~n364 & ~n367;
  assign n369 = n364 & n367;
  assign s30 = ~n368 & ~n369;
  assign n371 = a31 & b31;
  assign n372 = ~a31 & ~b31;
  assign n373 = ~n371 & ~n372;
  assign n374 = ~n353 & ~n362;
  assign n375 = ~n360 & n374;
  assign n376 = ~n363 & ~n375;
  assign n377 = ~n373 & n376;
  assign n378 = n373 & ~n376;
  assign s31 = n377 | n378;
  assign n380 = ~n362 & ~n371;
  assign n381 = ~n369 & n380;
  assign s32 = ~n372 & ~n381;
endmodule


