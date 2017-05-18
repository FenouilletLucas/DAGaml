// Benchmark "frg1" written by ABC on Tue May 16 16:07:49 2017

module frg1 ( 
    a, b, c, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y,
    z, a0, b0, c0,
    d0, e0, f0  );
  input  a, b, c, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v,
    w, x, y, z, a0, b0, c0;
  output d0, e0, f0;
  wire n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
    n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
    n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
    n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
    n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
    n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
    n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
    n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
    n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
    n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
    n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
    n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
    n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
    n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n210,
    n211, n212, n213, n215, n216;
  assign n32 = ~s & ~t;
  assign n33 = ~x & ~z;
  assign n34 = m & ~n33;
  assign n35 = ~a & ~e;
  assign n36 = ~c & ~n35;
  assign n37 = ~w & ~y;
  assign n38 = ~n34 & n37;
  assign n39 = m & ~n38;
  assign n40 = ~u & ~v;
  assign n41 = n32 & n40;
  assign n42 = k & ~n41;
  assign n43 = ~j & n36;
  assign n44 = ~o & ~w;
  assign n45 = ~x & n44;
  assign n46 = ~h & ~x;
  assign n47 = ~m & ~o;
  assign n48 = ~h & ~m;
  assign n49 = ~n47 & ~n48;
  assign n50 = ~n46 & n49;
  assign n51 = ~n45 & n50;
  assign n52 = ~i & n36;
  assign n53 = ~w & n36;
  assign n54 = ~n43 & ~n53;
  assign n55 = ~o & ~y;
  assign n56 = ~n54 & n55;
  assign n57 = n36 & n47;
  assign n58 = ~y & n43;
  assign n59 = ~m & n43;
  assign n60 = ~n58 & ~n59;
  assign n61 = ~n57 & n60;
  assign n62 = ~n56 & n61;
  assign n63 = ~z & n36;
  assign n64 = ~n52 & ~n63;
  assign n65 = ~h & ~p;
  assign n66 = ~r & n65;
  assign n67 = ~v & n66;
  assign n68 = n36 & n67;
  assign n69 = ~n34 & n68;
  assign n70 = n32 & n69;
  assign n71 = ~o & ~p;
  assign n72 = ~q & n71;
  assign n73 = ~r & n72;
  assign n74 = n36 & n73;
  assign n75 = ~n42 & n74;
  assign n76 = ~n39 & n75;
  assign n77 = ~q & ~r;
  assign n78 = ~u & n77;
  assign n79 = ~v & n78;
  assign n80 = ~y & n79;
  assign n81 = ~z & n80;
  assign n82 = n43 & n81;
  assign n83 = ~h & ~k;
  assign n84 = ~p & n83;
  assign n85 = ~r & n84;
  assign n86 = n36 & n85;
  assign n87 = ~n34 & n86;
  assign n88 = ~k & ~q;
  assign n89 = ~r & n88;
  assign n90 = ~y & n89;
  assign n91 = ~z & n90;
  assign n92 = n43 & n91;
  assign n93 = ~m & ~q;
  assign n94 = ~r & n93;
  assign n95 = ~u & n94;
  assign n96 = ~v & n95;
  assign n97 = n43 & n96;
  assign n98 = ~h & ~l;
  assign n99 = ~v & n98;
  assign n100 = n36 & n99;
  assign n101 = n32 & n100;
  assign n102 = ~h & ~r;
  assign n103 = ~v & n102;
  assign n104 = ~z & n103;
  assign n105 = n43 & n104;
  assign n106 = ~r & n83;
  assign n107 = ~z & n106;
  assign n108 = n43 & n107;
  assign n109 = ~r & n48;
  assign n110 = ~v & n109;
  assign n111 = n43 & n110;
  assign n112 = ~k & ~m;
  assign n113 = ~q & n112;
  assign n114 = ~r & n113;
  assign n115 = n43 & n114;
  assign n116 = ~m & n83;
  assign n117 = ~r & n116;
  assign n118 = n43 & n117;
  assign n119 = ~p & n52;
  assign n120 = ~n51 & n119;
  assign n121 = n32 & n120;
  assign n122 = ~g & ~q;
  assign n123 = ~u & n122;
  assign n124 = ~n62 & n123;
  assign n125 = ~g & ~k;
  assign n126 = ~q & n125;
  assign n127 = ~n62 & n126;
  assign n128 = ~k & ~p;
  assign n129 = n52 & n128;
  assign n130 = ~n51 & n129;
  assign n131 = ~h & ~n;
  assign n132 = ~x & n131;
  assign n133 = ~n64 & n132;
  assign n134 = ~g & ~n;
  assign n135 = ~y & n134;
  assign n136 = ~n54 & n135;
  assign n137 = ~n & ~w;
  assign n138 = ~x & n137;
  assign n139 = n52 & n138;
  assign n140 = ~g & ~o;
  assign n141 = ~w & n140;
  assign n142 = n52 & n141;
  assign n143 = ~w & n134;
  assign n144 = n52 & n143;
  assign n145 = ~g & ~m;
  assign n146 = ~o & n145;
  assign n147 = n52 & n146;
  assign n148 = ~n & ~y;
  assign n149 = ~z & n148;
  assign n150 = n43 & n149;
  assign n151 = ~z & n131;
  assign n152 = n43 & n151;
  assign n153 = ~l & ~u;
  assign n154 = ~v & n153;
  assign n155 = n43 & n154;
  assign n156 = n43 & n99;
  assign n157 = ~g & ~l;
  assign n158 = ~u & n157;
  assign n159 = n36 & n158;
  assign n160 = ~l & n52;
  assign n161 = n32 & n160;
  assign n162 = n52 & n157;
  assign n163 = ~n & n36;
  assign n164 = ~n39 & n163;
  assign n165 = ~l & n36;
  assign n166 = ~n42 & n165;
  assign n167 = ~l & ~n;
  assign n168 = n36 & n167;
  assign n169 = ~g & ~h;
  assign n170 = n36 & n169;
  assign n171 = ~c & ~c0;
  assign n172 = n35 & n171;
  assign n173 = ~i & n43;
  assign n174 = ~b & c;
  assign n175 = ~n173 & ~n174;
  assign n176 = ~n172 & n175;
  assign n177 = ~n170 & n176;
  assign n178 = ~n168 & n177;
  assign n179 = ~n166 & n178;
  assign n180 = ~n164 & n179;
  assign n181 = ~n162 & n180;
  assign n182 = ~n161 & n181;
  assign n183 = ~n159 & n182;
  assign n184 = ~n156 & n183;
  assign n185 = ~n155 & n184;
  assign n186 = ~n152 & n185;
  assign n187 = ~n150 & n186;
  assign n188 = ~n147 & n187;
  assign n189 = ~n144 & n188;
  assign n190 = ~n142 & n189;
  assign n191 = ~n139 & n190;
  assign n192 = ~n136 & n191;
  assign n193 = ~n133 & n192;
  assign n194 = ~n130 & n193;
  assign n195 = ~n127 & n194;
  assign n196 = ~n124 & n195;
  assign n197 = ~n121 & n196;
  assign n198 = ~n118 & n197;
  assign n199 = ~n115 & n198;
  assign n200 = ~n111 & n199;
  assign n201 = ~n108 & n200;
  assign n202 = ~n105 & n201;
  assign n203 = ~n101 & n202;
  assign n204 = ~n97 & n203;
  assign n205 = ~n92 & n204;
  assign n206 = ~n87 & n205;
  assign n207 = ~n82 & n206;
  assign n208 = ~n76 & n207;
  assign d0 = n70 | ~n208;
  assign n210 = ~a & ~c;
  assign n211 = f & ~a0;
  assign n212 = e & f;
  assign n213 = n210 & ~n212;
  assign e0 = n211 | ~n213;
  assign n215 = ~e & ~n210;
  assign n216 = ~e & ~b0;
  assign f0 = n215 | n216;
endmodule


