// Benchmark "CM162" written by ABC on Tue May 16 16:07:47 2017

module CM162 ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n,
    o, p, q, r, s  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n;
  output o, p, q, r, s;
  wire n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
    n34, n35, n36, n38, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49,
    n50, n51, n52, n53, n54, n55, n56, n58, n59, n60, n61, n62, n63, n64,
    n65, n66, n67, n68;
  assign n20 = c & d;
  assign n21 = e & n20;
  assign n22 = j & n;
  assign n23 = n21 & n22;
  assign n24 = d & f;
  assign n25 = ~n23 & n24;
  assign n26 = ~d & f;
  assign n27 = ~n23 & n26;
  assign n28 = ~i & ~n21;
  assign n29 = i & n21;
  assign n30 = ~n28 & ~n29;
  assign n31 = ~n25 & ~n27;
  assign n32 = ~a & ~n25;
  assign n33 = ~a & n30;
  assign n34 = ~n27 & n30;
  assign n35 = ~n33 & ~n34;
  assign n36 = ~n32 & n35;
  assign o = n31 | ~n36;
  assign n38 = ~i & n21;
  assign n39 = ~k & ~n38;
  assign n40 = k & n38;
  assign n41 = ~n39 & ~n40;
  assign n42 = ~b & ~n25;
  assign n43 = ~b & n41;
  assign n44 = ~n27 & n41;
  assign n45 = ~n43 & ~n44;
  assign n46 = ~n42 & n45;
  assign p = n31 | ~n46;
  assign n48 = ~k & n38;
  assign n49 = ~l & ~n48;
  assign n50 = l & n48;
  assign n51 = ~n49 & ~n50;
  assign n52 = ~g & ~n25;
  assign n53 = ~g & n51;
  assign n54 = ~n27 & n51;
  assign n55 = ~n53 & ~n54;
  assign n56 = ~n52 & n55;
  assign q = n31 | ~n56;
  assign n58 = ~l & n21;
  assign n59 = ~i & n58;
  assign n60 = ~k & n59;
  assign n61 = ~m & ~n60;
  assign n62 = m & n60;
  assign n63 = ~n61 & ~n62;
  assign n64 = ~h & ~n25;
  assign n65 = ~h & n63;
  assign n66 = ~n27 & n63;
  assign n67 = ~n65 & ~n66;
  assign n68 = ~n64 & n67;
  assign r = n31 | ~n68;
  assign s = e & n22;
endmodule


