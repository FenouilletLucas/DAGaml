// Benchmark "count" written by ABC on Tue May 16 16:07:48 2017

module count ( 
    g0, h0, i0, j0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r,
    s, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0,
    k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0  );
  input  g0, h0, i0, j0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
    q, r, s, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0;
  output k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0;
  wire n52, n53, n54, n55, n56, n57, n58, n60, n61, n62, n63, n64, n65, n66,
    n68, n69, n70, n71, n72, n73, n74, n76, n77, n78, n79, n80, n81, n82,
    n84, n85, n86, n87, n88, n89, n90, n92, n93, n94, n95, n96, n97, n98,
    n100, n101, n102, n103, n104, n105, n106, n108, n109, n110, n111, n112,
    n113, n114, n116, n117, n118, n119, n120, n121, n122, n124, n125, n126,
    n127, n128, n129, n130, n132, n133, n134, n135, n136, n137, n138, n140,
    n141, n142, n143, n144, n145, n146, n148, n149, n150, n151, n152, n153,
    n154, n156, n157, n158, n159, n160, n161, n162, n164, n165, n166, n167,
    n168, n169, n170, n172, n173, n174, n175, n176, n177, n178;
  assign n52 = ~r & ~u;
  assign n53 = q & r;
  assign n54 = u & n53;
  assign n55 = q & n52;
  assign n56 = ~p & ~q;
  assign n57 = ~s & ~n56;
  assign n58 = ~n55 & n57;
  assign k0 = n54 | ~n58;
  assign n60 = ~v & n52;
  assign n61 = q & v;
  assign n62 = ~n52 & n61;
  assign n63 = q & n60;
  assign n64 = ~o & ~q;
  assign n65 = ~s & ~n64;
  assign n66 = ~n63 & n65;
  assign l0 = n62 | ~n66;
  assign n68 = ~w & n60;
  assign n69 = q & w;
  assign n70 = ~n60 & n69;
  assign n71 = q & n68;
  assign n72 = ~n & ~q;
  assign n73 = ~s & ~n72;
  assign n74 = ~n71 & n73;
  assign m0 = n70 | ~n74;
  assign n76 = ~x & n68;
  assign n77 = q & x;
  assign n78 = ~n68 & n77;
  assign n79 = q & n76;
  assign n80 = ~m & ~q;
  assign n81 = ~s & ~n80;
  assign n82 = ~n79 & n81;
  assign n0 = n78 | ~n82;
  assign n84 = ~y & n76;
  assign n85 = q & y;
  assign n86 = ~n76 & n85;
  assign n87 = q & n84;
  assign n88 = ~l & ~q;
  assign n89 = ~s & ~n88;
  assign n90 = ~n87 & n89;
  assign o0 = n86 | ~n90;
  assign n92 = ~z & n84;
  assign n93 = q & z;
  assign n94 = ~n84 & n93;
  assign n95 = q & n92;
  assign n96 = ~k & ~q;
  assign n97 = ~s & ~n96;
  assign n98 = ~n95 & n97;
  assign p0 = n94 | ~n98;
  assign n100 = ~a0 & n92;
  assign n101 = q & a0;
  assign n102 = ~n92 & n101;
  assign n103 = q & n100;
  assign n104 = ~j & ~q;
  assign n105 = ~s & ~n104;
  assign n106 = ~n103 & n105;
  assign q0 = n102 | ~n106;
  assign n108 = ~b0 & n100;
  assign n109 = q & b0;
  assign n110 = ~n100 & n109;
  assign n111 = q & n108;
  assign n112 = ~i & ~q;
  assign n113 = ~s & ~n112;
  assign n114 = ~n111 & n113;
  assign r0 = n110 | ~n114;
  assign n116 = ~c0 & n108;
  assign n117 = q & c0;
  assign n118 = ~n108 & n117;
  assign n119 = q & n116;
  assign n120 = ~h & ~q;
  assign n121 = ~s & ~n120;
  assign n122 = ~n119 & n121;
  assign s0 = n118 | ~n122;
  assign n124 = ~d0 & n116;
  assign n125 = q & d0;
  assign n126 = ~n116 & n125;
  assign n127 = q & n124;
  assign n128 = ~g & ~q;
  assign n129 = ~s & ~n128;
  assign n130 = ~n127 & n129;
  assign t0 = n126 | ~n130;
  assign n132 = ~e0 & n124;
  assign n133 = q & e0;
  assign n134 = ~n124 & n133;
  assign n135 = q & n132;
  assign n136 = ~f & ~q;
  assign n137 = ~s & ~n136;
  assign n138 = ~n135 & n137;
  assign u0 = n134 | ~n138;
  assign n140 = ~f0 & n132;
  assign n141 = q & f0;
  assign n142 = ~n132 & n141;
  assign n143 = q & n140;
  assign n144 = ~e & ~q;
  assign n145 = ~s & ~n144;
  assign n146 = ~n143 & n145;
  assign v0 = n142 | ~n146;
  assign n148 = ~g0 & n140;
  assign n149 = g0 & q;
  assign n150 = ~n140 & n149;
  assign n151 = q & n148;
  assign n152 = ~d & ~q;
  assign n153 = ~s & ~n152;
  assign n154 = ~n151 & n153;
  assign w0 = n150 | ~n154;
  assign n156 = ~h0 & n148;
  assign n157 = h0 & q;
  assign n158 = ~n148 & n157;
  assign n159 = q & n156;
  assign n160 = ~c & ~q;
  assign n161 = ~s & ~n160;
  assign n162 = ~n159 & n161;
  assign x0 = n158 | ~n162;
  assign n164 = ~i0 & n156;
  assign n165 = i0 & q;
  assign n166 = ~n156 & n165;
  assign n167 = q & n164;
  assign n168 = ~b & ~q;
  assign n169 = ~s & ~n168;
  assign n170 = ~n167 & n169;
  assign y0 = n166 | ~n170;
  assign n172 = ~j0 & q;
  assign n173 = n164 & n172;
  assign n174 = j0 & q;
  assign n175 = ~n164 & n174;
  assign n176 = ~a & ~q;
  assign n177 = ~s & ~n176;
  assign n178 = ~n175 & n177;
  assign z0 = n173 | ~n178;
endmodule


