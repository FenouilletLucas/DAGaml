// Benchmark "mux" written by ABC on Tue May 16 16:07:51 2017

module mux ( 
    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u,
    v  );
  input  a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u;
  output v;
  wire n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
    n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
    n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
    n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
    n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
    n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
    n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
    n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
    n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
    n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153;
  assign n23 = ~a & ~b;
  assign n24 = ~c & n23;
  assign n25 = ~d & n24;
  assign n26 = ~d & ~s;
  assign n27 = ~t & n26;
  assign n28 = ~b & s;
  assign n29 = ~t & n28;
  assign n30 = ~b & ~d;
  assign n31 = ~t & n30;
  assign n32 = ~c & ~s;
  assign n33 = t & n32;
  assign n34 = ~a & s;
  assign n35 = t & n34;
  assign n36 = ~a & ~c;
  assign n37 = t & n36;
  assign n38 = ~c & ~d;
  assign n39 = ~s & n38;
  assign n40 = s & n23;
  assign n41 = ~n39 & ~n40;
  assign n42 = ~n37 & n41;
  assign n43 = ~n35 & n42;
  assign n44 = ~n33 & n43;
  assign n45 = ~n31 & n44;
  assign n46 = ~n29 & n45;
  assign n47 = ~n27 & n46;
  assign n48 = ~n25 & n47;
  assign n49 = ~e & ~f;
  assign n50 = ~g & n49;
  assign n51 = ~h & n50;
  assign n52 = ~h & ~s;
  assign n53 = ~t & n52;
  assign n54 = ~f & s;
  assign n55 = ~t & n54;
  assign n56 = ~f & ~h;
  assign n57 = ~t & n56;
  assign n58 = ~g & ~s;
  assign n59 = t & n58;
  assign n60 = ~e & s;
  assign n61 = t & n60;
  assign n62 = ~e & ~g;
  assign n63 = t & n62;
  assign n64 = ~g & ~h;
  assign n65 = ~s & n64;
  assign n66 = s & n49;
  assign n67 = ~n65 & ~n66;
  assign n68 = ~n63 & n67;
  assign n69 = ~n61 & n68;
  assign n70 = ~n59 & n69;
  assign n71 = ~n57 & n70;
  assign n72 = ~n55 & n71;
  assign n73 = ~n53 & n72;
  assign n74 = ~n51 & n73;
  assign n75 = ~i & ~j;
  assign n76 = ~k & n75;
  assign n77 = ~l & n76;
  assign n78 = ~l & ~s;
  assign n79 = ~t & n78;
  assign n80 = ~j & s;
  assign n81 = ~t & n80;
  assign n82 = ~j & ~l;
  assign n83 = ~t & n82;
  assign n84 = ~k & ~s;
  assign n85 = t & n84;
  assign n86 = ~i & s;
  assign n87 = t & n86;
  assign n88 = ~i & ~k;
  assign n89 = t & n88;
  assign n90 = ~k & ~l;
  assign n91 = ~s & n90;
  assign n92 = s & n75;
  assign n93 = ~n91 & ~n92;
  assign n94 = ~n89 & n93;
  assign n95 = ~n87 & n94;
  assign n96 = ~n85 & n95;
  assign n97 = ~n83 & n96;
  assign n98 = ~n81 & n97;
  assign n99 = ~n79 & n98;
  assign n100 = ~n77 & n99;
  assign n101 = ~m & ~n;
  assign n102 = ~o & n101;
  assign n103 = ~p & n102;
  assign n104 = ~p & ~s;
  assign n105 = ~t & n104;
  assign n106 = ~n & s;
  assign n107 = ~t & n106;
  assign n108 = ~n & ~p;
  assign n109 = ~t & n108;
  assign n110 = ~o & ~s;
  assign n111 = t & n110;
  assign n112 = ~m & s;
  assign n113 = t & n112;
  assign n114 = ~m & ~o;
  assign n115 = t & n114;
  assign n116 = ~o & ~p;
  assign n117 = ~s & n116;
  assign n118 = s & n101;
  assign n119 = ~n117 & ~n118;
  assign n120 = ~n115 & n119;
  assign n121 = ~n113 & n120;
  assign n122 = ~n111 & n121;
  assign n123 = ~n109 & n122;
  assign n124 = ~n107 & n123;
  assign n125 = ~n105 & n124;
  assign n126 = ~n103 & n125;
  assign n127 = n100 & n126;
  assign n128 = n74 & n127;
  assign n129 = n48 & n128;
  assign n130 = q & n74;
  assign n131 = n48 & n130;
  assign n132 = r & n100;
  assign n133 = n48 & n132;
  assign n134 = q & r;
  assign n135 = n48 & n134;
  assign n136 = ~r & n126;
  assign n137 = n74 & n136;
  assign n138 = q & ~r;
  assign n139 = n74 & n138;
  assign n140 = ~q & n126;
  assign n141 = n100 & n140;
  assign n142 = ~q & r;
  assign n143 = n100 & n142;
  assign n144 = ~q & ~r;
  assign n145 = n126 & n144;
  assign n146 = ~n143 & ~n145;
  assign n147 = ~n141 & n146;
  assign n148 = ~n139 & n147;
  assign n149 = ~n137 & n148;
  assign n150 = ~n135 & n149;
  assign n151 = ~n133 & n150;
  assign n152 = ~n131 & n151;
  assign n153 = ~n129 & n152;
  assign v = u & ~n153;
endmodule


