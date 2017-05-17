// Benchmark "C17.iscas" written by ABC on Tue May 16 16:07:44 2017

module \C17.iscas  ( 
    \2GAT(1) , \7GAT(4) , \3GAT(2) , \1GAT(0) , \6GAT(3) ,
    \22GAT(10) , \23GAT(9)   );
  input  \2GAT(1) , \7GAT(4) , \3GAT(2) , \1GAT(0) , \6GAT(3) ;
  output \22GAT(10) , \23GAT(9) ;
  wire n8, n9, n10, n12;
  assign n8 = \3GAT(2)  & \6GAT(3) ;
  assign n9 = \2GAT(1)  & ~n8;
  assign n10 = \3GAT(2)  & \1GAT(0) ;
  assign \22GAT(10)  = n9 | n10;
  assign n12 = \7GAT(4)  & ~n8;
  assign \23GAT(9)  = n9 | n12;
endmodule


