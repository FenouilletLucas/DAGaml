// Benchmark "CM162" written by ABC on Tue May 16 16:07:47 2017

module CM162 ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n,
    o, p, q, r, s  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n;
  output o, p, q, r, s;
  wire n20, n21, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
    n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n50,
    n51, n52, n53, n54, n55, n56, n57, n59, n60, n61, n62, n63, n64, n65,
    n66, n67;
  assign n20 = ~d & f;
  assign n21 = e & j;
  assign s = n & n21;
  assign n23 = d & f;
  assign n24 = ~s & n23;
  assign n25 = ~c & d;
  assign n26 = f & n25;
  assign n27 = ~n24 & ~n26;
  assign n28 = c & d;
  assign n29 = e & n28;
  assign n30 = i & n29;
  assign n31 = ~i & ~n29;
  assign n32 = ~n30 & ~n31;
  assign n33 = ~n20 & n27;
  assign n34 = ~n20 & n32;
  assign n35 = ~a & n27;
  assign n36 = ~a & n32;
  assign n37 = ~n35 & ~n36;
  assign n38 = ~n34 & n37;
  assign o = n33 | ~n38;
  assign n40 = ~i & ~k;
  assign n41 = n29 & n40;
  assign n42 = k & ~n32;
  assign n43 = i & k;
  assign n44 = ~n27 & ~n41;
  assign n45 = ~n43 & n44;
  assign n46 = ~n42 & n45;
  assign n47 = ~n20 & ~n46;
  assign n48 = ~b & ~n46;
  assign p = n47 | n48;
  assign n50 = l & n41;
  assign n51 = ~l & ~n41;
  assign n52 = ~n50 & ~n51;
  assign n53 = ~n20 & n52;
  assign n54 = ~g & n52;
  assign n55 = ~g & n27;
  assign n56 = ~n54 & ~n55;
  assign n57 = ~n33 & n56;
  assign q = n53 | ~n57;
  assign n59 = ~l & n41;
  assign n60 = m & n59;
  assign n61 = ~m & ~n59;
  assign n62 = ~n60 & ~n61;
  assign n63 = ~n20 & n62;
  assign n64 = ~h & n62;
  assign n65 = ~h & n27;
  assign n66 = ~n64 & ~n65;
  assign n67 = ~n33 & n66;
  assign r = n63 | ~n67;
endmodule


