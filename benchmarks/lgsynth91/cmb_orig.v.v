// Benchmark "cmb" written by ABC on Tue May 16 16:07:48 2017

module cmb ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
    q, r, s, t  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  output q, r, s, t;
  wire n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n32, n33, n34, n35,
    n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
    n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n64, n65,
    n66, n67, n68, n69, n70, n71, n72, n73;
  assign n21 = h & i;
  assign n22 = g & n21;
  assign n23 = f & n22;
  assign n24 = d & e;
  assign n25 = c & n24;
  assign n26 = a & b;
  assign n27 = n25 & n26;
  assign n28 = n23 & n27;
  assign n29 = k & l;
  assign n30 = j & n29;
  assign q = n28 & n30;
  assign n32 = e & ~p;
  assign n33 = ~n & o;
  assign n34 = ~m & n;
  assign n35 = ~l & m;
  assign n36 = ~n34 & ~n35;
  assign n37 = ~n33 & n36;
  assign n38 = ~n32 & n37;
  assign n39 = k & n38;
  assign n40 = ~l & n38;
  assign n41 = ~n39 & ~n40;
  assign n42 = ~j & k;
  assign n43 = ~i & j;
  assign n44 = ~h & i;
  assign n45 = ~n41 & ~n44;
  assign n46 = ~n43 & n45;
  assign n47 = ~n42 & n46;
  assign n48 = ~f & ~g;
  assign n49 = ~h & n48;
  assign n50 = n47 & n49;
  assign n51 = e & ~g;
  assign n52 = ~h & n51;
  assign n53 = n47 & n52;
  assign n54 = e & f;
  assign n55 = ~h & n54;
  assign n56 = n47 & n55;
  assign n57 = g & n54;
  assign n58 = n47 & n57;
  assign n59 = ~n56 & ~n58;
  assign n60 = ~n53 & n59;
  assign n61 = ~n50 & n60;
  assign r = p | n61;
  assign s = ~o | n61;
  assign n64 = ~l & ~m;
  assign n65 = ~k & n64;
  assign n66 = ~j & n65;
  assign n67 = ~h & ~i;
  assign n68 = ~g & n67;
  assign n69 = ~e & ~f;
  assign n70 = n68 & n69;
  assign n71 = n66 & n70;
  assign n72 = ~o & ~p;
  assign n73 = ~n & n72;
  assign t = n71 & n73;
endmodule


