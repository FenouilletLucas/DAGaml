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
  wire n87, n88, n90, n91, n92, n93, n95, n96, n97, n98, n99, n100, n102,
    n103, n104, n105, n106, n107, n108, n109, n111, n112, n113, n114, n115,
    n116, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
    n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n141,
    n142, n143, n144, n146, n147, n149, n150, n151, n152, n153, n154, n155,
    n156, n157, n158, n159, n160, n161, n162, n164, n165, n166, n167, n168,
    n169, n170, n171, n172, n173, n174, n176, n178, n179, n180, n181, n183,
    n184, n185, n186, n187, n188, n190, n191, n192, n193, n194, n195, n196,
    n197, n198, n199, n200, n202, n203, n204, n206, n207, n208, n210, n211,
    n214, n215, n217, n219, n220, n221, n222, n223, n224, n225, n226, n228,
    n229, n230, n232, n233, n235, n236, n238, n241, n242, n243, n244, n245,
    n247, n248, n250, n251, n252, n253, n254, n255, n256, n258, n259, n260,
    n262, n263, n265, n266, n268, n270, n271, n272, n274, n275, n276;
  assign n87 = ~KBG_N & OWL_N;
  assign n88 = VLENESR & OWL_N;
  assign VLENESR_P = n87 | n88;
  assign n90 = ~FBI & ~ICLR;
  assign n91 = PY & ~ICLR;
  assign n92 = FBI & n91;
  assign n93 = VST1 & n90;
  assign VST1_P = n92 | n93;
  assign n95 = FBI & DEL1;
  assign n96 = FBI & OWL_N;
  assign n97 = OWL_N & COMPPAR;
  assign n98 = ~n95 & n97;
  assign n99 = DEL1 & ~COMPPAR;
  assign n100 = n96 & n99;
  assign COMPPAR_P = n98 | n100;
  assign n102 = BULL0 & BULL1;
  assign n103 = BULL2 & WATCH;
  assign n104 = n102 & n103;
  assign n105 = BULL3 & OWL_N;
  assign n106 = n104 & n105;
  assign n107 = ~BULL4 & n106;
  assign n108 = BULL4 & OWL_N;
  assign n109 = ~n106 & n108;
  assign BULL4_P = n107 | n109;
  assign n111 = BULL5 & OWL_N;
  assign n112 = ~n106 & n111;
  assign n113 = BULL5 & BULL4_P;
  assign n114 = ~BULL5 & ~BULL4_P;
  assign n115 = n106 & n114;
  assign n116 = ~n113 & ~n115;
  assign BULL5_P = n112 | ~n116;
  assign n118 = STAR0 & STAR1;
  assign n119 = ~STAR2 & n118;
  assign n120 = IBT1 & IBT2;
  assign n121 = ~IBT1 & IBT2;
  assign n122 = IBT1 & ~IBT2;
  assign n123 = ~IBT0 & ~CAT4;
  assign n124 = n120 & n123;
  assign n125 = IBT0 & ~CAT5;
  assign n126 = n120 & n125;
  assign n127 = ~IBT0 & ~CAT2;
  assign n128 = n121 & n127;
  assign n129 = IBT0 & ~CAT3;
  assign n130 = n121 & n129;
  assign n131 = ~IBT0 & ~CAT0;
  assign n132 = n122 & n131;
  assign n133 = IBT0 & ~CAT1;
  assign n134 = n122 & n133;
  assign n135 = ~n132 & ~n134;
  assign n136 = ~n130 & n135;
  assign n137 = ~n128 & n136;
  assign n138 = ~n126 & n137;
  assign n139 = ~n124 & n138;
  assign ORWD_F = ~WATCH | n139;
  assign n141 = n119 & ORWD_F;
  assign n142 = n96 & ~n141;
  assign n143 = END & OWL_N;
  assign n144 = n96 & ~n142;
  assign END_P = n143 | n144;
  assign n146 = PY & n90;
  assign n147 = ~ICLR & n95;
  assign PY_P = n146 | n147;
  assign n149 = ~BULL0 & ~BULL3;
  assign n150 = BULL4 & n149;
  assign n151 = ~BULL5 & n150;
  assign n152 = BULL6 & n151;
  assign n153 = BULL1 & n152;
  assign n154 = ~BULL2 & n153;
  assign n155 = WATCH & n154;
  assign n156 = STAR3 & n119;
  assign n157 = ~ORWD_F & ~n156;
  assign n158 = VERR_N & ~n142;
  assign n159 = ~n155 & n158;
  assign n160 = VERR_N & n157;
  assign n161 = ~n154 & n160;
  assign n162 = OWL_N & ~n161;
  assign VERR_F = n159 | ~n162;
  assign n164 = ~VST0 & ~MMERR;
  assign n165 = COMPPAR & ~n164;
  assign n166 = n143 & ~n165;
  assign n167 = VST1 & n143;
  assign n168 = OWL_N & n155;
  assign n169 = ~n87 & ~n168;
  assign n170 = ~n167 & n169;
  assign n171 = ~n166 & n170;
  assign n172 = ~IBT0 & ~n171;
  assign n173 = n120 & n172;
  assign n174 = PLUTO4 & OWL_N;
  assign PLUTO4_P = n173 | n174;
  assign n176 = VSUMESR & OWL_N;
  assign VSUMESR_P = n167 | n176;
  assign n178 = WATCH & OWL_N;
  assign n179 = ~BULL0 & n178;
  assign n180 = ~WATCH & OWL_N;
  assign n181 = BULL0 & n180;
  assign BULL0_P = n179 | n181;
  assign n183 = OWL_N & LSD;
  assign n184 = ~n96 & n183;
  assign n185 = n119 & n157;
  assign n186 = n96 & n185;
  assign n187 = ~n156 & n183;
  assign n188 = ~n186 & ~n187;
  assign LSD_P = n184 | ~n188;
  assign n190 = ~FBI & ORWD_F;
  assign n191 = ~FBI & ORWD_N;
  assign n192 = OWL_N & ~n191;
  assign n193 = ~n190 & n192;
  assign n194 = OWL_N & ~n193;
  assign n195 = ~STAR0 & OWL_N;
  assign n196 = ~n194 & ~n195;
  assign n197 = ~STAR1 & OWL_N;
  assign n198 = n196 & ~n197;
  assign n199 = STAR2 & ~n198;
  assign n200 = n119 & n193;
  assign STAR2_P = n199 | n200;
  assign n202 = IBT0 & ~n171;
  assign n203 = n120 & n202;
  assign n204 = PLUTO5 & OWL_N;
  assign PLUTO5_P = n203 | n204;
  assign n206 = ~n104 & n105;
  assign n207 = ~BULL3 & OWL_N;
  assign n208 = n104 & n207;
  assign BULL3_P = n206 | n208;
  assign n210 = OWL_N & ~VACC;
  assign n211 = OVACC & n210;
  assign WATCH_P = n178 | n211;
  assign FBI_P = ~n141 & n193;
  assign n214 = n121 & n172;
  assign n215 = PLUTO2 & OWL_N;
  assign PLUTO2_P = n214 | n215;
  assign n217 = MARSSR & OWL_N;
  assign MARSSR_P = n168 | n217;
  assign n219 = BULL4 & BULL5;
  assign n220 = BULL3 & n219;
  assign n221 = ~BULL6 & n106;
  assign n222 = n220 & n221;
  assign n223 = BULL6 & OWL_N;
  assign n224 = ~n220 & n223;
  assign n225 = ~n106 & n223;
  assign n226 = ~n224 & ~n225;
  assign BULL6_P = n222 | ~n226;
  assign n228 = KBG_N & n157;
  assign n229 = KBG_N & ~n142;
  assign n230 = OWL_N & ~n229;
  assign KBG_F = n228 | ~n230;
  assign n232 = STAR0 & n194;
  assign n233 = ~STAR0 & n193;
  assign STAR0_P = n232 | n233;
  assign n235 = n121 & n202;
  assign n236 = PLUTO3 & OWL_N;
  assign PLUTO3_P = n235 | n236;
  assign n238 = OWL_N & RATR;
  assign RATR_P = n166 | n238;
  assign OVACC_P = ~ICLR & VACC;
  assign n241 = OWL_N & ~n102;
  assign n242 = ~BULL0_P & ~n241;
  assign n243 = BULL1 & ~n242;
  assign n244 = BULL0 & ~BULL0_P;
  assign n245 = ~n242 & n244;
  assign BULL1_P = n243 | n245;
  assign n247 = n122 & n172;
  assign n248 = PLUTO0 & OWL_N;
  assign PLUTO0_P = n247 | n248;
  assign n250 = ~STAR3 & ~n119;
  assign n251 = n193 & n250;
  assign n252 = n198 & n251;
  assign n253 = ~STAR2 & OWL_N;
  assign n254 = STAR3 & n253;
  assign n255 = STAR3 & ~n198;
  assign n256 = ~n254 & ~n255;
  assign STAR3_P = n252 | ~n256;
  assign n258 = FBI & ~ICLR;
  assign n259 = VST1 & n258;
  assign n260 = VST0 & n90;
  assign VST0_P = n259 | n260;
  assign n262 = ~END & ~ICLR;
  assign n263 = KBG_N & n262;
  assign OWL_F = ~n155 & n263;
  assign n265 = n122 & n202;
  assign n266 = PLUTO1 & OWL_N;
  assign PLUTO1_P = n265 | n266;
  assign n268 = ACCRPY & OWL_N;
  assign ACCRPY_P = n144 | n268;
  assign n270 = STAR0 & ~STAR1;
  assign n271 = n193 & n270;
  assign n272 = STAR1 & ~n196;
  assign STAR1_P = n271 | n272;
  assign n274 = BULL2 & ~n242;
  assign n275 = OWL_N & n242;
  assign n276 = ~n104 & n275;
  assign BULL2_P = n274 | n276;
  assign DEL1_P = CAPSD & ~ICLR;
  assign SDO = VST0;
endmodule


