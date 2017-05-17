// Benchmark "mux_cl" written by ABC on Tue May 16 16:07:47 2017

module mux_cl ( 
    a, b, c, d, e, f, g, h, i, j, k,
    l  );
  input  a, b, c, d, e, f, g, h, i, j, k;
  output l;
  wire n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
    n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
    n41, n42;
  assign n13 = a & ~i;
  assign n14 = ~j & n13;
  assign n15 = ~k & n14;
  assign n16 = b & i;
  assign n17 = ~j & n16;
  assign n18 = ~k & n17;
  assign n19 = c & ~i;
  assign n20 = j & n19;
  assign n21 = ~k & n20;
  assign n22 = d & i;
  assign n23 = j & n22;
  assign n24 = ~k & n23;
  assign n25 = e & ~i;
  assign n26 = ~j & n25;
  assign n27 = k & n26;
  assign n28 = f & i;
  assign n29 = ~j & n28;
  assign n30 = k & n29;
  assign n31 = g & ~i;
  assign n32 = j & n31;
  assign n33 = k & n32;
  assign n34 = h & i;
  assign n35 = j & n34;
  assign n36 = k & n35;
  assign n37 = ~n33 & ~n36;
  assign n38 = ~n30 & n37;
  assign n39 = ~n27 & n38;
  assign n40 = ~n24 & n39;
  assign n41 = ~n21 & n40;
  assign n42 = ~n18 & n41;
  assign l = n15 | ~n42;
endmodule


