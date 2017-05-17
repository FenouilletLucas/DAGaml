// Benchmark "cu" written by ABC on Tue May 16 16:07:48 2017

module cu ( 
    a, b, c, d, e, f, g, i, j, k, l, m, n, o,
    p, q, r, s, t, u, v, w, x, y, z  );
  input  a, b, c, d, e, f, g, i, j, k, l, m, n, o;
  output p, q, r, s, t, u, v, w, x, y, z;
  wire n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n38, n39, n40,
    n41, n42, n44, n46, n47, n49, n51, n52, n53, n54, n55, n56, n57, n58,
    n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n73,
    n74, n75, n77, n78, n79, n82, n83, n84;
  assign n26 = ~e & ~f;
  assign n27 = ~c & ~f;
  assign n28 = e & f;
  assign n29 = c & f;
  assign n30 = c & ~e;
  assign n31 = ~c & e;
  assign n32 = ~n30 & ~n31;
  assign n33 = ~n29 & n32;
  assign n34 = ~n28 & n33;
  assign n35 = ~n27 & n34;
  assign n36 = ~n26 & n35;
  assign q = ~d & n36;
  assign n38 = ~c & ~d;
  assign n39 = ~b & n38;
  assign n40 = ~a & n39;
  assign n41 = f & ~o;
  assign n42 = ~e & n41;
  assign r = n40 & n42;
  assign n44 = a & n39;
  assign s = n42 & n44;
  assign n46 = b & n38;
  assign n47 = ~a & n46;
  assign t = n42 & n47;
  assign n49 = a & n46;
  assign u = n42 & n49;
  assign n51 = c & o;
  assign n52 = ~d & e;
  assign n53 = ~n51 & n52;
  assign n54 = ~n29 & n53;
  assign n55 = ~a & ~b;
  assign n56 = j & n55;
  assign n57 = f & ~n;
  assign n58 = o & n57;
  assign n59 = ~n56 & n58;
  assign n60 = ~i & n59;
  assign n61 = ~a & b;
  assign n62 = l & n61;
  assign n63 = a & b;
  assign n64 = m & n63;
  assign n65 = a & ~b;
  assign n66 = k & n65;
  assign n67 = n60 & ~n66;
  assign n68 = ~n64 & n67;
  assign n69 = ~n62 & n68;
  assign n70 = n54 & n69;
  assign n71 = c & n54;
  assign v = n70 | n71;
  assign n73 = ~e & f;
  assign n74 = ~d & n73;
  assign n75 = ~c & n74;
  assign w = ~o & n75;
  assign n77 = ~n & o;
  assign n78 = f & n77;
  assign n79 = n54 & n78;
  assign x = n71 | n79;
  assign y = g & o;
  assign n82 = ~d & ~f;
  assign n83 = g & n82;
  assign n84 = g & n38;
  assign z = n83 | n84;
  assign p = ~q;
endmodule


