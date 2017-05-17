// Benchmark "f51m" written by ABC on Tue May 16 16:07:49 2017

module f51m ( 
    \1 , 2, 3, 4, 5, 6, 7, 8,
    44, 45, 46, 47, 48, 49, 50, 51  );
  input  \1 , 2, 3, 4, 5, 6, 7, 8;
  output 44, 45, 46, 47, 48, 49, 50, 51;
  wire n17, n18, n19, n20, n21, n22, n23, n25, n26, n28, n29, n30, n31, n32,
    n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
    n48, n49, n50, n51, n52, n53, n54, n55, n57, n58, n59, n60, n61, n62,
    n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
    n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
    n92, n93, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
    n106, n107, n108;
  assign n17 = 3 & ~5;
  assign n18 = ~3 & 5;
  assign n19 = ~n17 & ~n18;
  assign n20 = ~7 & 8;
  assign n21 = ~6 & ~7;
  assign n22 = 6 & ~n20;
  assign n23 = 8 & n21;
  assign 49 = n22 | n23;
  assign n25 = 8 & 49;
  assign n26 = 7 & ~8;
  assign 50 = n20 | n26;
  assign n28 = ~5 & 50;
  assign n29 = ~n25 & n28;
  assign n30 = 5 & ~50;
  assign n31 = 5 & n25;
  assign n32 = ~n30 & ~n31;
  assign 48 = n29 | ~n32;
  assign n34 = ~4 & ~50;
  assign n35 = ~n21 & n34;
  assign n36 = ~n25 & n35;
  assign n37 = ~4 & 6;
  assign n38 = 48 & n37;
  assign n39 = ~n25 & n38;
  assign n40 = 4 & 6;
  assign n41 = ~48 & n40;
  assign n42 = 50 & n41;
  assign n43 = 4 & ~6;
  assign n44 = 48 & n43;
  assign n45 = 50 & n44;
  assign n46 = ~4 & 7;
  assign n47 = ~48 & n46;
  assign n48 = ~49 & n47;
  assign n49 = 4 & n25;
  assign n50 = 4 & n21;
  assign n51 = ~n49 & ~n50;
  assign n52 = ~n48 & n51;
  assign n53 = ~n45 & n52;
  assign n54 = ~n42 & n53;
  assign n55 = ~n39 & n54;
  assign 47 = n36 | ~n55;
  assign n57 = 3 & 7;
  assign n58 = 49 & n57;
  assign n59 = n19 & n58;
  assign n60 = ~5 & ~8;
  assign n61 = ~49 & n60;
  assign n62 = ~n19 & n61;
  assign n63 = 3 & ~48;
  assign n64 = n20 & n63;
  assign n65 = n19 & ~50;
  assign n66 = n25 & n65;
  assign n67 = 4 & ~47;
  assign n68 = n19 & n67;
  assign n69 = ~4 & 47;
  assign n70 = ~n19 & n69;
  assign n71 = ~n19 & n21;
  assign n72 = ~n70 & ~n71;
  assign n73 = ~n68 & n72;
  assign n74 = ~n66 & n73;
  assign n75 = ~n64 & n74;
  assign n76 = ~n62 & n75;
  assign 46 = n59 | ~n76;
  assign n78 = ~5 & 46;
  assign n79 = \1  & ~3;
  assign n80 = ~\1  & 3;
  assign n81 = ~n79 & ~n80;
  assign n82 = 5 & ~46;
  assign n83 = 2 & ~4;
  assign n84 = ~2 & 4;
  assign n85 = ~n83 & ~n84;
  assign n86 = ~3 & ~n85;
  assign n87 = ~n82 & n86;
  assign n88 = 3 & n85;
  assign n89 = ~n78 & n88;
  assign n90 = n82 & n85;
  assign n91 = n78 & ~n85;
  assign n92 = ~n90 & ~n91;
  assign n93 = ~n89 & n92;
  assign 45 = n87 | ~n93;
  assign n95 = 3 & 4;
  assign n96 = n81 & n95;
  assign n97 = ~n78 & n96;
  assign n98 = 4 & n81;
  assign n99 = n82 & n98;
  assign n100 = ~2 & ~n81;
  assign n101 = n85 & n100;
  assign n102 = ~n81 & 45;
  assign n103 = ~n85 & n102;
  assign n104 = 2 & ~45;
  assign n105 = n81 & n104;
  assign n106 = ~n103 & ~n105;
  assign n107 = ~n101 & n106;
  assign n108 = ~n99 & n107;
  assign 44 = n97 | ~n108;
  assign 51 = ~8;
endmodule


