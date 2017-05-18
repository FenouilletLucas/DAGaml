// Benchmark "term1" written by ABC on Tue May 16 16:07:53 2017

module term1 ( 
    g0, h0, i0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t,
    u, v, w, x, y, z, a0, c0, d0, e0, f0,
    j0, k0, l0, m0, n0, o0, p0, q0, r0, s0  );
  input  g0, h0, i0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q,
    r, s, t, u, v, w, x, y, z, a0, c0, d0, e0, f0;
  output j0, k0, l0, m0, n0, o0, p0, q0, r0, s0;
  wire n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n56, n57, n58, n59,
    n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
    n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
    n88, n89, n90, n91, n92, n93, n95, n96, n97, n98, n99, n100, n101,
    n102, n103, n104, n105, n106, n107, n108, n110, n111, n112, n113, n115,
    n116, n117, n118, n119, n120, n121, n123, n124, n125, n126, n128, n129,
    n130, n131, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
    n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
    n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
    n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
    n179, n180, n181, n183, n184, n185, n186, n187, n188, n189, n190, n191,
    n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
    n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
    n216, n217, n218, n219, n220, n221, n222, n223;
  assign n45 = c & d;
  assign n46 = ~c & ~d;
  assign n47 = ~i0 & n46;
  assign n48 = c & ~d;
  assign n49 = ~h0 & n48;
  assign n50 = ~c & d;
  assign n51 = ~h0 & n50;
  assign n52 = ~i0 & n45;
  assign n53 = ~n51 & ~n52;
  assign n54 = ~n49 & n53;
  assign k0 = n47 | ~n54;
  assign n56 = e & h;
  assign n57 = d & n56;
  assign n58 = d & ~e;
  assign n59 = ~h & n58;
  assign n60 = ~d & e;
  assign n61 = ~h & n60;
  assign n62 = ~d & ~e;
  assign n63 = h & n62;
  assign n64 = ~n61 & ~n63;
  assign n65 = ~n59 & n64;
  assign n66 = ~c & g;
  assign n67 = ~d & ~f;
  assign n68 = n65 & n67;
  assign n69 = ~n65 & ~n67;
  assign n70 = ~n57 & ~n69;
  assign n71 = ~n68 & n70;
  assign n72 = b & ~c;
  assign n73 = i & n72;
  assign n74 = ~j & n73;
  assign n75 = n65 & n74;
  assign n76 = ~n57 & n75;
  assign n77 = ~b & i;
  assign n78 = ~j & n77;
  assign n79 = ~n71 & n78;
  assign n80 = n66 & n79;
  assign n81 = n71 & n78;
  assign n82 = ~n66 & n81;
  assign n83 = b & i;
  assign n84 = ~j & n83;
  assign n85 = n45 & n84;
  assign n86 = n56 & n85;
  assign n87 = b & c;
  assign n88 = i & n87;
  assign n89 = ~j & n88;
  assign n90 = ~n65 & n89;
  assign n91 = ~n86 & ~n90;
  assign n92 = ~n82 & n91;
  assign n93 = ~n80 & n92;
  assign l0 = n76 | ~n93;
  assign n95 = ~r & ~w;
  assign n96 = ~q & ~v;
  assign n97 = ~p & ~u;
  assign n98 = ~n96 & ~n97;
  assign n99 = ~n95 & n98;
  assign n100 = ~t & ~y;
  assign n101 = x & ~n100;
  assign n102 = s & ~n100;
  assign n103 = ~n101 & ~n102;
  assign n104 = b & z;
  assign n105 = ~a0 & n104;
  assign n106 = n99 & ~n103;
  assign n107 = ~n45 & n105;
  assign n108 = ~n106 & n107;
  assign m0 = ~c0 & n108;
  assign n110 = ~c0 & ~d0;
  assign n111 = ~d0 & ~n110;
  assign n112 = n108 & n111;
  assign n113 = m0 & ~n110;
  assign n0 = n112 | n113;
  assign n115 = d0 & e0;
  assign n116 = c0 & n115;
  assign n117 = ~m0 & ~n0;
  assign n118 = ~n116 & n117;
  assign n119 = n108 & n118;
  assign n120 = e0 & ~n116;
  assign n121 = n108 & n120;
  assign o0 = n119 | n121;
  assign n123 = f0 & ~n116;
  assign n124 = n108 & n123;
  assign n125 = ~f0 & n116;
  assign n126 = n108 & n125;
  assign p0 = n124 | n126;
  assign n128 = f0 & n116;
  assign n129 = ~g0 & n128;
  assign n130 = g0 & ~n128;
  assign n131 = n108 & ~n130;
  assign q0 = n129 | ~n131;
  assign n133 = e0 & ~n110;
  assign n134 = f0 & n133;
  assign n135 = ~f0 & ~n133;
  assign n136 = ~n134 & ~n135;
  assign n137 = g0 & n136;
  assign n138 = p & q;
  assign n139 = s & t;
  assign n140 = ~n & t;
  assign n141 = ~o & s;
  assign n142 = ~n139 & ~n141;
  assign n143 = ~n140 & n142;
  assign n144 = m & n139;
  assign n145 = l & p;
  assign n146 = r & n139;
  assign n147 = ~s & ~t;
  assign n148 = r & ~n143;
  assign n149 = n138 & n148;
  assign n150 = ~r & ~n144;
  assign n151 = ~q & ~n145;
  assign n152 = ~n138 & ~n146;
  assign n153 = ~n147 & ~n152;
  assign n154 = ~n151 & n153;
  assign n155 = ~n150 & n154;
  assign n156 = ~n149 & n155;
  assign n157 = a & ~a0;
  assign n158 = k & q;
  assign n159 = n146 & n158;
  assign n160 = ~n138 & n159;
  assign n161 = n138 & ~n146;
  assign n162 = n144 & n161;
  assign n163 = ~n138 & n146;
  assign n164 = n145 & n163;
  assign n165 = ~n162 & ~n164;
  assign n166 = ~n160 & n165;
  assign n167 = ~h0 & n157;
  assign n168 = n138 & n167;
  assign n169 = n156 & n168;
  assign n170 = n137 & n169;
  assign n171 = ~n166 & n167;
  assign n172 = n137 & n171;
  assign n173 = h0 & ~p;
  assign n174 = n157 & n173;
  assign n175 = n166 & n174;
  assign n176 = h0 & n157;
  assign n177 = ~n137 & n176;
  assign n178 = ~n156 & n176;
  assign n179 = ~n177 & ~n178;
  assign n180 = ~n175 & n179;
  assign n181 = ~n172 & n180;
  assign r0 = n170 | ~n181;
  assign n183 = p & f0;
  assign n184 = g0 & n183;
  assign n185 = ~i0 & n184;
  assign n186 = n157 & n185;
  assign n187 = n133 & n186;
  assign n188 = n156 & n187;
  assign n189 = ~g0 & p;
  assign n190 = ~i0 & n189;
  assign n191 = ~n136 & n190;
  assign n192 = n157 & n191;
  assign n193 = ~n133 & n192;
  assign n194 = n156 & n193;
  assign n195 = g0 & f0;
  assign n196 = ~i0 & n195;
  assign n197 = n157 & n196;
  assign n198 = ~n166 & n197;
  assign n199 = n133 & n198;
  assign n200 = ~g0 & ~i0;
  assign n201 = ~n136 & n200;
  assign n202 = n157 & n201;
  assign n203 = ~n166 & n202;
  assign n204 = ~n133 & n203;
  assign n205 = ~g0 & i0;
  assign n206 = n157 & n205;
  assign n207 = n133 & n206;
  assign n208 = i0 & n157;
  assign n209 = n166 & n208;
  assign n210 = ~n138 & n209;
  assign n211 = g0 & ~f0;
  assign n212 = i0 & n211;
  assign n213 = n157 & n212;
  assign n214 = ~n156 & n208;
  assign n215 = i0 & n136;
  assign n216 = n157 & n215;
  assign n217 = ~n214 & ~n216;
  assign n218 = ~n213 & n217;
  assign n219 = ~n210 & n218;
  assign n220 = ~n207 & n219;
  assign n221 = ~n204 & n220;
  assign n222 = ~n199 & n221;
  assign n223 = ~n194 & n222;
  assign s0 = n188 | ~n223;
  assign j0 = ~h0;
endmodule


