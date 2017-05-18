// Benchmark "CM85" written by ABC on Tue May 16 16:07:47 2017

module CM85 ( 
    a, b, c, d, e, f, g, h, i, j, k,
    l, m, n  );
  input  a, b, c, d, e, f, g, h, i, j, k;
  output l, m, n;
  wire n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
    n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n40, n41, n43, n44,
    n45, n46, n47, n48, n49, n50, n51, n52, n53;
  assign n15 = ~j & k;
  assign n16 = ~h & ~i;
  assign n17 = h & i;
  assign n18 = ~n16 & ~n17;
  assign n19 = f & ~g;
  assign n20 = ~f & g;
  assign n21 = ~n19 & ~n20;
  assign n22 = ~d & ~e;
  assign n23 = d & e;
  assign n24 = ~n22 & ~n23;
  assign n25 = b & ~n24;
  assign n26 = n21 & n25;
  assign n27 = ~n18 & n26;
  assign n28 = ~d & e;
  assign n29 = ~a & ~n28;
  assign n30 = ~a & ~b;
  assign n31 = ~n29 & ~n30;
  assign n32 = n20 & n25;
  assign n33 = ~n31 & ~n32;
  assign n34 = ~h & i;
  assign n35 = n33 & ~n34;
  assign n36 = ~n26 & n33;
  assign n37 = ~n35 & ~n36;
  assign n38 = n15 & n27;
  assign l = n37 | n38;
  assign n40 = j & ~k;
  assign n41 = ~n15 & ~n40;
  assign m = n27 & n41;
  assign n43 = d & ~e;
  assign n44 = ~c & ~n43;
  assign n45 = ~b & ~c;
  assign n46 = ~n44 & ~n45;
  assign n47 = n19 & n25;
  assign n48 = ~n46 & ~n47;
  assign n49 = h & ~i;
  assign n50 = n48 & ~n49;
  assign n51 = ~n26 & n48;
  assign n52 = ~n50 & ~n51;
  assign n53 = n27 & n40;
  assign n = n52 | n53;
endmodule


