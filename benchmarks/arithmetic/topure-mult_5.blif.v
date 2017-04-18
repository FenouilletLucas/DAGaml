// Benchmark "mult_5" written by ABC on Sat Apr 23 20:18:00 2016

module mult_5 ( 
    a_0, b_0, b_1, a_1, b_2, a_2, b_3, a_3, b_4, a_4,
    z_0, z_1, z_2, z_3, z_4, z_5, z_6, z_7, z_8, z_9  );
  input  a_0, b_0, b_1, a_1, b_2, a_2, b_3, a_3, b_4, a_4;
  output z_0, z_1, z_2, z_3, z_4, z_5, z_6, z_7, z_8, z_9;
  wire n22, n23, n24, n25, n27, n28, n29, n30, n31, n32, n33, n34, n35, n37,
    n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
    n52, n53, n54, n55, n56, n58, n59, n60, n61, n62, n63, n64, n65, n66,
    n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
    n81, n82, n83, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
    n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
    n108, n109, n110, n111, n112, n113, n114, n116, n117, n118, n119, n120,
    n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
    n133, n134, n135, n136, n137, n138, n139, n140, n142, n143, n144, n145,
    n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
    n158, n159, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
    n172, n173, n174;
  assign z_0 = a_0 & b_0;
  assign n22 = a_0 & b_1;
  assign n23 = b_0 & a_1;
  assign n24 = n22 & n23;
  assign n25 = ~n22 & ~n23;
  assign z_1 = ~n24 & ~n25;
  assign n27 = a_0 & b_2;
  assign n28 = b_0 & a_2;
  assign n29 = b_1 & a_1;
  assign n30 = ~z_0 & n29;
  assign n31 = n28 & ~n30;
  assign n32 = ~n28 & n30;
  assign n33 = ~n31 & ~n32;
  assign n34 = n27 & ~n33;
  assign n35 = ~n27 & n33;
  assign z_2 = ~n34 & ~n35;
  assign n37 = a_0 & b_3;
  assign n38 = a_1 & b_2;
  assign n39 = n37 & n38;
  assign n40 = ~n37 & ~n38;
  assign n41 = ~n39 & ~n40;
  assign n42 = b_1 & a_2;
  assign n43 = b_0 & a_3;
  assign n44 = n28 & n29;
  assign n45 = ~n24 & ~n44;
  assign n46 = n43 & ~n45;
  assign n47 = ~n43 & n45;
  assign n48 = ~n46 & ~n47;
  assign n49 = n42 & n48;
  assign n50 = ~n42 & ~n48;
  assign n51 = ~n49 & ~n50;
  assign n52 = n41 & n51;
  assign n53 = ~n41 & ~n51;
  assign n54 = ~n52 & ~n53;
  assign n55 = n34 & n54;
  assign n56 = ~n34 & ~n54;
  assign z_3 = ~n55 & ~n56;
  assign n58 = ~n52 & ~n55;
  assign n59 = a_0 & b_4;
  assign n60 = b_2 & a_2;
  assign n61 = a_1 & b_3;
  assign n62 = ~n27 & n61;
  assign n63 = n60 & ~n62;
  assign n64 = ~n60 & n62;
  assign n65 = ~n63 & ~n64;
  assign n66 = ~n59 & n65;
  assign n67 = n59 & ~n65;
  assign n68 = ~n66 & ~n67;
  assign n69 = b_1 & a_3;
  assign n70 = b_0 & a_4;
  assign n71 = ~n42 & ~n46;
  assign n72 = ~n47 & ~n71;
  assign n73 = n70 & n72;
  assign n74 = ~n70 & ~n72;
  assign n75 = ~n73 & ~n74;
  assign n76 = ~n69 & ~n75;
  assign n77 = n69 & n75;
  assign n78 = ~n76 & ~n77;
  assign n79 = ~n68 & ~n78;
  assign n80 = n68 & n78;
  assign n81 = ~n79 & ~n80;
  assign n82 = n58 & ~n81;
  assign n83 = ~n58 & n81;
  assign z_4 = ~n82 & ~n83;
  assign n85 = ~n66 & n78;
  assign n86 = ~n67 & ~n85;
  assign n87 = b_1 & a_4;
  assign n88 = ~n69 & ~n73;
  assign n89 = ~n74 & ~n88;
  assign n90 = n87 & n89;
  assign n91 = ~n87 & ~n89;
  assign n92 = ~n90 & ~n91;
  assign n93 = a_1 & b_4;
  assign n94 = a_2 & b_3;
  assign n95 = b_2 & a_3;
  assign n96 = n60 & n61;
  assign n97 = ~n39 & ~n96;
  assign n98 = n95 & ~n97;
  assign n99 = ~n95 & n97;
  assign n100 = ~n98 & ~n99;
  assign n101 = n94 & n100;
  assign n102 = ~n94 & ~n100;
  assign n103 = ~n101 & ~n102;
  assign n104 = n93 & n103;
  assign n105 = ~n93 & ~n103;
  assign n106 = ~n104 & ~n105;
  assign n107 = ~n92 & ~n106;
  assign n108 = n92 & n106;
  assign n109 = ~n107 & ~n108;
  assign n110 = ~n86 & n109;
  assign n111 = n86 & ~n109;
  assign n112 = ~n110 & ~n111;
  assign n113 = n83 & n112;
  assign n114 = ~n83 & ~n112;
  assign z_5 = ~n113 & ~n114;
  assign n116 = ~n110 & ~n113;
  assign n117 = ~n92 & ~n104;
  assign n118 = ~n105 & ~n117;
  assign n119 = a_2 & b_4;
  assign n120 = n90 & n119;
  assign n121 = ~n90 & ~n119;
  assign n122 = ~n120 & ~n121;
  assign n123 = b_3 & a_3;
  assign n124 = b_2 & a_4;
  assign n125 = ~n94 & ~n98;
  assign n126 = ~n99 & ~n125;
  assign n127 = n124 & n126;
  assign n128 = ~n124 & ~n126;
  assign n129 = ~n127 & ~n128;
  assign n130 = ~n123 & ~n129;
  assign n131 = n123 & n129;
  assign n132 = ~n130 & ~n131;
  assign n133 = n122 & ~n132;
  assign n134 = ~n122 & n132;
  assign n135 = ~n133 & ~n134;
  assign n136 = n118 & ~n135;
  assign n137 = ~n118 & n135;
  assign n138 = ~n136 & ~n137;
  assign n139 = ~n116 & n138;
  assign n140 = n116 & ~n138;
  assign z_6 = ~n139 & ~n140;
  assign n142 = ~n136 & ~n139;
  assign n143 = a_3 & b_4;
  assign n144 = b_3 & a_4;
  assign n145 = ~n123 & ~n127;
  assign n146 = ~n128 & ~n145;
  assign n147 = n144 & n146;
  assign n148 = ~n144 & ~n146;
  assign n149 = ~n147 & ~n148;
  assign n150 = n143 & n149;
  assign n151 = ~n143 & ~n149;
  assign n152 = ~n150 & ~n151;
  assign n153 = ~n120 & ~n132;
  assign n154 = ~n121 & ~n153;
  assign n155 = n152 & n154;
  assign n156 = ~n152 & ~n154;
  assign n157 = ~n155 & ~n156;
  assign n158 = ~n142 & n157;
  assign n159 = n142 & ~n157;
  assign z_7 = ~n158 & ~n159;
  assign n161 = ~n155 & ~n158;
  assign n162 = b_4 & n147;
  assign n163 = b_4 & a_4;
  assign n164 = ~n147 & ~n163;
  assign n165 = ~n162 & ~n164;
  assign n166 = n150 & n165;
  assign n167 = ~n150 & ~n165;
  assign n168 = ~n166 & ~n167;
  assign n169 = ~n161 & n168;
  assign n170 = n161 & ~n168;
  assign z_8 = ~n169 & ~n170;
  assign n172 = n162 & n169;
  assign n173 = ~n162 & ~n169;
  assign n174 = ~n172 & ~n173;
  assign z_9 = n166 | n174;
endmodule


