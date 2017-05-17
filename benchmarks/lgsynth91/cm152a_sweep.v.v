// Benchmark "mux_cl" written by ABC on Tue May 16 16:07:47 2017

module mux_cl ( 
    a, b, c, d, e, f, g, h, i, j, k,
    l  );
  input  a, b, c, d, e, f, g, h, i, j, k;
  output l;
  wire n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
    n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;
  assign n13 = j & k;
  assign n14 = i & n13;
  assign n15 = h & n14;
  assign n16 = ~i & n13;
  assign n17 = g & n16;
  assign n18 = ~j & k;
  assign n19 = i & n18;
  assign n20 = f & n19;
  assign n21 = ~i & n18;
  assign n22 = e & n21;
  assign n23 = j & ~k;
  assign n24 = i & n23;
  assign n25 = d & n24;
  assign n26 = ~i & n23;
  assign n27 = c & n26;
  assign n28 = ~j & ~k;
  assign n29 = a & n28;
  assign n30 = ~i & n29;
  assign n31 = b & n28;
  assign n32 = i & n31;
  assign n33 = ~n30 & ~n32;
  assign n34 = ~n27 & n33;
  assign n35 = ~n25 & n34;
  assign n36 = ~n22 & n35;
  assign n37 = ~n20 & n36;
  assign n38 = ~n17 & n37;
  assign l = n15 | ~n38;
endmodule


