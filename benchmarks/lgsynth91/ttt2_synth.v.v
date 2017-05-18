// Benchmark "ttt2" written by ABC on Tue May 16 16:07:53 2017

module ttt2 ( 
    a, b, c, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y,
    g0, h0, i0, j0, k0, l0, m0, z, n0, o0, p0, q0, r0, s0, t0, a0, b0, c0,
    d0, e0, f0  );
  input  a, b, c, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v,
    w, x, y;
  output g0, h0, i0, j0, k0, l0, m0, z, n0, o0, p0, q0, r0, s0, t0, a0, b0,
    c0, d0, e0, f0;
  wire n46, n47, n48, n50, n51, n52, n53, n55, n56, n57, n58, n59, n60, n62,
    n63, n64, n65, n66, n67, n69, n70, n71, n72, n73, n75, n76, n77, n78,
    n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n91, n92, n93,
    n94, n95, n96, n97, n98, n100, n101, n102, n103, n104, n105, n106,
    n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n118, n119,
    n120, n121, n122, n123, n124, n125, n126, n127, n128, n130, n131, n132,
    n133, n134, n135, n137, n138, n139, n140, n141, n142, n143, n144, n145,
    n146, n147, n148, n149, n150, n151, n152, n154, n155, n156, n157, n158,
    n159, n160, n161, n162, n164, n165, n166, n167, n168, n169, n170, n171,
    n173, n174, n175, n176, n177, n178, n179, n180, n182, n183, n184, n185,
    n187, n188, n189, n190, n192, n193, n194, n195, n196, n197, n198, n199,
    n200, n201, n202, n203, n204, n205, n207, n208, n209, n210, n211, n212,
    n213, n214, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
    n226, n227, n228, n230, n231, n232, n233, n235, n236, n237, n238, n239,
    n240, n241, n242, n243;
  assign n46 = ~l & ~m;
  assign n47 = n & n46;
  assign n48 = k & n47;
  assign f0 = ~a & ~k;
  assign n50 = l & f0;
  assign n51 = ~a & ~l;
  assign n52 = ~f0 & n51;
  assign n53 = ~n48 & n52;
  assign g0 = n50 | n53;
  assign n55 = ~a & k;
  assign n56 = l & n55;
  assign n57 = ~m & n56;
  assign n58 = m & n51;
  assign n59 = m & f0;
  assign n60 = ~n58 & ~n59;
  assign h0 = n57 | ~n60;
  assign n62 = ~a & m;
  assign n63 = ~n & n62;
  assign n64 = ~h0 & n63;
  assign n65 = n & h0;
  assign n66 = n & f0;
  assign n67 = ~n65 & ~n66;
  assign i0 = n64 | ~n67;
  assign n69 = ~x & ~n48;
  assign n70 = ~a & ~o;
  assign n71 = ~n69 & n70;
  assign n72 = ~a & o;
  assign n73 = n69 & n72;
  assign j0 = n71 | n73;
  assign n75 = ~p & ~n69;
  assign n76 = ~q & r;
  assign n77 = o & x;
  assign n78 = n76 & n77;
  assign n79 = p & n77;
  assign n80 = ~o & ~p;
  assign n81 = ~a & ~n80;
  assign n82 = ~n79 & n81;
  assign n83 = ~n78 & n82;
  assign n84 = ~n76 & n83;
  assign n85 = n75 & n84;
  assign n86 = p & n83;
  assign n87 = n69 & n86;
  assign n88 = ~o & n83;
  assign n89 = ~n87 & ~n88;
  assign k0 = n85 | ~n89;
  assign n91 = p & ~n69;
  assign n92 = ~a & ~q;
  assign n93 = ~j0 & n92;
  assign n94 = n91 & n93;
  assign n95 = ~a & q;
  assign n96 = ~n91 & n95;
  assign n97 = q & j0;
  assign n98 = ~n96 & ~n97;
  assign l0 = n94 | ~n98;
  assign n100 = q & n72;
  assign n101 = ~r & n100;
  assign n102 = n91 & n101;
  assign n103 = ~p & q;
  assign n104 = r & n103;
  assign n105 = n83 & n104;
  assign n106 = r & n83;
  assign n107 = ~n47 & n106;
  assign n108 = r & f0;
  assign n109 = ~n77 & n108;
  assign n110 = ~a & p;
  assign n111 = n76 & n110;
  assign n112 = r & n70;
  assign n113 = ~n111 & ~n112;
  assign n114 = ~n109 & n113;
  assign n115 = ~n107 & n114;
  assign n116 = ~n105 & n115;
  assign m0 = n102 | ~n116;
  assign n118 = u & v;
  assign n119 = t & ~u;
  assign n120 = ~n118 & ~n119;
  assign n121 = ~u & ~v;
  assign n122 = ~t & ~u;
  assign n123 = s & n122;
  assign n124 = e & ~w;
  assign n125 = ~n120 & n124;
  assign n126 = ~w & n121;
  assign n127 = ~w & n123;
  assign n128 = ~n126 & ~n127;
  assign z = n125 | ~n128;
  assign n130 = n75 & n76;
  assign n131 = o & n130;
  assign n132 = ~a & ~s;
  assign n133 = ~a & s;
  assign n134 = n131 & n132;
  assign n135 = ~n131 & n133;
  assign n0 = n134 | n135;
  assign n137 = s & ~v;
  assign n138 = ~t & n137;
  assign n139 = ~t & ~j0;
  assign n140 = ~n120 & n139;
  assign n141 = n130 & n140;
  assign n142 = n133 & n141;
  assign n143 = ~a & ~j0;
  assign n144 = n138 & n143;
  assign n145 = n130 & n144;
  assign n146 = ~a & t;
  assign n147 = ~n130 & n146;
  assign n148 = t & n132;
  assign n149 = t & j0;
  assign n150 = ~n148 & ~n149;
  assign n151 = ~n147 & n150;
  assign n152 = ~n145 & n151;
  assign o0 = n142 | ~n152;
  assign n154 = ~u & ~n0;
  assign n155 = ~n122 & n154;
  assign n156 = n133 & n155;
  assign n157 = ~a & ~t;
  assign n158 = ~n122 & n157;
  assign n159 = u & n132;
  assign n160 = u & n0;
  assign n161 = ~n159 & ~n160;
  assign n162 = ~n158 & n161;
  assign p0 = n156 | ~n162;
  assign n164 = t & n120;
  assign n165 = n133 & ~n0;
  assign n166 = n164 & n165;
  assign n167 = v & n132;
  assign n168 = v & p0;
  assign n169 = v & n0;
  assign n170 = ~n168 & ~n169;
  assign n171 = ~n167 & n170;
  assign q0 = n166 | ~n171;
  assign n173 = ~y & n138;
  assign n174 = ~n122 & n173;
  assign n175 = ~t & ~v;
  assign n176 = y & n175;
  assign n177 = ~n122 & n176;
  assign n178 = n132 & n177;
  assign n179 = ~a & w;
  assign n180 = ~n174 & n179;
  assign r0 = n178 | n180;
  assign n182 = ~a & b;
  assign n183 = ~x & n182;
  assign n184 = ~a & ~b;
  assign n185 = x & n184;
  assign s0 = n183 | n185;
  assign n187 = ~a & c;
  assign n188 = ~y & n187;
  assign n189 = ~a & ~c;
  assign n190 = y & n189;
  assign t0 = n188 | n190;
  assign n192 = u & n173;
  assign n193 = s & n120;
  assign n194 = ~v & ~y;
  assign n195 = ~n193 & ~n194;
  assign n196 = ~f & ~n120;
  assign n197 = ~n164 & n195;
  assign n198 = ~n121 & n197;
  assign n199 = ~n196 & n198;
  assign n200 = ~q & w;
  assign n201 = ~n192 & n200;
  assign n202 = ~q & n199;
  assign n203 = v & ~w;
  assign n204 = n199 & n203;
  assign n205 = ~n202 & ~n204;
  assign a0 = n201 | ~n205;
  assign n207 = v & ~n122;
  assign n208 = g & ~w;
  assign n209 = n207 & n208;
  assign n210 = u & ~w;
  assign n211 = ~n195 & n210;
  assign n212 = ~w & n164;
  assign n213 = ~n192 & ~n212;
  assign n214 = ~n211 & n213;
  assign b0 = n209 | ~n214;
  assign n216 = q & ~s;
  assign n217 = ~t & n216;
  assign n218 = ~v & n217;
  assign n219 = y & n218;
  assign n220 = ~n121 & ~n219;
  assign n221 = ~w & n120;
  assign n222 = n220 & n221;
  assign n223 = ~n123 & n222;
  assign n224 = h & ~w;
  assign n225 = n220 & n224;
  assign n226 = ~n123 & n225;
  assign n227 = ~n174 & ~n200;
  assign n228 = ~n226 & n227;
  assign c0 = n223 | ~n228;
  assign n230 = i & ~w;
  assign n231 = n207 & n230;
  assign n232 = ~w & ~n120;
  assign n233 = n137 & n232;
  assign d0 = n231 | n233;
  assign n235 = ~s & v;
  assign n236 = n122 & n235;
  assign n237 = ~j & n207;
  assign n238 = t & n137;
  assign n239 = ~n237 & ~n238;
  assign n240 = ~n236 & n239;
  assign n241 = n203 & n240;
  assign n242 = ~u & ~w;
  assign n243 = n240 & n242;
  assign e0 = n241 | n243;
endmodule


