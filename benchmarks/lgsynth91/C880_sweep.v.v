// Benchmark "C880.iscas" written by ABC on Tue May 16 16:07:46 2017

module \C880.iscas  ( 
    \87GAT(19) , \86GAT(18) , \85GAT(17) , \195GAT(46) , \126GAT(30) ,
    \210GAT(49) , \207GAT(48) , \80GAT(16) , \51GAT(8) , \183GAT(44) ,
    \201GAT(47) , \26GAT(4) , \219GAT(50) , \90GAT(22) , \91GAT(23) ,
    \189GAT(45) , \36GAT(6) , \171GAT(42) , \96GAT(24) , \228GAT(51) ,
    \17GAT(3) , \177GAT(43) , \101GAT(25) , \106GAT(26) , \156GAT(39) ,
    \42GAT(7) , \237GAT(52) , \165GAT(41) , \1GAT(0) , \153GAT(38) ,
    \152GAT(37) , \13GAT(2) , \246GAT(53) , \259GAT(55) , \159GAT(40) ,
    \130GAT(31) , \255GAT(54) , \138GAT(33) , \267GAT(58) , \135GAT(32) ,
    \121GAT(29) , \59GAT(10) , \116GAT(28) , \268GAT(59) , \143GAT(34) ,
    \149GAT(36) , \261GAT(57) , \260GAT(56) , \29GAT(5) , \111GAT(27) ,
    \146GAT(35) , \68GAT(11) , \73GAT(13) , \72GAT(12) , \8GAT(1) ,
    \55GAT(9) , \75GAT(15) , \74GAT(14) , \88GAT(20) , \89GAT(21) ,
    \865GAT(422) , \420GAT(158) , \419GAT(164) , \418GAT(168) ,
    \864GAT(423) , \421GAT(162) , \874GAT(433) , \866GAT(426) ,
    \448GAT(179) , \850GAT(404) , \388GAT(133) , \422GAT(161) ,
    \423GAT(155) , \449GAT(176) , \389GAT(132) , \768GAT(334) ,
    \879GAT(441) , \880GAT(440) , \863GAT(424) , \447GAT(182) ,
    \767GAT(349) , \391GAT(124) , \878GAT(442) , \446GAT(183) ,
    \450GAT(173) , \390GAT(131)   );
  input  \87GAT(19) , \86GAT(18) , \85GAT(17) , \195GAT(46) ,
    \126GAT(30) , \210GAT(49) , \207GAT(48) , \80GAT(16) , \51GAT(8) ,
    \183GAT(44) , \201GAT(47) , \26GAT(4) , \219GAT(50) , \90GAT(22) ,
    \91GAT(23) , \189GAT(45) , \36GAT(6) , \171GAT(42) , \96GAT(24) ,
    \228GAT(51) , \17GAT(3) , \177GAT(43) , \101GAT(25) , \106GAT(26) ,
    \156GAT(39) , \42GAT(7) , \237GAT(52) , \165GAT(41) , \1GAT(0) ,
    \153GAT(38) , \152GAT(37) , \13GAT(2) , \246GAT(53) , \259GAT(55) ,
    \159GAT(40) , \130GAT(31) , \255GAT(54) , \138GAT(33) , \267GAT(58) ,
    \135GAT(32) , \121GAT(29) , \59GAT(10) , \116GAT(28) , \268GAT(59) ,
    \143GAT(34) , \149GAT(36) , \261GAT(57) , \260GAT(56) , \29GAT(5) ,
    \111GAT(27) , \146GAT(35) , \68GAT(11) , \73GAT(13) , \72GAT(12) ,
    \8GAT(1) , \55GAT(9) , \75GAT(15) , \74GAT(14) , \88GAT(20) ,
    \89GAT(21) ;
  output \865GAT(422) , \420GAT(158) , \419GAT(164) , \418GAT(168) ,
    \864GAT(423) , \421GAT(162) , \874GAT(433) , \866GAT(426) ,
    \448GAT(179) , \850GAT(404) , \388GAT(133) , \422GAT(161) ,
    \423GAT(155) , \449GAT(176) , \389GAT(132) , \768GAT(334) ,
    \879GAT(441) , \880GAT(440) , \863GAT(424) , \447GAT(182) ,
    \767GAT(349) , \391GAT(124) , \878GAT(442) , \446GAT(183) ,
    \450GAT(173) , \390GAT(131) ;
  wire n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
    n101, n102, n103, n104, n106, n107, n108, n109, n110, n111, n112, n113,
    n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
    n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
    n138, n139, n140, n141, n142, n143, n144, n145, n146, n149, n151, n152,
    n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
    n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
    n179, n180, n181, n183, n185, n186, n187, n188, n189, n190, n191, n192,
    n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
    n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
    n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n229,
    n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
    n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
    n254, n255, n256, n257, n258, n259, n260, n261, n262, n264, n266, n267,
    n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
    n280, n281, n285, n287, n288, n291, n292, n293, n294, n295, n296, n297,
    n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
    n310, n311, n312, n313, n314, n315, n316, n318, n319, n320, n321, n322,
    n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
    n335, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
    n348, n349, n350, n351, n352, n354, n355, n356, n357, n358, n359, n360,
    n361, n362, n363, n364, n365, n366, n367, n369, n370, n371, n372, n373,
    n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
    n386, n387, n388, n389, n390, n391, n392, n393, n394, n397, n398, n399,
    n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410;
  assign n87 = \42GAT(7)  & \59GAT(10) ;
  assign n88 = \68GAT(11)  & n87;
  assign n89 = \72GAT(12)  & n88;
  assign n90 = \1GAT(0)  & \8GAT(1) ;
  assign n91 = \13GAT(2)  & n90;
  assign n92 = \55GAT(9)  & n91;
  assign n93 = n89 & n92;
  assign n94 = \73GAT(13)  & n93;
  assign n95 = \195GAT(46)  & n94;
  assign n96 = \51GAT(8)  & n90;
  assign n97 = \17GAT(3)  & n96;
  assign n98 = \59GAT(10)  & \75GAT(15) ;
  assign n99 = \42GAT(7)  & n98;
  assign n100 = n97 & ~n99;
  assign n101 = \17GAT(3)  & \42GAT(7) ;
  assign n102 = ~\17GAT(3)  & ~\42GAT(7) ;
  assign n103 = ~n101 & ~n102;
  assign n104 = \26GAT(4)  & \1GAT(0) ;
  assign \447GAT(182)  = \51GAT(8)  & n104;
  assign n106 = \156GAT(39)  & \59GAT(10) ;
  assign n107 = \447GAT(182)  & n106;
  assign n108 = n103 & n107;
  assign n109 = ~n100 & ~n108;
  assign n110 = \121GAT(29)  & ~n109;
  assign n111 = \17GAT(3)  & ~n106;
  assign n112 = \447GAT(182)  & n111;
  assign n113 = \1GAT(0)  & ~n112;
  assign n114 = \149GAT(36)  & ~n113;
  assign n115 = ~n110 & ~n114;
  assign n116 = \29GAT(5)  & \75GAT(15) ;
  assign n117 = \80GAT(16)  & n116;
  assign n118 = \55GAT(9)  & n117;
  assign n119 = \447GAT(182)  & n118;
  assign n120 = ~\268GAT(59)  & n119;
  assign n121 = n115 & ~n120;
  assign n122 = \246GAT(53)  & ~n121;
  assign n123 = \255GAT(54)  & \260GAT(56) ;
  assign n124 = ~n122 & ~n123;
  assign n125 = \195GAT(46)  & ~n121;
  assign n126 = \237GAT(52)  & n125;
  assign n127 = ~\195GAT(46)  & n121;
  assign n128 = ~n125 & ~n127;
  assign n129 = \228GAT(51)  & n128;
  assign n130 = ~n126 & ~n129;
  assign n131 = \126GAT(30)  & ~n109;
  assign n132 = \153GAT(38)  & ~n113;
  assign n133 = ~n131 & ~n132;
  assign n134 = ~n120 & n133;
  assign n135 = ~\201GAT(47)  & n134;
  assign n136 = \261GAT(57)  & ~n135;
  assign n137 = \201GAT(47)  & ~n134;
  assign n138 = ~n136 & ~n137;
  assign n139 = n128 & ~n138;
  assign n140 = ~n128 & n138;
  assign n141 = ~n139 & ~n140;
  assign n142 = \219GAT(50)  & n141;
  assign n143 = \210GAT(49)  & \116GAT(28) ;
  assign n144 = ~n142 & ~n143;
  assign n145 = n130 & n144;
  assign n146 = n124 & n145;
  assign \865GAT(422)  = n95 | ~n146;
  assign \420GAT(158)  = ~\80GAT(16)  | ~n98;
  assign n149 = \36GAT(6)  & \29GAT(5) ;
  assign \390GAT(131)  = \42GAT(7)  & n149;
  assign n151 = \13GAT(2)  & n104;
  assign n152 = \17GAT(3)  & n151;
  assign \419GAT(164)  = \390GAT(131)  | ~n152;
  assign \418GAT(168)  = \17GAT(3)  & n91;
  assign n155 = \189GAT(45)  & n94;
  assign n156 = \116GAT(28)  & ~n109;
  assign n157 = \146GAT(35)  & ~n113;
  assign n158 = ~n156 & ~n157;
  assign n159 = ~n120 & n158;
  assign n160 = \246GAT(53)  & ~n159;
  assign n161 = \259GAT(55)  & \255GAT(54) ;
  assign n162 = ~n160 & ~n161;
  assign n163 = \189GAT(45)  & ~n159;
  assign n164 = \237GAT(52)  & n163;
  assign n165 = ~\189GAT(45)  & n159;
  assign n166 = ~n163 & ~n165;
  assign n167 = \228GAT(51)  & n166;
  assign n168 = ~n164 & ~n167;
  assign n169 = ~n127 & n137;
  assign n170 = ~n127 & ~n135;
  assign n171 = \261GAT(57)  & n170;
  assign n172 = ~n125 & ~n171;
  assign n173 = ~n169 & n172;
  assign n174 = n166 & ~n173;
  assign n175 = ~n166 & n173;
  assign n176 = ~n174 & ~n175;
  assign n177 = \219GAT(50)  & n176;
  assign n178 = \210GAT(49)  & \111GAT(27) ;
  assign n179 = ~n177 & ~n178;
  assign n180 = n168 & n179;
  assign n181 = n162 & n180;
  assign \864GAT(423)  = n155 | ~n181;
  assign n183 = \36GAT(6)  & \59GAT(10) ;
  assign \421GAT(162)  = ~\80GAT(16)  | ~n183;
  assign n185 = \177GAT(43)  & n94;
  assign n186 = \17GAT(3)  & n117;
  assign n187 = \447GAT(182)  & n186;
  assign n188 = ~\268GAT(59)  & n187;
  assign n189 = \55GAT(9)  & ~n106;
  assign n190 = \447GAT(182)  & n189;
  assign n191 = \153GAT(38)  & n190;
  assign n192 = ~n188 & ~n191;
  assign n193 = \106GAT(26)  & ~n109;
  assign n194 = \152GAT(37)  & \138GAT(33) ;
  assign n195 = ~n193 & ~n194;
  assign n196 = n192 & n195;
  assign n197 = \246GAT(53)  & ~n196;
  assign n198 = ~n185 & ~n197;
  assign n199 = \177GAT(43)  & ~n196;
  assign n200 = \237GAT(52)  & n199;
  assign n201 = ~\177GAT(43)  & n196;
  assign n202 = ~n199 & ~n201;
  assign n203 = \228GAT(51)  & n202;
  assign n204 = ~n200 & ~n203;
  assign n205 = n125 & ~n165;
  assign n206 = ~n165 & n169;
  assign n207 = ~n127 & ~n165;
  assign n208 = ~n135 & n207;
  assign n209 = \261GAT(57)  & n208;
  assign n210 = ~n163 & ~n209;
  assign n211 = ~n206 & n210;
  assign n212 = ~n205 & n211;
  assign n213 = \111GAT(27)  & ~n109;
  assign n214 = \143GAT(34)  & ~n113;
  assign n215 = ~n213 & ~n214;
  assign n216 = ~n120 & n215;
  assign n217 = ~\183GAT(44)  & n216;
  assign n218 = ~n212 & ~n217;
  assign n219 = \183GAT(44)  & ~n216;
  assign n220 = ~n218 & ~n219;
  assign n221 = n202 & ~n220;
  assign n222 = ~n202 & n220;
  assign n223 = ~n221 & ~n222;
  assign n224 = \219GAT(50)  & n223;
  assign n225 = \210GAT(49)  & \101GAT(25) ;
  assign n226 = ~n224 & ~n225;
  assign n227 = n204 & n226;
  assign \874GAT(433)  = ~n198 | ~n227;
  assign n229 = \143GAT(34)  & n190;
  assign n230 = ~n188 & ~n229;
  assign n231 = \91GAT(23)  & ~n109;
  assign n232 = \138GAT(33)  & \8GAT(1) ;
  assign n233 = ~n231 & ~n232;
  assign n234 = n230 & n233;
  assign n235 = ~\159GAT(40)  & n234;
  assign n236 = \149GAT(36)  & n190;
  assign n237 = ~n188 & ~n236;
  assign n238 = \101GAT(25)  & ~n109;
  assign n239 = \17GAT(3)  & \138GAT(33) ;
  assign n240 = ~n238 & ~n239;
  assign n241 = n237 & n240;
  assign n242 = ~\171GAT(42)  & n241;
  assign n243 = \146GAT(35)  & n190;
  assign n244 = ~n188 & ~n243;
  assign n245 = \96GAT(24)  & ~n109;
  assign n246 = \51GAT(8)  & \138GAT(33) ;
  assign n247 = ~n245 & ~n246;
  assign n248 = n244 & n247;
  assign n249 = ~\165GAT(41)  & n248;
  assign n250 = ~n242 & ~n249;
  assign n251 = ~n201 & n250;
  assign n252 = ~n220 & n251;
  assign n253 = \171GAT(42)  & ~n241;
  assign n254 = ~n249 & n253;
  assign n255 = n199 & ~n242;
  assign n256 = ~n249 & n255;
  assign n257 = \165GAT(41)  & ~n248;
  assign n258 = ~n256 & ~n257;
  assign n259 = ~n254 & n258;
  assign n260 = ~n252 & n259;
  assign n261 = ~n235 & ~n260;
  assign n262 = \159GAT(40)  & ~n234;
  assign \866GAT(426)  = n261 | n262;
  assign n264 = \29GAT(5)  & \68GAT(11) ;
  assign \448GAT(179)  = n92 & n264;
  assign n266 = \201GAT(47)  & n94;
  assign n267 = \246GAT(53)  & ~n134;
  assign n268 = \255GAT(54)  & \267GAT(58) ;
  assign n269 = ~n267 & ~n268;
  assign n270 = \237GAT(52)  & n137;
  assign n271 = ~n135 & ~n137;
  assign n272 = \228GAT(51)  & n271;
  assign n273 = ~n270 & ~n272;
  assign n274 = \261GAT(57)  & n271;
  assign n275 = ~\261GAT(57)  & ~n271;
  assign n276 = ~n274 & ~n275;
  assign n277 = \219GAT(50)  & n276;
  assign n278 = \210GAT(49)  & \121GAT(29) ;
  assign n279 = ~n277 & ~n278;
  assign n280 = n273 & n279;
  assign n281 = n269 & n280;
  assign \850GAT(404)  = n266 | ~n281;
  assign \388GAT(133)  = \42GAT(7)  & n116;
  assign \422GAT(161)  = ~\42GAT(7)  | ~n183;
  assign n285 = ~\87GAT(19)  & ~\88GAT(20) ;
  assign \423GAT(155)  = \90GAT(22)  & ~n285;
  assign n287 = \59GAT(10)  & \68GAT(11) ;
  assign n288 = \74GAT(14)  & n287;
  assign \449GAT(176)  = n92 & n288;
  assign \389GAT(132)  = \80GAT(16)  & n149;
  assign n291 = ~\165GAT(41)  & ~\159GAT(40) ;
  assign n292 = \165GAT(41)  & \159GAT(40) ;
  assign n293 = ~n291 & ~n292;
  assign n294 = ~\171GAT(42)  & ~\177GAT(43) ;
  assign n295 = \171GAT(42)  & \177GAT(43) ;
  assign n296 = ~n294 & ~n295;
  assign n297 = n293 & n296;
  assign n298 = ~n293 & ~n296;
  assign n299 = ~n297 & ~n298;
  assign n300 = ~\130GAT(31)  & ~n299;
  assign n301 = \130GAT(31)  & n299;
  assign n302 = ~n300 & ~n301;
  assign n303 = ~\183GAT(44)  & ~\189GAT(45) ;
  assign n304 = \183GAT(44)  & \189GAT(45) ;
  assign n305 = ~n303 & ~n304;
  assign n306 = ~\195GAT(46)  & ~\201GAT(47) ;
  assign n307 = \195GAT(46)  & \201GAT(47) ;
  assign n308 = ~n306 & ~n307;
  assign n309 = n305 & n308;
  assign n310 = ~n305 & ~n308;
  assign n311 = ~n309 & ~n310;
  assign n312 = ~\207GAT(48)  & ~n311;
  assign n313 = \207GAT(48)  & n311;
  assign n314 = ~n312 & ~n313;
  assign n315 = n302 & n314;
  assign n316 = ~n302 & ~n314;
  assign \768GAT(334)  = ~n315 & ~n316;
  assign n318 = \165GAT(41)  & n94;
  assign n319 = \246GAT(53)  & ~n248;
  assign n320 = ~n318 & ~n319;
  assign n321 = \237GAT(52)  & n257;
  assign n322 = ~n249 & ~n257;
  assign n323 = \228GAT(51)  & n322;
  assign n324 = ~n321 & ~n323;
  assign n325 = ~n201 & ~n242;
  assign n326 = ~n220 & n325;
  assign n327 = ~n253 & ~n255;
  assign n328 = ~n326 & n327;
  assign n329 = n322 & ~n328;
  assign n330 = ~n322 & n328;
  assign n331 = ~n329 & ~n330;
  assign n332 = \219GAT(50)  & n331;
  assign n333 = \210GAT(49)  & \91GAT(23) ;
  assign n334 = ~n332 & ~n333;
  assign n335 = n324 & n334;
  assign \879GAT(441)  = ~n320 | ~n335;
  assign n337 = \171GAT(42)  & n94;
  assign n338 = \246GAT(53)  & ~n241;
  assign n339 = ~n337 & ~n338;
  assign n340 = \237GAT(52)  & n253;
  assign n341 = ~n242 & ~n253;
  assign n342 = \228GAT(51)  & n341;
  assign n343 = ~n340 & ~n342;
  assign n344 = ~n201 & ~n220;
  assign n345 = ~n199 & ~n344;
  assign n346 = n341 & ~n345;
  assign n347 = ~n341 & n345;
  assign n348 = ~n346 & ~n347;
  assign n349 = \219GAT(50)  & n348;
  assign n350 = \210GAT(49)  & \96GAT(24) ;
  assign n351 = ~n349 & ~n350;
  assign n352 = n343 & n351;
  assign \880GAT(440)  = ~n339 | ~n352;
  assign n354 = \183GAT(44)  & n94;
  assign n355 = \246GAT(53)  & ~n216;
  assign n356 = ~n354 & ~n355;
  assign n357 = \237GAT(52)  & n219;
  assign n358 = ~n217 & ~n219;
  assign n359 = \228GAT(51)  & n358;
  assign n360 = ~n357 & ~n359;
  assign n361 = ~n212 & n358;
  assign n362 = n212 & ~n358;
  assign n363 = ~n361 & ~n362;
  assign n364 = \219GAT(50)  & n363;
  assign n365 = \210GAT(49)  & \106GAT(26) ;
  assign n366 = ~n364 & ~n365;
  assign n367 = n360 & n366;
  assign \863GAT(424)  = ~n356 | ~n367;
  assign n369 = ~\91GAT(23)  & ~\96GAT(24) ;
  assign n370 = \91GAT(23)  & \96GAT(24) ;
  assign n371 = ~n369 & ~n370;
  assign n372 = ~\101GAT(25)  & ~\106GAT(26) ;
  assign n373 = \101GAT(25)  & \106GAT(26) ;
  assign n374 = ~n372 & ~n373;
  assign n375 = n371 & n374;
  assign n376 = ~n371 & ~n374;
  assign n377 = ~n375 & ~n376;
  assign n378 = ~\130GAT(31)  & ~n377;
  assign n379 = \130GAT(31)  & n377;
  assign n380 = ~n378 & ~n379;
  assign n381 = ~\116GAT(28)  & ~\111GAT(27) ;
  assign n382 = \116GAT(28)  & \111GAT(27) ;
  assign n383 = ~n381 & ~n382;
  assign n384 = ~\126GAT(30)  & ~\121GAT(29) ;
  assign n385 = \126GAT(30)  & \121GAT(29) ;
  assign n386 = ~n384 & ~n385;
  assign n387 = n383 & n386;
  assign n388 = ~n383 & ~n386;
  assign n389 = ~n387 & ~n388;
  assign n390 = ~\135GAT(32)  & ~n389;
  assign n391 = \135GAT(32)  & n389;
  assign n392 = ~n390 & ~n391;
  assign n393 = n380 & n392;
  assign n394 = ~n380 & ~n392;
  assign \767GAT(349)  = ~n393 & ~n394;
  assign \391GAT(124)  = \86GAT(18)  & \85GAT(17) ;
  assign n397 = \159GAT(40)  & n94;
  assign n398 = \246GAT(53)  & ~n234;
  assign n399 = ~n397 & ~n398;
  assign n400 = \237GAT(52)  & n262;
  assign n401 = ~n235 & ~n262;
  assign n402 = \228GAT(51)  & n401;
  assign n403 = ~n400 & ~n402;
  assign n404 = ~n260 & n401;
  assign n405 = n260 & ~n401;
  assign n406 = ~n404 & ~n405;
  assign n407 = \219GAT(50)  & n406;
  assign n408 = \210GAT(49)  & \268GAT(59) ;
  assign n409 = ~n407 & ~n408;
  assign n410 = n403 & n409;
  assign \878GAT(442)  = ~n399 | ~n410;
  assign \446GAT(183)  = ~\390GAT(131)  | ~n152;
  assign \450GAT(173)  = \89GAT(21)  & ~n285;
endmodule


