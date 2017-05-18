// Benchmark "CM151" written by ABC on Tue May 16 16:07:47 2017

module CM151 ( 
    a, b, c, d, e, f, g, h, i, j, k, l,
    m, n  );
  input  a, b, c, d, e, f, g, h, i, j, k, l;
  output m, n;
  wire n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
    n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;
  assign n15 = a & ~i;
  assign n16 = ~j & n15;
  assign n17 = b & i;
  assign n18 = ~j & n17;
  assign n19 = c & ~i;
  assign n20 = j & n19;
  assign n21 = d & i;
  assign n22 = j & n21;
  assign n23 = ~n20 & ~n22;
  assign n24 = ~n18 & n23;
  assign n25 = ~n16 & n24;
  assign n26 = e & ~i;
  assign n27 = ~j & n26;
  assign n28 = f & i;
  assign n29 = ~j & n28;
  assign n30 = g & ~i;
  assign n31 = j & n30;
  assign n32 = h & i;
  assign n33 = j & n32;
  assign n34 = ~n31 & ~n33;
  assign n35 = ~n29 & n34;
  assign n36 = ~n27 & n35;
  assign n37 = ~k & ~l;
  assign n38 = ~n25 & n37;
  assign n39 = k & ~l;
  assign n40 = ~n36 & n39;
  assign n = ~n38 & ~n40;
  assign m = ~n;
endmodule


