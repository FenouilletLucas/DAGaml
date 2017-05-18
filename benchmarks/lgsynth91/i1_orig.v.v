// Benchmark "i1" written by ABC on Tue May 16 16:07:49 2017

module i1 ( 
    V18_0, \IN-V27_0 , V10_0, \IN-V27_3 , V17_0, V16_0, V9_0, V15_0, V8_0,
    V14_0, V7_1, V7_2, V7_3, V7_4, V7_5, V7_6, V7_7, V13_0, V22_2, V22_3,
    V22_4, V22_5, \IN-V29_0 , V12_0, V11_0,
    V38_0, V30_0, V28_0, V37_0, V27_0, V27_1, V27_2, V27_3, V27_4, V36_0,
    V35_0, V34_0, V33_0, V32_0, V31_0, V29_0  );
  input  V18_0, \IN-V27_0 , V10_0, \IN-V27_3 , V17_0, V16_0, V9_0, V15_0,
    V8_0, V14_0, V7_1, V7_2, V7_3, V7_4, V7_5, V7_6, V7_7, V13_0, V22_2,
    V22_3, V22_4, V22_5, \IN-V29_0 , V12_0, V11_0;
  output V38_0, V30_0, V28_0, V37_0, V27_0, V27_1, V27_2, V27_3, V27_4, V36_0,
    V35_0, V34_0, V33_0, V32_0, V31_0, V29_0;
  wire n42, n43, n46, n47, n48, n49, n50, n51, n52, n53, n56, n57, n58, n59,
    n60, n61, n63, n64, n65, n66, n67, n70, n72, n77;
  assign n42 = ~V15_0 & ~V13_0;
  assign n43 = ~V12_0 & n42;
  assign V38_0 = V14_0 | ~n43;
  assign V30_0 = V18_0 & V22_5;
  assign n46 = ~V7_5 & ~V7_7;
  assign n47 = ~V7_3 & n46;
  assign n48 = ~V7_1 & n47;
  assign n49 = ~V7_2 & n48;
  assign n50 = ~V7_4 & n49;
  assign n51 = ~V7_6 & n50;
  assign n52 = ~V8_0 & \IN-V29_0 ;
  assign n53 = n51 & n52;
  assign V28_0 = V10_0 | n53;
  assign V37_0 = V16_0 & ~V22_5;
  assign n56 = ~V9_0 & n53;
  assign n57 = ~\IN-V27_0  & \IN-V29_0 ;
  assign n58 = V9_0 & n51;
  assign n59 = \IN-V29_0  & n58;
  assign n60 = V8_0 & n59;
  assign n61 = ~n57 & ~n60;
  assign V27_1 = n56 | ~n61;
  assign n63 = \IN-V29_0  & ~n51;
  assign n64 = \IN-V27_0  & n63;
  assign n65 = ~V9_0 & n51;
  assign n66 = \IN-V29_0  & n65;
  assign n67 = V8_0 & n66;
  assign V27_2 = n64 | n67;
  assign V27_4 = \IN-V27_3  | V22_2;
  assign n70 = V17_0 & ~V22_5;
  assign V36_0 = V22_4 & n70;
  assign n72 = V14_0 & ~V22_5;
  assign V35_0 = V22_4 & n72;
  assign V34_0 = V22_3 & n70;
  assign V33_0 = V22_3 & n72;
  assign V32_0 = V22_5 & V11_0;
  assign n77 = ~V22_5 & V11_0;
  assign V31_0 = V32_0 | n77;
  assign V27_0 = \IN-V27_0 ;
  assign V27_3 = \IN-V27_3 ;
  assign V29_0 = \IN-V29_0 ;
endmodule


