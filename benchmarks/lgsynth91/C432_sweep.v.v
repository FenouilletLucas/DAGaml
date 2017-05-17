// Benchmark "C432.iscas" written by ABC on Tue May 16 16:07:45 2017

module \C432.iscas  ( 
    \92GAT(28) , \66GAT(20) , \73GAT(22) , \69GAT(21) , \53GAT(16) ,
    \37GAT(11) , \79GAT(24) , \112GAT(34) , \34GAT(10) , \76GAT(23) ,
    \40GAT(12) , \99GAT(30) , \43GAT(13) , \11GAT(3) , \63GAT(19) ,
    \14GAT(4) , \102GAT(31) , \17GAT(5) , \60GAT(18) , \115GAT(35) ,
    \4GAT(1) , \108GAT(33) , \82GAT(25) , \1GAT(0) , \86GAT(26) ,
    \89GAT(27) , \105GAT(32) , \47GAT(14) , \95GAT(29) , \24GAT(7) ,
    \8GAT(2) , \21GAT(6) , \30GAT(9) , \27GAT(8) , \56GAT(17) ,
    \50GAT(15) ,
    \432GAT(195) , \421GAT(188) , \430GAT(193) , \370GAT(163) ,
    \431GAT(194) , \223GAT(84) , \329GAT(133)   );
  input  \92GAT(28) , \66GAT(20) , \73GAT(22) , \69GAT(21) , \53GAT(16) ,
    \37GAT(11) , \79GAT(24) , \112GAT(34) , \34GAT(10) , \76GAT(23) ,
    \40GAT(12) , \99GAT(30) , \43GAT(13) , \11GAT(3) , \63GAT(19) ,
    \14GAT(4) , \102GAT(31) , \17GAT(5) , \60GAT(18) , \115GAT(35) ,
    \4GAT(1) , \108GAT(33) , \82GAT(25) , \1GAT(0) , \86GAT(26) ,
    \89GAT(27) , \105GAT(32) , \47GAT(14) , \95GAT(29) , \24GAT(7) ,
    \8GAT(2) , \21GAT(6) , \30GAT(9) , \27GAT(8) , \56GAT(17) ,
    \50GAT(15) ;
  output \432GAT(195) , \421GAT(188) , \430GAT(193) , \370GAT(163) ,
    \431GAT(194) , \223GAT(84) , \329GAT(133) ;
  wire n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
    n58, n59, n60, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
    n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
    n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
    n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
    n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
    n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
    n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
    n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
    n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
    n174, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
    n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
    n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
    n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
    n223, n224, n225, n226, n228, n229, n230, n231, n232, n233, n234, n235,
    n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n248,
    n250, n251, n252;
  assign n44 = ~\112GAT(34)  & \108GAT(33) ;
  assign n45 = ~\102GAT(31)  & \108GAT(33) ;
  assign n46 = ~\89GAT(27)  & \95GAT(29) ;
  assign n47 = ~\76GAT(23)  & \82GAT(25) ;
  assign n48 = \69GAT(21)  & ~\63GAT(19) ;
  assign n49 = \56GAT(17)  & ~\50GAT(15) ;
  assign n50 = ~\37GAT(11)  & \43GAT(13) ;
  assign n51 = ~\24GAT(7)  & \30GAT(9) ;
  assign n52 = ~\11GAT(3)  & \17GAT(5) ;
  assign n53 = \4GAT(1)  & ~\1GAT(0) ;
  assign n54 = ~n52 & ~n53;
  assign n55 = ~n51 & n54;
  assign n56 = ~n50 & n55;
  assign n57 = ~n49 & n56;
  assign n58 = ~n48 & n57;
  assign n59 = ~n47 & n58;
  assign n60 = ~n46 & n59;
  assign \223GAT(84)  = n45 | ~n60;
  assign n62 = ~n45 & ~\223GAT(84) ;
  assign n63 = n45 & \223GAT(84) ;
  assign n64 = ~n62 & ~n63;
  assign n65 = n44 & ~n64;
  assign n66 = ~\99GAT(30)  & \95GAT(29) ;
  assign n67 = ~n46 & ~\223GAT(84) ;
  assign n68 = n46 & \223GAT(84) ;
  assign n69 = ~n67 & ~n68;
  assign n70 = n66 & ~n69;
  assign n71 = \82GAT(25)  & ~\86GAT(26) ;
  assign n72 = ~n47 & ~\223GAT(84) ;
  assign n73 = n47 & \223GAT(84) ;
  assign n74 = ~n72 & ~n73;
  assign n75 = n71 & ~n74;
  assign n76 = ~\73GAT(22)  & \69GAT(21) ;
  assign n77 = ~n48 & ~\223GAT(84) ;
  assign n78 = n48 & \223GAT(84) ;
  assign n79 = ~n77 & ~n78;
  assign n80 = n76 & ~n79;
  assign n81 = ~\60GAT(18)  & \56GAT(17) ;
  assign n82 = ~n49 & ~\223GAT(84) ;
  assign n83 = n49 & \223GAT(84) ;
  assign n84 = ~n82 & ~n83;
  assign n85 = n81 & ~n84;
  assign n86 = \43GAT(13)  & ~\47GAT(14) ;
  assign n87 = ~n50 & ~\223GAT(84) ;
  assign n88 = n50 & \223GAT(84) ;
  assign n89 = ~n87 & ~n88;
  assign n90 = n86 & ~n89;
  assign n91 = ~\34GAT(10)  & \30GAT(9) ;
  assign n92 = ~n51 & ~\223GAT(84) ;
  assign n93 = n51 & \223GAT(84) ;
  assign n94 = ~n92 & ~n93;
  assign n95 = n91 & ~n94;
  assign n96 = \17GAT(5)  & ~\21GAT(6) ;
  assign n97 = ~n52 & ~\223GAT(84) ;
  assign n98 = n52 & \223GAT(84) ;
  assign n99 = ~n97 & ~n98;
  assign n100 = n96 & ~n99;
  assign n101 = \4GAT(1)  & ~\8GAT(2) ;
  assign n102 = ~n53 & ~\223GAT(84) ;
  assign n103 = n53 & \223GAT(84) ;
  assign n104 = ~n102 & ~n103;
  assign n105 = n101 & ~n104;
  assign n106 = ~n100 & ~n105;
  assign n107 = ~n95 & n106;
  assign n108 = ~n90 & n107;
  assign n109 = ~n85 & n108;
  assign n110 = ~n80 & n109;
  assign n111 = ~n75 & n110;
  assign n112 = ~n70 & n111;
  assign \329GAT(133)  = n65 | ~n112;
  assign n114 = ~n65 & ~\329GAT(133) ;
  assign n115 = n65 & \329GAT(133) ;
  assign n116 = ~n114 & ~n115;
  assign n117 = ~\115GAT(35)  & \108GAT(33) ;
  assign n118 = ~n64 & n117;
  assign n119 = ~n116 & n118;
  assign n120 = ~n70 & ~\329GAT(133) ;
  assign n121 = n70 & \329GAT(133) ;
  assign n122 = ~n120 & ~n121;
  assign n123 = ~\105GAT(32)  & \95GAT(29) ;
  assign n124 = ~n69 & n123;
  assign n125 = ~n122 & n124;
  assign n126 = ~n75 & ~\329GAT(133) ;
  assign n127 = n75 & \329GAT(133) ;
  assign n128 = ~n126 & ~n127;
  assign n129 = ~\92GAT(28)  & \82GAT(25) ;
  assign n130 = ~n74 & n129;
  assign n131 = ~n128 & n130;
  assign n132 = ~n80 & ~\329GAT(133) ;
  assign n133 = n80 & \329GAT(133) ;
  assign n134 = ~n132 & ~n133;
  assign n135 = \69GAT(21)  & ~\79GAT(24) ;
  assign n136 = ~n79 & n135;
  assign n137 = ~n134 & n136;
  assign n138 = ~n85 & ~\329GAT(133) ;
  assign n139 = n85 & \329GAT(133) ;
  assign n140 = ~n138 & ~n139;
  assign n141 = ~\66GAT(20)  & \56GAT(17) ;
  assign n142 = ~n84 & n141;
  assign n143 = ~n140 & n142;
  assign n144 = ~n90 & ~\329GAT(133) ;
  assign n145 = n90 & \329GAT(133) ;
  assign n146 = ~n144 & ~n145;
  assign n147 = ~\53GAT(16)  & \43GAT(13) ;
  assign n148 = ~n89 & n147;
  assign n149 = ~n146 & n148;
  assign n150 = ~n95 & ~\329GAT(133) ;
  assign n151 = n95 & \329GAT(133) ;
  assign n152 = ~n150 & ~n151;
  assign n153 = ~\40GAT(12)  & \30GAT(9) ;
  assign n154 = ~n94 & n153;
  assign n155 = ~n152 & n154;
  assign n156 = ~n100 & ~\329GAT(133) ;
  assign n157 = n100 & \329GAT(133) ;
  assign n158 = ~n156 & ~n157;
  assign n159 = \17GAT(5)  & ~\27GAT(8) ;
  assign n160 = ~n99 & n159;
  assign n161 = ~n158 & n160;
  assign n162 = ~n105 & ~\329GAT(133) ;
  assign n163 = n105 & \329GAT(133) ;
  assign n164 = ~n162 & ~n163;
  assign n165 = ~\14GAT(4)  & \4GAT(1) ;
  assign n166 = ~n104 & n165;
  assign n167 = ~n164 & n166;
  assign n168 = ~n161 & ~n167;
  assign n169 = ~n155 & n168;
  assign n170 = ~n149 & n169;
  assign n171 = ~n143 & n170;
  assign n172 = ~n137 & n171;
  assign n173 = ~n131 & n172;
  assign n174 = ~n125 & n173;
  assign \370GAT(163)  = n119 | ~n174;
  assign n176 = \40GAT(12)  & \370GAT(163) ;
  assign n177 = \34GAT(10)  & \329GAT(133) ;
  assign n178 = \24GAT(7)  & \223GAT(84) ;
  assign n179 = ~n177 & ~n178;
  assign n180 = ~n176 & n179;
  assign n181 = \30GAT(9)  & n180;
  assign n182 = \53GAT(16)  & \370GAT(163) ;
  assign n183 = \47GAT(14)  & \329GAT(133) ;
  assign n184 = \37GAT(11)  & \223GAT(84) ;
  assign n185 = ~n183 & ~n184;
  assign n186 = ~n182 & n185;
  assign n187 = \43GAT(13)  & n186;
  assign n188 = \92GAT(28)  & \370GAT(163) ;
  assign n189 = \86GAT(26)  & \329GAT(133) ;
  assign n190 = \76GAT(23)  & \223GAT(84) ;
  assign n191 = ~n189 & ~n190;
  assign n192 = ~n188 & n191;
  assign n193 = \82GAT(25)  & n192;
  assign n194 = \105GAT(32)  & \370GAT(163) ;
  assign n195 = \99GAT(30)  & \329GAT(133) ;
  assign n196 = \89GAT(27)  & \223GAT(84) ;
  assign n197 = ~n195 & ~n196;
  assign n198 = ~n194 & n197;
  assign n199 = \95GAT(29)  & n198;
  assign n200 = ~n193 & n199;
  assign n201 = ~n187 & n200;
  assign n202 = ~n181 & n201;
  assign n203 = \66GAT(20)  & \370GAT(163) ;
  assign n204 = \60GAT(18)  & \329GAT(133) ;
  assign n205 = \50GAT(15)  & \223GAT(84) ;
  assign n206 = ~n204 & ~n205;
  assign n207 = ~n203 & n206;
  assign n208 = \56GAT(17)  & n207;
  assign n209 = \79GAT(24)  & \370GAT(163) ;
  assign n210 = \73GAT(22)  & \329GAT(133) ;
  assign n211 = \63GAT(19)  & \223GAT(84) ;
  assign n212 = ~n210 & ~n211;
  assign n213 = ~n209 & n212;
  assign n214 = \69GAT(21)  & n213;
  assign n215 = ~n208 & n214;
  assign n216 = ~n187 & n215;
  assign n217 = ~n181 & n216;
  assign n218 = ~n181 & n187;
  assign n219 = \27GAT(8)  & \370GAT(163) ;
  assign n220 = \21GAT(6)  & \329GAT(133) ;
  assign n221 = \11GAT(3)  & \223GAT(84) ;
  assign n222 = ~n220 & ~n221;
  assign n223 = ~n219 & n222;
  assign n224 = \17GAT(5)  & n223;
  assign n225 = ~n218 & ~n224;
  assign n226 = ~n217 & n225;
  assign \432GAT(195)  = n202 | ~n226;
  assign n228 = \115GAT(35)  & \370GAT(163) ;
  assign n229 = \112GAT(34)  & \329GAT(133) ;
  assign n230 = \102GAT(31)  & \223GAT(84) ;
  assign n231 = ~n229 & ~n230;
  assign n232 = ~n228 & n231;
  assign n233 = \108GAT(33)  & n232;
  assign n234 = ~n181 & ~n224;
  assign n235 = ~n187 & n234;
  assign n236 = ~n208 & n235;
  assign n237 = ~n214 & n236;
  assign n238 = ~n193 & n237;
  assign n239 = ~n199 & n238;
  assign n240 = ~n233 & n239;
  assign n241 = \14GAT(4)  & \370GAT(163) ;
  assign n242 = \8GAT(2)  & \329GAT(133) ;
  assign n243 = \1GAT(0)  & \223GAT(84) ;
  assign n244 = \4GAT(1)  & ~n243;
  assign n245 = ~n242 & n244;
  assign n246 = ~n241 & n245;
  assign \421GAT(188)  = ~n240 & ~n246;
  assign n248 = ~n218 & n234;
  assign \430GAT(193)  = n208 | ~n248;
  assign n250 = n193 & ~n208;
  assign n251 = ~n187 & n250;
  assign n252 = ~n217 & n234;
  assign \431GAT(194)  = n251 | ~n252;
endmodule


