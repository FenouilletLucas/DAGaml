// Benchmark "CM163" written by ABC on Tue May 16 16:07:47 2017

module CM163 ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
    q, r, s, t, u  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  output q, r, s, t, u;
  wire n22, n23, n24, n25, n26, n27, n28, n30, n31, n32, n33, n34, n35, n36,
    n38, n39, n40, n41, n42, n43, n44, n46, n47, n48, n49, n50, n51, n52,
    n53, n55, n56, n57;
  assign n22 = c & d;
  assign n23 = j & n22;
  assign n24 = ~j & ~n22;
  assign n25 = ~n23 & ~n24;
  assign n26 = e & n25;
  assign n27 = ~a & ~e;
  assign n28 = f & ~n27;
  assign q = n26 | ~n28;
  assign n30 = ~j & n25;
  assign n31 = l & n30;
  assign n32 = ~l & ~n30;
  assign n33 = ~n31 & ~n32;
  assign n34 = e & n33;
  assign n35 = ~b & ~e;
  assign n36 = f & ~n35;
  assign r = n34 | ~n36;
  assign n38 = ~l & n33;
  assign n39 = m & n38;
  assign n40 = ~m & ~n38;
  assign n41 = ~n39 & ~n40;
  assign n42 = e & n41;
  assign n43 = ~e & ~g;
  assign n44 = f & ~n43;
  assign s = n42 | ~n44;
  assign n46 = ~m & n41;
  assign n47 = e & ~n;
  assign n48 = n46 & n47;
  assign n49 = e & n;
  assign n50 = ~n46 & n49;
  assign n51 = ~e & ~h;
  assign n52 = f & ~n51;
  assign n53 = ~n50 & n52;
  assign t = n48 | ~n53;
  assign n55 = d & i;
  assign n56 = k & n55;
  assign n57 = o & n56;
  assign u = p & n57;
endmodule


