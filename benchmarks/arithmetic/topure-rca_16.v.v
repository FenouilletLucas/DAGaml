// Benchmark "rca_16" written by ABC on Sat Apr 23 20:17:58 2016

module rca_16 ( 
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
    n83, n84, n85, n87, n88, n89, n90, n91, n92, n94, n95, n96, n97, n98,
    n99, n101, n102, n103, n104, n105, n106, n108, n109, n110, n111, n112,
    n113, n115, n116, n117, n118, n119, n120, n122, n123, n124, n125, n126,
    n127, n129, n130, n131, n132, n133, n134, n136, n137, n138, n139, n140,
    n141, n143, n144, n145, n146, n147, n148, n150, n151, n152, n153, n154,
    n155;
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
  assign n77 = ~n73 & n76;
  assign n78 = n73 & ~n76;
  assign s4 = ~n77 & ~n78;
  assign n80 = ~n74 & ~n77;
  assign n81 = a5 & b5;
  assign n82 = ~a5 & ~b5;
  assign n83 = ~n81 & ~n82;
  assign n84 = ~n80 & n83;
  assign n85 = n80 & ~n83;
  assign s5 = ~n84 & ~n85;
  assign n87 = ~n81 & ~n84;
  assign n88 = a6 & b6;
  assign n89 = ~a6 & ~b6;
  assign n90 = ~n88 & ~n89;
  assign n91 = ~n87 & n90;
  assign n92 = n87 & ~n90;
  assign s6 = ~n91 & ~n92;
  assign n94 = ~n88 & ~n91;
  assign n95 = a7 & b7;
  assign n96 = ~a7 & ~b7;
  assign n97 = ~n95 & ~n96;
  assign n98 = ~n94 & n97;
  assign n99 = n94 & ~n97;
  assign s7 = ~n98 & ~n99;
  assign n101 = ~n95 & ~n98;
  assign n102 = a8 & b8;
  assign n103 = ~a8 & ~b8;
  assign n104 = ~n102 & ~n103;
  assign n105 = ~n101 & n104;
  assign n106 = n101 & ~n104;
  assign s8 = ~n105 & ~n106;
  assign n108 = ~n102 & ~n105;
  assign n109 = a9 & b9;
  assign n110 = ~a9 & ~b9;
  assign n111 = ~n109 & ~n110;
  assign n112 = ~n108 & n111;
  assign n113 = n108 & ~n111;
  assign s9 = ~n112 & ~n113;
  assign n115 = ~n109 & ~n112;
  assign n116 = a10 & b10;
  assign n117 = ~a10 & ~b10;
  assign n118 = ~n116 & ~n117;
  assign n119 = ~n115 & n118;
  assign n120 = n115 & ~n118;
  assign s10 = ~n119 & ~n120;
  assign n122 = ~n116 & ~n119;
  assign n123 = a11 & b11;
  assign n124 = ~a11 & ~b11;
  assign n125 = ~n123 & ~n124;
  assign n126 = ~n122 & n125;
  assign n127 = n122 & ~n125;
  assign s11 = ~n126 & ~n127;
  assign n129 = ~n123 & ~n126;
  assign n130 = a12 & b12;
  assign n131 = ~a12 & ~b12;
  assign n132 = ~n130 & ~n131;
  assign n133 = ~n129 & n132;
  assign n134 = n129 & ~n132;
  assign s12 = ~n133 & ~n134;
  assign n136 = ~n130 & ~n133;
  assign n137 = a13 & b13;
  assign n138 = ~a13 & ~b13;
  assign n139 = ~n137 & ~n138;
  assign n140 = ~n136 & n139;
  assign n141 = n136 & ~n139;
  assign s13 = ~n140 & ~n141;
  assign n143 = ~n137 & ~n140;
  assign n144 = a14 & b14;
  assign n145 = ~a14 & ~b14;
  assign n146 = ~n144 & ~n145;
  assign n147 = ~n143 & n146;
  assign n148 = n143 & ~n146;
  assign s14 = ~n147 & ~n148;
  assign n150 = ~n144 & ~n147;
  assign n151 = a15 & b15;
  assign n152 = ~a15 & ~b15;
  assign n153 = ~n151 & ~n152;
  assign n154 = ~n150 & n153;
  assign n155 = n150 & ~n153;
  assign s15 = ~n154 & ~n155;
  assign s16 = n151 | n154;
endmodule


