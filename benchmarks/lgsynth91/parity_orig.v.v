// Benchmark "PARITYFDS" written by ABC on Tue May 16 16:07:51 2017

module PARITYFDS ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
    q  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  output q;
  wire n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
    n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
    n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
    n60, n61;
  assign n18 = ~a & b;
  assign n19 = a & ~b;
  assign n20 = ~n18 & ~n19;
  assign n21 = ~c & d;
  assign n22 = c & ~d;
  assign n23 = ~n21 & ~n22;
  assign n24 = n20 & ~n23;
  assign n25 = ~n20 & n23;
  assign n26 = ~n24 & ~n25;
  assign n27 = ~e & f;
  assign n28 = e & ~f;
  assign n29 = ~n27 & ~n28;
  assign n30 = ~g & h;
  assign n31 = g & ~h;
  assign n32 = ~n30 & ~n31;
  assign n33 = n29 & ~n32;
  assign n34 = ~n29 & n32;
  assign n35 = ~n33 & ~n34;
  assign n36 = n26 & ~n35;
  assign n37 = ~n26 & n35;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~i & j;
  assign n40 = i & ~j;
  assign n41 = ~n39 & ~n40;
  assign n42 = ~k & l;
  assign n43 = k & ~l;
  assign n44 = ~n42 & ~n43;
  assign n45 = n41 & ~n44;
  assign n46 = ~n41 & n44;
  assign n47 = ~n45 & ~n46;
  assign n48 = ~m & n;
  assign n49 = m & ~n;
  assign n50 = ~n48 & ~n49;
  assign n51 = ~o & p;
  assign n52 = o & ~p;
  assign n53 = ~n51 & ~n52;
  assign n54 = n50 & ~n53;
  assign n55 = ~n50 & n53;
  assign n56 = ~n54 & ~n55;
  assign n57 = n47 & ~n56;
  assign n58 = ~n47 & n56;
  assign n59 = ~n57 & ~n58;
  assign n60 = n38 & ~n59;
  assign n61 = ~n38 & n59;
  assign q = n60 | n61;
endmodule


