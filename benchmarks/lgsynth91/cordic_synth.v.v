// Benchmark "cordic" written by ABC on Tue May 16 16:07:48 2017

module cordic ( 
    z0, z1, z2, v, ex0, ex1, ex2, ey0, ey1, ey2, a2, a3, a4, a5, a6, x0,
    x1, x2, x3, y0, y1, y2, y3,
    dn, d  );
  input  z0, z1, z2, v, ex0, ex1, ex2, ey0, ey1, ey2, a2, a3, a4, a5, a6,
    x0, x1, x2, x3, y0, y1, y2, y3;
  output dn, d;
  wire n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
    n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
    n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
    n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
    n82, n83, n84, n86, n87;
  assign n26 = y2 & ~y3;
  assign n27 = ~y2 & y3;
  assign n28 = ~n26 & ~n27;
  assign n29 = ~y0 & ~y1;
  assign n30 = y0 & y1;
  assign n31 = ~n29 & ~n30;
  assign n32 = x2 & ~x3;
  assign n33 = ~x2 & x3;
  assign n34 = ~n32 & ~n33;
  assign n35 = ~x0 & ~x1;
  assign n36 = x0 & x1;
  assign n37 = ~n35 & ~n36;
  assign n38 = z0 & ~z1;
  assign n39 = ~z2 & n38;
  assign n40 = ~z0 & z1;
  assign n41 = z2 & n40;
  assign n42 = n28 & n31;
  assign n43 = ~n28 & ~n31;
  assign n44 = n34 & n37;
  assign n45 = ~n34 & ~n37;
  assign n46 = ~n44 & ~n45;
  assign n47 = ~n43 & n46;
  assign n48 = ~n42 & n47;
  assign n49 = ~n41 & n48;
  assign n50 = ~n39 & n49;
  assign n51 = ~ex0 & ~ex1;
  assign n52 = ~ex2 & n51;
  assign n53 = ~ey0 & n52;
  assign n54 = ~ey1 & n53;
  assign n55 = ~ey2 & n54;
  assign n56 = ex0 & ex1;
  assign n57 = ex2 & n56;
  assign n58 = ~ey0 & n57;
  assign n59 = ~ey1 & n58;
  assign n60 = ~ey2 & n59;
  assign n61 = ey0 & n52;
  assign n62 = ey1 & n61;
  assign n63 = ey2 & n62;
  assign n64 = ey0 & n57;
  assign n65 = ey1 & n64;
  assign n66 = ey2 & n65;
  assign n67 = ~n63 & ~n66;
  assign n68 = ~n60 & n67;
  assign n69 = ~n55 & n68;
  assign n70 = a4 & a6;
  assign n71 = ~a3 & n70;
  assign n72 = ~a2 & n71;
  assign n73 = ~a4 & a6;
  assign n74 = a3 & n73;
  assign n75 = ~a2 & n74;
  assign n76 = ~n72 & ~n75;
  assign n77 = ~a4 & ~a6;
  assign n78 = ~a3 & n77;
  assign n79 = ~a2 & n78;
  assign n80 = ~a5 & n79;
  assign n81 = ~v & ~n69;
  assign n82 = n50 & n81;
  assign n83 = ~v & ~n76;
  assign n84 = ~n80 & ~n83;
  assign dn = n82 | ~n84;
  assign n86 = n69 & ~n72;
  assign n87 = ~n76 & n86;
  assign d = ~dn | n87;
endmodule


