// Benchmark "ADDERFDS" written by ABC on Tue May 16 16:07:51 2017

module ADDERFDS ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x,
    y, z, a0, b0, c0, d0, e0, f0, g0,
    h0, i0, j0, k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v, w, x, y, z, a0, b0, c0, d0, e0, f0, g0;
  output h0, i0, j0, k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0;
  wire n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
    n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
    n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
    n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
    n106, n107, n108, n109, n110, n111, n112, n113, n115, n116, n117, n118,
    n120, n121, n122, n123, n125, n126, n127, n128, n130, n131, n132, n133,
    n135, n136, n137, n138, n140, n141, n142, n143, n145, n146, n147, n148,
    n150, n151, n152, n153, n155, n156, n157, n158, n160, n161, n162, n163,
    n165, n166, n167, n168, n170, n171, n172, n173, n175, n176, n177, n178,
    n180, n181, n182, n183, n185, n186, n187, n188, n190, n191, n192, n193;
  assign n51 = b & r;
  assign n52 = c & s;
  assign n53 = d & t;
  assign n54 = e & u;
  assign n55 = f & v;
  assign n56 = g & w;
  assign n57 = h & x;
  assign n58 = i & y;
  assign n59 = j & z;
  assign n60 = k & a0;
  assign n61 = l & b0;
  assign n62 = m & c0;
  assign n63 = n & d0;
  assign n64 = o & e0;
  assign n65 = p & f0;
  assign n66 = ~p & ~f0;
  assign n67 = ~g0 & ~n65;
  assign n68 = ~n66 & ~n67;
  assign n69 = ~o & ~e0;
  assign n70 = ~n64 & ~n68;
  assign n71 = ~n69 & ~n70;
  assign n72 = ~n & ~d0;
  assign n73 = ~n63 & ~n71;
  assign n74 = ~n72 & ~n73;
  assign n75 = ~m & ~c0;
  assign n76 = ~n62 & ~n74;
  assign n77 = ~n75 & ~n76;
  assign n78 = ~l & ~b0;
  assign n79 = ~n61 & ~n77;
  assign n80 = ~n78 & ~n79;
  assign n81 = ~k & ~a0;
  assign n82 = ~n60 & ~n80;
  assign n83 = ~n81 & ~n82;
  assign n84 = ~j & ~z;
  assign n85 = ~n59 & ~n83;
  assign n86 = ~n84 & ~n85;
  assign n87 = ~i & ~y;
  assign n88 = ~n58 & ~n86;
  assign n89 = ~n87 & ~n88;
  assign n90 = ~h & ~x;
  assign n91 = ~n57 & ~n89;
  assign n92 = ~n90 & ~n91;
  assign n93 = ~g & ~w;
  assign n94 = ~n56 & ~n92;
  assign n95 = ~n93 & ~n94;
  assign n96 = ~f & ~v;
  assign n97 = ~n55 & ~n95;
  assign n98 = ~n96 & ~n97;
  assign n99 = ~e & ~u;
  assign n100 = ~n54 & ~n98;
  assign n101 = ~n99 & ~n100;
  assign n102 = ~d & ~t;
  assign n103 = ~n53 & ~n101;
  assign n104 = ~n102 & ~n103;
  assign n105 = ~c & ~s;
  assign n106 = ~n52 & ~n104;
  assign n107 = ~n105 & ~n106;
  assign n108 = ~b & ~r;
  assign n109 = ~n51 & ~n107;
  assign n110 = ~n108 & ~n109;
  assign n111 = ~a & ~q;
  assign n112 = a & q;
  assign n113 = n110 & ~n111;
  assign x0 = n112 | n113;
  assign n115 = n110 & n112;
  assign n116 = ~n111 & ~x0;
  assign n117 = n110 & ~x0;
  assign n118 = ~n116 & ~n117;
  assign h0 = n115 | ~n118;
  assign n120 = n51 & n107;
  assign n121 = ~n108 & ~n110;
  assign n122 = n107 & ~n110;
  assign n123 = ~n121 & ~n122;
  assign i0 = n120 | ~n123;
  assign n125 = n52 & n104;
  assign n126 = ~n105 & ~n107;
  assign n127 = n104 & ~n107;
  assign n128 = ~n126 & ~n127;
  assign j0 = n125 | ~n128;
  assign n130 = n53 & n101;
  assign n131 = ~n102 & ~n104;
  assign n132 = n101 & ~n104;
  assign n133 = ~n131 & ~n132;
  assign k0 = n130 | ~n133;
  assign n135 = n54 & n98;
  assign n136 = ~n99 & ~n101;
  assign n137 = n98 & ~n101;
  assign n138 = ~n136 & ~n137;
  assign l0 = n135 | ~n138;
  assign n140 = n55 & n95;
  assign n141 = ~n96 & ~n98;
  assign n142 = n95 & ~n98;
  assign n143 = ~n141 & ~n142;
  assign m0 = n140 | ~n143;
  assign n145 = n56 & n92;
  assign n146 = ~n93 & ~n95;
  assign n147 = n92 & ~n95;
  assign n148 = ~n146 & ~n147;
  assign n0 = n145 | ~n148;
  assign n150 = n57 & n89;
  assign n151 = ~n90 & ~n92;
  assign n152 = n89 & ~n92;
  assign n153 = ~n151 & ~n152;
  assign o0 = n150 | ~n153;
  assign n155 = n58 & n86;
  assign n156 = ~n87 & ~n89;
  assign n157 = n86 & ~n89;
  assign n158 = ~n156 & ~n157;
  assign p0 = n155 | ~n158;
  assign n160 = n59 & n83;
  assign n161 = ~n84 & ~n86;
  assign n162 = n83 & ~n86;
  assign n163 = ~n161 & ~n162;
  assign q0 = n160 | ~n163;
  assign n165 = n60 & n80;
  assign n166 = ~n81 & ~n83;
  assign n167 = n80 & ~n83;
  assign n168 = ~n166 & ~n167;
  assign r0 = n165 | ~n168;
  assign n170 = n61 & n77;
  assign n171 = ~n78 & ~n80;
  assign n172 = n77 & ~n80;
  assign n173 = ~n171 & ~n172;
  assign s0 = n170 | ~n173;
  assign n175 = n62 & n74;
  assign n176 = ~n75 & ~n77;
  assign n177 = n74 & ~n77;
  assign n178 = ~n176 & ~n177;
  assign t0 = n175 | ~n178;
  assign n180 = n63 & n71;
  assign n181 = ~n72 & ~n74;
  assign n182 = n71 & ~n74;
  assign n183 = ~n181 & ~n182;
  assign u0 = n180 | ~n183;
  assign n185 = n64 & n68;
  assign n186 = ~n69 & ~n71;
  assign n187 = n68 & ~n71;
  assign n188 = ~n186 & ~n187;
  assign v0 = n185 | ~n188;
  assign n190 = g0 & n65;
  assign n191 = ~n66 & ~n68;
  assign n192 = g0 & ~n68;
  assign n193 = ~n191 & ~n192;
  assign w0 = n190 | ~n193;
endmodule


