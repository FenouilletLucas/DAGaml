// Benchmark "CM85" written by ABC on Tue May 16 16:07:48 2017

module CM85 ( 
    a, b, c, d, e, f, g, h, i, j, k,
    l, m, n  );
  input  a, b, c, d, e, f, g, h, i, j, k;
  output l, m, n;
  wire n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
    n29, n30, n31, n32, n33, n34, n35, n36, n37, n39, n40, n41, n42, n44,
    n45, n46, n47, n48, n49, n50, n51, n52, n53;
  assign n15 = d & ~e;
  assign n16 = ~d & e;
  assign n17 = b & ~n16;
  assign n18 = ~n15 & n17;
  assign n19 = ~f & ~g;
  assign n20 = n18 & n19;
  assign n21 = f & g;
  assign n22 = n18 & n21;
  assign n23 = ~n20 & ~n22;
  assign n24 = h & ~i;
  assign n25 = ~h & i;
  assign n26 = ~n23 & ~n25;
  assign n27 = ~n24 & n26;
  assign n28 = ~n23 & n25;
  assign n29 = ~f & g;
  assign n30 = n18 & n29;
  assign n31 = ~j & k;
  assign n32 = n27 & n31;
  assign n33 = b & ~d;
  assign n34 = e & n33;
  assign n35 = ~a & ~n34;
  assign n36 = ~n32 & n35;
  assign n37 = ~n30 & n36;
  assign l = n28 | ~n37;
  assign n39 = ~j & ~k;
  assign n40 = n27 & n39;
  assign n41 = j & k;
  assign n42 = n27 & n41;
  assign m = n40 | n42;
  assign n44 = ~n23 & n24;
  assign n45 = f & ~g;
  assign n46 = n18 & n45;
  assign n47 = j & ~k;
  assign n48 = n27 & n47;
  assign n49 = b & d;
  assign n50 = ~e & n49;
  assign n51 = ~c & ~n50;
  assign n52 = ~n48 & n51;
  assign n53 = ~n46 & n52;
  assign n = n44 | ~n53;
endmodule


