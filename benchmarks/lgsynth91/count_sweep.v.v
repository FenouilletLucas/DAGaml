// Benchmark "count" written by ABC on Tue May 16 16:07:48 2017

module count ( 
    g0, h0, i0, j0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r,
    s, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0,
    k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0  );
  input  g0, h0, i0, j0, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
    q, r, s, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0;
  output k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0;
  wire n52, n53, n54, n55, n56, n57, n59, n60, n61, n62, n63, n64, n65, n67,
    n68, n69, n70, n71, n72, n73, n75, n76, n77, n78, n79, n80, n81, n83,
    n84, n85, n86, n87, n88, n89, n91, n92, n93, n94, n95, n96, n97, n99,
    n100, n101, n102, n103, n104, n105, n107, n108, n109, n110, n111, n112,
    n113, n115, n116, n117, n118, n119, n120, n121, n123, n124, n125, n126,
    n127, n128, n129, n131, n132, n133, n134, n135, n136, n137, n139, n140,
    n141, n142, n143, n144, n145, n147, n148, n149, n150, n151, n152, n153,
    n155, n156, n157, n158, n159, n160, n161, n163, n164, n165, n166, n167,
    n168, n169, n171, n172, n173, n174, n175, n176, n177;
  assign n52 = ~r & u;
  assign n53 = r & ~u;
  assign n54 = ~n52 & ~n53;
  assign n55 = q & n54;
  assign n56 = ~p & ~q;
  assign n57 = ~s & ~n56;
  assign k0 = n55 | ~n57;
  assign n59 = ~r & ~u;
  assign n60 = ~v & ~n59;
  assign n61 = v & n59;
  assign n62 = ~n60 & ~n61;
  assign n63 = q & n62;
  assign n64 = ~o & ~q;
  assign n65 = ~s & ~n64;
  assign l0 = n63 | ~n65;
  assign n67 = ~v & n59;
  assign n68 = w & n67;
  assign n69 = ~w & ~n67;
  assign n70 = ~n68 & ~n69;
  assign n71 = q & n70;
  assign n72 = ~n & ~q;
  assign n73 = ~s & ~n72;
  assign m0 = n71 | ~n73;
  assign n75 = ~w & n67;
  assign n76 = ~x & ~n75;
  assign n77 = x & n75;
  assign n78 = ~n76 & ~n77;
  assign n79 = q & n78;
  assign n80 = ~m & ~q;
  assign n81 = ~s & ~n80;
  assign n0 = n79 | ~n81;
  assign n83 = ~x & n75;
  assign n84 = y & n83;
  assign n85 = ~y & ~n83;
  assign n86 = ~n84 & ~n85;
  assign n87 = q & n86;
  assign n88 = ~l & ~q;
  assign n89 = ~s & ~n88;
  assign o0 = n87 | ~n89;
  assign n91 = ~y & n83;
  assign n92 = ~z & ~n91;
  assign n93 = z & n91;
  assign n94 = ~n92 & ~n93;
  assign n95 = q & n94;
  assign n96 = ~k & ~q;
  assign n97 = ~s & ~n96;
  assign p0 = n95 | ~n97;
  assign n99 = ~z & n91;
  assign n100 = a0 & n99;
  assign n101 = ~a0 & ~n99;
  assign n102 = ~n100 & ~n101;
  assign n103 = q & n102;
  assign n104 = ~j & ~q;
  assign n105 = ~s & ~n104;
  assign q0 = n103 | ~n105;
  assign n107 = ~a0 & n99;
  assign n108 = ~b0 & ~n107;
  assign n109 = b0 & n107;
  assign n110 = ~n108 & ~n109;
  assign n111 = q & n110;
  assign n112 = ~i & ~q;
  assign n113 = ~s & ~n112;
  assign r0 = n111 | ~n113;
  assign n115 = ~b0 & n107;
  assign n116 = c0 & n115;
  assign n117 = ~c0 & ~n115;
  assign n118 = ~n116 & ~n117;
  assign n119 = q & n118;
  assign n120 = ~h & ~q;
  assign n121 = ~s & ~n120;
  assign s0 = n119 | ~n121;
  assign n123 = ~c0 & n115;
  assign n124 = ~d0 & ~n123;
  assign n125 = d0 & n123;
  assign n126 = ~n124 & ~n125;
  assign n127 = q & n126;
  assign n128 = ~g & ~q;
  assign n129 = ~s & ~n128;
  assign t0 = n127 | ~n129;
  assign n131 = ~d0 & n123;
  assign n132 = e0 & n131;
  assign n133 = ~e0 & ~n131;
  assign n134 = ~n132 & ~n133;
  assign n135 = q & n134;
  assign n136 = ~f & ~q;
  assign n137 = ~s & ~n136;
  assign u0 = n135 | ~n137;
  assign n139 = ~e0 & n131;
  assign n140 = ~f0 & ~n139;
  assign n141 = f0 & n139;
  assign n142 = ~n140 & ~n141;
  assign n143 = q & n142;
  assign n144 = ~e & ~q;
  assign n145 = ~s & ~n144;
  assign v0 = n143 | ~n145;
  assign n147 = ~f0 & n139;
  assign n148 = g0 & n147;
  assign n149 = ~g0 & ~n147;
  assign n150 = ~n148 & ~n149;
  assign n151 = q & n150;
  assign n152 = ~d & ~q;
  assign n153 = ~s & ~n152;
  assign w0 = n151 | ~n153;
  assign n155 = ~g0 & n147;
  assign n156 = ~h0 & ~n155;
  assign n157 = h0 & n155;
  assign n158 = ~n156 & ~n157;
  assign n159 = q & n158;
  assign n160 = ~c & ~q;
  assign n161 = ~s & ~n160;
  assign x0 = n159 | ~n161;
  assign n163 = ~h0 & n155;
  assign n164 = i0 & n163;
  assign n165 = ~i0 & ~n163;
  assign n166 = ~n164 & ~n165;
  assign n167 = q & n166;
  assign n168 = ~b & ~q;
  assign n169 = ~s & ~n168;
  assign y0 = n167 | ~n169;
  assign n171 = ~i0 & n163;
  assign n172 = ~j0 & ~n171;
  assign n173 = j0 & n171;
  assign n174 = ~n172 & ~n173;
  assign n175 = q & n174;
  assign n176 = ~a & ~q;
  assign n177 = ~s & ~n176;
  assign z0 = n175 | ~n177;
endmodule


