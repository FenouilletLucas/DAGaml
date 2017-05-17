// Benchmark "sct" written by ABC on Tue May 16 16:07:52 2017

module sct ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s,
    t, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s;
  output t, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0;
  wire n35, n36, n38, n39, n40, n41, n43, n44, n45, n47, n48, n50, n51, n52,
    n53, n55, n56, n57, n58, n59, n60, n62, n63, n64, n65, n67, n68, n69,
    n70, n72, n73, n74, n75, n77, n78, n79, n80, n82, n83, n84, n85, n87,
    n88, n89, n90, n91, n92, n93, n94, n95;
  assign n35 = ~b & ~o;
  assign n36 = b & ~c;
  assign t = n35 | n36;
  assign n38 = ~f & ~s;
  assign n39 = ~f & p;
  assign n40 = ~e & f;
  assign n41 = ~n39 & ~n40;
  assign u = n38 | ~n41;
  assign n43 = ~c & e;
  assign n44 = q & n43;
  assign n45 = d & e;
  assign f0 = n44 | n45;
  assign n47 = q & f0;
  assign n48 = e & ~n47;
  assign v = ~g & n48;
  assign n50 = e & ~h;
  assign n51 = ~v & n50;
  assign n52 = ~n47 & n51;
  assign n53 = h & v;
  assign w = n52 | n53;
  assign n55 = h & ~i;
  assign n56 = ~w & n55;
  assign n57 = n48 & n56;
  assign n58 = i & w;
  assign n59 = i & v;
  assign n60 = ~n58 & ~n59;
  assign x = n57 | ~n60;
  assign n62 = i & ~x;
  assign n63 = ~j & n62;
  assign n64 = j & ~n62;
  assign n65 = n48 & ~n64;
  assign y = n63 | ~n65;
  assign n67 = ~j & y;
  assign n68 = ~k & n67;
  assign n69 = k & ~n67;
  assign n70 = n48 & ~n69;
  assign z = n68 | ~n70;
  assign n72 = ~k & z;
  assign n73 = ~l & n72;
  assign n74 = l & ~n72;
  assign n75 = n48 & ~n74;
  assign a0 = n73 | ~n75;
  assign n77 = ~l & a0;
  assign n78 = ~m & n77;
  assign n79 = m & ~n77;
  assign n80 = n48 & ~n79;
  assign b0 = n78 | ~n80;
  assign n82 = ~m & b0;
  assign n83 = ~n & n82;
  assign n84 = n & ~n82;
  assign n85 = n48 & ~n84;
  assign c0 = n83 | ~n85;
  assign n87 = ~k & ~l;
  assign n88 = ~m & n87;
  assign n89 = ~n & n88;
  assign n90 = n48 & n89;
  assign n91 = n67 & n90;
  assign n92 = a & n48;
  assign n93 = n67 & n92;
  assign n94 = o & n47;
  assign n95 = ~n93 & ~n94;
  assign d0 = n91 | ~n95;
  assign h0 = e & r;
  assign e0 = c;
  assign g0 = e;
endmodule


