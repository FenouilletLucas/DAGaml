// Benchmark "cordic" written by ABC on Tue May 16 16:07:48 2017

module cordic ( 
    ex0, ex1, ex2, ey0, ey1, ey2, v, x0, x1, x2, x3, y0, y1, y2, y3, z0,
    z1, z2, a2, a3, a4, a5, a6,
    dn, d  );
  input  ex0, ex1, ex2, ey0, ey1, ey2, v, x0, x1, x2, x3, y0, y1, y2, y3,
    z0, z1, z2, a2, a3, a4, a5, a6;
  output dn, d;
  wire n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
    n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
    n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
    n68, n69, n70, n71, n72, n73, n74, n75, n77, n78, n79, n80, n81, n82,
    n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
    n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108;
  assign n26 = z1 & z2;
  assign n27 = ~z0 & ~n26;
  assign n28 = ~z1 & ~z2;
  assign n29 = z0 & ~n28;
  assign n30 = ~n27 & ~n29;
  assign n31 = ~y2 & y3;
  assign n32 = y2 & ~y3;
  assign n33 = ~n31 & ~n32;
  assign n34 = y0 & y1;
  assign n35 = ~y0 & ~y1;
  assign n36 = ~n34 & ~n35;
  assign n37 = ~n33 & n36;
  assign n38 = n33 & ~n36;
  assign n39 = ~n37 & ~n38;
  assign n40 = ey0 & ey1;
  assign n41 = ey2 & n40;
  assign n42 = ~ey0 & ~ey2;
  assign n43 = ~ey1 & n42;
  assign n44 = ~n41 & ~n43;
  assign n45 = ex0 & ex1;
  assign n46 = ex2 & n45;
  assign n47 = ~ex0 & ~ex2;
  assign n48 = ~ex1 & n47;
  assign n49 = ~n46 & ~n48;
  assign n50 = ~n44 & ~n49;
  assign n51 = ~x2 & x3;
  assign n52 = x2 & ~x3;
  assign n53 = ~n51 & ~n52;
  assign n54 = x0 & x1;
  assign n55 = ~x0 & ~x1;
  assign n56 = ~n54 & ~n55;
  assign n57 = ~n53 & n56;
  assign n58 = n53 & ~n56;
  assign n59 = ~n57 & ~n58;
  assign n60 = n50 & ~n59;
  assign n61 = ~n39 & n60;
  assign n62 = ~n30 & n61;
  assign n63 = ~a4 & a6;
  assign n64 = a3 & n63;
  assign n65 = ~a2 & n64;
  assign n66 = a4 & a6;
  assign n67 = ~a3 & n66;
  assign n68 = ~a2 & n67;
  assign n69 = ~n65 & ~n68;
  assign n70 = ~n62 & n69;
  assign n71 = ~v & ~n70;
  assign n72 = ~a2 & ~a5;
  assign n73 = ~a4 & ~a6;
  assign n74 = ~a3 & n73;
  assign n75 = n72 & n74;
  assign dn = n71 | n75;
  assign n77 = ~x0 & x1;
  assign n78 = x0 & ~x1;
  assign n79 = ~n77 & ~n78;
  assign n80 = n53 & ~n79;
  assign n81 = ~y0 & y1;
  assign n82 = y0 & ~y1;
  assign n83 = ~n81 & ~n82;
  assign n84 = ~n33 & n83;
  assign n85 = ~n53 & n79;
  assign n86 = ~z0 & z1;
  assign n87 = z2 & n86;
  assign n88 = z0 & ~z1;
  assign n89 = ~z2 & n88;
  assign n90 = n33 & ~n83;
  assign n91 = ~n89 & ~n90;
  assign n92 = ~n87 & n91;
  assign n93 = ~n85 & n92;
  assign n94 = ~n84 & n93;
  assign n95 = ~n80 & n94;
  assign n96 = ~n65 & ~n95;
  assign n97 = ~ey1 & ~n42;
  assign n98 = ~ex1 & ~n47;
  assign n99 = ex0 & ex2;
  assign n100 = ex1 & ~n99;
  assign n101 = ~n98 & ~n100;
  assign n102 = ey0 & ey2;
  assign n103 = ey1 & ~n102;
  assign n104 = n101 & ~n103;
  assign n105 = ~n97 & n104;
  assign n106 = ~n96 & n105;
  assign n107 = ~n68 & ~n106;
  assign n108 = ~v & ~n107;
  assign d = ~n75 & ~n108;
endmodule


