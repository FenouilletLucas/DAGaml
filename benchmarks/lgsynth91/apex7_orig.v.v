// Benchmark "apex7" written by ABC on Tue May 16 16:07:44 2017

module apex7 ( 
    PLUTO0, PLUTO1, PLUTO2, PLUTO3, PLUTO4, PLUTO5, PY, VST0, VST1,
    VLENESR, BULL0, BULL1, BULL2, BULL3, BULL4, BULL5, BULL6, MMERR,
    VERR_N, MARSSR, END, WATCH, FBI, STAR0, STAR1, STAR2, STAR3, ACCRPY,
    IBT0, IBT1, IBT2, VSUMESR, KBG_N, CAPSD, CAT0, CAT1, CAT2, CAT3, CAT4,
    CAT5, ICLR, OWL_N, ORWD_N, OVACC, VACC, RATR, LSD, DEL1, COMPPAR,
    VLENESR_P, VST1_P, COMPPAR_P, BULL5_P, END_P, PY_P, VERR_F, PLUTO4_P,
    VSUMESR_P, BULL0_P, LSD_P, STAR2_P, SDO, PLUTO5_P, BULL3_P, WATCH_P,
    FBI_P, PLUTO2_P, MARSSR_P, BULL6_P, KBG_F, STAR0_P, PLUTO3_P, RATR_P,
    OVACC_P, BULL1_P, PLUTO0_P, STAR3_P, VST0_P, OWL_F, BULL4_P, ORWD_F,
    PLUTO1_P, ACCRPY_P, STAR1_P, BULL2_P, DEL1_P  );
  input  PLUTO0, PLUTO1, PLUTO2, PLUTO3, PLUTO4, PLUTO5, PY, VST0, VST1,
    VLENESR, BULL0, BULL1, BULL2, BULL3, BULL4, BULL5, BULL6, MMERR,
    VERR_N, MARSSR, END, WATCH, FBI, STAR0, STAR1, STAR2, STAR3, ACCRPY,
    IBT0, IBT1, IBT2, VSUMESR, KBG_N, CAPSD, CAT0, CAT1, CAT2, CAT3, CAT4,
    CAT5, ICLR, OWL_N, ORWD_N, OVACC, VACC, RATR, LSD, DEL1, COMPPAR;
  output VLENESR_P, VST1_P, COMPPAR_P, BULL5_P, END_P, PY_P, VERR_F, PLUTO4_P,
    VSUMESR_P, BULL0_P, LSD_P, STAR2_P, SDO, PLUTO5_P, BULL3_P, WATCH_P,
    FBI_P, PLUTO2_P, MARSSR_P, BULL6_P, KBG_F, STAR0_P, PLUTO3_P, RATR_P,
    OVACC_P, BULL1_P, PLUTO0_P, STAR3_P, VST0_P, OWL_F, BULL4_P, ORWD_F,
    PLUTO1_P, ACCRPY_P, STAR1_P, BULL2_P, DEL1_P;
  wire n87, n88, n90, n91, n92, n93, n95, n96, n97, n98, n99, n100, n101,
    n102, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n115,
    n116, n117, n118, n119, n120, n121, n122, n124, n125, n126, n127, n128,
    n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
    n141, n142, n143, n144, n145, n146, n147, n149, n150, n151, n152, n153,
    n155, n156, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
    n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
    n180, n181, n182, n183, n184, n185, n187, n188, n189, n190, n191, n192,
    n193, n194, n195, n196, n197, n198, n199, n200, n202, n204, n205, n206,
    n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
    n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n233,
    n234, n235, n236, n238, n239, n240, n242, n243, n245, n246, n247, n248,
    n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
    n261, n262, n263, n264, n265, n266, n267, n269, n270, n271, n272, n274,
    n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
    n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
    n300, n301, n303, n304, n305, n307, n308, n310, n311, n312, n313, n315,
    n316, n319, n320, n321, n323, n324, n325, n327, n328, n329, n330, n331,
    n332, n333, n334, n335, n337, n338, n340, n341, n342, n343, n344, n345,
    n347, n348, n349, n351, n353, n354, n355, n356, n357, n358, n359, n360,
    n361, n363, n364, n365, n366;
  assign n87 = ~KBG_N & OWL_N;
  assign n88 = VLENESR & OWL_N;
  assign VLENESR_P = n87 | n88;
  assign n90 = FBI & ~ICLR;
  assign n91 = ~FBI & ~ICLR;
  assign n92 = VST1 & n91;
  assign n93 = PY & n90;
  assign VST1_P = n92 | n93;
  assign n95 = FBI & OWL_N;
  assign n96 = ~DEL1 & COMPPAR;
  assign n97 = OWL_N & n96;
  assign n98 = ~FBI & COMPPAR;
  assign n99 = OWL_N & n98;
  assign n100 = DEL1 & ~COMPPAR;
  assign n101 = n95 & n100;
  assign n102 = ~n99 & ~n101;
  assign COMPPAR_P = n97 | ~n102;
  assign n104 = BULL0 & WATCH;
  assign n105 = BULL1 & n104;
  assign n106 = BULL2 & n105;
  assign n107 = BULL3 & OWL_N;
  assign n108 = n106 & n107;
  assign n109 = BULL4 & OWL_N;
  assign n110 = ~n106 & n109;
  assign n111 = ~BULL4 & n108;
  assign n112 = ~BULL3 & n109;
  assign n113 = ~n111 & ~n112;
  assign BULL4_P = n110 | ~n113;
  assign n115 = BULL5 & OWL_N;
  assign n116 = ~n106 & n115;
  assign n117 = ~BULL3 & n115;
  assign n118 = BULL4 & ~BULL5;
  assign n119 = n108 & n118;
  assign n120 = BULL5 & BULL4_P;
  assign n121 = ~n119 & ~n120;
  assign n122 = ~n117 & n121;
  assign BULL5_P = n116 | ~n122;
  assign n124 = STAR0 & STAR1;
  assign n125 = ~STAR2 & n124;
  assign n126 = IBT1 & ~IBT2;
  assign n127 = ~IBT0 & ~CAT2;
  assign n128 = ~IBT1 & n127;
  assign n129 = IBT2 & n128;
  assign n130 = IBT0 & ~CAT3;
  assign n131 = ~IBT1 & n130;
  assign n132 = IBT2 & n131;
  assign n133 = ~IBT0 & ~CAT4;
  assign n134 = IBT1 & n133;
  assign n135 = IBT2 & n134;
  assign n136 = IBT0 & ~CAT5;
  assign n137 = IBT1 & n136;
  assign n138 = IBT2 & n137;
  assign n139 = ~IBT0 & n126;
  assign n140 = ~CAT0 & n139;
  assign n141 = IBT0 & ~CAT1;
  assign n142 = n126 & n141;
  assign n143 = ~n140 & ~n142;
  assign n144 = ~n138 & n143;
  assign n145 = ~n135 & n144;
  assign n146 = ~n132 & n145;
  assign n147 = ~n129 & n146;
  assign ORWD_F = ~WATCH | n147;
  assign n149 = n95 & ~n125;
  assign n150 = n95 & ~ORWD_F;
  assign n151 = ~n149 & ~n150;
  assign n152 = END & OWL_N;
  assign n153 = n95 & n151;
  assign END_P = n152 | n153;
  assign n155 = PY & n91;
  assign n156 = DEL1 & n90;
  assign PY_P = n155 | n156;
  assign n158 = ~BULL0 & ~BULL3;
  assign n159 = BULL4 & n158;
  assign n160 = ~BULL5 & n159;
  assign n161 = BULL6 & n160;
  assign n162 = BULL1 & n161;
  assign n163 = ~BULL2 & n162;
  assign n164 = ~CAT1 & ~n125;
  assign n165 = WATCH & n164;
  assign n166 = ~CAT0 & n165;
  assign n167 = n126 & n166;
  assign n168 = ~STAR3 & ~CAT1;
  assign n169 = WATCH & n168;
  assign n170 = ~CAT0 & n169;
  assign n171 = n126 & n170;
  assign n172 = ~n125 & ~ORWD_F;
  assign n173 = ~STAR3 & ~ORWD_F;
  assign n174 = ~n172 & ~n173;
  assign n175 = ~n171 & n174;
  assign n176 = ~n167 & n175;
  assign n177 = VERR_N & ~n176;
  assign n178 = ~n163 & n177;
  assign n179 = VERR_N & n151;
  assign n180 = ~n163 & n179;
  assign n181 = ~OWL_N & ~n95;
  assign n182 = VERR_N & ~WATCH;
  assign n183 = n151 & n182;
  assign n184 = ~n181 & ~n183;
  assign n185 = ~n180 & n184;
  assign VERR_F = n178 | ~n185;
  assign n187 = WATCH & OWL_N;
  assign n188 = ~VST0 & ~MMERR;
  assign n189 = n152 & n188;
  assign n190 = VST1 & n152;
  assign n191 = ~COMPPAR & n152;
  assign n192 = n163 & n187;
  assign n193 = ~n189 & ~n192;
  assign n194 = ~n191 & n193;
  assign n195 = ~n190 & n194;
  assign n196 = ~n87 & n195;
  assign n197 = PLUTO4 & OWL_N;
  assign n198 = ~IBT0 & IBT1;
  assign n199 = IBT2 & n198;
  assign n200 = ~n196 & n199;
  assign PLUTO4_P = n197 | n200;
  assign n202 = VSUMESR & OWL_N;
  assign VSUMESR_P = n190 | n202;
  assign n204 = ~BULL0 & n187;
  assign n205 = BULL0 & OWL_N;
  assign n206 = ~WATCH & n205;
  assign BULL0_P = n204 | n206;
  assign n208 = ~n147 & n187;
  assign n209 = FBI & ~STAR3;
  assign n210 = n125 & n209;
  assign n211 = n208 & n210;
  assign n212 = LSD & ~n125;
  assign n213 = OWL_N & n212;
  assign n214 = ~STAR3 & LSD;
  assign n215 = OWL_N & n214;
  assign n216 = ~FBI & LSD;
  assign n217 = OWL_N & n216;
  assign n218 = ~n215 & ~n217;
  assign n219 = ~n213 & n218;
  assign LSD_P = n211 | ~n219;
  assign n221 = OWL_N & ~n124;
  assign n222 = ~ORWD_N & n208;
  assign n223 = ~ORWD_N & ~ORWD_F;
  assign n224 = ~FBI & OWL_N;
  assign n225 = ~n223 & n224;
  assign n226 = n95 & n125;
  assign n227 = STAR2 & n221;
  assign n228 = STAR2 & n225;
  assign n229 = n125 & n222;
  assign n230 = ~n228 & ~n229;
  assign n231 = ~n227 & n230;
  assign STAR2_P = n226 | ~n231;
  assign n233 = IBT0 & IBT1;
  assign n234 = IBT2 & n233;
  assign n235 = ~n196 & n234;
  assign n236 = PLUTO5 & OWL_N;
  assign PLUTO5_P = n235 | n236;
  assign n238 = ~n106 & n107;
  assign n239 = ~BULL3 & OWL_N;
  assign n240 = n106 & n239;
  assign BULL3_P = n238 | n240;
  assign n242 = OWL_N & ~VACC;
  assign n243 = OVACC & n242;
  assign WATCH_P = n187 | n243;
  assign n245 = ~n95 & ~n222;
  assign n246 = ~n125 & n222;
  assign n247 = STAR2 & n246;
  assign n248 = n221 & n247;
  assign n249 = FBI & ~n125;
  assign n250 = STAR2 & n249;
  assign n251 = n221 & n250;
  assign n252 = ~n124 & ~n125;
  assign n253 = n95 & n252;
  assign n254 = n95 & n249;
  assign n255 = ~ORWD_N & ~n125;
  assign n256 = n95 & n255;
  assign n257 = ~n124 & ~n245;
  assign n258 = n208 & n257;
  assign n259 = ~ORWD_N & ~n245;
  assign n260 = n208 & n259;
  assign n261 = FBI & n208;
  assign n262 = ~n260 & ~n261;
  assign n263 = ~n258 & n262;
  assign n264 = ~n256 & n263;
  assign n265 = ~n254 & n264;
  assign n266 = ~n253 & n265;
  assign n267 = ~n251 & n266;
  assign FBI_P = n248 | ~n267;
  assign n269 = ~IBT0 & ~IBT1;
  assign n270 = IBT2 & n269;
  assign n271 = ~n196 & n270;
  assign n272 = PLUTO2 & OWL_N;
  assign PLUTO2_P = n271 | n272;
  assign n274 = MARSSR & OWL_N;
  assign MARSSR_P = n192 | n274;
  assign n276 = ~WATCH & OWL_N;
  assign n277 = ~BULL1 & OWL_N;
  assign n278 = ~BULL0 & OWL_N;
  assign n279 = ~n277 & ~n278;
  assign n280 = ~n276 & n279;
  assign n281 = BULL3 & BULL4;
  assign n282 = BULL5 & n281;
  assign n283 = ~n280 & n282;
  assign n284 = n106 & n283;
  assign n285 = BULL4 & BULL5;
  assign n286 = ~BULL6 & n285;
  assign n287 = n108 & n286;
  assign n288 = ~BULL5 & BULL6;
  assign n289 = OWL_N & n288;
  assign n290 = ~BULL4 & BULL6;
  assign n291 = OWL_N & n290;
  assign n292 = ~BULL3 & BULL6;
  assign n293 = OWL_N & n292;
  assign n294 = ~BULL2 & BULL6;
  assign n295 = OWL_N & n294;
  assign n296 = BULL6 & ~n280;
  assign n297 = ~n295 & ~n296;
  assign n298 = ~n293 & n297;
  assign n299 = ~n291 & n298;
  assign n300 = ~n289 & n299;
  assign n301 = ~n287 & n300;
  assign BULL6_P = n284 | ~n301;
  assign n303 = KBG_N & ~n176;
  assign n304 = KBG_N & n151;
  assign n305 = ~n303 & ~n304;
  assign KBG_F = n181 | ~n305;
  assign n307 = STAR0 & n225;
  assign n308 = ~STAR0 & ~n245;
  assign STAR0_P = n307 | n308;
  assign n310 = PLUTO3 & OWL_N;
  assign n311 = IBT0 & ~IBT1;
  assign n312 = IBT2 & n311;
  assign n313 = ~n196 & n312;
  assign PLUTO3_P = n310 | n313;
  assign n315 = OWL_N & RATR;
  assign n316 = ~n189 & ~n315;
  assign RATR_P = n191 | ~n316;
  assign OVACC_P = ~ICLR & VACC;
  assign n319 = BULL1 & ~n280;
  assign n320 = BULL0 & ~BULL1;
  assign n321 = n187 & n320;
  assign BULL1_P = n319 | n321;
  assign n323 = ~IBT0 & ~n196;
  assign n324 = n126 & n323;
  assign n325 = PLUTO0 & OWL_N;
  assign PLUTO0_P = n324 | n325;
  assign n327 = STAR2 & ~STAR3;
  assign n328 = ~n245 & n327;
  assign n329 = n124 & n328;
  assign n330 = ~STAR2 & OWL_N;
  assign n331 = STAR3 & n330;
  assign n332 = STAR3 & n225;
  assign n333 = STAR3 & n221;
  assign n334 = ~n332 & ~n333;
  assign n335 = ~n331 & n334;
  assign STAR3_P = n329 | ~n335;
  assign n337 = VST0 & n91;
  assign n338 = VST1 & n90;
  assign VST0_P = n337 | n338;
  assign n340 = ~ICLR & ~n163;
  assign n341 = ~END & n340;
  assign n342 = KBG_N & n341;
  assign n343 = ~WATCH & ~ICLR;
  assign n344 = ~END & n343;
  assign n345 = KBG_N & n344;
  assign OWL_F = n342 | n345;
  assign n347 = PLUTO1 & OWL_N;
  assign n348 = IBT0 & ~n196;
  assign n349 = n126 & n348;
  assign PLUTO1_P = n347 | n349;
  assign n351 = ACCRPY & OWL_N;
  assign ACCRPY_P = n153 | n351;
  assign n353 = STAR0 & ~n124;
  assign n354 = n95 & n353;
  assign n355 = ~STAR0 & STAR1;
  assign n356 = n221 & n355;
  assign n357 = STAR0 & ~STAR1;
  assign n358 = n222 & n357;
  assign n359 = STAR1 & n225;
  assign n360 = ~n358 & ~n359;
  assign n361 = ~n356 & n360;
  assign STAR1_P = n354 | ~n361;
  assign n363 = BULL1 & ~BULL2;
  assign n364 = BULL0 & n363;
  assign n365 = n187 & n364;
  assign n366 = BULL2 & ~n280;
  assign BULL2_P = n365 | n366;
  assign DEL1_P = CAPSD & ~ICLR;
  assign SDO = VST0;
endmodule


