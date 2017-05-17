// Benchmark "pm1" written by ABC on Tue May 16 16:07:52 2017

module pm1 ( 
    a, b, c, d, e, g, h, i, j, k, l, m, n, o, p, q,
    r, s, t, u, v, w, x, y, z, a0, b0, c0, d0  );
  input  a, b, c, d, e, g, h, i, j, k, l, m, n, o, p, q;
  output r, s, t, u, v, w, x, y, z, a0, b0, c0, d0;
  wire n30, n33, n34, n35, n36, n37, n39, n40, n41, n42, n43, n44, n45, n47,
    n48, n49, n50, n51, n52, n54, n55, n56, n57, n58, n59, n60, n61, n63,
    n64, n65, n67, n68, n69, n70, n71, n72, n73, n74, n75, n77, n78, n79,
    n80, n81, n82, n83, n84, n85, n87, n88;
  assign n30 = ~m & ~n;
  assign r = b | ~n30;
  assign s = m | ~n;
  assign n33 = j & k;
  assign n34 = i & n33;
  assign n35 = g & h;
  assign n36 = n34 & n35;
  assign n37 = m & n;
  assign t = ~n36 | ~n37;
  assign n39 = i & j;
  assign n40 = n & ~n39;
  assign n41 = ~g & n;
  assign n42 = ~h & n;
  assign n43 = ~n41 & ~n42;
  assign n44 = ~n40 & n43;
  assign n45 = k & m;
  assign u = n44 | ~n45;
  assign n47 = b & k;
  assign n48 = d & e;
  assign n49 = ~s & n47;
  assign n50 = n47 & ~n48;
  assign n51 = ~c & n47;
  assign n52 = ~n50 & ~n51;
  assign x = n49 | ~n52;
  assign n54 = k & n;
  assign n55 = e & n54;
  assign n56 = m & ~n55;
  assign n57 = ~c & m;
  assign n58 = ~d & m;
  assign n59 = ~n57 & ~n58;
  assign n60 = ~n56 & n59;
  assign n61 = a & ~l;
  assign z = n60 | ~n61;
  assign n63 = s & n61;
  assign n64 = ~m & n63;
  assign n65 = n & n63;
  assign a0 = n64 | n65;
  assign n67 = ~e & k;
  assign n68 = a & n67;
  assign n69 = ~d & k;
  assign n70 = a & n69;
  assign n71 = ~c & k;
  assign n72 = a & n71;
  assign n73 = ~n70 & ~n72;
  assign n74 = ~n68 & n73;
  assign n75 = ~l & ~n74;
  assign b0 = n37 & n75;
  assign n77 = ~b & n;
  assign n78 = n61 & ~n77;
  assign n79 = c & d;
  assign n80 = e & n79;
  assign n81 = n54 & ~n80;
  assign n82 = m & n81;
  assign n83 = n78 & n82;
  assign n84 = ~b & m;
  assign n85 = n78 & n84;
  assign c0 = n83 | n85;
  assign n87 = ~k & ~l;
  assign n88 = a & n87;
  assign d0 = n37 & n88;
  assign v = ~p;
  assign w = ~o;
  assign y = ~q;
endmodule


