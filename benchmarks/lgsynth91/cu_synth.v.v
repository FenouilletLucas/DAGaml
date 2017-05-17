// Benchmark "cu" written by ABC on Tue May 16 16:07:48 2017

module cu ( 
    a, b, c, d, e, f, g, i, j, k, l, m, n, o,
    p, q, r, s, t, u, v, w, x, y, z  );
  input  a, b, c, d, e, f, g, i, j, k, l, m, n, o;
  output p, q, r, s, t, u, v, w, x, y, z;
  wire n26, n27, n28, n29, n30, n31, n33, n35, n37, n39, n41, n43, n44, n45,
    n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n60,
    n61, n62, n63, n66, n67, n68;
  assign n26 = ~c & ~d;
  assign n27 = c & ~d;
  assign n28 = e & n27;
  assign n29 = ~f & n28;
  assign n30 = ~e & f;
  assign n31 = n26 & n30;
  assign p = ~n29 & ~n31;
  assign n33 = ~o & ~p;
  assign w = f & n33;
  assign n35 = ~a & ~b;
  assign r = w & n35;
  assign n37 = a & b;
  assign u = w & n37;
  assign n39 = a & ~u;
  assign s = w & n39;
  assign n41 = b & ~u;
  assign t = w & n41;
  assign n43 = m & n37;
  assign n44 = ~a & b;
  assign n45 = l & n44;
  assign n46 = a & ~b;
  assign n47 = k & n46;
  assign n48 = j & n35;
  assign n49 = f & ~i;
  assign n50 = ~n & n49;
  assign n51 = o & n50;
  assign n52 = ~n48 & n51;
  assign n53 = ~n47 & n52;
  assign n54 = ~n45 & n53;
  assign n55 = ~n43 & n54;
  assign n56 = e & n55;
  assign n57 = n26 & n56;
  assign n58 = ~f & n33;
  assign v = n57 | n58;
  assign n60 = f & ~n;
  assign n61 = o & n60;
  assign n62 = p & n61;
  assign n63 = n26 & n62;
  assign x = n58 | n63;
  assign y = g & o;
  assign n66 = ~d & ~f;
  assign n67 = g & n66;
  assign n68 = g & n26;
  assign z = n67 | n68;
  assign q = ~p;
endmodule


