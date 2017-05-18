// Benchmark "CM151" written by ABC on Tue May 16 16:07:47 2017

module CM151 ( 
    a, b, c, d, e, f, g, h, i, j, k, l,
    m, n  );
  input  a, b, c, d, e, f, g, h, i, j, k, l;
  output m, n;
  wire n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
    n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
    n43, n44, n45, n46, n47, n48, n49;
  assign n15 = ~g & ~i;
  assign n16 = ~h & i;
  assign n17 = ~g & ~h;
  assign n18 = ~n16 & ~n17;
  assign n19 = ~n15 & n18;
  assign n20 = ~e & ~i;
  assign n21 = ~f & i;
  assign n22 = ~e & ~f;
  assign n23 = ~n21 & ~n22;
  assign n24 = ~n20 & n23;
  assign n25 = n19 & n24;
  assign n26 = ~j & n24;
  assign n27 = j & n19;
  assign n28 = ~n26 & ~n27;
  assign n29 = ~n25 & n28;
  assign n30 = ~c & ~i;
  assign n31 = ~d & i;
  assign n32 = ~c & ~d;
  assign n33 = ~n31 & ~n32;
  assign n34 = ~n30 & n33;
  assign n35 = ~a & ~i;
  assign n36 = ~b & i;
  assign n37 = ~a & ~b;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~n35 & n38;
  assign n40 = n34 & n39;
  assign n41 = ~j & n39;
  assign n42 = j & n34;
  assign n43 = ~n41 & ~n42;
  assign n44 = ~n40 & n43;
  assign n45 = n29 & n44;
  assign n46 = ~k & n44;
  assign n47 = k & n29;
  assign n48 = ~n46 & ~n47;
  assign n49 = ~n45 & n48;
  assign m = ~l & n49;
  assign n = ~m;
endmodule


