// Benchmark "sct" written by ABC on Tue May 16 16:07:52 2017

module sct ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s,
    t, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s;
  output t, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0;
  wire n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n47, n48, n49, n50,
    n51, n53, n54, n55, n56, n57, n58, n59, n60, n62, n63, n64, n65, n66,
    n67, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
    n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n95, n96,
    n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
    n109, n110, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
    n122, n123, n124, n126, n127, n128, n129, n130, n131, n132, n133, n134,
    n135, n136, n137, n138, n139, n141, n142, n143, n144, n145, n146, n147,
    n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n160,
    n161, n162, n163, n164, n165, n166, n167, n168, n170, n171, n172;
  assign n35 = ~c & ~o;
  assign n36 = ~b & ~o;
  assign n37 = b & ~c;
  assign n38 = ~n36 & ~n37;
  assign t = n35 | ~n38;
  assign n40 = ~f & ~p;
  assign n41 = s & n40;
  assign n42 = e & ~p;
  assign n43 = s & n42;
  assign n44 = e & f;
  assign n45 = ~n43 & ~n44;
  assign u = ~n41 & n45;
  assign n47 = ~d & ~g;
  assign n48 = c & n47;
  assign n49 = e & n48;
  assign n50 = ~g & ~q;
  assign n51 = e & n50;
  assign v = n49 | n51;
  assign n53 = d & q;
  assign n54 = ~c & q;
  assign n55 = g & h;
  assign n56 = e & ~n55;
  assign n57 = ~n54 & n56;
  assign n58 = ~n53 & n57;
  assign n59 = g & n58;
  assign n60 = h & n58;
  assign w = n59 | n60;
  assign n62 = i & n55;
  assign n63 = e & ~n54;
  assign n64 = ~n53 & n63;
  assign n65 = ~n62 & n64;
  assign n66 = n55 & n65;
  assign n67 = i & n65;
  assign x = n66 | n67;
  assign n69 = h & i;
  assign n70 = g & n69;
  assign n71 = c & ~d;
  assign n72 = e & n71;
  assign n73 = j & n72;
  assign n74 = ~d & ~i;
  assign n75 = c & n74;
  assign n76 = e & n75;
  assign n77 = ~d & ~h;
  assign n78 = c & n77;
  assign n79 = e & n78;
  assign n80 = e & ~q;
  assign n81 = j & n80;
  assign n82 = ~i & ~q;
  assign n83 = e & n82;
  assign n84 = ~h & ~q;
  assign n85 = e & n84;
  assign n86 = ~n51 & ~n85;
  assign n87 = ~n83 & n86;
  assign n88 = ~n81 & n87;
  assign n89 = ~n49 & n88;
  assign n90 = ~n79 & n89;
  assign n91 = ~n76 & n90;
  assign n92 = ~n73 & n91;
  assign n93 = j & ~n70;
  assign y = n92 | n93;
  assign n95 = i & ~j;
  assign n96 = h & n95;
  assign n97 = g & n96;
  assign n98 = ~j & ~k;
  assign n99 = ~d & ~n98;
  assign n100 = ~q & ~n98;
  assign n101 = ~n82 & ~n84;
  assign n102 = ~n50 & n101;
  assign n103 = ~n100 & n102;
  assign n104 = ~n74 & n103;
  assign n105 = ~n77 & n104;
  assign n106 = ~n47 & n105;
  assign n107 = ~n99 & n106;
  assign n108 = k & ~n97;
  assign n109 = e & ~n107;
  assign n110 = ~n108 & n109;
  assign z = n54 | ~n110;
  assign n112 = n70 & n98;
  assign n113 = ~k & ~l;
  assign n114 = ~j & n113;
  assign n115 = ~d & ~n114;
  assign n116 = ~q & ~n114;
  assign n117 = n102 & ~n116;
  assign n118 = ~n74 & n117;
  assign n119 = ~n77 & n118;
  assign n120 = ~n47 & n119;
  assign n121 = ~n115 & n120;
  assign n122 = l & ~n112;
  assign n123 = e & ~n121;
  assign n124 = ~n122 & n123;
  assign a0 = n54 | ~n124;
  assign n126 = n70 & n114;
  assign n127 = ~l & ~m;
  assign n128 = ~k & n127;
  assign n129 = ~j & n128;
  assign n130 = ~d & ~n129;
  assign n131 = ~q & ~n129;
  assign n132 = n102 & ~n131;
  assign n133 = ~n74 & n132;
  assign n134 = ~n77 & n133;
  assign n135 = ~n47 & n134;
  assign n136 = ~n130 & n135;
  assign n137 = m & ~n126;
  assign n138 = e & ~n136;
  assign n139 = ~n137 & n138;
  assign b0 = n54 | ~n139;
  assign n141 = n70 & n129;
  assign n142 = ~m & ~n;
  assign n143 = ~l & n142;
  assign n144 = ~k & n143;
  assign n145 = ~d & ~n144;
  assign n146 = ~d & ~n95;
  assign n147 = ~q & ~n144;
  assign n148 = ~q & ~n95;
  assign n149 = ~n50 & ~n84;
  assign n150 = ~n148 & n149;
  assign n151 = ~n147 & n150;
  assign n152 = ~n77 & n151;
  assign n153 = ~n47 & n152;
  assign n154 = ~n146 & n153;
  assign n155 = ~n145 & n154;
  assign n156 = n & ~n141;
  assign n157 = e & ~n155;
  assign n158 = ~n156 & n157;
  assign c0 = n54 | ~n158;
  assign n160 = q & ~n71;
  assign n161 = ~a & ~n144;
  assign n162 = ~n160 & ~n161;
  assign n163 = e & o;
  assign n164 = q & n163;
  assign n165 = ~n71 & n164;
  assign n166 = e & g;
  assign n167 = n96 & n166;
  assign n168 = n162 & n167;
  assign d0 = n165 | n168;
  assign n170 = ~c & e;
  assign n171 = q & n170;
  assign n172 = d & e;
  assign f0 = n171 | n172;
  assign h0 = e & r;
  assign e0 = c;
  assign g0 = e;
endmodule


