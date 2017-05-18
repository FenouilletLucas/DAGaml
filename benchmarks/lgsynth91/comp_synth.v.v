// Benchmark "comp" written by ABC on Tue May 16 16:07:48 2017

module comp ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x,
    y, z, a0, b0, c0, d0, e0, f0,
    g0, h0, i0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v, w, x, y, z, a0, b0, c0, d0, e0, f0;
  output g0, h0, i0;
  wire n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
    n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
    n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
    n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
    n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
    n105, n106, n107, n108, n109, n110, n111, n113, n114, n115, n116, n117,
    n118;
  assign n36 = ~i & y;
  assign n37 = ~j & z;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~k & a0;
  assign n40 = n38 & ~n39;
  assign n41 = l & ~b0;
  assign n42 = n40 & n41;
  assign n43 = k & ~a0;
  assign n44 = n38 & n43;
  assign n45 = j & ~z;
  assign n46 = ~n36 & n45;
  assign n47 = i & ~y;
  assign n48 = ~n46 & ~n47;
  assign n49 = ~n44 & n48;
  assign n50 = ~n42 & n49;
  assign n51 = ~l & b0;
  assign n52 = n50 & n51;
  assign n53 = ~n40 & n50;
  assign n54 = ~n52 & ~n53;
  assign n55 = ~m & c0;
  assign n56 = ~n & d0;
  assign n57 = ~n55 & ~n56;
  assign n58 = ~o & e0;
  assign n59 = n57 & ~n58;
  assign n60 = ~p & f0;
  assign n61 = n59 & ~n60;
  assign n62 = p & ~f0;
  assign n63 = n59 & n62;
  assign n64 = o & ~e0;
  assign n65 = n57 & n64;
  assign n66 = n & ~d0;
  assign n67 = ~n55 & n66;
  assign n68 = m & ~c0;
  assign n69 = ~n67 & ~n68;
  assign n70 = ~n65 & n69;
  assign n71 = ~n63 & n70;
  assign n72 = ~a & q;
  assign n73 = ~b & r;
  assign n74 = ~n72 & ~n73;
  assign n75 = ~c & s;
  assign n76 = n74 & ~n75;
  assign n77 = ~d & t;
  assign n78 = n76 & ~n77;
  assign n79 = d & ~t;
  assign n80 = n76 & n79;
  assign n81 = c & ~s;
  assign n82 = n74 & n81;
  assign n83 = b & ~r;
  assign n84 = ~n72 & n83;
  assign n85 = a & ~q;
  assign n86 = ~n84 & ~n85;
  assign n87 = ~n82 & n86;
  assign n88 = ~n80 & n87;
  assign n89 = n78 & n88;
  assign n90 = ~e & u;
  assign n91 = ~f & v;
  assign n92 = ~n90 & ~n91;
  assign n93 = ~g & w;
  assign n94 = n92 & ~n93;
  assign n95 = ~h & x;
  assign n96 = n94 & ~n95;
  assign n97 = h & ~x;
  assign n98 = n94 & n97;
  assign n99 = g & ~w;
  assign n100 = n92 & n99;
  assign n101 = f & ~v;
  assign n102 = ~n90 & n101;
  assign n103 = e & ~u;
  assign n104 = ~n102 & ~n103;
  assign n105 = ~n100 & n104;
  assign n106 = ~n98 & n105;
  assign n107 = n96 & n106;
  assign n108 = n89 & n107;
  assign n109 = n71 & n108;
  assign n110 = n61 & n109;
  assign n111 = n50 & n110;
  assign h0 = n54 & n111;
  assign n113 = ~n71 & n108;
  assign n114 = n54 & n113;
  assign n115 = ~n50 & n108;
  assign n116 = n89 & ~n106;
  assign n117 = n88 & ~n116;
  assign n118 = ~n115 & n117;
  assign i0 = n114 | ~n118;
  assign g0 = ~h0 & ~i0;
endmodule


