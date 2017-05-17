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
    n101, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
    n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
    n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
    n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n150, n152,
    n153, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
    n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
    n179, n180, n181, n182, n184, n186, n187, n188, n189, n190, n191, n192,
    n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
    n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
    n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n229,
    n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
    n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
    n254, n255, n256, n257, n258, n259, n260, n261, n263, n265, n266, n267,
    n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
    n280, n284, n286, n287, n290, n291, n292, n293, n294, n295, n296, n297,
    n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
    n310, n311, n312, n313, n314, n315, n317, n318, n319, n320, n321, n322,
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
  assign n96 = \59GAT(10)  & \75GAT(15) ;
  assign n97 = \42GAT(7)  & n96;
  assign n98 = \51GAT(8)  & n90;
  assign n99 = \17GAT(3)  & n98;
  assign n100 = ~n97 & n99;
  assign n101 = \26GAT(4)  & \1GAT(0) ;
  assign \447GAT(182)  = \51GAT(8)  & n101;
  assign n103 = \17GAT(3)  & \42GAT(7) ;
  assign n104 = ~\17GAT(3)  & ~\42GAT(7) ;
  assign n105 = ~n103 & ~n104;
  assign n106 = \59GAT(10)  & n105;
  assign n107 = \156GAT(39)  & n106;
  assign n108 = \447GAT(182)  & n107;
  assign n109 = ~n100 & ~n108;
  assign n110 = \121GAT(29)  & ~n109;
  assign n111 = \156GAT(39)  & \59GAT(10) ;
  assign n112 = \447GAT(182)  & ~n111;
  assign n113 = \17GAT(3)  & n112;
  assign n114 = \1GAT(0)  & ~n113;
  assign n115 = \149GAT(36)  & ~n114;
  assign n116 = ~n110 & ~n115;
  assign n117 = \29GAT(5)  & \75GAT(15) ;
  assign n118 = \80GAT(16)  & n117;
  assign n119 = \447GAT(182)  & n118;
  assign n120 = \55GAT(9)  & n119;
  assign n121 = ~\268GAT(59)  & n120;
  assign n122 = n116 & ~n121;
  assign n123 = \246GAT(53)  & ~n122;
  assign n124 = \255GAT(54)  & \260GAT(56) ;
  assign n125 = ~n123 & ~n124;
  assign n126 = \195GAT(46)  & ~n122;
  assign n127 = \237GAT(52)  & n126;
  assign n128 = ~\195GAT(46)  & n122;
  assign n129 = ~n126 & ~n128;
  assign n130 = \228GAT(51)  & n129;
  assign n131 = ~n127 & ~n130;
  assign n132 = \126GAT(30)  & ~n109;
  assign n133 = \153GAT(38)  & ~n114;
  assign n134 = ~n132 & ~n133;
  assign n135 = ~n121 & n134;
  assign n136 = ~\201GAT(47)  & n135;
  assign n137 = \261GAT(57)  & ~n136;
  assign n138 = \201GAT(47)  & ~n135;
  assign n139 = ~n137 & ~n138;
  assign n140 = n129 & ~n139;
  assign n141 = ~n129 & n139;
  assign n142 = ~n140 & ~n141;
  assign n143 = \219GAT(50)  & n142;
  assign n144 = \210GAT(49)  & \116GAT(28) ;
  assign n145 = ~n143 & ~n144;
  assign n146 = n131 & n145;
  assign n147 = n125 & n146;
  assign \865GAT(422)  = n95 | ~n147;
  assign \420GAT(158)  = ~\80GAT(16)  | ~n96;
  assign n150 = \36GAT(6)  & \29GAT(5) ;
  assign \390GAT(131)  = \42GAT(7)  & n150;
  assign n152 = \13GAT(2)  & n101;
  assign n153 = \17GAT(3)  & n152;
  assign \419GAT(164)  = \390GAT(131)  | ~n153;
  assign \418GAT(168)  = \17GAT(3)  & n91;
  assign n156 = \189GAT(45)  & n94;
  assign n157 = \116GAT(28)  & ~n109;
  assign n158 = \146GAT(35)  & ~n114;
  assign n159 = ~n157 & ~n158;
  assign n160 = ~n121 & n159;
  assign n161 = \246GAT(53)  & ~n160;
  assign n162 = \259GAT(55)  & \255GAT(54) ;
  assign n163 = ~n161 & ~n162;
  assign n164 = \189GAT(45)  & ~n160;
  assign n165 = \237GAT(52)  & n164;
  assign n166 = ~\189GAT(45)  & n160;
  assign n167 = ~n164 & ~n166;
  assign n168 = \228GAT(51)  & n167;
  assign n169 = ~n165 & ~n168;
  assign n170 = ~n128 & ~n136;
  assign n171 = \261GAT(57)  & n170;
  assign n172 = ~n128 & n138;
  assign n173 = ~n126 & ~n172;
  assign n174 = ~n171 & n173;
  assign n175 = n167 & ~n174;
  assign n176 = ~n167 & n174;
  assign n177 = ~n175 & ~n176;
  assign n178 = \219GAT(50)  & n177;
  assign n179 = \210GAT(49)  & \111GAT(27) ;
  assign n180 = ~n178 & ~n179;
  assign n181 = n169 & n180;
  assign n182 = n163 & n181;
  assign \864GAT(423)  = n156 | ~n182;
  assign n184 = \36GAT(6)  & \59GAT(10) ;
  assign \421GAT(162)  = ~\80GAT(16)  | ~n184;
  assign n186 = \177GAT(43)  & n94;
  assign n187 = \17GAT(3)  & \447GAT(182) ;
  assign n188 = n118 & n187;
  assign n189 = ~\268GAT(59)  & n188;
  assign n190 = \55GAT(9)  & n112;
  assign n191 = \153GAT(38)  & n190;
  assign n192 = ~n189 & ~n191;
  assign n193 = \106GAT(26)  & ~n109;
  assign n194 = \152GAT(37)  & \138GAT(33) ;
  assign n195 = ~n193 & ~n194;
  assign n196 = n192 & n195;
  assign n197 = \246GAT(53)  & ~n196;
  assign n198 = ~n186 & ~n197;
  assign n199 = \177GAT(43)  & ~n196;
  assign n200 = \237GAT(52)  & n199;
  assign n201 = ~\177GAT(43)  & n196;
  assign n202 = ~n199 & ~n201;
  assign n203 = \228GAT(51)  & n202;
  assign n204 = ~n200 & ~n203;
  assign n205 = \111GAT(27)  & ~n109;
  assign n206 = \143GAT(34)  & ~n114;
  assign n207 = ~n205 & ~n206;
  assign n208 = ~n121 & n207;
  assign n209 = \183GAT(44)  & ~n208;
  assign n210 = ~n128 & ~n166;
  assign n211 = ~n136 & n210;
  assign n212 = \261GAT(57)  & n211;
  assign n213 = n138 & n210;
  assign n214 = n126 & ~n166;
  assign n215 = ~n164 & ~n214;
  assign n216 = ~n213 & n215;
  assign n217 = ~n212 & n216;
  assign n218 = ~\183GAT(44)  & n208;
  assign n219 = ~n217 & ~n218;
  assign n220 = ~n209 & ~n219;
  assign n221 = n202 & ~n220;
  assign n222 = ~n202 & n220;
  assign n223 = ~n221 & ~n222;
  assign n224 = \219GAT(50)  & n223;
  assign n225 = \210GAT(49)  & \101GAT(25) ;
  assign n226 = ~n224 & ~n225;
  assign n227 = n204 & n226;
  assign \874GAT(433)  = ~n198 | ~n227;
  assign n229 = \143GAT(34)  & n190;
  assign n230 = ~n189 & ~n229;
  assign n231 = \91GAT(23)  & ~n109;
  assign n232 = \138GAT(33)  & \8GAT(1) ;
  assign n233 = ~n231 & ~n232;
  assign n234 = n230 & n233;
  assign n235 = ~\159GAT(40)  & n234;
  assign n236 = \149GAT(36)  & n190;
  assign n237 = ~n189 & ~n236;
  assign n238 = \101GAT(25)  & ~n109;
  assign n239 = \17GAT(3)  & \138GAT(33) ;
  assign n240 = ~n238 & ~n239;
  assign n241 = n237 & n240;
  assign n242 = ~\171GAT(42)  & n241;
  assign n243 = \146GAT(35)  & n190;
  assign n244 = ~n189 & ~n243;
  assign n245 = \96GAT(24)  & ~n109;
  assign n246 = \51GAT(8)  & \138GAT(33) ;
  assign n247 = ~n245 & ~n246;
  assign n248 = n244 & n247;
  assign n249 = ~\165GAT(41)  & n248;
  assign n250 = ~n242 & ~n249;
  assign n251 = ~n201 & n250;
  assign n252 = ~n220 & n251;
  assign n253 = n199 & n250;
  assign n254 = \171GAT(42)  & ~n241;
  assign n255 = ~n249 & n254;
  assign n256 = \165GAT(41)  & ~n248;
  assign n257 = ~n255 & ~n256;
  assign n258 = ~n253 & n257;
  assign n259 = ~n252 & n258;
  assign n260 = ~n235 & ~n259;
  assign n261 = \159GAT(40)  & ~n234;
  assign \866GAT(426)  = n260 | n261;
  assign n263 = \29GAT(5)  & \68GAT(11) ;
  assign \448GAT(179)  = n92 & n263;
  assign n265 = \201GAT(47)  & n94;
  assign n266 = \246GAT(53)  & ~n135;
  assign n267 = \255GAT(54)  & \267GAT(58) ;
  assign n268 = ~n266 & ~n267;
  assign n269 = \237GAT(52)  & n138;
  assign n270 = ~n136 & ~n138;
  assign n271 = \228GAT(51)  & n270;
  assign n272 = ~n269 & ~n271;
  assign n273 = \261GAT(57)  & n270;
  assign n274 = ~\261GAT(57)  & ~n270;
  assign n275 = ~n273 & ~n274;
  assign n276 = \219GAT(50)  & n275;
  assign n277 = \210GAT(49)  & \121GAT(29) ;
  assign n278 = ~n276 & ~n277;
  assign n279 = n272 & n278;
  assign n280 = n268 & n279;
  assign \850GAT(404)  = n265 | ~n280;
  assign \388GAT(133)  = \42GAT(7)  & n117;
  assign \422GAT(161)  = ~\42GAT(7)  | ~n184;
  assign n284 = ~\87GAT(19)  & ~\88GAT(20) ;
  assign \423GAT(155)  = \90GAT(22)  & ~n284;
  assign n286 = \59GAT(10)  & \68GAT(11) ;
  assign n287 = \74GAT(14)  & n286;
  assign \449GAT(176)  = n92 & n287;
  assign \389GAT(132)  = \80GAT(16)  & n150;
  assign n290 = ~\195GAT(46)  & ~\201GAT(47) ;
  assign n291 = \195GAT(46)  & \201GAT(47) ;
  assign n292 = ~n290 & ~n291;
  assign n293 = ~\183GAT(44)  & ~\189GAT(45) ;
  assign n294 = \183GAT(44)  & \189GAT(45) ;
  assign n295 = ~n293 & ~n294;
  assign n296 = n292 & n295;
  assign n297 = ~n292 & ~n295;
  assign n298 = ~n296 & ~n297;
  assign n299 = ~\207GAT(48)  & ~n298;
  assign n300 = \207GAT(48)  & n298;
  assign n301 = ~n299 & ~n300;
  assign n302 = ~\171GAT(42)  & ~\177GAT(43) ;
  assign n303 = \171GAT(42)  & \177GAT(43) ;
  assign n304 = ~n302 & ~n303;
  assign n305 = ~\165GAT(41)  & ~\159GAT(40) ;
  assign n306 = \165GAT(41)  & \159GAT(40) ;
  assign n307 = ~n305 & ~n306;
  assign n308 = n304 & n307;
  assign n309 = ~n304 & ~n307;
  assign n310 = ~n308 & ~n309;
  assign n311 = ~\130GAT(31)  & ~n310;
  assign n312 = \130GAT(31)  & n310;
  assign n313 = ~n311 & ~n312;
  assign n314 = n301 & n313;
  assign n315 = ~n301 & ~n313;
  assign \768GAT(334)  = ~n314 & ~n315;
  assign n317 = \165GAT(41)  & n94;
  assign n318 = \246GAT(53)  & ~n248;
  assign n319 = ~n317 & ~n318;
  assign n320 = \237GAT(52)  & n256;
  assign n321 = ~n249 & ~n256;
  assign n322 = \228GAT(51)  & n321;
  assign n323 = ~n320 & ~n322;
  assign n324 = ~n201 & ~n242;
  assign n325 = ~n220 & n324;
  assign n326 = n199 & ~n242;
  assign n327 = ~n254 & ~n326;
  assign n328 = ~n325 & n327;
  assign n329 = n321 & ~n328;
  assign n330 = ~n321 & n328;
  assign n331 = ~n329 & ~n330;
  assign n332 = \219GAT(50)  & n331;
  assign n333 = \210GAT(49)  & \91GAT(23) ;
  assign n334 = ~n332 & ~n333;
  assign n335 = n323 & n334;
  assign \879GAT(441)  = ~n319 | ~n335;
  assign n337 = \171GAT(42)  & n94;
  assign n338 = \246GAT(53)  & ~n241;
  assign n339 = ~n337 & ~n338;
  assign n340 = \237GAT(52)  & n254;
  assign n341 = ~n242 & ~n254;
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
  assign n355 = \246GAT(53)  & ~n208;
  assign n356 = ~n354 & ~n355;
  assign n357 = \237GAT(52)  & n209;
  assign n358 = ~n209 & ~n218;
  assign n359 = \228GAT(51)  & n358;
  assign n360 = ~n357 & ~n359;
  assign n361 = ~n217 & n358;
  assign n362 = n217 & ~n358;
  assign n363 = ~n361 & ~n362;
  assign n364 = \219GAT(50)  & n363;
  assign n365 = \210GAT(49)  & \106GAT(26) ;
  assign n366 = ~n364 & ~n365;
  assign n367 = n360 & n366;
  assign \863GAT(424)  = ~n356 | ~n367;
  assign n369 = ~\126GAT(30)  & ~\121GAT(29) ;
  assign n370 = \126GAT(30)  & \121GAT(29) ;
  assign n371 = ~n369 & ~n370;
  assign n372 = ~\116GAT(28)  & ~\111GAT(27) ;
  assign n373 = \116GAT(28)  & \111GAT(27) ;
  assign n374 = ~n372 & ~n373;
  assign n375 = n371 & n374;
  assign n376 = ~n371 & ~n374;
  assign n377 = ~n375 & ~n376;
  assign n378 = ~\135GAT(32)  & ~n377;
  assign n379 = \135GAT(32)  & n377;
  assign n380 = ~n378 & ~n379;
  assign n381 = ~\101GAT(25)  & ~\106GAT(26) ;
  assign n382 = \101GAT(25)  & \106GAT(26) ;
  assign n383 = ~n381 & ~n382;
  assign n384 = ~\91GAT(23)  & ~\96GAT(24) ;
  assign n385 = \91GAT(23)  & \96GAT(24) ;
  assign n386 = ~n384 & ~n385;
  assign n387 = n383 & n386;
  assign n388 = ~n383 & ~n386;
  assign n389 = ~n387 & ~n388;
  assign n390 = ~\130GAT(31)  & ~n389;
  assign n391 = \130GAT(31)  & n389;
  assign n392 = ~n390 & ~n391;
  assign n393 = n380 & n392;
  assign n394 = ~n380 & ~n392;
  assign \767GAT(349)  = ~n393 & ~n394;
  assign \391GAT(124)  = \86GAT(18)  & \85GAT(17) ;
  assign n397 = \159GAT(40)  & n94;
  assign n398 = \246GAT(53)  & ~n234;
  assign n399 = ~n397 & ~n398;
  assign n400 = \237GAT(52)  & n261;
  assign n401 = ~n235 & ~n261;
  assign n402 = \228GAT(51)  & n401;
  assign n403 = ~n400 & ~n402;
  assign n404 = ~n259 & n401;
  assign n405 = n259 & ~n401;
  assign n406 = ~n404 & ~n405;
  assign n407 = \219GAT(50)  & n406;
  assign n408 = \210GAT(49)  & \268GAT(59) ;
  assign n409 = ~n407 & ~n408;
  assign n410 = n403 & n409;
  assign \878GAT(442)  = ~n399 | ~n410;
  assign \446GAT(183)  = ~\390GAT(131)  | ~n153;
  assign \450GAT(173)  = \89GAT(21)  & ~n284;
endmodule


