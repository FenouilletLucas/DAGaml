// Benchmark "CM150" written by ABC on Tue May 16 16:07:47 2017

module CM150 ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  output v;
  wire n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
    n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
    n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
    n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
    n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
    n93, n94, n95, n96, n97;
  assign n23 = ~o & ~q;
  assign n24 = ~p & q;
  assign n25 = ~o & ~p;
  assign n26 = ~n24 & ~n25;
  assign n27 = ~n23 & n26;
  assign n28 = ~m & ~q;
  assign n29 = ~n & q;
  assign n30 = ~m & ~n;
  assign n31 = ~n29 & ~n30;
  assign n32 = ~n28 & n31;
  assign n33 = n27 & n32;
  assign n34 = ~r & n32;
  assign n35 = r & n27;
  assign n36 = ~n34 & ~n35;
  assign n37 = ~n33 & n36;
  assign n38 = ~k & ~q;
  assign n39 = ~l & q;
  assign n40 = ~k & ~l;
  assign n41 = ~n39 & ~n40;
  assign n42 = ~n38 & n41;
  assign n43 = ~i & ~q;
  assign n44 = ~j & q;
  assign n45 = ~i & ~j;
  assign n46 = ~n44 & ~n45;
  assign n47 = ~n43 & n46;
  assign n48 = n42 & n47;
  assign n49 = ~r & n47;
  assign n50 = r & n42;
  assign n51 = ~n49 & ~n50;
  assign n52 = ~n48 & n51;
  assign n53 = n37 & n52;
  assign n54 = ~s & n52;
  assign n55 = s & n37;
  assign n56 = ~n54 & ~n55;
  assign n57 = ~n53 & n56;
  assign n58 = ~g & ~q;
  assign n59 = ~h & q;
  assign n60 = ~g & ~h;
  assign n61 = ~n59 & ~n60;
  assign n62 = ~n58 & n61;
  assign n63 = ~e & ~q;
  assign n64 = ~f & q;
  assign n65 = ~e & ~f;
  assign n66 = ~n64 & ~n65;
  assign n67 = ~n63 & n66;
  assign n68 = n62 & n67;
  assign n69 = ~r & n67;
  assign n70 = r & n62;
  assign n71 = ~n69 & ~n70;
  assign n72 = ~n68 & n71;
  assign n73 = ~c & ~q;
  assign n74 = ~d & q;
  assign n75 = ~c & ~d;
  assign n76 = ~n74 & ~n75;
  assign n77 = ~n73 & n76;
  assign n78 = ~a & ~q;
  assign n79 = ~b & q;
  assign n80 = ~a & ~b;
  assign n81 = ~n79 & ~n80;
  assign n82 = ~n78 & n81;
  assign n83 = n77 & n82;
  assign n84 = ~r & n82;
  assign n85 = r & n77;
  assign n86 = ~n84 & ~n85;
  assign n87 = ~n83 & n86;
  assign n88 = n72 & n87;
  assign n89 = ~s & n87;
  assign n90 = s & n72;
  assign n91 = ~n89 & ~n90;
  assign n92 = ~n88 & n91;
  assign n93 = n57 & n92;
  assign n94 = ~t & n92;
  assign n95 = t & n57;
  assign n96 = ~n94 & ~n95;
  assign n97 = ~n93 & n96;
  assign v = u | n97;
endmodule


