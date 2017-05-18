// Benchmark "CM150" written by ABC on Tue May 16 16:07:47 2017

module CM150 ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  output v;
  wire n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
    n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
    n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
    n65;
  assign n23 = q & ~r;
  assign n24 = ~q & r;
  assign n25 = ~q & ~r;
  assign n26 = q & r;
  assign n27 = n & n23;
  assign n28 = o & n24;
  assign n29 = m & n25;
  assign n30 = p & n26;
  assign n31 = ~n29 & ~n30;
  assign n32 = ~n28 & n31;
  assign n33 = ~n27 & n32;
  assign n34 = j & n23;
  assign n35 = k & n24;
  assign n36 = i & n25;
  assign n37 = l & n26;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~n35 & n38;
  assign n40 = ~n34 & n39;
  assign n41 = f & n23;
  assign n42 = g & n24;
  assign n43 = e & n25;
  assign n44 = h & n26;
  assign n45 = ~n43 & ~n44;
  assign n46 = ~n42 & n45;
  assign n47 = ~n41 & n46;
  assign n48 = b & n23;
  assign n49 = c & n24;
  assign n50 = a & n25;
  assign n51 = d & n26;
  assign n52 = ~n50 & ~n51;
  assign n53 = ~n49 & n52;
  assign n54 = ~n48 & n53;
  assign n55 = s & t;
  assign n56 = n33 & n55;
  assign n57 = ~s & t;
  assign n58 = n40 & n57;
  assign n59 = s & ~t;
  assign n60 = n47 & n59;
  assign n61 = ~s & ~t;
  assign n62 = n54 & n61;
  assign n63 = ~u & ~n62;
  assign n64 = ~n60 & n63;
  assign n65 = ~n58 & n64;
  assign v = n56 | ~n65;
endmodule


