// Benchmark "pcle_cl" written by ABC on Tue May 16 16:07:52 2017

module pcle_cl ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s,
    t, u, v, w, x, y, z, a0, b0  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s;
  output t, u, v, w, x, y, z, a0, b0;
  wire n29, n30, n31, n32, n33, n34, n35, n36, n37, n39, n40, n42, n43, n44,
    n45, n46, n48, n49, n50, n51, n52, n53, n55, n56, n57, n58, n59, n60,
    n62, n63, n64, n65, n66, n67, n69, n70, n71, n72, n73, n74, n76, n77,
    n78, n79, n80, n81, n83, n84, n85, n86, n87, n88;
  assign n29 = ~i & j;
  assign n30 = ~k & n29;
  assign n31 = l & m;
  assign n32 = n & n31;
  assign n33 = o & n32;
  assign n34 = p & n33;
  assign n35 = q & n34;
  assign n36 = r & n35;
  assign n37 = s & n36;
  assign t = n30 & n37;
  assign n39 = ~l & n30;
  assign n40 = a & i;
  assign u = n39 | n40;
  assign n42 = l & n30;
  assign n43 = ~m & n42;
  assign n44 = m & n39;
  assign n45 = b & i;
  assign n46 = ~n44 & ~n45;
  assign v = n43 | ~n46;
  assign n48 = n & n30;
  assign n49 = ~n31 & n48;
  assign n50 = ~n & n30;
  assign n51 = n31 & n50;
  assign n52 = c & i;
  assign n53 = ~n51 & ~n52;
  assign w = n49 | ~n53;
  assign n55 = o & n30;
  assign n56 = ~n32 & n55;
  assign n57 = ~o & n30;
  assign n58 = n32 & n57;
  assign n59 = d & i;
  assign n60 = ~n58 & ~n59;
  assign x = n56 | ~n60;
  assign n62 = p & n30;
  assign n63 = ~n33 & n62;
  assign n64 = ~p & n30;
  assign n65 = n33 & n64;
  assign n66 = e & i;
  assign n67 = ~n65 & ~n66;
  assign y = n63 | ~n67;
  assign n69 = q & n30;
  assign n70 = ~n34 & n69;
  assign n71 = ~q & n30;
  assign n72 = n34 & n71;
  assign n73 = f & i;
  assign n74 = ~n72 & ~n73;
  assign z = n70 | ~n74;
  assign n76 = r & n30;
  assign n77 = ~n35 & n76;
  assign n78 = ~r & n30;
  assign n79 = n35 & n78;
  assign n80 = g & i;
  assign n81 = ~n79 & ~n80;
  assign a0 = n77 | ~n81;
  assign n83 = s & n30;
  assign n84 = ~n36 & n83;
  assign n85 = ~s & n30;
  assign n86 = n36 & n85;
  assign n87 = h & i;
  assign n88 = ~n86 & ~n87;
  assign b0 = n84 | ~n88;
endmodule


