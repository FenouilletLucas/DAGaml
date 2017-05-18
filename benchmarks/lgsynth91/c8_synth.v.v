// Benchmark "c8" written by ABC on Tue May 16 16:07:46 2017

module c8 ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, u, v, w, x, y,
    z, a0, b0, c0,
    g0, h0, i0, j0, k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, d0, e0, f0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, u, v,
    w, x, y, z, a0, b0, c0;
  output g0, h0, i0, j0, k0, l0, m0, n0, o0, p0, q0, r0, s0, t0, u0, d0, e0,
    f0;
  wire n47, n48, n50, n51, n53, n54, n56, n57, n59, n60, n62, n63, n64, n65,
    n66, n67, n68, n69, n70, n71, n73, n74, n75, n76, n77, n78, n79, n80,
    n81, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n94, n95, n96,
    n97, n98, n99, n100, n101, n102, n103, n104, n106, n107, n108, n109,
    n110, n111, n112, n113, n114, n116, n117, n118, n119, n120, n121, n122,
    n123, n124, n126, n127, n128, n129, n130, n131, n132, n133, n134, n136,
    n137, n138, n139, n140, n141, n142, n143, n144, n146, n147, n148, n149,
    n150, n151, n152, n153, n154, n156, n157, n159, n160, n162, n163;
  assign n47 = ~x & ~c0;
  assign n48 = ~l & c0;
  assign g0 = n47 | n48;
  assign n50 = ~y & ~c0;
  assign n51 = ~m & c0;
  assign h0 = n50 | n51;
  assign n53 = ~z & ~c0;
  assign n54 = ~n & c0;
  assign i0 = n53 | n54;
  assign n56 = ~a0 & ~c0;
  assign n57 = ~o & c0;
  assign j0 = n56 | n57;
  assign n59 = ~b0 & ~c0;
  assign n60 = ~p & c0;
  assign k0 = n59 | n60;
  assign n62 = ~q & s;
  assign n63 = ~q & ~s;
  assign n64 = ~r & ~u;
  assign n65 = q & r;
  assign n66 = u & n65;
  assign n67 = a & n62;
  assign n68 = i & n63;
  assign n69 = q & n64;
  assign n70 = ~n68 & ~n69;
  assign n71 = ~n67 & n70;
  assign m0 = n66 | ~n71;
  assign n73 = q & ~v;
  assign n74 = q & v;
  assign n75 = n64 & n74;
  assign n76 = ~b & n62;
  assign n77 = ~j & n63;
  assign n78 = ~n76 & ~n77;
  assign n79 = ~n75 & n78;
  assign n80 = ~n73 & n79;
  assign n81 = n64 & n79;
  assign n0 = n80 | n81;
  assign n83 = ~v & n64;
  assign n84 = ~c & n62;
  assign n85 = ~k & n63;
  assign n86 = ~n84 & ~n85;
  assign n87 = ~w & n83;
  assign n88 = w & n86;
  assign n89 = ~n83 & n88;
  assign n90 = n86 & n87;
  assign n91 = ~q & n86;
  assign n92 = ~n90 & ~n91;
  assign o0 = n89 | ~n92;
  assign n94 = ~d & n62;
  assign n95 = ~l & n63;
  assign n96 = ~n94 & ~n95;
  assign n97 = ~v & ~w;
  assign n98 = ~x & n97;
  assign n99 = n64 & n98;
  assign n100 = x & n96;
  assign n101 = ~n87 & n100;
  assign n102 = n96 & n99;
  assign n103 = ~q & n96;
  assign n104 = ~n102 & ~n103;
  assign p0 = n101 | ~n104;
  assign n106 = ~e & n62;
  assign n107 = ~m & n63;
  assign n108 = ~n106 & ~n107;
  assign n109 = ~y & n99;
  assign n110 = y & n108;
  assign n111 = ~n99 & n110;
  assign n112 = n108 & n109;
  assign n113 = ~q & n108;
  assign n114 = ~n112 & ~n113;
  assign q0 = n111 | ~n114;
  assign n116 = ~f & n62;
  assign n117 = ~n & n63;
  assign n118 = ~n116 & ~n117;
  assign n119 = ~z & n109;
  assign n120 = z & n118;
  assign n121 = ~n109 & n120;
  assign n122 = n118 & n119;
  assign n123 = ~q & n118;
  assign n124 = ~n122 & ~n123;
  assign r0 = n121 | ~n124;
  assign n126 = ~g & n62;
  assign n127 = ~o & n63;
  assign n128 = ~n126 & ~n127;
  assign n129 = ~a0 & n119;
  assign n130 = a0 & n128;
  assign n131 = ~n119 & n130;
  assign n132 = n128 & n129;
  assign n133 = ~q & n128;
  assign n134 = ~n132 & ~n133;
  assign s0 = n131 | ~n134;
  assign n136 = ~h & n62;
  assign n137 = ~p & n63;
  assign n138 = ~n136 & ~n137;
  assign n139 = ~b0 & n138;
  assign n140 = n129 & n139;
  assign n141 = b0 & n138;
  assign n142 = ~n129 & n141;
  assign n143 = ~q & n138;
  assign n144 = ~n142 & ~n143;
  assign t0 = n140 | ~n144;
  assign n146 = ~r & u;
  assign n147 = ~w & n146;
  assign n148 = ~x & n147;
  assign n149 = ~y & n148;
  assign n150 = ~z & n149;
  assign n151 = ~a0 & n150;
  assign n152 = ~b0 & n151;
  assign n153 = n73 & n152;
  assign n154 = c0 & n65;
  assign u0 = n153 | n154;
  assign n156 = ~u & ~c0;
  assign n157 = ~i & c0;
  assign d0 = n156 | n157;
  assign n159 = ~v & ~c0;
  assign n160 = ~j & c0;
  assign e0 = n159 | n160;
  assign n162 = ~w & ~c0;
  assign n163 = ~k & c0;
  assign f0 = n162 | n163;
  assign l0 = c0;
endmodule


