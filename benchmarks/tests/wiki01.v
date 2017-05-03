module wiki01 ( x1, x2, x3, x4, x5, x6, x7, x8, s);
  input  x1, x2, x3, x4, x5, x6, x7, x8;
  output s;

  assign s = ( x1 | x2 ) & ( x3 | x4 ) & ( x5 | x6 ) & ( x7 | x8 );
endmodule


