// Benchmark "C1908.iscas" written by ABC on Tue May 16 16:07:45 2017

module \C1908.iscas  ( 
    \122(7) , \237(23) , \101(0) , \900(29) , \953(32) , \475(26) ,
    \210(16) , \469(24) , \119(6) , \478(27) , \221(19) , \125(8) ,
    \104(1) , \902(30) , \110(3) , \214(17) , \131(10) , \128(9) ,
    \107(2) , \140(13) , \217(18) , \224(20) , \134(11) , \113(4) ,
    \472(25) , \143(14) , \227(21) , \898(28) , \234(22) , \952(31) ,
    \116(5) , \137(12) , \146(15) ,
    \51(899) , \9(863) , \66(903) , \12(862) , \60(901) , \27(857) ,
    \39(853) , \15(861) , \30(856) , \42(852) , \3(865) , \69(908) ,
    \72(909) , \75(866) , \57(912) , \21(859) , \33(855) , \45(851) ,
    \18(860) , \6(864) , \63(902) , \54(900) , \24(858) , \36(854) ,
    \48(850)   );
  input  \122(7) , \237(23) , \101(0) , \900(29) , \953(32) , \475(26) ,
    \210(16) , \469(24) , \119(6) , \478(27) , \221(19) , \125(8) ,
    \104(1) , \902(30) , \110(3) , \214(17) , \131(10) , \128(9) ,
    \107(2) , \140(13) , \217(18) , \224(20) , \134(11) , \113(4) ,
    \472(25) , \143(14) , \227(21) , \898(28) , \234(22) , \952(31) ,
    \116(5) , \137(12) , \146(15) ;
  output \51(899) , \9(863) , \66(903) , \12(862) , \60(901) , \27(857) ,
    \39(853) , \15(861) , \30(856) , \42(852) , \3(865) , \69(908) ,
    \72(909) , \75(866) , \57(912) , \21(859) , \33(855) , \45(851) ,
    \18(860) , \6(864) , \63(902) , \54(900) , \24(858) , \36(854) ,
    \48(850) ;
  wire n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
    n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
    n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
    n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
    n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
    n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
    n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
    n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
    n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
    n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
    n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
    n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
    n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
    n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
    n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
    n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
    n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
    n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
    n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
    n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
    n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
    n317, n319, n320, n322, n323, n324, n325, n326, n328, n329, n331, n332,
    n333, n334, n335, n337, n338, n340, n341, n343, n344, n346, n347, n349,
    n350, n352, n353, n355, n356, n357, n358, n359, n360, n361, n362, n363,
    n364, n365, n366, n367, n368, n370, n371, n372, n373, n374, n375, n376,
    n377, n378, n379, n380, n381, n383, n384, n385, n386, n387, n388, n389,
    n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
    n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
    n415, n416, n417, n418, n419, n420, n421, n422, n424, n425, n427, n428,
    n430, n431, n433, n434, n436, n437, n439, n440, n441, n442, n443, n445,
    n446, n447, n448, n449, n450, n451, n452, n454, n455, n457, n458, n460,
    n461;
  assign n59 = ~\902(30)  & \234(22) ;
  assign n60 = \221(19)  & ~n59;
  assign n61 = ~\953(32)  & \227(21) ;
  assign n62 = \104(1)  & ~\107(2) ;
  assign n63 = ~\104(1)  & \107(2) ;
  assign n64 = ~n62 & ~n63;
  assign n65 = \101(0)  & ~n64;
  assign n66 = ~\101(0)  & n64;
  assign n67 = ~n65 & ~n66;
  assign n68 = \143(14)  & ~\146(15) ;
  assign n69 = ~\143(14)  & \146(15) ;
  assign n70 = ~n68 & ~n69;
  assign n71 = \128(9)  & ~n70;
  assign n72 = ~\128(9)  & n70;
  assign n73 = ~n71 & ~n72;
  assign n74 = ~n67 & ~n73;
  assign n75 = n67 & n73;
  assign n76 = ~n74 & ~n75;
  assign n77 = \134(11)  & ~\137(12) ;
  assign n78 = ~\134(11)  & \137(12) ;
  assign n79 = ~n77 & ~n78;
  assign n80 = \131(10)  & ~n79;
  assign n81 = ~\131(10)  & n79;
  assign n82 = ~n80 & ~n81;
  assign n83 = ~n76 & ~n82;
  assign n84 = n76 & n82;
  assign n85 = ~n83 & ~n84;
  assign n86 = \110(3)  & ~\140(13) ;
  assign n87 = ~\110(3)  & \140(13) ;
  assign n88 = ~n86 & ~n87;
  assign n89 = ~n85 & ~n88;
  assign n90 = n85 & n88;
  assign n91 = ~n89 & ~n90;
  assign n92 = ~n61 & ~n91;
  assign n93 = n61 & n91;
  assign n94 = ~n92 & ~n93;
  assign n95 = ~\902(30)  & ~n94;
  assign n96 = \469(24)  & ~n95;
  assign n97 = ~\469(24)  & n95;
  assign n98 = ~n96 & ~n97;
  assign n99 = ~n60 & ~n98;
  assign n100 = ~\900(29)  & \953(32) ;
  assign n101 = \237(23)  & \234(22) ;
  assign n102 = ~\953(32)  & \952(31) ;
  assign n103 = ~n101 & n102;
  assign n104 = \902(30)  & ~n101;
  assign n105 = n100 & n104;
  assign n106 = ~n103 & ~n105;
  assign n107 = n99 & ~n106;
  assign n108 = ~\237(23)  & ~\902(30) ;
  assign n109 = \214(17)  & ~n108;
  assign n110 = ~\953(32)  & \224(20) ;
  assign n111 = ~\119(6)  & \116(5) ;
  assign n112 = \119(6)  & ~\116(5) ;
  assign n113 = ~n111 & ~n112;
  assign n114 = \113(4)  & ~n113;
  assign n115 = ~\113(4)  & n113;
  assign n116 = ~n114 & ~n115;
  assign n117 = ~n67 & ~n116;
  assign n118 = n67 & n116;
  assign n119 = ~n117 & ~n118;
  assign n120 = ~\122(7)  & \110(3) ;
  assign n121 = \122(7)  & ~\110(3) ;
  assign n122 = ~n120 & ~n121;
  assign n123 = ~n119 & ~n122;
  assign n124 = n119 & n122;
  assign n125 = ~n123 & ~n124;
  assign n126 = \125(8)  & ~n73;
  assign n127 = ~\125(8)  & n73;
  assign n128 = ~n126 & ~n127;
  assign n129 = n125 & ~n128;
  assign n130 = ~n125 & n128;
  assign n131 = ~n129 & ~n130;
  assign n132 = ~n110 & ~n131;
  assign n133 = n110 & n131;
  assign n134 = ~n132 & ~n133;
  assign n135 = ~\902(30)  & ~n134;
  assign n136 = \210(16)  & ~n135;
  assign n137 = ~n108 & n136;
  assign n138 = n108 & n135;
  assign n139 = ~\210(16)  & n135;
  assign n140 = ~n138 & ~n139;
  assign n141 = ~n137 & n140;
  assign n142 = ~n109 & ~n141;
  assign n143 = n107 & n142;
  assign n144 = ~n73 & ~n82;
  assign n145 = n73 & n82;
  assign n146 = ~n144 & ~n145;
  assign n147 = ~n116 & ~n146;
  assign n148 = n116 & n146;
  assign n149 = ~n147 & ~n148;
  assign n150 = ~\237(23)  & ~\953(32) ;
  assign n151 = \210(16)  & n150;
  assign n152 = \101(0)  & n151;
  assign n153 = ~\101(0)  & ~n151;
  assign n154 = ~n152 & ~n153;
  assign n155 = n149 & n154;
  assign n156 = ~n149 & ~n154;
  assign n157 = ~\902(30)  & ~n156;
  assign n158 = ~n155 & n157;
  assign n159 = \472(25)  & ~n158;
  assign n160 = ~\472(25)  & n158;
  assign n161 = ~n159 & ~n160;
  assign n162 = \217(18)  & ~\234(22) ;
  assign n163 = \125(8)  & ~\140(13) ;
  assign n164 = ~\125(8)  & \140(13) ;
  assign n165 = ~n163 & ~n164;
  assign n166 = \146(15)  & ~n165;
  assign n167 = ~\146(15)  & n165;
  assign n168 = ~n166 & ~n167;
  assign n169 = ~\119(6)  & \110(3) ;
  assign n170 = \119(6)  & ~\110(3) ;
  assign n171 = ~n169 & ~n170;
  assign n172 = \128(9)  & ~n171;
  assign n173 = ~\128(9)  & n171;
  assign n174 = ~n172 & ~n173;
  assign n175 = n168 & ~n174;
  assign n176 = ~n168 & n174;
  assign n177 = ~n175 & ~n176;
  assign n178 = ~\953(32)  & \234(22) ;
  assign n179 = \221(19)  & n178;
  assign n180 = \137(12)  & n179;
  assign n181 = ~\137(12)  & ~n179;
  assign n182 = ~n180 & ~n181;
  assign n183 = n177 & ~n182;
  assign n184 = ~n177 & n182;
  assign n185 = ~n183 & ~n184;
  assign n186 = ~\902(30)  & n185;
  assign n187 = ~n162 & n186;
  assign n188 = n162 & ~n185;
  assign n189 = \902(30)  & \217(18) ;
  assign n190 = ~n188 & ~n189;
  assign n191 = ~n187 & n190;
  assign n192 = ~n161 & ~n191;
  assign n193 = \131(10)  & n168;
  assign n194 = ~\131(10)  & ~n168;
  assign n195 = ~n193 & ~n194;
  assign n196 = \214(17)  & n150;
  assign n197 = \143(14)  & n196;
  assign n198 = ~\143(14)  & ~n196;
  assign n199 = ~n197 & ~n198;
  assign n200 = ~n195 & ~n199;
  assign n201 = n195 & n199;
  assign n202 = ~n200 & ~n201;
  assign n203 = \104(1)  & ~\113(4) ;
  assign n204 = ~\104(1)  & \113(4) ;
  assign n205 = ~n203 & ~n204;
  assign n206 = \122(7)  & ~n205;
  assign n207 = ~\122(7)  & n205;
  assign n208 = ~n206 & ~n207;
  assign n209 = ~n202 & ~n208;
  assign n210 = n202 & n208;
  assign n211 = ~n209 & ~n210;
  assign n212 = ~\902(30)  & n211;
  assign n213 = \475(26)  & ~n212;
  assign n214 = ~\475(26)  & n212;
  assign n215 = ~n213 & ~n214;
  assign n216 = \217(18)  & n178;
  assign n217 = \107(2)  & ~\116(5) ;
  assign n218 = ~\107(2)  & \116(5) ;
  assign n219 = ~n217 & ~n218;
  assign n220 = \122(7)  & ~n219;
  assign n221 = ~\122(7)  & n219;
  assign n222 = ~n220 & ~n221;
  assign n223 = \128(9)  & ~\134(11) ;
  assign n224 = ~\128(9)  & \134(11) ;
  assign n225 = ~n223 & ~n224;
  assign n226 = \143(14)  & ~n225;
  assign n227 = ~\143(14)  & n225;
  assign n228 = ~n226 & ~n227;
  assign n229 = n222 & ~n228;
  assign n230 = ~n222 & n228;
  assign n231 = ~n229 & ~n230;
  assign n232 = ~n216 & ~n231;
  assign n233 = n216 & n231;
  assign n234 = ~n232 & ~n233;
  assign n235 = ~\902(30)  & ~n234;
  assign n236 = \478(27)  & ~n235;
  assign n237 = ~\478(27)  & n235;
  assign n238 = ~n236 & ~n237;
  assign n239 = ~n215 & n238;
  assign n240 = n192 & n239;
  assign n241 = n143 & n240;
  assign n242 = ~n161 & n191;
  assign n243 = ~n215 & ~n238;
  assign n244 = n242 & n243;
  assign n245 = n143 & n244;
  assign n246 = ~n109 & n141;
  assign n247 = n107 & n246;
  assign n248 = n161 & ~n191;
  assign n249 = n239 & n248;
  assign n250 = n247 & n249;
  assign n251 = n215 & n238;
  assign n252 = n247 & n251;
  assign n253 = n192 & n252;
  assign n254 = n215 & ~n238;
  assign n255 = n242 & n254;
  assign n256 = n247 & n255;
  assign n257 = n239 & n242;
  assign n258 = n247 & n257;
  assign n259 = n192 & n254;
  assign n260 = n143 & n259;
  assign n261 = ~n60 & n98;
  assign n262 = n239 & n261;
  assign n263 = ~n106 & n142;
  assign n264 = n248 & n263;
  assign n265 = n262 & n264;
  assign n266 = ~n260 & ~n265;
  assign n267 = ~n258 & n266;
  assign n268 = ~n256 & n267;
  assign n269 = ~n253 & n268;
  assign n270 = ~n250 & n269;
  assign n271 = ~n245 & n270;
  assign n272 = ~n241 & n271;
  assign n273 = \902(30)  & ~\898(28) ;
  assign n274 = \953(32)  & n273;
  assign n275 = n142 & n274;
  assign n276 = ~n101 & n275;
  assign n277 = n103 & n142;
  assign n278 = ~n276 & ~n277;
  assign n279 = n161 & n191;
  assign n280 = n243 & n279;
  assign n281 = n261 & n280;
  assign n282 = ~n278 & n281;
  assign n283 = n251 & n261;
  assign n284 = ~n278 & n283;
  assign n285 = n192 & n284;
  assign n286 = n261 & ~n278;
  assign n287 = n242 & n286;
  assign n288 = n254 & n287;
  assign n289 = n242 & ~n278;
  assign n290 = n262 & n289;
  assign n291 = n99 & ~n278;
  assign n292 = n248 & n251;
  assign n293 = n291 & n292;
  assign n294 = n254 & n279;
  assign n295 = n291 & n294;
  assign n296 = n239 & n279;
  assign n297 = n291 & n296;
  assign n298 = n242 & n251;
  assign n299 = n291 & n298;
  assign n300 = ~n297 & ~n299;
  assign n301 = ~n295 & n300;
  assign n302 = ~n293 & n301;
  assign n303 = ~n290 & n302;
  assign n304 = ~n288 & n303;
  assign n305 = ~n285 & n304;
  assign n306 = ~n282 & n305;
  assign n307 = n272 & n306;
  assign n308 = \902(30)  & ~n307;
  assign n309 = \953(32)  & ~\952(31) ;
  assign n310 = \210(16)  & n134;
  assign n311 = ~n309 & n310;
  assign n312 = n308 & n311;
  assign n313 = ~n134 & ~n309;
  assign n314 = ~n308 & n313;
  assign n315 = ~\210(16)  & ~n134;
  assign n316 = ~n309 & n315;
  assign n317 = ~n314 & ~n316;
  assign \51(899)  = n312 | ~n317;
  assign n319 = \107(2)  & ~n295;
  assign n320 = ~\107(2)  & n295;
  assign \9(863)  = n319 | n320;
  assign n322 = \217(18)  & n308;
  assign n323 = ~n309 & n322;
  assign n324 = ~n185 & n323;
  assign n325 = ~n309 & ~n322;
  assign n326 = n185 & n325;
  assign \66(903)  = n324 | n326;
  assign n328 = \110(3)  & ~n293;
  assign n329 = ~\110(3)  & n293;
  assign \12(862)  = n328 | n329;
  assign n331 = \475(26)  & n308;
  assign n332 = ~n309 & n331;
  assign n333 = ~n211 & n332;
  assign n334 = ~n309 & ~n331;
  assign n335 = n211 & n334;
  assign \60(901)  = n333 | n335;
  assign n337 = \125(8)  & ~n265;
  assign n338 = ~\125(8)  & n265;
  assign \27(857)  = n337 | n338;
  assign n340 = \137(12)  & ~n253;
  assign n341 = ~\137(12)  & n253;
  assign \39(853)  = n340 | n341;
  assign n343 = \113(4)  & ~n290;
  assign n344 = ~\113(4)  & n290;
  assign \15(861)  = n343 | n344;
  assign n346 = \128(9)  & ~n260;
  assign n347 = ~\128(9)  & n260;
  assign \30(856)  = n346 | n347;
  assign n349 = \140(13)  & ~n250;
  assign n350 = ~\140(13)  & n250;
  assign \42(852)  = n349 | n350;
  assign n352 = \101(0)  & ~n299;
  assign n353 = ~\101(0)  & n299;
  assign \3(865)  = n352 | n353;
  assign n355 = \224(20)  & \898(28) ;
  assign n356 = ~\953(32)  & ~n125;
  assign n357 = ~n306 & n356;
  assign n358 = ~\953(32)  & n125;
  assign n359 = n306 & n358;
  assign n360 = \953(32)  & \898(28) ;
  assign n361 = n125 & n360;
  assign n362 = ~n359 & ~n361;
  assign n363 = ~n357 & n362;
  assign n364 = \953(32)  & n363;
  assign n365 = ~n355 & n364;
  assign n366 = n355 & ~n363;
  assign n367 = ~\953(32)  & ~n363;
  assign n368 = ~n366 & ~n367;
  assign \69(908)  = n365 | ~n368;
  assign n370 = n146 & ~n165;
  assign n371 = ~n146 & n165;
  assign n372 = ~n370 & ~n371;
  assign n373 = n272 & ~n372;
  assign n374 = ~n272 & n372;
  assign n375 = ~n373 & ~n374;
  assign n376 = \953(32)  & ~\227(21) ;
  assign n377 = n375 & n376;
  assign n378 = ~\953(32)  & ~n375;
  assign n379 = \227(21)  & ~n375;
  assign n380 = ~n100 & ~n379;
  assign n381 = ~n378 & n380;
  assign \72(909)  = n377 | ~n381;
  assign n383 = n103 & n279;
  assign n384 = n283 & n383;
  assign n385 = n141 & n384;
  assign n386 = n246 & n383;
  assign n387 = n98 & n251;
  assign n388 = n386 & n387;
  assign n389 = n246 & n283;
  assign n390 = n103 & n248;
  assign n391 = n389 & n390;
  assign n392 = n254 & n261;
  assign n393 = n386 & n392;
  assign n394 = n103 & n242;
  assign n395 = n389 & n394;
  assign n396 = ~n99 & ~n142;
  assign n397 = ~n395 & n396;
  assign n398 = ~n393 & n397;
  assign n399 = ~n391 & n398;
  assign n400 = ~n388 & n399;
  assign n401 = ~n385 & n400;
  assign n402 = ~n262 & n401;
  assign n403 = ~n391 & ~n395;
  assign n404 = n307 & n403;
  assign n405 = ~n384 & n404;
  assign n406 = ~n386 & n405;
  assign n407 = n99 & ~n251;
  assign n408 = n386 & n407;
  assign n409 = ~n406 & ~n408;
  assign n410 = ~n402 & n409;
  assign n411 = n279 & n389;
  assign n412 = ~\953(32)  & ~n411;
  assign n413 = \952(31)  & n410;
  assign \75(866)  = ~n412 | n413;
  assign n415 = \472(25)  & n308;
  assign n416 = ~n149 & ~n415;
  assign n417 = n149 & n415;
  assign n418 = ~n416 & ~n417;
  assign n419 = ~n154 & n418;
  assign n420 = ~n309 & n419;
  assign n421 = n154 & ~n418;
  assign n422 = ~n309 & n421;
  assign \57(912)  = n420 | n422;
  assign n424 = \119(6)  & ~n285;
  assign n425 = ~\119(6)  & n285;
  assign \21(859)  = n424 | n425;
  assign n427 = \131(10)  & ~n258;
  assign n428 = ~\131(10)  & n258;
  assign \33(855)  = n427 | n428;
  assign n430 = \143(14)  & ~n245;
  assign n431 = ~\143(14)  & n245;
  assign \45(851)  = n430 | n431;
  assign n433 = \116(5)  & ~n288;
  assign n434 = ~\116(5)  & n288;
  assign \18(860)  = n433 | n434;
  assign n436 = \104(1)  & ~n297;
  assign n437 = ~\104(1)  & n297;
  assign \6(864)  = n436 | n437;
  assign n439 = \478(27)  & n308;
  assign n440 = ~n234 & ~n309;
  assign n441 = ~n439 & n440;
  assign n442 = n234 & ~n309;
  assign n443 = n439 & n442;
  assign \63(902)  = n441 | n443;
  assign n445 = n94 & ~n98;
  assign n446 = ~n309 & n445;
  assign n447 = n308 & n446;
  assign n448 = ~n94 & n98;
  assign n449 = ~n309 & n448;
  assign n450 = ~n94 & ~n309;
  assign n451 = ~n308 & n450;
  assign n452 = ~n449 & ~n451;
  assign \54(900)  = n447 | ~n452;
  assign n454 = \122(7)  & ~n282;
  assign n455 = ~\122(7)  & n282;
  assign \24(858)  = n454 | n455;
  assign n457 = \134(11)  & ~n256;
  assign n458 = ~\134(11)  & n256;
  assign \36(854)  = n457 | n458;
  assign n460 = \146(15)  & ~n241;
  assign n461 = ~\146(15)  & n241;
  assign \48(850)  = n460 | n461;
endmodule


