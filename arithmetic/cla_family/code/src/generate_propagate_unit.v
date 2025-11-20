module generate_propagate_unit (G, P, X, Y);
  output wire [3:0] G, P;
  input  wire [3:0] X, Y;
  assign #2 G = X & Y;
  assign #2 P = X ^ Y;
endmodule
