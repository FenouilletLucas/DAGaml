// Benchmark "C1908.iscas" written by ABC on Tue May 16 16:07:45 2017

module \C1908.iscas  ( 
    \472(25) , \143(14) , \134(11) , \125(8) , \217(18) , \902(30) ,
    \110(3) , \128(9) , \113(4) , \475(26) , \146(15) , \137(12) ,
    \953(32) , \234(22) , \116(5) , \221(19) , \101(0) , \478(27) ,
    \469(24) , \119(6) , \237(23) , \104(1) , \898(28) , \952(31) ,
    \900(29) , \224(20) , \107(2) , \227(21) , \140(13) , \131(10) ,
    \214(17) , \122(7) , \210(16) ,
    \66(903) , \21(859) , \69(908) , \42(852) , \3(865) , \24(858) ,
    \45(851) , \6(864) , \27(857) , \48(850) , \9(863) , \72(909) ,
    \54(900) , \30(856) , \57(912) , \33(855) , \12(862) , \15(861) ,
    \36(854) , \60(901) , \18(860) , \39(853) , \75(866) , \51(899) ,
    \63(902)   );
  input  \472(25) , \143(14) , \134(11) , \125(8) , \217(18) , \902(30) ,
    \110(3) , \128(9) , \113(4) , \475(26) , \146(15) , \137(12) ,
    \953(32) , \234(22) , \116(5) , \221(19) , \101(0) , \478(27) ,
    \469(24) , \119(6) , \237(23) , \104(1) , \898(28) , \952(31) ,
    \900(29) , \224(20) , \107(2) , \227(21) , \140(13) , \131(10) ,
    \214(17) , \122(7) , \210(16) ;
  output \66(903) , \21(859) , \69(908) , \42(852) , \3(865) , \24(858) ,
    \45(851) , \6(864) , \27(857) , \48(850) , \9(863) , \72(909) ,
    \54(900) , \30(856) , \57(912) , \33(855) , \12(862) , \15(861) ,
    \36(854) , \60(901) , \18(860) , \39(853) , \75(866) , \51(899) ,
    \63(902) ;
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
    n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n316, n317,
    n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n330, n331,
    n333, n334, n336, n337, n339, n340, n342, n343, n345, n346, n348, n349,
    n351, n352, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
    n364, n365, n366, n368, n369, n370, n371, n372, n374, n375, n377, n378,
    n379, n380, n381, n382, n383, n384, n386, n387, n389, n390, n392, n393,
    n395, n396, n398, n399, n400, n401, n402, n404, n405, n407, n408, n410,
    n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
    n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
    n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
    n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n458, n459,
    n460, n461, n462, n463, n464, n465, n467, n468, n469, n470, n471;
  assign n59 = \125(8)  & ~\140(13) ;
  assign n60 = ~\125(8)  & \140(13) ;
  assign n61 = ~n59 & ~n60;
  assign n62 = ~\146(15)  & n61;
  assign n63 = \146(15)  & ~n61;
  assign n64 = ~n62 & ~n63;
  assign n65 = \128(9)  & ~\119(6) ;
  assign n66 = ~\128(9)  & \119(6) ;
  assign n67 = ~n65 & ~n66;
  assign n68 = ~\110(3)  & n67;
  assign n69 = \110(3)  & ~n67;
  assign n70 = ~n68 & ~n69;
  assign n71 = ~n64 & n70;
  assign n72 = n64 & ~n70;
  assign n73 = ~n71 & ~n72;
  assign n74 = \234(22)  & \221(19) ;
  assign n75 = ~\953(32)  & n74;
  assign n76 = ~\137(12)  & ~n75;
  assign n77 = \137(12)  & n75;
  assign n78 = ~n76 & ~n77;
  assign n79 = n73 & n78;
  assign n80 = ~n73 & ~n78;
  assign n81 = ~n79 & ~n80;
  assign n82 = \234(22)  & \237(23) ;
  assign n83 = ~\953(32)  & \952(31) ;
  assign n84 = ~n82 & n83;
  assign n85 = \902(30)  & ~\900(29) ;
  assign n86 = \953(32)  & n85;
  assign n87 = ~n82 & n86;
  assign n88 = ~n84 & ~n87;
  assign n89 = ~\237(23)  & \214(17) ;
  assign n90 = ~\953(32)  & n89;
  assign n91 = \143(14)  & n90;
  assign n92 = ~\143(14)  & ~n90;
  assign n93 = ~n91 & ~n92;
  assign n94 = ~\131(10)  & n93;
  assign n95 = \131(10)  & ~n93;
  assign n96 = ~n94 & ~n95;
  assign n97 = n64 & ~n96;
  assign n98 = ~n64 & n96;
  assign n99 = ~n97 & ~n98;
  assign n100 = ~\113(4)  & \122(7) ;
  assign n101 = \113(4)  & ~\122(7) ;
  assign n102 = ~n100 & ~n101;
  assign n103 = ~\104(1)  & n102;
  assign n104 = \104(1)  & ~n102;
  assign n105 = ~n103 & ~n104;
  assign n106 = n99 & ~n105;
  assign n107 = ~n99 & n105;
  assign n108 = ~n106 & ~n107;
  assign n109 = ~\902(30)  & ~n108;
  assign n110 = ~\475(26)  & n109;
  assign n111 = \475(26)  & ~n109;
  assign n112 = ~n110 & ~n111;
  assign n113 = ~\116(5)  & \122(7) ;
  assign n114 = \116(5)  & ~\122(7) ;
  assign n115 = ~n113 & ~n114;
  assign n116 = ~\107(2)  & n115;
  assign n117 = \107(2)  & ~n115;
  assign n118 = ~n116 & ~n117;
  assign n119 = \143(14)  & ~\128(9) ;
  assign n120 = ~\143(14)  & \128(9) ;
  assign n121 = ~n119 & ~n120;
  assign n122 = ~\134(11)  & n121;
  assign n123 = \134(11)  & ~n121;
  assign n124 = ~n122 & ~n123;
  assign n125 = n118 & ~n124;
  assign n126 = ~n118 & n124;
  assign n127 = ~n125 & ~n126;
  assign n128 = \217(18)  & \234(22) ;
  assign n129 = ~\953(32)  & n128;
  assign n130 = n127 & n129;
  assign n131 = ~n127 & ~n129;
  assign n132 = ~n130 & ~n131;
  assign n133 = ~\902(30)  & ~n132;
  assign n134 = ~\478(27)  & n133;
  assign n135 = \478(27)  & ~n133;
  assign n136 = ~n134 & ~n135;
  assign n137 = ~n112 & n136;
  assign n138 = ~\237(23)  & \210(16) ;
  assign n139 = ~\953(32)  & n138;
  assign n140 = \101(0)  & n139;
  assign n141 = ~\101(0)  & ~n139;
  assign n142 = ~n140 & ~n141;
  assign n143 = ~\134(11)  & \137(12) ;
  assign n144 = \134(11)  & ~\137(12) ;
  assign n145 = ~n143 & ~n144;
  assign n146 = ~\131(10)  & n145;
  assign n147 = \131(10)  & ~n145;
  assign n148 = ~n146 & ~n147;
  assign n149 = ~\143(14)  & \146(15) ;
  assign n150 = \143(14)  & ~\146(15) ;
  assign n151 = ~n149 & ~n150;
  assign n152 = ~\128(9)  & n151;
  assign n153 = \128(9)  & ~n151;
  assign n154 = ~n152 & ~n153;
  assign n155 = ~n148 & ~n154;
  assign n156 = n148 & n154;
  assign n157 = ~n155 & ~n156;
  assign n158 = ~\116(5)  & \119(6) ;
  assign n159 = \116(5)  & ~\119(6) ;
  assign n160 = ~n158 & ~n159;
  assign n161 = ~\113(4)  & n160;
  assign n162 = \113(4)  & ~n160;
  assign n163 = ~n161 & ~n162;
  assign n164 = n157 & n163;
  assign n165 = ~n157 & ~n163;
  assign n166 = ~n164 & ~n165;
  assign n167 = ~n142 & n166;
  assign n168 = n142 & ~n166;
  assign n169 = ~n167 & ~n168;
  assign n170 = ~\902(30)  & ~n169;
  assign n171 = ~\472(25)  & n170;
  assign n172 = \472(25)  & ~n170;
  assign n173 = ~n171 & ~n172;
  assign n174 = ~\902(30)  & ~n81;
  assign n175 = ~\902(30)  & \234(22) ;
  assign n176 = \217(18)  & ~n175;
  assign n177 = n174 & ~n176;
  assign n178 = ~n174 & n176;
  assign n179 = ~n177 & ~n178;
  assign n180 = ~n173 & ~n179;
  assign n181 = \110(3)  & ~\140(13) ;
  assign n182 = ~\110(3)  & \140(13) ;
  assign n183 = ~n181 & ~n182;
  assign n184 = ~\953(32)  & \227(21) ;
  assign n185 = n183 & n184;
  assign n186 = ~n183 & ~n184;
  assign n187 = ~n185 & ~n186;
  assign n188 = ~\104(1)  & \107(2) ;
  assign n189 = \104(1)  & ~\107(2) ;
  assign n190 = ~n188 & ~n189;
  assign n191 = ~\101(0)  & n190;
  assign n192 = \101(0)  & ~n190;
  assign n193 = ~n191 & ~n192;
  assign n194 = n154 & n193;
  assign n195 = ~n154 & ~n193;
  assign n196 = ~n194 & ~n195;
  assign n197 = n148 & n196;
  assign n198 = ~n148 & ~n196;
  assign n199 = ~n197 & ~n198;
  assign n200 = n187 & n199;
  assign n201 = ~n187 & ~n199;
  assign n202 = ~n200 & ~n201;
  assign n203 = ~\902(30)  & ~n202;
  assign n204 = ~\469(24)  & n203;
  assign n205 = \469(24)  & ~n203;
  assign n206 = ~n204 & ~n205;
  assign n207 = \221(19)  & ~n175;
  assign n208 = ~n206 & ~n207;
  assign n209 = ~\125(8)  & n154;
  assign n210 = \125(8)  & ~n154;
  assign n211 = ~n209 & ~n210;
  assign n212 = ~\953(32)  & \224(20) ;
  assign n213 = n211 & n212;
  assign n214 = ~n211 & ~n212;
  assign n215 = ~n213 & ~n214;
  assign n216 = ~n163 & ~n193;
  assign n217 = n163 & n193;
  assign n218 = ~n216 & ~n217;
  assign n219 = ~\110(3)  & \122(7) ;
  assign n220 = \110(3)  & ~\122(7) ;
  assign n221 = ~n219 & ~n220;
  assign n222 = n218 & n221;
  assign n223 = ~n218 & ~n221;
  assign n224 = ~n222 & ~n223;
  assign n225 = ~n215 & ~n224;
  assign n226 = n215 & n224;
  assign n227 = ~n225 & ~n226;
  assign n228 = ~\902(30)  & n227;
  assign n229 = ~\902(30)  & ~\237(23) ;
  assign n230 = \210(16)  & ~n229;
  assign n231 = n228 & ~n230;
  assign n232 = ~n228 & n230;
  assign n233 = ~n231 & ~n232;
  assign n234 = \214(17)  & ~n229;
  assign n235 = ~n233 & ~n234;
  assign n236 = n208 & n235;
  assign n237 = n180 & n236;
  assign n238 = n137 & n237;
  assign n239 = ~n88 & n238;
  assign n240 = ~n112 & ~n136;
  assign n241 = ~n173 & n179;
  assign n242 = n236 & n241;
  assign n243 = n240 & n242;
  assign n244 = ~n88 & n243;
  assign n245 = n173 & ~n179;
  assign n246 = n233 & ~n234;
  assign n247 = n208 & n246;
  assign n248 = n245 & n247;
  assign n249 = n137 & n248;
  assign n250 = ~n88 & n249;
  assign n251 = n112 & n136;
  assign n252 = n180 & n247;
  assign n253 = n251 & n252;
  assign n254 = ~n88 & n253;
  assign n255 = n112 & ~n136;
  assign n256 = n241 & n247;
  assign n257 = n255 & n256;
  assign n258 = ~n88 & n257;
  assign n259 = n137 & n256;
  assign n260 = ~n88 & n259;
  assign n261 = n237 & n255;
  assign n262 = ~n88 & n261;
  assign n263 = n206 & ~n207;
  assign n264 = n235 & n263;
  assign n265 = n245 & n264;
  assign n266 = n137 & n265;
  assign n267 = ~n88 & n266;
  assign n268 = ~n262 & ~n267;
  assign n269 = ~n260 & n268;
  assign n270 = ~n258 & n269;
  assign n271 = ~n254 & n270;
  assign n272 = ~n250 & n271;
  assign n273 = ~n244 & n272;
  assign n274 = ~n239 & n273;
  assign n275 = \902(30)  & ~\898(28) ;
  assign n276 = \953(32)  & n275;
  assign n277 = ~n82 & n276;
  assign n278 = ~n84 & ~n277;
  assign n279 = n173 & n179;
  assign n280 = n264 & n279;
  assign n281 = n240 & n280;
  assign n282 = ~n278 & n281;
  assign n283 = n180 & n264;
  assign n284 = n251 & n283;
  assign n285 = ~n278 & n284;
  assign n286 = n241 & n264;
  assign n287 = n255 & n286;
  assign n288 = ~n278 & n287;
  assign n289 = n137 & n286;
  assign n290 = ~n278 & n289;
  assign n291 = n236 & n245;
  assign n292 = n251 & n291;
  assign n293 = ~n278 & n292;
  assign n294 = n236 & n279;
  assign n295 = n255 & n294;
  assign n296 = ~n278 & n295;
  assign n297 = n137 & n294;
  assign n298 = ~n278 & n297;
  assign n299 = n242 & n251;
  assign n300 = ~n278 & n299;
  assign n301 = ~n298 & ~n300;
  assign n302 = ~n296 & n301;
  assign n303 = ~n293 & n302;
  assign n304 = ~n290 & n303;
  assign n305 = ~n288 & n304;
  assign n306 = ~n285 & n305;
  assign n307 = ~n282 & n306;
  assign n308 = n274 & n307;
  assign n309 = \902(30)  & n176;
  assign n310 = ~n308 & n309;
  assign n311 = n81 & n310;
  assign n312 = ~n81 & ~n310;
  assign n313 = ~n311 & ~n312;
  assign n314 = \953(32)  & ~\952(31) ;
  assign \66(903)  = ~n313 & ~n314;
  assign n316 = \119(6)  & ~n285;
  assign n317 = ~\119(6)  & n285;
  assign \21(859)  = n316 | n317;
  assign n319 = ~\953(32)  & ~n307;
  assign n320 = \953(32)  & ~\898(28) ;
  assign n321 = n224 & ~n320;
  assign n322 = ~n319 & n321;
  assign n323 = n319 & ~n321;
  assign n324 = ~n322 & ~n323;
  assign n325 = \898(28)  & \224(20) ;
  assign n326 = \953(32)  & ~n325;
  assign n327 = n324 & n326;
  assign n328 = ~n324 & ~n326;
  assign \69(908)  = n327 | n328;
  assign n330 = \140(13)  & ~n250;
  assign n331 = ~\140(13)  & n250;
  assign \42(852)  = n330 | n331;
  assign n333 = \101(0)  & ~n300;
  assign n334 = ~\101(0)  & n300;
  assign \3(865)  = n333 | n334;
  assign n336 = \122(7)  & ~n282;
  assign n337 = ~\122(7)  & n282;
  assign \24(858)  = n336 | n337;
  assign n339 = \143(14)  & ~n244;
  assign n340 = ~\143(14)  & n244;
  assign \45(851)  = n339 | n340;
  assign n342 = \104(1)  & ~n298;
  assign n343 = ~\104(1)  & n298;
  assign \6(864)  = n342 | n343;
  assign n345 = \125(8)  & ~n267;
  assign n346 = ~\125(8)  & n267;
  assign \27(857)  = n345 | n346;
  assign n348 = \146(15)  & ~n239;
  assign n349 = ~\146(15)  & n239;
  assign \48(850)  = n348 | n349;
  assign n351 = \107(2)  & ~n296;
  assign n352 = ~\107(2)  & n296;
  assign \9(863)  = n351 | n352;
  assign n354 = ~\953(32)  & ~n274;
  assign n355 = n61 & n157;
  assign n356 = ~n61 & ~n157;
  assign n357 = ~n355 & ~n356;
  assign n358 = \953(32)  & ~\900(29) ;
  assign n359 = n357 & ~n358;
  assign n360 = ~n354 & n359;
  assign n361 = n354 & ~n359;
  assign n362 = ~n360 & ~n361;
  assign n363 = \900(29)  & \227(21) ;
  assign n364 = \953(32)  & ~n363;
  assign n365 = n362 & n364;
  assign n366 = ~n362 & ~n364;
  assign \72(909)  = n365 | n366;
  assign n368 = \902(30)  & \469(24) ;
  assign n369 = ~n308 & n368;
  assign n370 = n202 & n369;
  assign n371 = ~n202 & ~n369;
  assign n372 = ~n370 & ~n371;
  assign \54(900)  = ~n314 & ~n372;
  assign n374 = \128(9)  & ~n262;
  assign n375 = ~\128(9)  & n262;
  assign \30(856)  = n374 | n375;
  assign n377 = \472(25)  & \902(30) ;
  assign n378 = ~n308 & n377;
  assign n379 = n166 & n378;
  assign n380 = ~n166 & ~n378;
  assign n381 = ~n379 & ~n380;
  assign n382 = ~n142 & n381;
  assign n383 = n142 & ~n381;
  assign n384 = ~n382 & ~n383;
  assign \57(912)  = ~n314 & ~n384;
  assign n386 = \131(10)  & ~n260;
  assign n387 = ~\131(10)  & n260;
  assign \33(855)  = n386 | n387;
  assign n389 = \110(3)  & ~n293;
  assign n390 = ~\110(3)  & n293;
  assign \12(862)  = n389 | n390;
  assign n392 = \113(4)  & ~n290;
  assign n393 = ~\113(4)  & n290;
  assign \15(861)  = n392 | n393;
  assign n395 = \134(11)  & ~n258;
  assign n396 = ~\134(11)  & n258;
  assign \36(854)  = n395 | n396;
  assign n398 = \902(30)  & \475(26) ;
  assign n399 = ~n308 & n398;
  assign n400 = n108 & n399;
  assign n401 = ~n108 & ~n399;
  assign n402 = ~n400 & ~n401;
  assign \60(901)  = ~n314 & ~n402;
  assign n404 = \116(5)  & ~n288;
  assign n405 = ~\116(5)  & n288;
  assign \18(860)  = n404 | n405;
  assign n407 = \137(12)  & ~n254;
  assign n408 = ~\137(12)  & n254;
  assign \39(853)  = n407 | n408;
  assign n410 = n233 & n234;
  assign n411 = n263 & n410;
  assign n412 = n279 & n411;
  assign n413 = n251 & n412;
  assign n414 = n84 & n413;
  assign n415 = n206 & n207;
  assign n416 = n246 & n415;
  assign n417 = n279 & n416;
  assign n418 = n251 & n417;
  assign n419 = n84 & n418;
  assign n420 = n246 & n263;
  assign n421 = n245 & n420;
  assign n422 = n251 & n421;
  assign n423 = n84 & n422;
  assign n424 = n279 & n420;
  assign n425 = n255 & n424;
  assign n426 = n84 & n425;
  assign n427 = n137 & n424;
  assign n428 = n84 & n427;
  assign n429 = n241 & n420;
  assign n430 = n251 & n429;
  assign n431 = n84 & n430;
  assign n432 = n247 & n279;
  assign n433 = n251 & n432;
  assign n434 = n84 & n433;
  assign n435 = n251 & n280;
  assign n436 = n84 & n435;
  assign n437 = ~n434 & ~n436;
  assign n438 = ~n431 & n437;
  assign n439 = ~n428 & n438;
  assign n440 = ~n426 & n439;
  assign n441 = ~n423 & n440;
  assign n442 = ~n419 & n441;
  assign n443 = ~n414 & n442;
  assign n444 = n308 & n443;
  assign n445 = n136 & n179;
  assign n446 = n112 & n445;
  assign n447 = n173 & n446;
  assign n448 = ~n234 & n447;
  assign n449 = n206 & n448;
  assign n450 = n233 & n449;
  assign n451 = ~n207 & n450;
  assign n452 = ~\953(32)  & ~n451;
  assign n453 = \952(31)  & n452;
  assign n454 = n444 & n453;
  assign n455 = ~\953(32)  & ~\952(31) ;
  assign n456 = ~n451 & n455;
  assign \75(866)  = ~n454 & ~n456;
  assign n458 = n215 & ~n224;
  assign n459 = ~n215 & n224;
  assign n460 = ~n458 & ~n459;
  assign n461 = \902(30)  & n230;
  assign n462 = ~n308 & n461;
  assign n463 = n460 & n462;
  assign n464 = ~n460 & ~n462;
  assign n465 = ~n463 & ~n464;
  assign \51(899)  = ~n314 & ~n465;
  assign n467 = \902(30)  & \478(27) ;
  assign n468 = ~n308 & n467;
  assign n469 = n132 & n468;
  assign n470 = ~n132 & ~n468;
  assign n471 = ~n469 & ~n470;
  assign \63(902)  = ~n314 & ~n471;
endmodule


