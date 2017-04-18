// Benchmark "moa_6x8" written by ABC on Sat Apr 23 20:18:02 2016

module moa_6x8 ( 
    a0_0, a1_0, a2_0, a3_0, a4_0, a5_0, a6_0, a7_0, a0_1, a1_1, a2_1, a3_1,
    a4_1, a5_1, a6_1, a7_1, a0_2, a1_2, a2_2, a3_2, a4_2, a5_2, a6_2, a7_2,
    a0_3, a1_3, a2_3, a3_3, a4_3, a5_3, a6_3, a7_3, a0_4, a1_4, a2_4, a3_4,
    a4_4, a5_4, a6_4, a7_4, a0_5, a1_5, a2_5, a3_5, a4_5, a5_5, a6_5, a7_5,
    s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10  );
  input  a0_0, a1_0, a2_0, a3_0, a4_0, a5_0, a6_0, a7_0, a0_1, a1_1,
    a2_1, a3_1, a4_1, a5_1, a6_1, a7_1, a0_2, a1_2, a2_2, a3_2, a4_2, a5_2,
    a6_2, a7_2, a0_3, a1_3, a2_3, a3_3, a4_3, a5_3, a6_3, a7_3, a0_4, a1_4,
    a2_4, a3_4, a4_4, a5_4, a6_4, a7_4, a0_5, a1_5, a2_5, a3_5, a4_5, a5_5,
    a6_5, a7_5;
  output s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10;
  wire n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
    n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
    n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n101, n102,
    n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
    n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
    n127, n128, n129, n130, n131, n132, n134, n135, n136, n137, n138, n139,
    n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
    n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
    n164, n165, n166, n167, n168, n169, n171, n172, n173, n174, n175, n176,
    n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
    n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
    n201, n202, n203, n204, n205, n206, n207, n209, n210, n211, n212, n213,
    n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
    n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
    n238, n239, n240, n241, n242, n243, n244, n245, n247, n248, n249, n250,
    n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
    n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
    n275, n276, n277, n278, n279, n280, n281, n282, n283, n285, n286, n287,
    n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
    n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
    n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n323, n324,
    n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
    n337, n338, n339, n340, n341, n343, n344, n345, n346, n347, n348, n349;
  assign n60 = a0_0 & a0_1;
  assign n61 = ~a0_0 & ~a0_1;
  assign n62 = ~n60 & ~n61;
  assign n63 = a0_2 & n62;
  assign n64 = ~a0_2 & ~n62;
  assign n65 = ~n63 & ~n64;
  assign n66 = a0_3 & a0_4;
  assign n67 = ~a0_3 & ~a0_4;
  assign n68 = ~n66 & ~n67;
  assign n69 = a0_5 & n68;
  assign n70 = ~a0_5 & ~n68;
  assign n71 = ~n69 & ~n70;
  assign n72 = n65 & n71;
  assign n73 = ~n65 & ~n71;
  assign s0 = ~n72 & ~n73;
  assign n75 = ~n60 & ~n63;
  assign n76 = ~n66 & ~n69;
  assign n77 = ~n75 & ~n76;
  assign n78 = n75 & n76;
  assign n79 = ~n77 & ~n78;
  assign n80 = n72 & n79;
  assign n81 = ~n72 & ~n79;
  assign n82 = ~n80 & ~n81;
  assign n83 = a1_0 & a1_1;
  assign n84 = ~a1_0 & ~a1_1;
  assign n85 = ~n83 & ~n84;
  assign n86 = a1_2 & n85;
  assign n87 = ~a1_2 & ~n85;
  assign n88 = ~n86 & ~n87;
  assign n89 = a1_3 & a1_4;
  assign n90 = ~a1_3 & ~a1_4;
  assign n91 = ~n89 & ~n90;
  assign n92 = a1_5 & n91;
  assign n93 = ~a1_5 & ~n91;
  assign n94 = ~n92 & ~n93;
  assign n95 = n88 & n94;
  assign n96 = ~n88 & ~n94;
  assign n97 = ~n95 & ~n96;
  assign n98 = n82 & n97;
  assign n99 = ~n82 & ~n97;
  assign s1 = ~n98 & ~n99;
  assign n101 = a2_0 & a2_1;
  assign n102 = ~a2_0 & ~a2_1;
  assign n103 = ~n101 & ~n102;
  assign n104 = a2_2 & n103;
  assign n105 = ~a2_2 & ~n103;
  assign n106 = ~n104 & ~n105;
  assign n107 = a2_3 & a2_4;
  assign n108 = ~a2_3 & ~a2_4;
  assign n109 = ~n107 & ~n108;
  assign n110 = a2_5 & n109;
  assign n111 = ~a2_5 & ~n109;
  assign n112 = ~n110 & ~n111;
  assign n113 = n106 & n112;
  assign n114 = ~n106 & ~n112;
  assign n115 = ~n113 & ~n114;
  assign n116 = ~n77 & ~n80;
  assign n117 = ~n83 & ~n86;
  assign n118 = ~n89 & ~n92;
  assign n119 = ~n117 & ~n118;
  assign n120 = n117 & n118;
  assign n121 = ~n119 & ~n120;
  assign n122 = n95 & n121;
  assign n123 = ~n95 & ~n121;
  assign n124 = ~n122 & ~n123;
  assign n125 = ~n116 & n124;
  assign n126 = n116 & ~n124;
  assign n127 = ~n125 & ~n126;
  assign n128 = n115 & n127;
  assign n129 = ~n115 & ~n127;
  assign n130 = ~n128 & ~n129;
  assign n131 = n98 & n130;
  assign n132 = ~n98 & ~n130;
  assign s2 = ~n131 & ~n132;
  assign n134 = ~n125 & ~n128;
  assign n135 = a3_0 & a3_1;
  assign n136 = ~a3_0 & ~a3_1;
  assign n137 = ~n135 & ~n136;
  assign n138 = a3_2 & n137;
  assign n139 = ~a3_2 & ~n137;
  assign n140 = ~n138 & ~n139;
  assign n141 = a3_3 & a3_4;
  assign n142 = ~a3_3 & ~a3_4;
  assign n143 = ~n141 & ~n142;
  assign n144 = a3_5 & n143;
  assign n145 = ~a3_5 & ~n143;
  assign n146 = ~n144 & ~n145;
  assign n147 = n140 & n146;
  assign n148 = ~n140 & ~n146;
  assign n149 = ~n147 & ~n148;
  assign n150 = ~n119 & ~n122;
  assign n151 = ~n101 & ~n104;
  assign n152 = ~n107 & ~n110;
  assign n153 = ~n151 & ~n152;
  assign n154 = n151 & n152;
  assign n155 = ~n153 & ~n154;
  assign n156 = n113 & n155;
  assign n157 = ~n113 & ~n155;
  assign n158 = ~n156 & ~n157;
  assign n159 = ~n150 & n158;
  assign n160 = n150 & ~n158;
  assign n161 = ~n159 & ~n160;
  assign n162 = n149 & n161;
  assign n163 = ~n149 & ~n161;
  assign n164 = ~n162 & ~n163;
  assign n165 = ~n134 & n164;
  assign n166 = n134 & ~n164;
  assign n167 = ~n165 & ~n166;
  assign n168 = n131 & n167;
  assign n169 = ~n131 & ~n167;
  assign s3 = ~n168 & ~n169;
  assign n171 = ~n165 & ~n168;
  assign n172 = ~n159 & ~n162;
  assign n173 = a4_0 & a4_1;
  assign n174 = ~a4_0 & ~a4_1;
  assign n175 = ~n173 & ~n174;
  assign n176 = a4_2 & n175;
  assign n177 = ~a4_2 & ~n175;
  assign n178 = ~n176 & ~n177;
  assign n179 = a4_3 & a4_4;
  assign n180 = ~a4_3 & ~a4_4;
  assign n181 = ~n179 & ~n180;
  assign n182 = a4_5 & n181;
  assign n183 = ~a4_5 & ~n181;
  assign n184 = ~n182 & ~n183;
  assign n185 = n178 & n184;
  assign n186 = ~n178 & ~n184;
  assign n187 = ~n185 & ~n186;
  assign n188 = ~n153 & ~n156;
  assign n189 = ~n135 & ~n138;
  assign n190 = ~n141 & ~n144;
  assign n191 = ~n189 & ~n190;
  assign n192 = n189 & n190;
  assign n193 = ~n191 & ~n192;
  assign n194 = n147 & n193;
  assign n195 = ~n147 & ~n193;
  assign n196 = ~n194 & ~n195;
  assign n197 = ~n188 & n196;
  assign n198 = n188 & ~n196;
  assign n199 = ~n197 & ~n198;
  assign n200 = n187 & n199;
  assign n201 = ~n187 & ~n199;
  assign n202 = ~n200 & ~n201;
  assign n203 = ~n172 & n202;
  assign n204 = n172 & ~n202;
  assign n205 = ~n203 & ~n204;
  assign n206 = ~n171 & n205;
  assign n207 = n171 & ~n205;
  assign s4 = ~n206 & ~n207;
  assign n209 = ~n203 & ~n206;
  assign n210 = ~n197 & ~n200;
  assign n211 = a5_0 & a5_1;
  assign n212 = ~a5_0 & ~a5_1;
  assign n213 = ~n211 & ~n212;
  assign n214 = a5_2 & n213;
  assign n215 = ~a5_2 & ~n213;
  assign n216 = ~n214 & ~n215;
  assign n217 = a5_3 & a5_4;
  assign n218 = ~a5_3 & ~a5_4;
  assign n219 = ~n217 & ~n218;
  assign n220 = a5_5 & n219;
  assign n221 = ~a5_5 & ~n219;
  assign n222 = ~n220 & ~n221;
  assign n223 = n216 & n222;
  assign n224 = ~n216 & ~n222;
  assign n225 = ~n223 & ~n224;
  assign n226 = ~n191 & ~n194;
  assign n227 = ~n173 & ~n176;
  assign n228 = ~n179 & ~n182;
  assign n229 = ~n227 & ~n228;
  assign n230 = n227 & n228;
  assign n231 = ~n229 & ~n230;
  assign n232 = n185 & n231;
  assign n233 = ~n185 & ~n231;
  assign n234 = ~n232 & ~n233;
  assign n235 = ~n226 & n234;
  assign n236 = n226 & ~n234;
  assign n237 = ~n235 & ~n236;
  assign n238 = n225 & n237;
  assign n239 = ~n225 & ~n237;
  assign n240 = ~n238 & ~n239;
  assign n241 = ~n210 & n240;
  assign n242 = n210 & ~n240;
  assign n243 = ~n241 & ~n242;
  assign n244 = ~n209 & n243;
  assign n245 = n209 & ~n243;
  assign s5 = ~n244 & ~n245;
  assign n247 = ~n241 & ~n244;
  assign n248 = ~n235 & ~n238;
  assign n249 = a6_0 & a6_1;
  assign n250 = ~a6_0 & ~a6_1;
  assign n251 = ~n249 & ~n250;
  assign n252 = a6_2 & n251;
  assign n253 = ~a6_2 & ~n251;
  assign n254 = ~n252 & ~n253;
  assign n255 = a6_3 & a6_4;
  assign n256 = ~a6_3 & ~a6_4;
  assign n257 = ~n255 & ~n256;
  assign n258 = a6_5 & n257;
  assign n259 = ~a6_5 & ~n257;
  assign n260 = ~n258 & ~n259;
  assign n261 = n254 & n260;
  assign n262 = ~n254 & ~n260;
  assign n263 = ~n261 & ~n262;
  assign n264 = ~n229 & ~n232;
  assign n265 = ~n211 & ~n214;
  assign n266 = ~n217 & ~n220;
  assign n267 = ~n265 & ~n266;
  assign n268 = n265 & n266;
  assign n269 = ~n267 & ~n268;
  assign n270 = n223 & n269;
  assign n271 = ~n223 & ~n269;
  assign n272 = ~n270 & ~n271;
  assign n273 = ~n264 & n272;
  assign n274 = n264 & ~n272;
  assign n275 = ~n273 & ~n274;
  assign n276 = n263 & n275;
  assign n277 = ~n263 & ~n275;
  assign n278 = ~n276 & ~n277;
  assign n279 = ~n248 & n278;
  assign n280 = n248 & ~n278;
  assign n281 = ~n279 & ~n280;
  assign n282 = ~n247 & n281;
  assign n283 = n247 & ~n281;
  assign s6 = ~n282 & ~n283;
  assign n285 = ~n279 & ~n282;
  assign n286 = ~n273 & ~n276;
  assign n287 = a7_0 & a7_1;
  assign n288 = ~a7_0 & ~a7_1;
  assign n289 = ~n287 & ~n288;
  assign n290 = a7_2 & n289;
  assign n291 = ~a7_2 & ~n289;
  assign n292 = ~n290 & ~n291;
  assign n293 = a7_3 & a7_4;
  assign n294 = ~a7_3 & ~a7_4;
  assign n295 = ~n293 & ~n294;
  assign n296 = a7_5 & n295;
  assign n297 = ~a7_5 & ~n295;
  assign n298 = ~n296 & ~n297;
  assign n299 = n292 & n298;
  assign n300 = ~n292 & ~n298;
  assign n301 = ~n299 & ~n300;
  assign n302 = ~n267 & ~n270;
  assign n303 = ~n249 & ~n252;
  assign n304 = ~n255 & ~n258;
  assign n305 = ~n303 & ~n304;
  assign n306 = n303 & n304;
  assign n307 = ~n305 & ~n306;
  assign n308 = n261 & n307;
  assign n309 = ~n261 & ~n307;
  assign n310 = ~n308 & ~n309;
  assign n311 = ~n302 & n310;
  assign n312 = n302 & ~n310;
  assign n313 = ~n311 & ~n312;
  assign n314 = n301 & n313;
  assign n315 = ~n301 & ~n313;
  assign n316 = ~n314 & ~n315;
  assign n317 = ~n286 & n316;
  assign n318 = n286 & ~n316;
  assign n319 = ~n317 & ~n318;
  assign n320 = ~n285 & n319;
  assign n321 = n285 & ~n319;
  assign s7 = ~n320 & ~n321;
  assign n323 = ~n317 & ~n320;
  assign n324 = ~n311 & ~n314;
  assign n325 = ~n305 & ~n308;
  assign n326 = ~n287 & ~n290;
  assign n327 = ~n293 & ~n296;
  assign n328 = ~n326 & ~n327;
  assign n329 = n326 & n327;
  assign n330 = ~n328 & ~n329;
  assign n331 = n299 & n330;
  assign n332 = ~n299 & ~n330;
  assign n333 = ~n331 & ~n332;
  assign n334 = ~n325 & n333;
  assign n335 = n325 & ~n333;
  assign n336 = ~n334 & ~n335;
  assign n337 = ~n324 & n336;
  assign n338 = n324 & ~n336;
  assign n339 = ~n337 & ~n338;
  assign n340 = ~n323 & n339;
  assign n341 = n323 & ~n339;
  assign s8 = ~n340 & ~n341;
  assign n343 = ~n337 & ~n340;
  assign n344 = ~n328 & ~n331;
  assign n345 = n334 & ~n344;
  assign n346 = ~n334 & n344;
  assign n347 = ~n345 & ~n346;
  assign n348 = ~n343 & n347;
  assign n349 = n343 & ~n347;
  assign s9 = ~n348 & ~n349;
  assign s10 = n345 | n348;
endmodule


