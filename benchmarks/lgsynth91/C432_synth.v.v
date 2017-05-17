// Benchmark "C432.iscas" written by ABC on Tue May 16 16:07:45 2017

module \C432.iscas  ( 
    \37GAT(11) , \79GAT(24) , \95GAT(29) , \82GAT(25) , \86GAT(26) ,
    \34GAT(10) , \66GAT(20) , \11GAT(3) , \24GAT(7) , \99GAT(30) ,
    \112GAT(34) , \89GAT(27) , \102GAT(31) , \76GAT(23) , \8GAT(2) ,
    \108GAT(33) , \40GAT(12) , \69GAT(21) , \53GAT(16) , \43GAT(13) ,
    \17GAT(5) , \92GAT(28) , \105GAT(32) , \4GAT(1) , \21GAT(6) ,
    \115GAT(35) , \30GAT(9) , \73GAT(22) , \14GAT(4) , \47GAT(14) ,
    \63GAT(19) , \27GAT(8) , \50GAT(15) , \56GAT(17) , \60GAT(18) ,
    \1GAT(0) ,
    \431GAT(194) , \329GAT(133) , \430GAT(193) , \432GAT(195) ,
    \223GAT(84) , \421GAT(188) , \370GAT(163)   );
  input  \37GAT(11) , \79GAT(24) , \95GAT(29) , \82GAT(25) , \86GAT(26) ,
    \34GAT(10) , \66GAT(20) , \11GAT(3) , \24GAT(7) , \99GAT(30) ,
    \112GAT(34) , \89GAT(27) , \102GAT(31) , \76GAT(23) , \8GAT(2) ,
    \108GAT(33) , \40GAT(12) , \69GAT(21) , \53GAT(16) , \43GAT(13) ,
    \17GAT(5) , \92GAT(28) , \105GAT(32) , \4GAT(1) , \21GAT(6) ,
    \115GAT(35) , \30GAT(9) , \73GAT(22) , \14GAT(4) , \47GAT(14) ,
    \63GAT(19) , \27GAT(8) , \50GAT(15) , \56GAT(17) , \60GAT(18) ,
    \1GAT(0) ;
  output \431GAT(194) , \329GAT(133) , \430GAT(193) , \432GAT(195) ,
    \223GAT(84) , \421GAT(188) , \370GAT(163) ;
  wire n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
    n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
    n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
    n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
    n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
    n112, n113, n114, n115, n117, n118, n119, n120, n121, n122, n123, n124,
    n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
    n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
    n149, n150, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
    n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
    n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
    n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
    n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
    n210, n211, n212, n213, n214, n215, n217, n218, n219, n220, n221, n222,
    n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
    n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
    n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
    n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
    n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n284,
    n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
    n297, n298, n299, n300, n301, n302, n303, n304, n306, n307, n308, n309,
    n310, n311, n312, n313, n314;
  assign n44 = \4GAT(1)  & ~\1GAT(0) ;
  assign n45 = ~\11GAT(3)  & \17GAT(5) ;
  assign n46 = ~\24GAT(7)  & \30GAT(9) ;
  assign n47 = ~\37GAT(11)  & \43GAT(13) ;
  assign n48 = ~\50GAT(15)  & \56GAT(17) ;
  assign n49 = \69GAT(21)  & ~\63GAT(19) ;
  assign n50 = ~\95GAT(29)  & ~\82GAT(25) ;
  assign n51 = ~\108GAT(33)  & n50;
  assign n52 = ~n49 & n51;
  assign n53 = ~n48 & n52;
  assign n54 = ~n47 & n53;
  assign n55 = ~n46 & n54;
  assign n56 = ~n45 & n55;
  assign n57 = ~n44 & n56;
  assign n58 = ~\95GAT(29)  & \76GAT(23) ;
  assign n59 = ~\108GAT(33)  & n58;
  assign n60 = ~n49 & n59;
  assign n61 = ~n48 & n60;
  assign n62 = ~n47 & n61;
  assign n63 = ~n46 & n62;
  assign n64 = ~n45 & n63;
  assign n65 = ~n44 & n64;
  assign n66 = ~\82GAT(25)  & \89GAT(27) ;
  assign n67 = ~\108GAT(33)  & n66;
  assign n68 = ~n49 & n67;
  assign n69 = ~n48 & n68;
  assign n70 = ~n47 & n69;
  assign n71 = ~n46 & n70;
  assign n72 = ~n45 & n71;
  assign n73 = ~n44 & n72;
  assign n74 = \89GAT(27)  & \76GAT(23) ;
  assign n75 = ~\108GAT(33)  & n74;
  assign n76 = ~n49 & n75;
  assign n77 = ~n48 & n76;
  assign n78 = ~n47 & n77;
  assign n79 = ~n46 & n78;
  assign n80 = ~n45 & n79;
  assign n81 = ~n44 & n80;
  assign n82 = \102GAT(31)  & n50;
  assign n83 = ~n49 & n82;
  assign n84 = ~n48 & n83;
  assign n85 = ~n47 & n84;
  assign n86 = ~n46 & n85;
  assign n87 = ~n45 & n86;
  assign n88 = ~n44 & n87;
  assign n89 = \102GAT(31)  & n58;
  assign n90 = ~n49 & n89;
  assign n91 = ~n48 & n90;
  assign n92 = ~n47 & n91;
  assign n93 = ~n46 & n92;
  assign n94 = ~n45 & n93;
  assign n95 = ~n44 & n94;
  assign n96 = \102GAT(31)  & n66;
  assign n97 = ~n49 & n96;
  assign n98 = ~n48 & n97;
  assign n99 = ~n47 & n98;
  assign n100 = ~n46 & n99;
  assign n101 = ~n45 & n100;
  assign n102 = ~n44 & n101;
  assign n103 = \102GAT(31)  & n74;
  assign n104 = ~n49 & n103;
  assign n105 = ~n48 & n104;
  assign n106 = ~n47 & n105;
  assign n107 = ~n46 & n106;
  assign n108 = ~n45 & n107;
  assign n109 = ~n44 & n108;
  assign n110 = ~n102 & ~n109;
  assign n111 = ~n95 & n110;
  assign n112 = ~n88 & n111;
  assign n113 = ~n81 & n112;
  assign n114 = ~n73 & n113;
  assign n115 = ~n65 & n114;
  assign \223GAT(84)  = ~n57 & n115;
  assign n117 = \102GAT(31)  & \223GAT(84) ;
  assign n118 = \108GAT(33)  & ~n117;
  assign n119 = ~\112GAT(34)  & n118;
  assign n120 = \89GAT(27)  & \223GAT(84) ;
  assign n121 = \95GAT(29)  & ~n120;
  assign n122 = ~\99GAT(30)  & n121;
  assign n123 = \76GAT(23)  & \223GAT(84) ;
  assign n124 = \82GAT(25)  & ~n123;
  assign n125 = ~\86GAT(26)  & n124;
  assign n126 = ~n49 & \223GAT(84) ;
  assign n127 = \69GAT(21)  & ~\73GAT(22) ;
  assign n128 = ~n126 & n127;
  assign n129 = ~n48 & \223GAT(84) ;
  assign n130 = \56GAT(17)  & ~\60GAT(18) ;
  assign n131 = ~n129 & n130;
  assign n132 = ~n47 & \223GAT(84) ;
  assign n133 = \43GAT(13)  & ~\47GAT(14) ;
  assign n134 = ~n132 & n133;
  assign n135 = ~n46 & \223GAT(84) ;
  assign n136 = ~\34GAT(10)  & \30GAT(9) ;
  assign n137 = ~n135 & n136;
  assign n138 = ~n45 & \223GAT(84) ;
  assign n139 = \17GAT(5)  & ~\21GAT(6) ;
  assign n140 = ~n138 & n139;
  assign n141 = ~n44 & \223GAT(84) ;
  assign n142 = ~\8GAT(2)  & \4GAT(1) ;
  assign n143 = ~n141 & n142;
  assign n144 = ~n140 & ~n143;
  assign n145 = ~n137 & n144;
  assign n146 = ~n134 & n145;
  assign n147 = ~n131 & n146;
  assign n148 = ~n128 & n147;
  assign n149 = ~n125 & n148;
  assign n150 = ~n122 & n149;
  assign \329GAT(133)  = n119 | ~n150;
  assign n152 = ~n119 & \329GAT(133) ;
  assign n153 = ~\115GAT(35)  & n118;
  assign n154 = ~n152 & n153;
  assign n155 = ~n140 & \329GAT(133) ;
  assign n156 = \17GAT(5)  & ~\27GAT(8) ;
  assign n157 = ~n138 & n156;
  assign n158 = ~n155 & n157;
  assign n159 = ~n137 & \329GAT(133) ;
  assign n160 = ~\40GAT(12)  & \30GAT(9) ;
  assign n161 = ~n135 & n160;
  assign n162 = ~n159 & n161;
  assign n163 = ~n134 & \329GAT(133) ;
  assign n164 = ~\53GAT(16)  & \43GAT(13) ;
  assign n165 = ~n132 & n164;
  assign n166 = ~n163 & n165;
  assign n167 = ~n131 & \329GAT(133) ;
  assign n168 = ~\66GAT(20)  & \56GAT(17) ;
  assign n169 = ~n129 & n168;
  assign n170 = ~n167 & n169;
  assign n171 = ~n128 & \329GAT(133) ;
  assign n172 = ~\79GAT(24)  & \69GAT(21) ;
  assign n173 = ~n126 & n172;
  assign n174 = ~n171 & n173;
  assign n175 = ~n125 & \329GAT(133) ;
  assign n176 = ~\92GAT(28)  & n124;
  assign n177 = ~n175 & n176;
  assign n178 = ~n122 & \329GAT(133) ;
  assign n179 = ~\105GAT(32)  & n121;
  assign n180 = ~n178 & n179;
  assign n181 = ~n143 & \329GAT(133) ;
  assign n182 = ~n180 & n181;
  assign n183 = ~n177 & n182;
  assign n184 = ~n174 & n183;
  assign n185 = ~n170 & n184;
  assign n186 = ~n166 & n185;
  assign n187 = ~n162 & n186;
  assign n188 = ~n158 & n187;
  assign n189 = ~n154 & n188;
  assign n190 = ~n177 & ~n180;
  assign n191 = ~n174 & n190;
  assign n192 = ~n170 & n191;
  assign n193 = ~n166 & n192;
  assign n194 = ~n162 & n193;
  assign n195 = ~n158 & n194;
  assign n196 = ~n154 & n195;
  assign n197 = n141 & n196;
  assign n198 = \14GAT(4)  & ~n180;
  assign n199 = ~n177 & n198;
  assign n200 = ~n174 & n199;
  assign n201 = ~n170 & n200;
  assign n202 = ~n166 & n201;
  assign n203 = ~n162 & n202;
  assign n204 = ~n158 & n203;
  assign n205 = ~n154 & n204;
  assign n206 = ~\4GAT(1)  & ~n180;
  assign n207 = ~n177 & n206;
  assign n208 = ~n174 & n207;
  assign n209 = ~n170 & n208;
  assign n210 = ~n166 & n209;
  assign n211 = ~n162 & n210;
  assign n212 = ~n158 & n211;
  assign n213 = ~n154 & n212;
  assign n214 = ~n205 & ~n213;
  assign n215 = ~n197 & n214;
  assign \370GAT(163)  = ~n189 & n215;
  assign n217 = \92GAT(28)  & \370GAT(163) ;
  assign n218 = \86GAT(26)  & \329GAT(133) ;
  assign n219 = n124 & ~n218;
  assign n220 = ~n217 & n219;
  assign n221 = \27GAT(8)  & \370GAT(163) ;
  assign n222 = \21GAT(6)  & \329GAT(133) ;
  assign n223 = \11GAT(3)  & \223GAT(84) ;
  assign n224 = \17GAT(5)  & ~n223;
  assign n225 = ~n222 & n224;
  assign n226 = ~n221 & n225;
  assign n227 = \40GAT(12)  & \370GAT(163) ;
  assign n228 = \34GAT(10)  & \329GAT(133) ;
  assign n229 = \24GAT(7)  & \223GAT(84) ;
  assign n230 = \30GAT(9)  & ~n229;
  assign n231 = ~n228 & n230;
  assign n232 = ~n227 & n231;
  assign n233 = \53GAT(16)  & \370GAT(163) ;
  assign n234 = \47GAT(14)  & \329GAT(133) ;
  assign n235 = \37GAT(11)  & \223GAT(84) ;
  assign n236 = \43GAT(13)  & ~n235;
  assign n237 = ~n234 & n236;
  assign n238 = ~n233 & n237;
  assign n239 = \66GAT(20)  & \370GAT(163) ;
  assign n240 = \60GAT(18)  & \329GAT(133) ;
  assign n241 = \50GAT(15)  & \223GAT(84) ;
  assign n242 = \56GAT(17)  & ~n241;
  assign n243 = ~n240 & n242;
  assign n244 = ~n239 & n243;
  assign n245 = ~n238 & ~n244;
  assign n246 = ~n232 & n245;
  assign \430GAT(193)  = n226 | ~n246;
  assign n248 = \69GAT(21)  & ~\430GAT(193) ;
  assign n249 = ~\223GAT(84)  & n248;
  assign n250 = ~\329GAT(133)  & n249;
  assign n251 = ~\370GAT(163)  & n250;
  assign n252 = n127 & ~\430GAT(193) ;
  assign n253 = ~\223GAT(84)  & n252;
  assign n254 = ~\370GAT(163)  & n253;
  assign n255 = n172 & ~\430GAT(193) ;
  assign n256 = ~\223GAT(84)  & n255;
  assign n257 = ~\329GAT(133)  & n256;
  assign n258 = ~\79GAT(24)  & n127;
  assign n259 = ~\430GAT(193)  & n258;
  assign n260 = ~\223GAT(84)  & n259;
  assign n261 = n49 & ~\430GAT(193) ;
  assign n262 = ~\329GAT(133)  & n261;
  assign n263 = ~\370GAT(163)  & n262;
  assign n264 = ~\73GAT(22)  & ~\430GAT(193) ;
  assign n265 = n49 & n264;
  assign n266 = ~\370GAT(163)  & n265;
  assign n267 = ~\79GAT(24)  & ~\430GAT(193) ;
  assign n268 = n49 & n267;
  assign n269 = ~\329GAT(133)  & n268;
  assign n270 = ~\79GAT(24)  & ~\73GAT(22) ;
  assign n271 = ~\430GAT(193)  & n270;
  assign n272 = n49 & n271;
  assign n273 = ~n226 & ~n272;
  assign n274 = ~n269 & n273;
  assign n275 = ~n266 & n274;
  assign n276 = ~n263 & n275;
  assign n277 = ~n260 & n276;
  assign n278 = ~n257 & n277;
  assign n279 = ~n254 & n278;
  assign n280 = ~n251 & n279;
  assign n281 = n220 & ~\430GAT(193) ;
  assign n282 = ~n232 & n280;
  assign \431GAT(194)  = n281 | ~n282;
  assign n284 = ~\329GAT(133)  & ~\370GAT(163) ;
  assign n285 = ~n220 & n284;
  assign n286 = ~n232 & n285;
  assign n287 = n121 & n286;
  assign n288 = ~\99GAT(30)  & ~\370GAT(163) ;
  assign n289 = ~n220 & n288;
  assign n290 = ~n232 & n289;
  assign n291 = n121 & n290;
  assign n292 = ~\105GAT(32)  & ~\329GAT(133) ;
  assign n293 = ~n220 & n292;
  assign n294 = ~n232 & n293;
  assign n295 = n121 & n294;
  assign n296 = ~\99GAT(30)  & ~\105GAT(32) ;
  assign n297 = ~n220 & n296;
  assign n298 = ~n232 & n297;
  assign n299 = n121 & n298;
  assign n300 = ~n232 & n238;
  assign n301 = n280 & ~n300;
  assign n302 = ~n299 & n301;
  assign n303 = ~n295 & n302;
  assign n304 = ~n291 & n303;
  assign \432GAT(195)  = n287 | ~n304;
  assign n306 = ~\430GAT(193)  & ~\431GAT(194) ;
  assign n307 = ~\432GAT(195)  & n306;
  assign n308 = ~n118 & n307;
  assign n309 = ~\4GAT(1)  & ~n308;
  assign n310 = \14GAT(4)  & \370GAT(163) ;
  assign n311 = \8GAT(2)  & \329GAT(133) ;
  assign n312 = \1GAT(0)  & \223GAT(84) ;
  assign n313 = ~n311 & ~n312;
  assign n314 = ~n310 & n313;
  assign \421GAT(188)  = n309 | ~n314;
endmodule


