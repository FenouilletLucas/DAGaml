// Benchmark "cordic" written by ABC on Tue May 16 16:07:48 2017

module cordic ( 
    v, ex0, ex1, ex2, ey0, ey1, ey2, a2, a3, a4, a5, a6, x0, x1, x2, x3,
    y0, y1, y2, y3, z0, z1, z2,
    d, dn  );
  input  v, ex0, ex1, ex2, ey0, ey1, ey2, a2, a3, a4, a5, a6, x0, x1, x2,
    x3, y0, y1, y2, y3, z0, z1, z2;
  output d, dn;
  wire n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
    n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
    n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
    n68, n69, n70, n71, n72, n73, n74, n75, n77, n78, n79, n80, n81, n82,
    n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
    n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107;
  assign n26 = ~x2 & x3;
  assign n27 = x2 & ~x3;
  assign n28 = ~n26 & ~n27;
  assign n29 = ~x0 & x1;
  assign n30 = x0 & ~x1;
  assign n31 = ~n29 & ~n30;
  assign n32 = n28 & ~n31;
  assign n33 = ~y0 & y1;
  assign n34 = y0 & ~y1;
  assign n35 = ~n33 & ~n34;
  assign n36 = ~y2 & y3;
  assign n37 = y2 & ~y3;
  assign n38 = ~n36 & ~n37;
  assign n39 = n35 & ~n38;
  assign n40 = ~n28 & n31;
  assign n41 = ~z0 & z2;
  assign n42 = z1 & n41;
  assign n43 = ~z1 & ~z2;
  assign n44 = z0 & n43;
  assign n45 = ~n35 & n38;
  assign n46 = ~n44 & ~n45;
  assign n47 = ~n42 & n46;
  assign n48 = ~n40 & n47;
  assign n49 = ~n39 & n48;
  assign n50 = ~n32 & n49;
  assign n51 = ~a4 & a6;
  assign n52 = ~a2 & n51;
  assign n53 = a3 & n52;
  assign n54 = ~n50 & ~n53;
  assign n55 = ~ey0 & ~ey2;
  assign n56 = ~ey1 & ~n55;
  assign n57 = ~ex0 & ~ex2;
  assign n58 = ~ex1 & ~n57;
  assign n59 = ex0 & ex2;
  assign n60 = ex1 & ~n59;
  assign n61 = ~n58 & ~n60;
  assign n62 = ey0 & ey2;
  assign n63 = ey1 & ~n62;
  assign n64 = n61 & ~n63;
  assign n65 = ~n56 & n64;
  assign n66 = ~n54 & n65;
  assign n67 = a4 & a6;
  assign n68 = ~a3 & n67;
  assign n69 = ~a2 & n68;
  assign n70 = ~n66 & ~n69;
  assign n71 = ~v & ~n70;
  assign n72 = ~a2 & ~a5;
  assign n73 = ~a3 & n72;
  assign n74 = ~a6 & n73;
  assign n75 = ~a4 & n74;
  assign d = ~n71 & ~n75;
  assign n77 = z1 & z2;
  assign n78 = ~z0 & ~n77;
  assign n79 = z0 & ~n43;
  assign n80 = ~n78 & ~n79;
  assign n81 = y0 & y1;
  assign n82 = ~y0 & ~y1;
  assign n83 = ~n81 & ~n82;
  assign n84 = ~n38 & n83;
  assign n85 = n38 & ~n83;
  assign n86 = ~n84 & ~n85;
  assign n87 = ey1 & ey2;
  assign n88 = ey0 & n87;
  assign n89 = ~ey1 & n55;
  assign n90 = ~n88 & ~n89;
  assign n91 = ex1 & ex2;
  assign n92 = ex0 & n91;
  assign n93 = ~ex1 & n57;
  assign n94 = ~n92 & ~n93;
  assign n95 = ~n90 & ~n94;
  assign n96 = x0 & x1;
  assign n97 = ~x0 & ~x1;
  assign n98 = ~n96 & ~n97;
  assign n99 = ~n28 & n98;
  assign n100 = n28 & ~n98;
  assign n101 = ~n99 & ~n100;
  assign n102 = n95 & ~n101;
  assign n103 = ~n86 & n102;
  assign n104 = ~n80 & n103;
  assign n105 = ~n53 & ~n69;
  assign n106 = ~n104 & n105;
  assign n107 = ~v & ~n106;
  assign dn = n75 | n107;
endmodule


