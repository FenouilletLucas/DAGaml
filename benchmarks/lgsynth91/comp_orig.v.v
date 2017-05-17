// Benchmark "comp" written by ABC on Tue May 16 16:07:48 2017

module comp ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x,
    y, z, a0, b0, c0, d0, e0, f0,
    g0, h0, i0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v, w, x, y, z, a0, b0, c0, d0, e0, f0;
  output g0, h0, i0;
  wire n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
    n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
    n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
    n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
    n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
    n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
    n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
    n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
    n141, n142, n143, n144, n145, n146, n147, n148, n149, n151, n152, n153,
    n154, n155, n156, n157, n158;
  assign n36 = a & ~q;
  assign n37 = ~a & q;
  assign n38 = ~n36 & ~n37;
  assign n39 = b & ~r;
  assign n40 = ~b & r;
  assign n41 = ~n39 & ~n40;
  assign n42 = c & ~s;
  assign n43 = ~c & s;
  assign n44 = ~n42 & ~n43;
  assign n45 = d & ~t;
  assign n46 = ~d & t;
  assign n47 = ~n45 & ~n46;
  assign n48 = n44 & n47;
  assign n49 = n41 & n48;
  assign n50 = n38 & n49;
  assign n51 = n41 & n44;
  assign n52 = n38 & n51;
  assign n53 = n45 & n52;
  assign n54 = n38 & n41;
  assign n55 = n42 & n54;
  assign n56 = n38 & n39;
  assign n57 = ~n36 & ~n56;
  assign n58 = ~n55 & n57;
  assign n59 = ~n53 & n58;
  assign n60 = ~n50 & n59;
  assign n61 = ~n59 & ~n60;
  assign n62 = n59 & n60;
  assign n63 = ~n61 & ~n62;
  assign n64 = e & ~u;
  assign n65 = ~e & u;
  assign n66 = ~n64 & ~n65;
  assign n67 = f & ~v;
  assign n68 = ~f & v;
  assign n69 = ~n67 & ~n68;
  assign n70 = g & ~w;
  assign n71 = ~g & w;
  assign n72 = ~n70 & ~n71;
  assign n73 = h & ~x;
  assign n74 = ~h & x;
  assign n75 = ~n73 & ~n74;
  assign n76 = n72 & n75;
  assign n77 = n69 & n76;
  assign n78 = n66 & n77;
  assign n79 = n69 & n72;
  assign n80 = n66 & n79;
  assign n81 = n73 & n80;
  assign n82 = n66 & n69;
  assign n83 = n70 & n82;
  assign n84 = n66 & n67;
  assign n85 = ~n64 & ~n84;
  assign n86 = ~n83 & n85;
  assign n87 = ~n81 & n86;
  assign n88 = ~n78 & n87;
  assign n89 = ~n87 & ~n88;
  assign n90 = n87 & n88;
  assign n91 = ~n89 & ~n90;
  assign n92 = i & ~y;
  assign n93 = ~i & y;
  assign n94 = ~n92 & ~n93;
  assign n95 = j & ~z;
  assign n96 = ~j & z;
  assign n97 = ~n95 & ~n96;
  assign n98 = k & ~a0;
  assign n99 = ~k & a0;
  assign n100 = ~n98 & ~n99;
  assign n101 = l & ~b0;
  assign n102 = ~l & b0;
  assign n103 = ~n101 & ~n102;
  assign n104 = n100 & n103;
  assign n105 = n97 & n104;
  assign n106 = n94 & n105;
  assign n107 = n97 & n100;
  assign n108 = n94 & n107;
  assign n109 = n101 & n108;
  assign n110 = n94 & n97;
  assign n111 = n98 & n110;
  assign n112 = n94 & n95;
  assign n113 = ~n92 & ~n112;
  assign n114 = ~n111 & n113;
  assign n115 = ~n109 & n114;
  assign n116 = ~n106 & n115;
  assign n117 = ~n115 & ~n116;
  assign n118 = n115 & n116;
  assign n119 = ~n117 & ~n118;
  assign n120 = m & ~c0;
  assign n121 = ~m & c0;
  assign n122 = ~n120 & ~n121;
  assign n123 = n & ~d0;
  assign n124 = ~n & d0;
  assign n125 = ~n123 & ~n124;
  assign n126 = o & ~e0;
  assign n127 = ~o & e0;
  assign n128 = ~n126 & ~n127;
  assign n129 = p & ~f0;
  assign n130 = ~p & f0;
  assign n131 = ~n129 & ~n130;
  assign n132 = n128 & n131;
  assign n133 = n125 & n132;
  assign n134 = n122 & n133;
  assign n135 = n125 & n128;
  assign n136 = n122 & n135;
  assign n137 = n129 & n136;
  assign n138 = n122 & n125;
  assign n139 = n126 & n138;
  assign n140 = n122 & n123;
  assign n141 = ~n120 & ~n140;
  assign n142 = ~n139 & n141;
  assign n143 = ~n137 & n142;
  assign n144 = ~n134 & n143;
  assign n145 = ~n143 & ~n144;
  assign n146 = n143 & n144;
  assign n147 = ~n145 & ~n146;
  assign n148 = n119 & n147;
  assign n149 = n91 & n148;
  assign h0 = n63 & n149;
  assign n151 = n91 & n119;
  assign n152 = n63 & n151;
  assign n153 = n145 & n152;
  assign n154 = n63 & n91;
  assign n155 = n117 & n154;
  assign n156 = n63 & n89;
  assign n157 = ~n61 & ~n156;
  assign n158 = ~n155 & n157;
  assign i0 = n153 | ~n158;
  assign g0 = ~h0 & ~i0;
endmodule


