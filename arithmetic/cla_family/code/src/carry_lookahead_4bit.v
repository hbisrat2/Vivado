module carry_lookahead_4bit (Cout, S, X, Y, Cin);
  output wire Cout;
  output wire [3:0] S;
  input  wire [3:0] X, Y;
  input  wire Cin;
  wire [3:0] G, P;
  wire [4:1] C_int;
  wire [3:0] C_sum;

  generate_propagate_unit GPU (.G(G), .P(P), .X(X), .Y(Y));
  carry_lookahead_unit CLAU (.C(C_int), .G(G), .P(P), .C0(Cin));
  assign C_sum = {C_int[3], C_int[2], C_int[1], Cin};
  summation_unit SUMU (.S(S), .P(P), .C(C_sum));
  assign Cout = C_int[4];

endmodule
