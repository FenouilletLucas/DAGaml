// Benchmark "cc" written by ABC on Tue May 16 16:07:46 2017

module cc ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, o, p, q, r, s, t, u, v,
    k0, l0, m0, n0, o0, p0, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0, i0,
    j0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, o, p, q, r, s, t, u, v;
  output k0, l0, m0, n0, o0, p0, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0,
    i0, j0;
  wire n42, n43, n44, n45, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56,
    n57, n58, n59, n60, n62, n63, n64, n65, n66, n67, n69, n70, n71, n72,
    n73, n74, n76, n77, n78, n79, n80, n81, n83, n84, n85, n86, n87, n88,
    n91, n92, n94, n95, n96, n98, n99, n100, n103, n104, n105, n106, n107,
    n108, n110, n111, n112, n113, n114, n115, n116, n117;
  assign n42 = ~k & ~q;
  assign n43 = ~i & ~q;
  assign n44 = m & ~n43;
  assign n45 = ~n42 & n44;
  assign n46 = c & ~q;
  assign n47 = n45 & n46;
  assign n48 = ~i & n45;
  assign n49 = ~k & n45;
  assign n50 = ~n48 & ~n49;
  assign k0 = n47 | ~n50;
  assign n52 = ~d & i;
  assign n53 = k & n52;
  assign n54 = ~q & n53;
  assign n55 = m & ~n54;
  assign n56 = k & ~q;
  assign n57 = i & n56;
  assign n58 = n55 & n57;
  assign n59 = ~p & r;
  assign n60 = n55 & n59;
  assign l0 = n58 | n60;
  assign n62 = ~e & i;
  assign n63 = k & n62;
  assign n64 = ~q & n63;
  assign n65 = m & ~n64;
  assign n66 = n57 & n65;
  assign n67 = s & n65;
  assign m0 = n66 | n67;
  assign n69 = ~f & i;
  assign n70 = k & n69;
  assign n71 = ~q & n70;
  assign n72 = m & ~n71;
  assign n73 = n57 & n72;
  assign n74 = t & n72;
  assign n0 = n73 | n74;
  assign n76 = ~g & i;
  assign n77 = k & n76;
  assign n78 = ~q & n77;
  assign n79 = m & ~n78;
  assign n80 = n57 & n79;
  assign n81 = u & n79;
  assign o0 = n80 | n81;
  assign n83 = ~h & i;
  assign n84 = k & n83;
  assign n85 = ~q & n84;
  assign n86 = m & ~n85;
  assign n87 = n57 & n86;
  assign n88 = v & n86;
  assign p0 = n87 | n88;
  assign w = l & v;
  assign n91 = ~p & q;
  assign n92 = k & n91;
  assign x = i & n92;
  assign n94 = ~l & m;
  assign n95 = n57 & n94;
  assign n96 = p & n94;
  assign y = n95 | n96;
  assign n98 = m & ~p;
  assign n99 = k & n98;
  assign n100 = i & n99;
  assign z = q & n100;
  assign f0 = i & j;
  assign n103 = ~a & i;
  assign n104 = k & n103;
  assign n105 = ~q & n104;
  assign n106 = m & ~n105;
  assign n107 = n57 & n106;
  assign n108 = o & n106;
  assign i0 = n107 | n108;
  assign n110 = b & i;
  assign n111 = k & n110;
  assign n112 = ~q & n111;
  assign n113 = m & ~n112;
  assign n114 = k & q;
  assign n115 = i & n114;
  assign n116 = n113 & n115;
  assign n117 = p & n113;
  assign j0 = n116 | n117;
  assign a0 = ~t;
  assign g0 = ~f0;
  assign b0 = u;
  assign c0 = q;
  assign d0 = s;
  assign e0 = r;
  assign h0 = p;
endmodule


