// Benchmark "cmb" written by ABC on Tue May 16 16:07:48 2017

module cmb ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
    q, r, s, t  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
  output q, r, s, t;
  wire n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n32, n33, n34, n35,
    n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
    n50, n51, n52, n53, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65;
  assign n21 = a & b;
  assign n22 = c & n21;
  assign n23 = d & n22;
  assign n24 = e & n23;
  assign n25 = f & n24;
  assign n26 = g & n25;
  assign n27 = h & n26;
  assign n28 = i & n27;
  assign n29 = j & n28;
  assign n30 = k & n29;
  assign q = l & n30;
  assign n32 = e & ~p;
  assign n33 = ~n & o;
  assign n34 = ~m & n;
  assign n35 = ~l & m;
  assign n36 = ~k & l;
  assign n37 = ~j & k;
  assign n38 = ~i & j;
  assign n39 = ~h & i;
  assign n40 = ~n38 & ~n39;
  assign n41 = ~n37 & n40;
  assign n42 = ~n36 & n41;
  assign n43 = ~n35 & n42;
  assign n44 = ~n34 & n43;
  assign n45 = ~n33 & n44;
  assign n46 = ~n32 & n45;
  assign n47 = ~f & ~g;
  assign n48 = ~h & n47;
  assign n49 = n46 & n48;
  assign n50 = e & f;
  assign n51 = g & n50;
  assign n52 = n46 & n51;
  assign n53 = ~n49 & ~n52;
  assign r = p | n53;
  assign s = ~o | n53;
  assign n56 = ~e & ~f;
  assign n57 = ~g & n56;
  assign n58 = ~h & n57;
  assign n59 = ~i & n58;
  assign n60 = ~j & n59;
  assign n61 = ~k & n60;
  assign n62 = ~l & n61;
  assign n63 = ~m & n62;
  assign n64 = ~n & n63;
  assign n65 = ~o & n64;
  assign t = ~p & n65;
endmodule


