// Benchmark "ksa_16" written by ABC on Sat Apr 23 20:17:59 2016

module ksa_16 ( 
    a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7, a8, b8,
    a9, b9, a10, b10, a11, b11, a12, b12, a13, b13, a14, b14, a15, b15,
    s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
    s16  );
  input  a0, b0, a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7,
    a8, b8, a9, b9, a10, b10, a11, b11, a12, b12, a13, b13, a14, b14, a15,
    b15;
  output s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15,
    s16;
  wire n50, n51, n53, n54, n55, n56, n57, n59, n60, n61, n62, n63, n64, n66,
    n67, n68, n69, n70, n71, n73, n74, n75, n76, n77, n78, n80, n81, n82,
    n83, n84, n85, n86, n88, n89, n90, n91, n92, n93, n94, n96, n97, n98,
    n99, n100, n101, n102, n104, n105, n106, n107, n108, n109, n110, n112,
    n113, n114, n115, n116, n117, n118, n120, n121, n122, n123, n124, n125,
    n126, n128, n129, n130, n131, n132, n133, n134, n136, n137, n138, n139,
    n140, n141, n142, n144, n145, n146, n147, n148, n149, n150, n152, n153,
    n154, n155, n156, n157, n158, n160, n161, n162, n163, n164, n165, n166,
    n168;
  assign n50 = a0 & b0;
  assign n51 = ~a0 & ~b0;
  assign s0 = ~n50 & ~n51;
  assign n53 = a1 & b1;
  assign n54 = ~a1 & ~b1;
  assign n55 = ~n53 & ~n54;
  assign n56 = n50 & n55;
  assign n57 = ~n50 & ~n55;
  assign s1 = ~n56 & ~n57;
  assign n59 = ~n53 & ~n56;
  assign n60 = a2 & b2;
  assign n61 = ~a2 & ~b2;
  assign n62 = ~n60 & ~n61;
  assign n63 = ~n59 & n62;
  assign n64 = n59 & ~n62;
  assign s2 = ~n63 & ~n64;
  assign n66 = ~n60 & ~n63;
  assign n67 = a3 & b3;
  assign n68 = ~a3 & ~b3;
  assign n69 = ~n67 & ~n68;
  assign n70 = ~n66 & n69;
  assign n71 = n66 & ~n69;
  assign s3 = ~n70 & ~n71;
  assign n73 = ~n67 & ~n70;
  assign n74 = a4 & b4;
  assign n75 = ~a4 & ~b4;
  assign n76 = ~n74 & ~n75;
  assign n77 = n73 & n76;
  assign n78 = ~n73 & ~n76;
  assign s4 = n77 | n78;
  assign n80 = a5 & b5;
  assign n81 = ~a5 & ~b5;
  assign n82 = ~n80 & ~n81;
  assign n83 = ~n73 & ~n75;
  assign n84 = ~n74 & ~n83;
  assign n85 = ~n82 & ~n84;
  assign n86 = n82 & n84;
  assign s5 = n85 | n86;
  assign n88 = a6 & b6;
  assign n89 = ~a6 & ~b6;
  assign n90 = ~n88 & ~n89;
  assign n91 = ~n81 & ~n84;
  assign n92 = ~n80 & ~n91;
  assign n93 = ~n90 & ~n92;
  assign n94 = n90 & n92;
  assign s6 = n93 | n94;
  assign n96 = a7 & b7;
  assign n97 = ~a7 & ~b7;
  assign n98 = ~n96 & ~n97;
  assign n99 = ~n89 & ~n92;
  assign n100 = ~n88 & ~n99;
  assign n101 = ~n98 & ~n100;
  assign n102 = n98 & n100;
  assign s7 = n101 | n102;
  assign n104 = a8 & b8;
  assign n105 = ~a8 & ~b8;
  assign n106 = ~n104 & ~n105;
  assign n107 = ~n97 & ~n100;
  assign n108 = ~n96 & ~n107;
  assign n109 = ~n106 & ~n108;
  assign n110 = n106 & n108;
  assign s8 = n109 | n110;
  assign n112 = a9 & b9;
  assign n113 = ~a9 & ~b9;
  assign n114 = ~n112 & ~n113;
  assign n115 = ~n105 & ~n108;
  assign n116 = ~n104 & ~n115;
  assign n117 = ~n114 & ~n116;
  assign n118 = n114 & n116;
  assign s9 = n117 | n118;
  assign n120 = a10 & b10;
  assign n121 = ~a10 & ~b10;
  assign n122 = ~n120 & ~n121;
  assign n123 = ~n113 & ~n116;
  assign n124 = ~n112 & ~n123;
  assign n125 = ~n122 & ~n124;
  assign n126 = n122 & n124;
  assign s10 = n125 | n126;
  assign n128 = ~a11 & ~b11;
  assign n129 = a11 & b11;
  assign n130 = ~n128 & ~n129;
  assign n131 = ~n121 & ~n124;
  assign n132 = ~n120 & ~n131;
  assign n133 = ~n130 & n132;
  assign n134 = n130 & ~n132;
  assign s11 = ~n133 & ~n134;
  assign n136 = ~a12 & ~b12;
  assign n137 = a12 & b12;
  assign n138 = ~n136 & ~n137;
  assign n139 = ~n128 & ~n132;
  assign n140 = ~n129 & ~n139;
  assign n141 = ~n138 & n140;
  assign n142 = n138 & ~n140;
  assign s12 = ~n141 & ~n142;
  assign n144 = ~n136 & ~n140;
  assign n145 = ~n137 & ~n144;
  assign n146 = a13 & b13;
  assign n147 = ~a13 & ~b13;
  assign n148 = ~n146 & ~n147;
  assign n149 = n145 & ~n148;
  assign n150 = ~n145 & n148;
  assign s13 = ~n149 & ~n150;
  assign n152 = a14 & b14;
  assign n153 = ~a14 & ~b14;
  assign n154 = ~n152 & ~n153;
  assign n155 = n145 & ~n146;
  assign n156 = ~n147 & ~n155;
  assign n157 = ~n154 & ~n156;
  assign n158 = n154 & n156;
  assign s14 = ~n157 & ~n158;
  assign n160 = a15 & b15;
  assign n161 = ~a15 & ~b15;
  assign n162 = ~n160 & ~n161;
  assign n163 = ~n152 & ~n156;
  assign n164 = ~n153 & ~n163;
  assign n165 = ~n162 & ~n164;
  assign n166 = n162 & n164;
  assign s15 = ~n165 & ~n166;
  assign n168 = ~n160 & ~n164;
  assign s16 = ~n161 & ~n168;
endmodule


