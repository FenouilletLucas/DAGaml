// Benchmark "x2" written by ABC on Tue May 16 16:07:53 2017

module x2 ( 
    a, b, c, d, e, f, g, h, i, j,
    k, l, m, n, o, p, q  );
  input  a, b, c, d, e, f, g, h, i, j;
  output k, l, m, n, o, p, q;
  wire n18, n19, n20, n21, n22, n23, n24, n25, n26, n28, n29, n30, n32, n34,
    n35, n36, n37, n38, n39, n41, n42, n43, n45, n46, n47, n48, n49, n50,
    n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n63, n64, n65,
    n66, n67, n68, n69, n70, n71, n72;
  assign n18 = ~h & j;
  assign n19 = i & j;
  assign n20 = ~h & i;
  assign n21 = h & ~i;
  assign n22 = j & n21;
  assign n23 = ~i & ~j;
  assign n24 = ~n20 & ~n22;
  assign n25 = ~n19 & n24;
  assign n26 = ~n18 & n25;
  assign k = n23 | ~n26;
  assign n28 = h & ~j;
  assign n29 = ~n19 & ~n20;
  assign n30 = ~n18 & n29;
  assign l = n28 | ~n30;
  assign n32 = ~h & ~i;
  assign m = ~j & n32;
  assign n34 = ~n22 & ~m;
  assign n35 = ~n19 & n34;
  assign n36 = ~n18 & n35;
  assign n37 = ~c & n36;
  assign n38 = ~a & n37;
  assign n39 = ~b & n38;
  assign n = n28 | ~n39;
  assign n41 = ~n20 & ~m;
  assign n42 = ~n19 & n41;
  assign n43 = ~n18 & n42;
  assign o = ~g | ~n43;
  assign n45 = f & ~h;
  assign n46 = i & n45;
  assign n47 = j & n46;
  assign n48 = ~a & n19;
  assign n49 = ~b & n48;
  assign n50 = c & n49;
  assign n51 = h & n50;
  assign n52 = ~a & ~i;
  assign n53 = ~b & n52;
  assign n54 = c & n53;
  assign n55 = ~h & n54;
  assign n56 = d & n28;
  assign n57 = ~e & n56;
  assign n58 = g & ~n47;
  assign n59 = ~n23 & n58;
  assign n60 = ~n57 & n59;
  assign n61 = ~n55 & n60;
  assign p = n51 | ~n61;
  assign n63 = e & n56;
  assign n64 = i & n63;
  assign n65 = ~a & ~b;
  assign n66 = ~c & n65;
  assign n67 = h & n66;
  assign n68 = j & n67;
  assign n69 = ~m & ~n47;
  assign n70 = ~n22 & n69;
  assign n71 = g & n70;
  assign n72 = ~n68 & n71;
  assign q = n64 | ~n72;
endmodule


