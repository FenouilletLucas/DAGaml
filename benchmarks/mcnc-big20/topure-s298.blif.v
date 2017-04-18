// Benchmark "s298.bench" written by ABC on Sun Apr 24 20:32:15 2016

module \s298.bench  ( clock, 
    G0, G1, G2,
    G117, G132, G66, G118, G133, G67  );
  input  clock;
  input  G0, G1, G2;
  output G117, G132, G66, G118, G133, G67;
  reg G10, G11, G12, G13, G14, G15, G16, G17, G18, G19, G20, G21, G22, G23;
  wire n53, n54, n55_1, n56, n57, n59, n60_1, n61, n62, n64, n65_1, n66, n67,
    n68, n69, n71, n72, n73, n74, n75_1, n77, n78, n79, n80_1, n81, n82,
    n83, n84, n85_1, n87, n88, n89, n90, n91, n93, n94, n95, n96, n97, n98,
    n99, n101, n103, n104, n105, n107, n108, n109, n111, n112, n113, n114,
    n116, n117, n118, n120, n121, n122, n20, n25, n30, n35, n40, n45, n50,
    n55, n60, n65, n70, n75, n80, n85;
  assign n20 = ~G0 & ~G10;
  assign n53 = ~G12 & G13;
  assign n54 = G10 & ~n53;
  assign n55_1 = ~G11 & ~n54;
  assign n56 = G10 & G11;
  assign n57 = ~G0 & ~n56;
  assign n25 = ~n55_1 & n57;
  assign n59 = G11 & G12;
  assign n60_1 = G10 & n59;
  assign n61 = ~G12 & ~n56;
  assign n62 = ~G0 & ~n61;
  assign n30 = ~n60_1 & n62;
  assign n64 = G13 & n60_1;
  assign n65_1 = ~G13 & ~n60_1;
  assign n66 = ~n64 & ~n65_1;
  assign n67 = G10 & ~G11;
  assign n68 = ~G12 & n67;
  assign n69 = ~G0 & ~n68;
  assign n35 = n66 & n69;
  assign n71 = n53 & n67;
  assign n72 = ~G23 & ~n71;
  assign n73 = G14 & ~n72;
  assign n74 = ~G14 & n72;
  assign n75_1 = ~G0 & ~n74;
  assign n40 = ~n73 & n75_1;
  assign n77 = ~G11 & ~G14;
  assign n78 = n53 & n77;
  assign n79 = G22 & n78;
  assign n80_1 = ~G15 & ~n79;
  assign n81 = G13 & ~G14;
  assign n82 = G11 & n81;
  assign n83 = ~G12 & n82;
  assign n84 = ~G22 & n83;
  assign n85_1 = ~n80_1 & ~n84;
  assign n45 = ~G0 & n85_1;
  assign n87 = G14 & ~G16;
  assign n88 = ~G12 & ~G13;
  assign n89 = ~G13 & ~G14;
  assign n90 = ~n88 & ~n89;
  assign n91 = ~n85_1 & n90;
  assign n50 = ~n87 & n91;
  assign n93 = ~G14 & n59;
  assign n94 = G14 & n88;
  assign n95 = ~G11 & n94;
  assign n96 = ~n85_1 & ~n95;
  assign n97 = ~n81 & n96;
  assign n98 = ~G17 & n90;
  assign n99 = n97 & ~n98;
  assign n55 = ~n93 & n99;
  assign n101 = ~G18 & n90;
  assign n60 = n97 & ~n101;
  assign n103 = G10 & n85_1;
  assign n104 = G19 & n90;
  assign n105 = n97 & ~n104;
  assign n65 = ~n103 & ~n105;
  assign n107 = G20 & ~n88;
  assign n108 = G14 & n107;
  assign n109 = n96 & ~n108;
  assign n70 = ~n103 & ~n109;
  assign n111 = G14 & ~G21;
  assign n112 = ~n81 & ~n111;
  assign n113 = ~n77 & ~n88;
  assign n114 = n112 & n113;
  assign n75 = ~n85_1 & n114;
  assign n116 = G2 & G22;
  assign n117 = ~G2 & ~G22;
  assign n118 = ~n116 & ~n117;
  assign n80 = ~G0 & n118;
  assign n120 = G1 & G23;
  assign n121 = ~G1 & ~G23;
  assign n122 = ~n120 & ~n121;
  assign n85 = ~G0 & n122;
  assign G117 = G18;
  assign G132 = G20;
  assign G66 = G16;
  assign G118 = G19;
  assign G133 = G21;
  assign G67 = G17;
  always @ (posedge clock) begin
    G10 <= n20;
    G11 <= n25;
    G12 <= n30;
    G13 <= n35;
    G14 <= n40;
    G15 <= n45;
    G16 <= n50;
    G17 <= n55;
    G18 <= n60;
    G19 <= n65;
    G20 <= n70;
    G21 <= n75;
    G22 <= n80;
    G23 <= n85;
  end
  initial begin
    G10 <= 1'b0;
    G11 <= 1'b0;
    G12 <= 1'b0;
    G13 <= 1'b0;
    G14 <= 1'b0;
    G15 <= 1'b0;
    G16 <= 1'b0;
    G17 <= 1'b0;
    G18 <= 1'b0;
    G19 <= 1'b0;
    G20 <= 1'b0;
    G21 <= 1'b0;
    G22 <= 1'b0;
    G23 <= 1'b0;
  end
endmodule


