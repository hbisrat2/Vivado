module summation_unit (S, P, C);
  output wire [3:0] S;
  input  wire [3:0] P, C;
  assign #2 S = P ^ C;
endmodule
