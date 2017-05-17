// Benchmark "pcler8_cl" written by ABC on Tue May 16 16:07:52 2017

module pcler8_cl ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x,
    y, z, a0,
    k0, l0, m0, n0, o0, p0, q0, r0, b0, c0, d0, e0, f0, g0, h0, i0, j0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v, w, x, y, z, a0;
  output k0, l0, m0, n0, o0, p0, q0, r0, b0, c0, d0, e0, f0, g0, h0, i0, j0;
  wire n45, n46, n47, n48, n49, n50, n51, n52, n53, n56, n57, n58, n61, n62,
    n63, n64, n65, n66, n69, n70, n71, n72, n73, n74, n75, n78, n79, n80,
    n81, n82, n83, n84, n87, n88, n89, n90, n91, n92, n93, n96, n97, n98,
    n99, n100, n101, n102, n105, n106, n107, n108, n109, n110, n111, n114,
    n115, n116, n117, n118, n119, n120;
  assign n45 = ~i & j;
  assign n46 = ~k & n45;
  assign n47 = t & u;
  assign n48 = v & n47;
  assign n49 = w & n48;
  assign n50 = x & n49;
  assign n51 = y & n50;
  assign n52 = z & n51;
  assign n53 = a0 & n52;
  assign b0 = n46 & n53;
  assign c0 = a & i;
  assign n56 = ~t & n46;
  assign n57 = l & b0;
  assign n58 = ~c0 & ~n57;
  assign k0 = n56 | ~n58;
  assign d0 = b & i;
  assign n61 = t & n46;
  assign n62 = ~u & n61;
  assign n63 = u & n56;
  assign n64 = m & b0;
  assign n65 = ~d0 & ~n64;
  assign n66 = ~n63 & n65;
  assign l0 = n62 | ~n66;
  assign e0 = c & i;
  assign n69 = v & n46;
  assign n70 = ~n47 & n69;
  assign n71 = ~v & n46;
  assign n72 = n47 & n71;
  assign n73 = n & b0;
  assign n74 = ~e0 & ~n73;
  assign n75 = ~n72 & n74;
  assign m0 = n70 | ~n75;
  assign f0 = d & i;
  assign n78 = w & n46;
  assign n79 = ~n48 & n78;
  assign n80 = ~w & n46;
  assign n81 = n48 & n80;
  assign n82 = o & b0;
  assign n83 = ~f0 & ~n82;
  assign n84 = ~n81 & n83;
  assign n0 = n79 | ~n84;
  assign g0 = e & i;
  assign n87 = x & n46;
  assign n88 = ~n49 & n87;
  assign n89 = ~x & n46;
  assign n90 = n49 & n89;
  assign n91 = p & b0;
  assign n92 = ~g0 & ~n91;
  assign n93 = ~n90 & n92;
  assign o0 = n88 | ~n93;
  assign h0 = f & i;
  assign n96 = y & n46;
  assign n97 = ~n50 & n96;
  assign n98 = ~y & n46;
  assign n99 = n50 & n98;
  assign n100 = q & b0;
  assign n101 = ~h0 & ~n100;
  assign n102 = ~n99 & n101;
  assign p0 = n97 | ~n102;
  assign i0 = g & i;
  assign n105 = z & n46;
  assign n106 = ~n51 & n105;
  assign n107 = ~z & n46;
  assign n108 = n51 & n107;
  assign n109 = r & b0;
  assign n110 = ~i0 & ~n109;
  assign n111 = ~n108 & n110;
  assign q0 = n106 | ~n111;
  assign j0 = h & i;
  assign n114 = a0 & n46;
  assign n115 = ~n52 & n114;
  assign n116 = ~a0 & n46;
  assign n117 = n52 & n116;
  assign n118 = s & b0;
  assign n119 = ~j0 & ~n118;
  assign n120 = ~n117 & n119;
  assign r0 = n115 | ~n120;
endmodule


