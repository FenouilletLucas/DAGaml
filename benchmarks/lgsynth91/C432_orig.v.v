// Benchmark "C432.iscas" written by ABC on Tue May 16 16:07:45 2017

module \C432.iscas  ( 
    \40GAT(12) , \43GAT(13) , \76GAT(23) , \50GAT(15) , \56GAT(17) ,
    \115GAT(35) , \47GAT(14) , \66GAT(20) , \11GAT(3) , \17GAT(5) ,
    \69GAT(21) , \53GAT(16) , \21GAT(6) , \95GAT(29) , \4GAT(1) ,
    \27GAT(8) , \63GAT(19) , \60GAT(18) , \92GAT(28) , \30GAT(9) ,
    \82GAT(25) , \86GAT(26) , \89GAT(27) , \102GAT(31) , \14GAT(4) ,
    \108GAT(33) , \73GAT(22) , \99GAT(30) , \105GAT(32) , \8GAT(2) ,
    \37GAT(11) , \34GAT(10) , \24GAT(7) , \1GAT(0) , \112GAT(34) ,
    \79GAT(24) ,
    \430GAT(193) , \329GAT(133) , \223GAT(84) , \431GAT(194) ,
    \370GAT(163) , \432GAT(195) , \421GAT(188)   );
  input  \40GAT(12) , \43GAT(13) , \76GAT(23) , \50GAT(15) , \56GAT(17) ,
    \115GAT(35) , \47GAT(14) , \66GAT(20) , \11GAT(3) , \17GAT(5) ,
    \69GAT(21) , \53GAT(16) , \21GAT(6) , \95GAT(29) , \4GAT(1) ,
    \27GAT(8) , \63GAT(19) , \60GAT(18) , \92GAT(28) , \30GAT(9) ,
    \82GAT(25) , \86GAT(26) , \89GAT(27) , \102GAT(31) , \14GAT(4) ,
    \108GAT(33) , \73GAT(22) , \99GAT(30) , \105GAT(32) , \8GAT(2) ,
    \37GAT(11) , \34GAT(10) , \24GAT(7) , \1GAT(0) , \112GAT(34) ,
    \79GAT(24) ;
  output \430GAT(193) , \329GAT(133) , \223GAT(84) , \431GAT(194) ,
    \370GAT(163) , \432GAT(195) , \421GAT(188) ;
  wire n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
    n58, n59, n60, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
    n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
    n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
    n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
    n113, n114, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
    n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
    n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
    n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
    n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
    n174, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
    n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
    n199, n200, n201, n202, n204, n205, n206, n207, n208, n209, n210, n211,
    n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n223, n224,
    n225, n226, n227, n228, n229, n230, n231, n232, n234, n235, n236, n237,
    n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
    n250, n251;
  assign n44 = ~\115GAT(35)  & \108GAT(33) ;
  assign n45 = ~\102GAT(31)  & \108GAT(33) ;
  assign n46 = \95GAT(29)  & ~\89GAT(27) ;
  assign n47 = ~\76GAT(23)  & \82GAT(25) ;
  assign n48 = \69GAT(21)  & ~\63GAT(19) ;
  assign n49 = ~\50GAT(15)  & \56GAT(17) ;
  assign n50 = \43GAT(13)  & ~\37GAT(11) ;
  assign n51 = \30GAT(9)  & ~\24GAT(7) ;
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
  assign n62 = n45 & \223GAT(84) ;
  assign n63 = ~n45 & ~\223GAT(84) ;
  assign n64 = ~n62 & ~n63;
  assign n65 = n44 & ~n64;
  assign n66 = \108GAT(33)  & ~\112GAT(34) ;
  assign n67 = ~n64 & n66;
  assign n68 = \95GAT(29)  & ~\99GAT(30) ;
  assign n69 = n46 & \223GAT(84) ;
  assign n70 = ~n46 & ~\223GAT(84) ;
  assign n71 = ~n69 & ~n70;
  assign n72 = n68 & ~n71;
  assign n73 = \82GAT(25)  & ~\86GAT(26) ;
  assign n74 = n47 & \223GAT(84) ;
  assign n75 = ~n47 & ~\223GAT(84) ;
  assign n76 = ~n74 & ~n75;
  assign n77 = n73 & ~n76;
  assign n78 = \69GAT(21)  & ~\73GAT(22) ;
  assign n79 = n48 & \223GAT(84) ;
  assign n80 = ~n48 & ~\223GAT(84) ;
  assign n81 = ~n79 & ~n80;
  assign n82 = n78 & ~n81;
  assign n83 = \56GAT(17)  & ~\60GAT(18) ;
  assign n84 = n49 & \223GAT(84) ;
  assign n85 = ~n49 & ~\223GAT(84) ;
  assign n86 = ~n84 & ~n85;
  assign n87 = n83 & ~n86;
  assign n88 = \43GAT(13)  & ~\47GAT(14) ;
  assign n89 = n50 & \223GAT(84) ;
  assign n90 = ~n50 & ~\223GAT(84) ;
  assign n91 = ~n89 & ~n90;
  assign n92 = n88 & ~n91;
  assign n93 = \30GAT(9)  & ~\34GAT(10) ;
  assign n94 = n51 & \223GAT(84) ;
  assign n95 = ~n51 & ~\223GAT(84) ;
  assign n96 = ~n94 & ~n95;
  assign n97 = n93 & ~n96;
  assign n98 = \17GAT(5)  & ~\21GAT(6) ;
  assign n99 = n52 & \223GAT(84) ;
  assign n100 = ~n52 & ~\223GAT(84) ;
  assign n101 = ~n99 & ~n100;
  assign n102 = n98 & ~n101;
  assign n103 = \4GAT(1)  & ~\8GAT(2) ;
  assign n104 = n53 & \223GAT(84) ;
  assign n105 = ~n53 & ~\223GAT(84) ;
  assign n106 = ~n104 & ~n105;
  assign n107 = n103 & ~n106;
  assign n108 = ~n102 & ~n107;
  assign n109 = ~n97 & n108;
  assign n110 = ~n92 & n109;
  assign n111 = ~n87 & n110;
  assign n112 = ~n82 & n111;
  assign n113 = ~n77 & n112;
  assign n114 = ~n72 & n113;
  assign \329GAT(133)  = n67 | ~n114;
  assign n116 = n67 & \329GAT(133) ;
  assign n117 = ~n67 & ~\329GAT(133) ;
  assign n118 = ~n116 & ~n117;
  assign n119 = n65 & ~n118;
  assign n120 = \95GAT(29)  & ~\105GAT(32) ;
  assign n121 = ~n71 & n120;
  assign n122 = n72 & \329GAT(133) ;
  assign n123 = ~n72 & ~\329GAT(133) ;
  assign n124 = ~n122 & ~n123;
  assign n125 = n121 & ~n124;
  assign n126 = ~\92GAT(28)  & \82GAT(25) ;
  assign n127 = ~n76 & n126;
  assign n128 = n77 & \329GAT(133) ;
  assign n129 = ~n77 & ~\329GAT(133) ;
  assign n130 = ~n128 & ~n129;
  assign n131 = n127 & ~n130;
  assign n132 = \69GAT(21)  & ~\79GAT(24) ;
  assign n133 = ~n81 & n132;
  assign n134 = n82 & \329GAT(133) ;
  assign n135 = ~n82 & ~\329GAT(133) ;
  assign n136 = ~n134 & ~n135;
  assign n137 = n133 & ~n136;
  assign n138 = \56GAT(17)  & ~\66GAT(20) ;
  assign n139 = ~n86 & n138;
  assign n140 = n87 & \329GAT(133) ;
  assign n141 = ~n87 & ~\329GAT(133) ;
  assign n142 = ~n140 & ~n141;
  assign n143 = n139 & ~n142;
  assign n144 = \43GAT(13)  & ~\53GAT(16) ;
  assign n145 = ~n91 & n144;
  assign n146 = n92 & \329GAT(133) ;
  assign n147 = ~n92 & ~\329GAT(133) ;
  assign n148 = ~n146 & ~n147;
  assign n149 = n145 & ~n148;
  assign n150 = ~\40GAT(12)  & \30GAT(9) ;
  assign n151 = ~n96 & n150;
  assign n152 = n97 & \329GAT(133) ;
  assign n153 = ~n97 & ~\329GAT(133) ;
  assign n154 = ~n152 & ~n153;
  assign n155 = n151 & ~n154;
  assign n156 = \17GAT(5)  & ~\27GAT(8) ;
  assign n157 = ~n101 & n156;
  assign n158 = n102 & \329GAT(133) ;
  assign n159 = ~n102 & ~\329GAT(133) ;
  assign n160 = ~n158 & ~n159;
  assign n161 = n157 & ~n160;
  assign n162 = \4GAT(1)  & ~\14GAT(4) ;
  assign n163 = ~n106 & n162;
  assign n164 = n107 & \329GAT(133) ;
  assign n165 = ~n107 & ~\329GAT(133) ;
  assign n166 = ~n164 & ~n165;
  assign n167 = n163 & ~n166;
  assign n168 = ~n161 & ~n167;
  assign n169 = ~n155 & n168;
  assign n170 = ~n149 & n169;
  assign n171 = ~n143 & n170;
  assign n172 = ~n137 & n171;
  assign n173 = ~n131 & n172;
  assign n174 = ~n125 & n173;
  assign \370GAT(163)  = n119 | ~n174;
  assign n176 = \66GAT(20)  & \370GAT(163) ;
  assign n177 = \60GAT(18)  & \329GAT(133) ;
  assign n178 = \50GAT(15)  & \223GAT(84) ;
  assign n179 = ~n177 & ~n178;
  assign n180 = ~n176 & n179;
  assign n181 = \56GAT(17)  & n180;
  assign n182 = \53GAT(16)  & \370GAT(163) ;
  assign n183 = \47GAT(14)  & \329GAT(133) ;
  assign n184 = \37GAT(11)  & \223GAT(84) ;
  assign n185 = ~n183 & ~n184;
  assign n186 = ~n182 & n185;
  assign n187 = \43GAT(13)  & n186;
  assign n188 = \40GAT(12)  & \370GAT(163) ;
  assign n189 = \34GAT(10)  & \329GAT(133) ;
  assign n190 = \24GAT(7)  & \223GAT(84) ;
  assign n191 = ~n189 & ~n190;
  assign n192 = ~n188 & n191;
  assign n193 = \30GAT(9)  & n192;
  assign n194 = n187 & ~n193;
  assign n195 = \27GAT(8)  & \370GAT(163) ;
  assign n196 = \21GAT(6)  & \329GAT(133) ;
  assign n197 = \11GAT(3)  & \223GAT(84) ;
  assign n198 = ~n196 & ~n197;
  assign n199 = ~n195 & n198;
  assign n200 = \17GAT(5)  & n199;
  assign n201 = ~n193 & ~n200;
  assign n202 = ~n194 & n201;
  assign \430GAT(193)  = n181 | ~n202;
  assign n204 = \92GAT(28)  & \370GAT(163) ;
  assign n205 = \86GAT(26)  & \329GAT(133) ;
  assign n206 = \76GAT(23)  & \223GAT(84) ;
  assign n207 = ~n205 & ~n206;
  assign n208 = ~n204 & n207;
  assign n209 = \82GAT(25)  & n208;
  assign n210 = ~n181 & ~n187;
  assign n211 = n209 & n210;
  assign n212 = \79GAT(24)  & \370GAT(163) ;
  assign n213 = \73GAT(22)  & \329GAT(133) ;
  assign n214 = \63GAT(19)  & \223GAT(84) ;
  assign n215 = ~n213 & ~n214;
  assign n216 = ~n212 & n215;
  assign n217 = \69GAT(21)  & n216;
  assign n218 = ~n187 & ~n193;
  assign n219 = n217 & n218;
  assign n220 = ~n181 & n219;
  assign n221 = n201 & ~n220;
  assign \431GAT(194)  = n211 | ~n221;
  assign n223 = \105GAT(32)  & \370GAT(163) ;
  assign n224 = \99GAT(30)  & \329GAT(133) ;
  assign n225 = \89GAT(27)  & \223GAT(84) ;
  assign n226 = ~n224 & ~n225;
  assign n227 = ~n223 & n226;
  assign n228 = \95GAT(29)  & n227;
  assign n229 = ~n209 & n218;
  assign n230 = n228 & n229;
  assign n231 = ~n194 & ~n200;
  assign n232 = ~n220 & n231;
  assign \432GAT(195)  = n230 | ~n232;
  assign n234 = \115GAT(35)  & \370GAT(163) ;
  assign n235 = \112GAT(34)  & \329GAT(133) ;
  assign n236 = \102GAT(31)  & \223GAT(84) ;
  assign n237 = ~n235 & ~n236;
  assign n238 = ~n234 & n237;
  assign n239 = \108GAT(33)  & n238;
  assign n240 = ~n187 & n201;
  assign n241 = ~n181 & n240;
  assign n242 = ~n217 & n241;
  assign n243 = ~n209 & n242;
  assign n244 = ~n228 & n243;
  assign n245 = ~n239 & n244;
  assign n246 = \14GAT(4)  & \370GAT(163) ;
  assign n247 = \8GAT(2)  & \329GAT(133) ;
  assign n248 = \1GAT(0)  & \223GAT(84) ;
  assign n249 = \4GAT(1)  & ~n248;
  assign n250 = ~n247 & n249;
  assign n251 = ~n246 & n250;
  assign \421GAT(188)  = ~n245 & ~n251;
endmodule


