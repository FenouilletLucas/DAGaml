// Benchmark "lal" written by ABC on Tue May 16 16:07:51 2017

module lal ( 
    a, b, c, d, e, f, g, h, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y,
    z, a0,
    b0, c0, d0, e0, f0, g0, h0, i0, j0, k0, l0, m0, n0, o0, p0, q0, r0, s0,
    t0  );
  input  a, b, c, d, e, f, g, h, j, k, l, m, n, o, p, q, r, s, t, u, v,
    w, x, y, z, a0;
  output b0, c0, d0, e0, f0, g0, h0, i0, j0, k0, l0, m0, n0, o0, p0, q0, r0,
    s0, t0;
  wire n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
    n61, n62, n63, n64, n65, n66, n68, n69, n70, n71, n72, n74, n75, n76,
    n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
    n91, n92, n93, n94, n95, n96, n101, n102, n104, n105, n106, n108, n109,
    n110, n111, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
    n123, n125, n126, n127, n128, n129, n130, n131, n132, n134, n135, n136,
    n137, n138, n139, n140, n141, n143, n144, n145, n146, n147, n148, n149,
    n150, n151, n153, n154, n155, n156, n157, n158, n159, n160, n161, n163,
    n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n175, n176,
    n177, n178, n179, n180, n181, n182;
  assign b0 = j & ~r;
  assign n47 = u & ~v;
  assign n48 = s & ~v;
  assign n49 = t & ~v;
  assign n50 = ~n48 & ~n49;
  assign n51 = ~n47 & n50;
  assign n52 = w & x;
  assign n53 = n51 & n52;
  assign n54 = ~f & a0;
  assign n55 = ~h & n54;
  assign n56 = ~f & z;
  assign n57 = ~h & n56;
  assign n58 = ~e & a0;
  assign n59 = ~h & n58;
  assign n60 = ~e & z;
  assign n61 = ~h & n60;
  assign n62 = ~n59 & ~n61;
  assign n63 = ~n57 & n62;
  assign n64 = ~n55 & n63;
  assign n65 = ~y & ~a0;
  assign n66 = ~n53 & n65;
  assign c0 = n64 | n66;
  assign n68 = x & z;
  assign n69 = ~z & ~a0;
  assign n70 = ~n65 & ~n69;
  assign n71 = w & n68;
  assign n72 = n51 & n71;
  assign e0 = ~n70 & ~n72;
  assign n74 = ~d & n;
  assign n75 = ~c & m;
  assign n76 = ~b & l;
  assign n77 = ~n75 & ~n76;
  assign n78 = ~n74 & n77;
  assign n79 = a & n78;
  assign n80 = ~k & n78;
  assign n81 = ~n79 & ~n80;
  assign n82 = d & ~n;
  assign n83 = c & ~m;
  assign n84 = ~n81 & ~n83;
  assign n85 = ~n82 & n84;
  assign n86 = ~a & ~b;
  assign n87 = n85 & n86;
  assign n88 = ~b & k;
  assign n89 = n85 & n88;
  assign n90 = ~a & l;
  assign n91 = n85 & n90;
  assign n92 = k & l;
  assign n93 = n85 & n92;
  assign n94 = ~n91 & ~n93;
  assign n95 = ~n89 & n94;
  assign n96 = ~n87 & n95;
  assign f0 = ~j & n96;
  assign g0 = ~j & ~o;
  assign h0 = ~j & p;
  assign i0 = ~g | j;
  assign n101 = f & ~h;
  assign n102 = e & n101;
  assign k0 = ~q & n102;
  assign n104 = e & f;
  assign n105 = ~h & ~q;
  assign n106 = ~n104 & n105;
  assign l0 = ~s & n106;
  assign n108 = s & ~t;
  assign n109 = n106 & n108;
  assign n110 = ~s & t;
  assign n111 = n106 & n110;
  assign m0 = n109 | n111;
  assign n113 = ~f & ~h;
  assign n114 = ~q & n113;
  assign n115 = ~e & ~h;
  assign n116 = ~q & n115;
  assign n117 = ~n114 & ~n116;
  assign n118 = t & u;
  assign n119 = s & n118;
  assign n120 = ~n117 & ~n119;
  assign n121 = s & t;
  assign n122 = n120 & n121;
  assign n123 = u & n120;
  assign n0 = n122 | n123;
  assign n125 = ~v & n119;
  assign n126 = ~e & ~q;
  assign n127 = ~n125 & n126;
  assign n128 = ~f & ~q;
  assign n129 = ~n125 & n128;
  assign n130 = ~n127 & ~n129;
  assign n131 = v & ~n119;
  assign n132 = ~h & ~n130;
  assign o0 = n131 | ~n132;
  assign n134 = n47 & n121;
  assign n135 = ~v & ~w;
  assign n136 = n119 & n135;
  assign n137 = n126 & ~n136;
  assign n138 = n128 & ~n136;
  assign n139 = ~n137 & ~n138;
  assign n140 = w & ~n134;
  assign n141 = ~h & ~n139;
  assign p0 = n140 | ~n141;
  assign n143 = u & n135;
  assign n144 = n121 & n143;
  assign n145 = ~w & ~x;
  assign n146 = n134 & n145;
  assign n147 = n126 & ~n146;
  assign n148 = n128 & ~n146;
  assign n149 = ~n147 & ~n148;
  assign n150 = x & ~n144;
  assign n151 = ~h & ~n149;
  assign q0 = n150 | ~n151;
  assign n153 = ~v & n145;
  assign n154 = n119 & n153;
  assign n155 = ~x & ~y;
  assign n156 = n144 & n155;
  assign n157 = n126 & ~n156;
  assign n158 = n128 & ~n156;
  assign n159 = ~n157 & ~n158;
  assign n160 = y & ~n154;
  assign n161 = ~h & ~n159;
  assign r0 = n160 | ~n161;
  assign n163 = ~w & n155;
  assign n164 = t & n47;
  assign n165 = s & n164;
  assign n166 = n163 & n165;
  assign n167 = ~y & ~z;
  assign n168 = n154 & n167;
  assign n169 = n126 & ~n168;
  assign n170 = n128 & ~n168;
  assign n171 = ~n169 & ~n170;
  assign n172 = z & ~n166;
  assign n173 = ~h & ~n171;
  assign s0 = n172 | ~n173;
  assign n175 = ~x & n167;
  assign n176 = n144 & n175;
  assign n177 = n69 & n166;
  assign n178 = n126 & ~n177;
  assign n179 = n128 & ~n177;
  assign n180 = ~n178 & ~n179;
  assign n181 = a0 & ~n176;
  assign n182 = ~h & ~n180;
  assign t0 = n181 | ~n182;
  assign j0 = ~e0;
  assign d0 = r;
endmodule


