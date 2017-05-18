// Benchmark "CM163" written by ABC on Tue May 16 16:07:47 2017

module CM163 ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
    q, r, s, t, u  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  output q, r, s, t, u;
  wire n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n35, n36,
    n37, n38, n39, n40, n41, n42, n43, n45, n46, n47, n48, n49, n50, n51,
    n52, n53, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n67,
    n68, n69;
  assign n22 = e & f;
  assign n23 = ~e & f;
  assign n24 = c & d;
  assign n25 = j & n24;
  assign n26 = ~j & ~n24;
  assign n27 = ~n25 & ~n26;
  assign n28 = ~n22 & ~n23;
  assign n29 = ~a & ~n22;
  assign n30 = ~a & n27;
  assign n31 = ~n23 & n27;
  assign n32 = ~n30 & ~n31;
  assign n33 = ~n29 & n32;
  assign q = n28 | ~n33;
  assign n35 = ~j & n24;
  assign n36 = ~l & ~n35;
  assign n37 = l & n35;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~b & ~n22;
  assign n40 = ~b & n38;
  assign n41 = ~n23 & n38;
  assign n42 = ~n40 & ~n41;
  assign n43 = ~n39 & n42;
  assign r = n28 | ~n43;
  assign n45 = ~l & n35;
  assign n46 = ~m & ~n45;
  assign n47 = m & n45;
  assign n48 = ~n46 & ~n47;
  assign n49 = ~g & ~n22;
  assign n50 = ~g & n48;
  assign n51 = ~n23 & n48;
  assign n52 = ~n50 & ~n51;
  assign n53 = ~n49 & n52;
  assign s = n28 | ~n53;
  assign n55 = ~m & n24;
  assign n56 = ~j & n55;
  assign n57 = ~l & n56;
  assign n58 = ~n & ~n57;
  assign n59 = n & n57;
  assign n60 = ~n58 & ~n59;
  assign n61 = ~h & ~n22;
  assign n62 = ~h & n60;
  assign n63 = ~n23 & n60;
  assign n64 = ~n62 & ~n63;
  assign n65 = ~n61 & n64;
  assign t = n28 | ~n65;
  assign n67 = k & o;
  assign n68 = i & n67;
  assign n69 = p & n68;
  assign u = d & n69;
endmodule


