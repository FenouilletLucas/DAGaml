// Benchmark "pcle_cl" written by ABC on Tue May 16 16:07:52 2017

module pcle_cl ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s,
    t, u, v, w, x, y, z, a0, b0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s;
  output t, u, v, w, x, y, z, a0, b0;
  wire n29, n30, n31, n32, n33, n34, n35, n36, n37, n39, n40, n42, n43, n44,
    n45, n46, n48, n49, n50, n51, n52, n53, n55, n56, n57, n58, n59, n60,
    n62, n63, n64, n65, n66, n67, n69, n70, n71, n72, n73, n74, n76, n77,
    n78, n79, n80, n81, n83, n84, n85, n86, n87, n88, n89;
  assign n29 = l & m;
  assign n30 = n & n29;
  assign n31 = o & p;
  assign n32 = n30 & n31;
  assign n33 = q & n32;
  assign n34 = ~i & j;
  assign n35 = ~k & n34;
  assign n36 = r & s;
  assign n37 = n35 & n36;
  assign t = n33 & n37;
  assign n39 = a & i;
  assign n40 = ~l & n35;
  assign u = n39 | n40;
  assign n42 = l & n35;
  assign n43 = ~m & n42;
  assign n44 = b & i;
  assign n45 = m & n40;
  assign n46 = ~n44 & ~n45;
  assign v = n43 | ~n46;
  assign n48 = ~n & n35;
  assign n49 = n29 & n48;
  assign n50 = n & n35;
  assign n51 = ~n29 & n50;
  assign n52 = c & i;
  assign n53 = ~n51 & ~n52;
  assign w = n49 | ~n53;
  assign n55 = ~o & n35;
  assign n56 = n30 & n55;
  assign n57 = o & n35;
  assign n58 = ~n30 & n57;
  assign n59 = d & i;
  assign n60 = ~n58 & ~n59;
  assign x = n56 | ~n60;
  assign n62 = ~n32 & n57;
  assign n63 = n30 & n62;
  assign n64 = e & i;
  assign n65 = p & n35;
  assign n66 = ~n32 & n65;
  assign n67 = ~n64 & ~n66;
  assign y = n63 | ~n67;
  assign n69 = q & n35;
  assign n70 = ~n32 & n69;
  assign n71 = f & i;
  assign n72 = ~q & n35;
  assign n73 = n32 & n72;
  assign n74 = ~n71 & ~n73;
  assign z = n70 | ~n74;
  assign n76 = ~r & n35;
  assign n77 = n33 & n76;
  assign n78 = r & n35;
  assign n79 = ~n33 & n78;
  assign n80 = g & i;
  assign n81 = ~n79 & ~n80;
  assign a0 = n77 | ~n81;
  assign n83 = r & ~t;
  assign n84 = n35 & n83;
  assign n85 = n33 & n84;
  assign n86 = s & ~t;
  assign n87 = n35 & n86;
  assign n88 = h & i;
  assign n89 = ~n87 & ~n88;
  assign b0 = n85 | ~n89;
endmodule


