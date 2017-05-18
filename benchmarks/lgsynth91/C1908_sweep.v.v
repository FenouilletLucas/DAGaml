// Benchmark "C1908.iscas" written by ABC on Tue May 16 16:07:45 2017

module \C1908.iscas  ( 
    \146(15) , \221(19) , \128(9) , \116(5) , \237(23) , \104(1) ,
    \140(13) , \210(16) , \475(26) , \119(6) , \134(11) , \107(2) ,
    \902(30) , \469(24) , \214(17) , \224(20) , \143(14) , \953(32) ,
    \900(29) , \898(28) , \234(22) , \478(27) , \122(7) , \952(31) ,
    \472(25) , \110(3) , \137(12) , \131(10) , \217(18) , \125(8) ,
    \113(4) , \101(0) , \227(21) ,
    \60(901) , \51(899) , \15(861) , \30(856) , \54(900) , \24(858) ,
    \9(863) , \33(855) , \18(860) , \63(902) , \27(857) , \42(852) ,
    \75(866) , \72(909) , \36(854) , \66(903) , \57(912) , \45(851) ,
    \39(853) , \3(865) , \69(908) , \48(850) , \12(862) , \21(859) ,
    \6(864)   );
  input  \146(15) , \221(19) , \128(9) , \116(5) , \237(23) , \104(1) ,
    \140(13) , \210(16) , \475(26) , \119(6) , \134(11) , \107(2) ,
    \902(30) , \469(24) , \214(17) , \224(20) , \143(14) , \953(32) ,
    \900(29) , \898(28) , \234(22) , \478(27) , \122(7) , \952(31) ,
    \472(25) , \110(3) , \137(12) , \131(10) , \217(18) , \125(8) ,
    \113(4) , \101(0) , \227(21) ;
  output \60(901) , \51(899) , \15(861) , \30(856) , \54(900) , \24(858) ,
    \9(863) , \33(855) , \18(860) , \63(902) , \27(857) , \42(852) ,
    \75(866) , \72(909) , \36(854) , \66(903) , \57(912) , \45(851) ,
    \39(853) , \3(865) , \69(908) , \48(850) , \12(862) , \21(859) ,
    \6(864) ;
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
    n317, n318, n319, n320, n322, n323, n324, n325, n326, n327, n328, n329,
    n331, n332, n334, n335, n337, n338, n339, n340, n341, n343, n344, n346,
    n347, n349, n350, n352, n353, n355, n356, n357, n358, n359, n361, n362,
    n364, n365, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
    n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
    n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
    n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
    n413, n414, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
    n426, n427, n428, n430, n431, n433, n434, n435, n436, n437, n439, n440,
    n441, n442, n443, n444, n445, n446, n448, n449, n451, n452, n454, n455,
    n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n468, n469,
    n471, n472, n474, n475, n477, n478;
  assign n59 = ~\104(1)  & \107(2) ;
  assign n60 = \104(1)  & ~\107(2) ;
  assign n61 = ~n59 & ~n60;
  assign n62 = ~\101(0)  & n61;
  assign n63 = \101(0)  & ~n61;
  assign n64 = ~n62 & ~n63;
  assign n65 = ~\116(5)  & \119(6) ;
  assign n66 = \116(5)  & ~\119(6) ;
  assign n67 = ~n65 & ~n66;
  assign n68 = ~\113(4)  & n67;
  assign n69 = \113(4)  & ~n67;
  assign n70 = ~n68 & ~n69;
  assign n71 = ~n64 & ~n70;
  assign n72 = n64 & n70;
  assign n73 = ~n71 & ~n72;
  assign n74 = \122(7)  & ~\110(3) ;
  assign n75 = ~\122(7)  & \110(3) ;
  assign n76 = ~n74 & ~n75;
  assign n77 = n73 & n76;
  assign n78 = ~n73 & ~n76;
  assign n79 = ~n77 & ~n78;
  assign n80 = \146(15)  & ~\143(14) ;
  assign n81 = ~\146(15)  & \143(14) ;
  assign n82 = ~n80 & ~n81;
  assign n83 = ~\128(9)  & n82;
  assign n84 = \128(9)  & ~n82;
  assign n85 = ~n83 & ~n84;
  assign n86 = ~\125(8)  & n85;
  assign n87 = \125(8)  & ~n85;
  assign n88 = ~n86 & ~n87;
  assign n89 = \224(20)  & ~\953(32) ;
  assign n90 = n88 & n89;
  assign n91 = ~n88 & ~n89;
  assign n92 = ~n90 & ~n91;
  assign n93 = ~n79 & ~n92;
  assign n94 = n79 & n92;
  assign n95 = ~n93 & ~n94;
  assign n96 = ~\902(30)  & n95;
  assign n97 = ~\237(23)  & ~\902(30) ;
  assign n98 = \210(16)  & ~n97;
  assign n99 = n96 & ~n98;
  assign n100 = ~n96 & n98;
  assign n101 = ~n99 & ~n100;
  assign n102 = \214(17)  & ~n97;
  assign n103 = ~n101 & ~n102;
  assign n104 = ~\134(11)  & \137(12) ;
  assign n105 = \134(11)  & ~\137(12) ;
  assign n106 = ~n104 & ~n105;
  assign n107 = ~\131(10)  & n106;
  assign n108 = \131(10)  & ~n106;
  assign n109 = ~n107 & ~n108;
  assign n110 = ~n85 & ~n109;
  assign n111 = n85 & n109;
  assign n112 = ~n110 & ~n111;
  assign n113 = n70 & n112;
  assign n114 = ~n70 & ~n112;
  assign n115 = ~n113 & ~n114;
  assign n116 = ~\237(23)  & \210(16) ;
  assign n117 = ~\953(32)  & n116;
  assign n118 = \101(0)  & n117;
  assign n119 = ~\101(0)  & ~n117;
  assign n120 = ~n118 & ~n119;
  assign n121 = n115 & ~n120;
  assign n122 = ~n115 & n120;
  assign n123 = ~n121 & ~n122;
  assign n124 = ~\902(30)  & ~n123;
  assign n125 = ~\472(25)  & n124;
  assign n126 = \472(25)  & ~n124;
  assign n127 = ~n125 & ~n126;
  assign n128 = ~\140(13)  & \125(8) ;
  assign n129 = \140(13)  & ~\125(8) ;
  assign n130 = ~n128 & ~n129;
  assign n131 = ~\146(15)  & n130;
  assign n132 = \146(15)  & ~n130;
  assign n133 = ~n131 & ~n132;
  assign n134 = \128(9)  & ~\119(6) ;
  assign n135 = ~\128(9)  & \119(6) ;
  assign n136 = ~n134 & ~n135;
  assign n137 = ~\110(3)  & n136;
  assign n138 = \110(3)  & ~n136;
  assign n139 = ~n137 & ~n138;
  assign n140 = ~n133 & n139;
  assign n141 = n133 & ~n139;
  assign n142 = ~n140 & ~n141;
  assign n143 = \221(19)  & \234(22) ;
  assign n144 = ~\953(32)  & n143;
  assign n145 = ~\137(12)  & ~n144;
  assign n146 = \137(12)  & n144;
  assign n147 = ~n145 & ~n146;
  assign n148 = n142 & n147;
  assign n149 = ~n142 & ~n147;
  assign n150 = ~n148 & ~n149;
  assign n151 = ~\902(30)  & ~n150;
  assign n152 = ~\902(30)  & \234(22) ;
  assign n153 = \217(18)  & ~n152;
  assign n154 = n151 & ~n153;
  assign n155 = ~n151 & n153;
  assign n156 = ~n154 & ~n155;
  assign n157 = ~n127 & ~n156;
  assign n158 = n64 & n85;
  assign n159 = ~n64 & ~n85;
  assign n160 = ~n158 & ~n159;
  assign n161 = n109 & n160;
  assign n162 = ~n109 & ~n160;
  assign n163 = ~n161 & ~n162;
  assign n164 = ~\140(13)  & \110(3) ;
  assign n165 = \140(13)  & ~\110(3) ;
  assign n166 = ~n164 & ~n165;
  assign n167 = ~\953(32)  & \227(21) ;
  assign n168 = n166 & n167;
  assign n169 = ~n166 & ~n167;
  assign n170 = ~n168 & ~n169;
  assign n171 = n163 & n170;
  assign n172 = ~n163 & ~n170;
  assign n173 = ~n171 & ~n172;
  assign n174 = ~\902(30)  & ~n173;
  assign n175 = ~\469(24)  & n174;
  assign n176 = \469(24)  & ~n174;
  assign n177 = ~n175 & ~n176;
  assign n178 = \221(19)  & ~n152;
  assign n179 = ~n177 & ~n178;
  assign n180 = ~\237(23)  & \214(17) ;
  assign n181 = ~\953(32)  & n180;
  assign n182 = \143(14)  & n181;
  assign n183 = ~\143(14)  & ~n181;
  assign n184 = ~n182 & ~n183;
  assign n185 = ~\131(10)  & n184;
  assign n186 = \131(10)  & ~n184;
  assign n187 = ~n185 & ~n186;
  assign n188 = n133 & ~n187;
  assign n189 = ~n133 & n187;
  assign n190 = ~n188 & ~n189;
  assign n191 = \122(7)  & ~\113(4) ;
  assign n192 = ~\122(7)  & \113(4) ;
  assign n193 = ~n191 & ~n192;
  assign n194 = ~\104(1)  & n193;
  assign n195 = \104(1)  & ~n193;
  assign n196 = ~n194 & ~n195;
  assign n197 = n190 & ~n196;
  assign n198 = ~n190 & n196;
  assign n199 = ~n197 & ~n198;
  assign n200 = ~\902(30)  & ~n199;
  assign n201 = ~\475(26)  & n200;
  assign n202 = \475(26)  & ~n200;
  assign n203 = ~n201 & ~n202;
  assign n204 = ~\116(5)  & \122(7) ;
  assign n205 = \116(5)  & ~\122(7) ;
  assign n206 = ~n204 & ~n205;
  assign n207 = ~\107(2)  & n206;
  assign n208 = \107(2)  & ~n206;
  assign n209 = ~n207 & ~n208;
  assign n210 = ~\128(9)  & \143(14) ;
  assign n211 = \128(9)  & ~\143(14) ;
  assign n212 = ~n210 & ~n211;
  assign n213 = ~\134(11)  & n212;
  assign n214 = \134(11)  & ~n212;
  assign n215 = ~n213 & ~n214;
  assign n216 = n209 & ~n215;
  assign n217 = ~n209 & n215;
  assign n218 = ~n216 & ~n217;
  assign n219 = \234(22)  & \217(18) ;
  assign n220 = ~\953(32)  & n219;
  assign n221 = n218 & n220;
  assign n222 = ~n218 & ~n220;
  assign n223 = ~n221 & ~n222;
  assign n224 = ~\902(30)  & ~n223;
  assign n225 = ~\478(27)  & n224;
  assign n226 = \478(27)  & ~n224;
  assign n227 = ~n225 & ~n226;
  assign n228 = ~n203 & n227;
  assign n229 = \237(23)  & \234(22) ;
  assign n230 = ~\953(32)  & \952(31) ;
  assign n231 = ~n229 & n230;
  assign n232 = \902(30)  & ~\900(29) ;
  assign n233 = \953(32)  & n232;
  assign n234 = ~n229 & n233;
  assign n235 = ~n231 & ~n234;
  assign n236 = n228 & ~n235;
  assign n237 = n179 & n236;
  assign n238 = n157 & n237;
  assign n239 = n103 & n238;
  assign n240 = ~n127 & n156;
  assign n241 = ~n203 & ~n227;
  assign n242 = ~n235 & n241;
  assign n243 = n179 & n242;
  assign n244 = n240 & n243;
  assign n245 = n103 & n244;
  assign n246 = n101 & ~n102;
  assign n247 = n127 & ~n156;
  assign n248 = n237 & n247;
  assign n249 = n246 & n248;
  assign n250 = n203 & n227;
  assign n251 = ~n235 & n250;
  assign n252 = n179 & n251;
  assign n253 = n157 & n252;
  assign n254 = n246 & n253;
  assign n255 = n203 & ~n227;
  assign n256 = ~n235 & n255;
  assign n257 = n179 & n256;
  assign n258 = n240 & n257;
  assign n259 = n246 & n258;
  assign n260 = n237 & n240;
  assign n261 = n246 & n260;
  assign n262 = n157 & n257;
  assign n263 = n103 & n262;
  assign n264 = n177 & ~n178;
  assign n265 = n236 & n247;
  assign n266 = n103 & n265;
  assign n267 = n264 & n266;
  assign n268 = ~n263 & ~n267;
  assign n269 = ~n261 & n268;
  assign n270 = ~n259 & n269;
  assign n271 = ~n254 & n270;
  assign n272 = ~n249 & n271;
  assign n273 = ~n245 & n272;
  assign n274 = ~n239 & n273;
  assign n275 = n127 & n156;
  assign n276 = \902(30)  & ~\898(28) ;
  assign n277 = \953(32)  & n276;
  assign n278 = ~n229 & n277;
  assign n279 = ~n231 & ~n278;
  assign n280 = n241 & ~n279;
  assign n281 = n275 & n280;
  assign n282 = n103 & n281;
  assign n283 = n264 & n282;
  assign n284 = n250 & ~n279;
  assign n285 = n157 & n284;
  assign n286 = n103 & n285;
  assign n287 = n264 & n286;
  assign n288 = n255 & ~n279;
  assign n289 = n240 & n288;
  assign n290 = n103 & n289;
  assign n291 = n264 & n290;
  assign n292 = n228 & ~n279;
  assign n293 = n240 & n292;
  assign n294 = n103 & n293;
  assign n295 = n264 & n294;
  assign n296 = n179 & n284;
  assign n297 = n247 & n296;
  assign n298 = n103 & n297;
  assign n299 = n179 & n288;
  assign n300 = n275 & n299;
  assign n301 = n103 & n300;
  assign n302 = n179 & n292;
  assign n303 = n275 & n302;
  assign n304 = n103 & n303;
  assign n305 = n240 & n296;
  assign n306 = n103 & n305;
  assign n307 = ~n304 & ~n306;
  assign n308 = ~n301 & n307;
  assign n309 = ~n298 & n308;
  assign n310 = ~n295 & n309;
  assign n311 = ~n291 & n310;
  assign n312 = ~n287 & n311;
  assign n313 = ~n283 & n312;
  assign n314 = n274 & n313;
  assign n315 = \475(26)  & \902(30) ;
  assign n316 = ~n314 & n315;
  assign n317 = n199 & n316;
  assign n318 = ~n199 & ~n316;
  assign n319 = ~n317 & ~n318;
  assign n320 = \953(32)  & ~\952(31) ;
  assign \60(901)  = ~n319 & ~n320;
  assign n322 = \902(30)  & n98;
  assign n323 = ~n314 & n322;
  assign n324 = ~n79 & n92;
  assign n325 = n79 & ~n92;
  assign n326 = ~n324 & ~n325;
  assign n327 = n323 & n326;
  assign n328 = ~n323 & ~n326;
  assign n329 = ~n327 & ~n328;
  assign \51(899)  = ~n320 & ~n329;
  assign n331 = \113(4)  & ~n295;
  assign n332 = ~\113(4)  & n295;
  assign \15(861)  = n331 | n332;
  assign n334 = \128(9)  & ~n263;
  assign n335 = ~\128(9)  & n263;
  assign \30(856)  = n334 | n335;
  assign n337 = \902(30)  & \469(24) ;
  assign n338 = ~n314 & n337;
  assign n339 = n173 & n338;
  assign n340 = ~n173 & ~n338;
  assign n341 = ~n339 & ~n340;
  assign \54(900)  = ~n320 & ~n341;
  assign n343 = \122(7)  & ~n283;
  assign n344 = ~\122(7)  & n283;
  assign \24(858)  = n343 | n344;
  assign n346 = \107(2)  & ~n301;
  assign n347 = ~\107(2)  & n301;
  assign \9(863)  = n346 | n347;
  assign n349 = \131(10)  & ~n261;
  assign n350 = ~\131(10)  & n261;
  assign \33(855)  = n349 | n350;
  assign n352 = \116(5)  & ~n291;
  assign n353 = ~\116(5)  & n291;
  assign \18(860)  = n352 | n353;
  assign n355 = \902(30)  & \478(27) ;
  assign n356 = ~n314 & n355;
  assign n357 = n223 & n356;
  assign n358 = ~n223 & ~n356;
  assign n359 = ~n357 & ~n358;
  assign \63(902)  = ~n320 & ~n359;
  assign n361 = \125(8)  & ~n267;
  assign n362 = ~\125(8)  & n267;
  assign \27(857)  = n361 | n362;
  assign n364 = \140(13)  & ~n249;
  assign n365 = ~\140(13)  & n249;
  assign \42(852)  = n364 | n365;
  assign n367 = n101 & n102;
  assign n368 = n264 & n367;
  assign n369 = n275 & n368;
  assign n370 = n250 & n369;
  assign n371 = n231 & n370;
  assign n372 = n177 & n178;
  assign n373 = n246 & n372;
  assign n374 = n275 & n373;
  assign n375 = n250 & n374;
  assign n376 = n231 & n375;
  assign n377 = n246 & n264;
  assign n378 = n247 & n377;
  assign n379 = n250 & n378;
  assign n380 = n231 & n379;
  assign n381 = n275 & n377;
  assign n382 = n255 & n381;
  assign n383 = n231 & n382;
  assign n384 = n228 & n381;
  assign n385 = n231 & n384;
  assign n386 = n240 & n377;
  assign n387 = n250 & n386;
  assign n388 = n231 & n387;
  assign n389 = n231 & n250;
  assign n390 = n179 & n389;
  assign n391 = n275 & n390;
  assign n392 = n246 & n391;
  assign n393 = n275 & n389;
  assign n394 = n103 & n393;
  assign n395 = n264 & n394;
  assign n396 = ~n392 & ~n395;
  assign n397 = ~n388 & n396;
  assign n398 = ~n385 & n397;
  assign n399 = ~n383 & n398;
  assign n400 = ~n380 & n399;
  assign n401 = ~n376 & n400;
  assign n402 = ~n371 & n401;
  assign n403 = n314 & n402;
  assign n404 = ~n102 & ~n178;
  assign n405 = n227 & n404;
  assign n406 = n203 & n405;
  assign n407 = n156 & n406;
  assign n408 = n127 & n407;
  assign n409 = n177 & n408;
  assign n410 = n101 & n409;
  assign n411 = n230 & ~n410;
  assign n412 = n403 & n411;
  assign n413 = ~\953(32)  & ~\952(31) ;
  assign n414 = ~n410 & n413;
  assign \75(866)  = ~n412 & ~n414;
  assign n416 = ~\953(32)  & ~n274;
  assign n417 = n112 & n130;
  assign n418 = ~n112 & ~n130;
  assign n419 = ~n417 & ~n418;
  assign n420 = \953(32)  & ~\900(29) ;
  assign n421 = n419 & ~n420;
  assign n422 = ~n416 & n421;
  assign n423 = n416 & ~n421;
  assign n424 = ~n422 & ~n423;
  assign n425 = \900(29)  & \227(21) ;
  assign n426 = \953(32)  & ~n425;
  assign n427 = n424 & n426;
  assign n428 = ~n424 & ~n426;
  assign \72(909)  = n427 | n428;
  assign n430 = \134(11)  & ~n259;
  assign n431 = ~\134(11)  & n259;
  assign \36(854)  = n430 | n431;
  assign n433 = \902(30)  & n153;
  assign n434 = ~n314 & n433;
  assign n435 = n150 & n434;
  assign n436 = ~n150 & ~n434;
  assign n437 = ~n435 & ~n436;
  assign \66(903)  = ~n320 & ~n437;
  assign n439 = \902(30)  & \472(25) ;
  assign n440 = ~n314 & n439;
  assign n441 = n115 & n440;
  assign n442 = ~n115 & ~n440;
  assign n443 = ~n441 & ~n442;
  assign n444 = ~n120 & n443;
  assign n445 = n120 & ~n443;
  assign n446 = ~n444 & ~n445;
  assign \57(912)  = ~n320 & ~n446;
  assign n448 = \143(14)  & ~n245;
  assign n449 = ~\143(14)  & n245;
  assign \45(851)  = n448 | n449;
  assign n451 = \137(12)  & ~n254;
  assign n452 = ~\137(12)  & n254;
  assign \39(853)  = n451 | n452;
  assign n454 = \101(0)  & ~n306;
  assign n455 = ~\101(0)  & n306;
  assign \3(865)  = n454 | n455;
  assign n457 = ~\953(32)  & ~n313;
  assign n458 = \953(32)  & ~\898(28) ;
  assign n459 = n79 & ~n458;
  assign n460 = ~n457 & n459;
  assign n461 = n457 & ~n459;
  assign n462 = ~n460 & ~n461;
  assign n463 = \224(20)  & \898(28) ;
  assign n464 = \953(32)  & ~n463;
  assign n465 = n462 & n464;
  assign n466 = ~n462 & ~n464;
  assign \69(908)  = n465 | n466;
  assign n468 = \146(15)  & ~n239;
  assign n469 = ~\146(15)  & n239;
  assign \48(850)  = n468 | n469;
  assign n471 = \110(3)  & ~n298;
  assign n472 = ~\110(3)  & n298;
  assign \12(862)  = n471 | n472;
  assign n474 = \119(6)  & ~n287;
  assign n475 = ~\119(6)  & n287;
  assign \21(859)  = n474 | n475;
  assign n477 = \104(1)  & ~n304;
  assign n478 = ~\104(1)  & n304;
  assign \6(864)  = n477 | n478;
endmodule


