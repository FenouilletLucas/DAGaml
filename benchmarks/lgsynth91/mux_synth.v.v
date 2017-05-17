// Benchmark "mux" written by ABC on Tue May 16 16:07:51 2017

module mux ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  output v;
  wire n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
    n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
    n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
    n65, n66, n67, n68;
  assign n23 = s & ~t;
  assign n24 = ~s & t;
  assign n25 = ~s & ~t;
  assign n26 = s & t;
  assign n27 = ~b & n23;
  assign n28 = ~c & n24;
  assign n29 = ~d & n25;
  assign n30 = ~a & n26;
  assign n31 = ~n29 & ~n30;
  assign n32 = ~n28 & n31;
  assign n33 = ~n27 & n32;
  assign n34 = ~f & n23;
  assign n35 = ~g & n24;
  assign n36 = ~h & n25;
  assign n37 = ~e & n26;
  assign n38 = ~n36 & ~n37;
  assign n39 = ~n35 & n38;
  assign n40 = ~n34 & n39;
  assign n41 = ~j & n23;
  assign n42 = ~k & n24;
  assign n43 = ~l & n25;
  assign n44 = ~i & n26;
  assign n45 = ~n43 & ~n44;
  assign n46 = ~n42 & n45;
  assign n47 = ~n41 & n46;
  assign n48 = ~n & n23;
  assign n49 = ~o & n24;
  assign n50 = ~p & n25;
  assign n51 = ~m & n26;
  assign n52 = ~n50 & ~n51;
  assign n53 = ~n49 & n52;
  assign n54 = ~n48 & n53;
  assign n55 = q & r;
  assign n56 = u & n55;
  assign n57 = n33 & n56;
  assign n58 = q & ~r;
  assign n59 = u & n58;
  assign n60 = n40 & n59;
  assign n61 = ~q & r;
  assign n62 = u & n61;
  assign n63 = n47 & n62;
  assign n64 = ~q & ~r;
  assign n65 = u & n64;
  assign n66 = n54 & n65;
  assign n67 = ~n63 & ~n66;
  assign n68 = ~n60 & n67;
  assign v = n57 | ~n68;
endmodule


