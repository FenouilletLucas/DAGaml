// Benchmark "rca_32" written by ABC on Sat Apr 23 20:18:00 2016

module rca_32 ( 
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
    n112, n114, n115, n116, n117, n118, n119, n121, n122, n123, n124, n125,
    n126, n128, n129, n130, n131, n132, n133, n135, n136, n137, n138, n139,
    n140, n142, n143, n144, n145, n146, n147, n149, n150, n151, n152, n153,
    n154, n156, n157, n158, n159, n160, n161, n163, n164, n165, n166, n167,
    n168, n170, n171, n172, n173, n174, n175, n177, n178, n179, n180, n181,
    n182, n184, n185, n186, n187, n188, n189, n191, n192, n193, n194, n195,
    n196, n198, n199, n200, n201, n202, n203, n205, n206, n207, n208, n209,
    n210, n212, n213, n214, n215, n216, n217, n219, n220, n221, n222, n223,
    n224, n226, n227, n228, n229, n230, n231, n233, n234, n235, n236, n237,
    n238, n240, n241, n242, n243, n244, n245, n247, n248, n249, n250, n251,
    n252, n254, n255, n256, n257, n258, n259, n261, n262, n263, n264, n265,
    n266, n268, n269, n270, n271, n272, n273, n275, n276, n277, n278, n279,
    n280, n282, n283, n284, n285, n286, n287, n289, n290, n291, n292, n293,
    n294, n296, n297, n298, n299, n300, n301, n303, n304, n305, n306, n307,
    n308, n310, n311, n312, n313, n314, n315;
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
  assign n114 = ~n108 & ~n111;
  assign n115 = a3 & b3;
  assign n116 = ~a3 & ~b3;
  assign n117 = ~n115 & ~n116;
  assign n118 = ~n114 & n117;
  assign n119 = n114 & ~n117;
  assign s3 = ~n118 & ~n119;
  assign n121 = ~n115 & ~n118;
  assign n122 = a4 & b4;
  assign n123 = ~a4 & ~b4;
  assign n124 = ~n122 & ~n123;
  assign n125 = ~n121 & n124;
  assign n126 = n121 & ~n124;
  assign s4 = ~n125 & ~n126;
  assign n128 = ~n122 & ~n125;
  assign n129 = a5 & b5;
  assign n130 = ~a5 & ~b5;
  assign n131 = ~n129 & ~n130;
  assign n132 = ~n128 & n131;
  assign n133 = n128 & ~n131;
  assign s5 = ~n132 & ~n133;
  assign n135 = ~n129 & ~n132;
  assign n136 = a6 & b6;
  assign n137 = ~a6 & ~b6;
  assign n138 = ~n136 & ~n137;
  assign n139 = ~n135 & n138;
  assign n140 = n135 & ~n138;
  assign s6 = ~n139 & ~n140;
  assign n142 = ~n136 & ~n139;
  assign n143 = a7 & b7;
  assign n144 = ~a7 & ~b7;
  assign n145 = ~n143 & ~n144;
  assign n146 = ~n142 & n145;
  assign n147 = n142 & ~n145;
  assign s7 = ~n146 & ~n147;
  assign n149 = ~n143 & ~n146;
  assign n150 = a8 & b8;
  assign n151 = ~a8 & ~b8;
  assign n152 = ~n150 & ~n151;
  assign n153 = ~n149 & n152;
  assign n154 = n149 & ~n152;
  assign s8 = ~n153 & ~n154;
  assign n156 = ~n150 & ~n153;
  assign n157 = a9 & b9;
  assign n158 = ~a9 & ~b9;
  assign n159 = ~n157 & ~n158;
  assign n160 = ~n156 & n159;
  assign n161 = n156 & ~n159;
  assign s9 = ~n160 & ~n161;
  assign n163 = ~n157 & ~n160;
  assign n164 = a10 & b10;
  assign n165 = ~a10 & ~b10;
  assign n166 = ~n164 & ~n165;
  assign n167 = ~n163 & n166;
  assign n168 = n163 & ~n166;
  assign s10 = ~n167 & ~n168;
  assign n170 = ~n164 & ~n167;
  assign n171 = a11 & b11;
  assign n172 = ~a11 & ~b11;
  assign n173 = ~n171 & ~n172;
  assign n174 = ~n170 & n173;
  assign n175 = n170 & ~n173;
  assign s11 = ~n174 & ~n175;
  assign n177 = ~n171 & ~n174;
  assign n178 = a12 & b12;
  assign n179 = ~a12 & ~b12;
  assign n180 = ~n178 & ~n179;
  assign n181 = ~n177 & n180;
  assign n182 = n177 & ~n180;
  assign s12 = ~n181 & ~n182;
  assign n184 = ~n178 & ~n181;
  assign n185 = a13 & b13;
  assign n186 = ~a13 & ~b13;
  assign n187 = ~n185 & ~n186;
  assign n188 = ~n184 & n187;
  assign n189 = n184 & ~n187;
  assign s13 = ~n188 & ~n189;
  assign n191 = ~n185 & ~n188;
  assign n192 = a14 & b14;
  assign n193 = ~a14 & ~b14;
  assign n194 = ~n192 & ~n193;
  assign n195 = ~n191 & n194;
  assign n196 = n191 & ~n194;
  assign s14 = ~n195 & ~n196;
  assign n198 = ~n192 & ~n195;
  assign n199 = a15 & b15;
  assign n200 = ~a15 & ~b15;
  assign n201 = ~n199 & ~n200;
  assign n202 = ~n198 & n201;
  assign n203 = n198 & ~n201;
  assign s15 = ~n202 & ~n203;
  assign n205 = ~n199 & ~n202;
  assign n206 = a16 & b16;
  assign n207 = ~a16 & ~b16;
  assign n208 = ~n206 & ~n207;
  assign n209 = ~n205 & n208;
  assign n210 = n205 & ~n208;
  assign s16 = ~n209 & ~n210;
  assign n212 = ~n206 & ~n209;
  assign n213 = a17 & b17;
  assign n214 = ~a17 & ~b17;
  assign n215 = ~n213 & ~n214;
  assign n216 = ~n212 & n215;
  assign n217 = n212 & ~n215;
  assign s17 = ~n216 & ~n217;
  assign n219 = ~n213 & ~n216;
  assign n220 = a18 & b18;
  assign n221 = ~a18 & ~b18;
  assign n222 = ~n220 & ~n221;
  assign n223 = ~n219 & n222;
  assign n224 = n219 & ~n222;
  assign s18 = ~n223 & ~n224;
  assign n226 = ~n220 & ~n223;
  assign n227 = a19 & b19;
  assign n228 = ~a19 & ~b19;
  assign n229 = ~n227 & ~n228;
  assign n230 = ~n226 & n229;
  assign n231 = n226 & ~n229;
  assign s19 = ~n230 & ~n231;
  assign n233 = ~n227 & ~n230;
  assign n234 = a20 & b20;
  assign n235 = ~a20 & ~b20;
  assign n236 = ~n234 & ~n235;
  assign n237 = ~n233 & n236;
  assign n238 = n233 & ~n236;
  assign s20 = ~n237 & ~n238;
  assign n240 = ~n234 & ~n237;
  assign n241 = a21 & b21;
  assign n242 = ~a21 & ~b21;
  assign n243 = ~n241 & ~n242;
  assign n244 = ~n240 & n243;
  assign n245 = n240 & ~n243;
  assign s21 = ~n244 & ~n245;
  assign n247 = ~n241 & ~n244;
  assign n248 = a22 & b22;
  assign n249 = ~a22 & ~b22;
  assign n250 = ~n248 & ~n249;
  assign n251 = ~n247 & n250;
  assign n252 = n247 & ~n250;
  assign s22 = ~n251 & ~n252;
  assign n254 = ~n248 & ~n251;
  assign n255 = a23 & b23;
  assign n256 = ~a23 & ~b23;
  assign n257 = ~n255 & ~n256;
  assign n258 = ~n254 & n257;
  assign n259 = n254 & ~n257;
  assign s23 = ~n258 & ~n259;
  assign n261 = ~n255 & ~n258;
  assign n262 = a24 & b24;
  assign n263 = ~a24 & ~b24;
  assign n264 = ~n262 & ~n263;
  assign n265 = ~n261 & n264;
  assign n266 = n261 & ~n264;
  assign s24 = ~n265 & ~n266;
  assign n268 = ~n262 & ~n265;
  assign n269 = a25 & b25;
  assign n270 = ~a25 & ~b25;
  assign n271 = ~n269 & ~n270;
  assign n272 = ~n268 & n271;
  assign n273 = n268 & ~n271;
  assign s25 = ~n272 & ~n273;
  assign n275 = ~n269 & ~n272;
  assign n276 = a26 & b26;
  assign n277 = ~a26 & ~b26;
  assign n278 = ~n276 & ~n277;
  assign n279 = ~n275 & n278;
  assign n280 = n275 & ~n278;
  assign s26 = ~n279 & ~n280;
  assign n282 = ~n276 & ~n279;
  assign n283 = a27 & b27;
  assign n284 = ~a27 & ~b27;
  assign n285 = ~n283 & ~n284;
  assign n286 = ~n282 & n285;
  assign n287 = n282 & ~n285;
  assign s27 = ~n286 & ~n287;
  assign n289 = ~n283 & ~n286;
  assign n290 = a28 & b28;
  assign n291 = ~a28 & ~b28;
  assign n292 = ~n290 & ~n291;
  assign n293 = ~n289 & n292;
  assign n294 = n289 & ~n292;
  assign s28 = ~n293 & ~n294;
  assign n296 = ~n290 & ~n293;
  assign n297 = a29 & b29;
  assign n298 = ~a29 & ~b29;
  assign n299 = ~n297 & ~n298;
  assign n300 = ~n296 & n299;
  assign n301 = n296 & ~n299;
  assign s29 = ~n300 & ~n301;
  assign n303 = ~n297 & ~n300;
  assign n304 = a30 & b30;
  assign n305 = ~a30 & ~b30;
  assign n306 = ~n304 & ~n305;
  assign n307 = ~n303 & n306;
  assign n308 = n303 & ~n306;
  assign s30 = ~n307 & ~n308;
  assign n310 = ~n304 & ~n307;
  assign n311 = a31 & b31;
  assign n312 = ~a31 & ~b31;
  assign n313 = ~n311 & ~n312;
  assign n314 = ~n310 & n313;
  assign n315 = n310 & ~n313;
  assign s31 = ~n314 & ~n315;
  assign s32 = n311 | n314;
endmodule


