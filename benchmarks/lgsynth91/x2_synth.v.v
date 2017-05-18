// Benchmark "x2" written by ABC on Tue May 16 16:07:53 2017

module x2 ( 
    a, b, c, d, e, f, g, h, i, j,
    k, l, m, n, o, p, q  );
  input  a, b, c, d, e, f, g, h, i, j;
  output k, l, m, n, o, p, q;
  wire n18, n20, n21, n22, n24, n26, n27, n28, n29, n31, n32, n34, n35, n36,
    n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
    n52, n53, n54, n55, n56, n57, n58;
  assign n18 = h & i;
  assign k = j | ~n18;
  assign n20 = h & ~j;
  assign n21 = ~h & j;
  assign n22 = ~i & ~n21;
  assign l = n20 | ~n22;
  assign n24 = ~h & ~i;
  assign m = ~j & n24;
  assign n26 = ~a & ~b;
  assign n27 = ~c & ~h;
  assign n28 = ~j & n27;
  assign n29 = ~m & n28;
  assign n = ~n26 | ~n29;
  assign n31 = i & j;
  assign n32 = g & h;
  assign o = n31 | ~n32;
  assign n34 = f & ~h;
  assign n35 = i & n34;
  assign n36 = j & n35;
  assign n37 = g & ~n36;
  assign n38 = c & h;
  assign n39 = k & n38;
  assign n40 = l & n39;
  assign n41 = n26 & n40;
  assign n42 = c & ~i;
  assign n43 = l & n42;
  assign n44 = n26 & n43;
  assign n45 = d & ~e;
  assign n46 = ~k & n45;
  assign n47 = ~i & ~j;
  assign n48 = n37 & ~n47;
  assign n49 = ~n46 & n48;
  assign n50 = ~n44 & n49;
  assign p = n41 | ~n50;
  assign n52 = ~c & h;
  assign n53 = o & n52;
  assign n54 = n26 & n53;
  assign n55 = d & e;
  assign n56 = ~k & n55;
  assign n57 = l & n37;
  assign n58 = ~n56 & n57;
  assign q = n54 | ~n58;
endmodule


