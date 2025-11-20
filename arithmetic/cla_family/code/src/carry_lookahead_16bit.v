module carry_lookahead_16bit (Cout, S, X, Y, Cin);
  output wire Cout;
  output wire [15:0] S;
  input  wire [15:0] X, Y;
  input  wire Cin;
  wire [16:0] C;
  wire [15:0] G, P;
  wire [3:0] Gstar, Pstar;

  assign C[0] = Cin;

  generate_propagate_unit GPU (.G(G[3:0]), .P(P[3:0]), .X(X[3:0]), .Y(Y[3:0]));
  generate_propagate_unit GPU1 (.G(G[7:4]), .P(P[7:4]), .X(X[7:4]), .Y(Y[7:4]));
  generate_propagate_unit GPU2 (.G(G[11:8]), .P(P[11:8]), .X(X[11:8]), .Y(Y[11:8]));
  generate_propagate_unit GPU3 (.G(G[15:12]), .P(P[15:12]), .X(X[15:12]), .Y(Y[15:12]));

  block_carry_lookahead_unit BCLAU0 (.Gstar(Gstar[0]), .Pstar(Pstar[0]), .C(C[3:1]), .G(G[3:0]), .P(P[3:0]), .C0(C[0]));
  block_carry_lookahead_unit BCLAU1 (.Gstar(Gstar[1]), .Pstar(Pstar[1]), .C(C[7:5]), .G(G[7:4]), .P(P[7:4]), .C0(C[4]));
  block_carry_lookahead_unit BCLAU2 (.Gstar(Gstar[2]), .Pstar(Pstar[2]), .C(C[11:9]), .G(G[11:8]), .P(P[11:8]), .C0(C[8]));
  block_carry_lookahead_unit BCLAU3 (.Gstar(Gstar[3]), .Pstar(Pstar[3]), .C(C[15:13]), .G(G[15:12]), .P(P[15:12]), .C0(C[12]));

  carry_lookahead_unit CLAU (.C({C[16], C[12], C[8], C[4]}), .G(Gstar), .P(Pstar), .C0(C[0]));

  summation_unit SUMU0 (.S(S[3:0]), .P(P[3:0]), .C(C[3:0]));
  summation_unit SUMU1 (.S(S[7:4]), .P(P[7:4]), .C(C[7:4]));
  summation_unit SUMU2 (.S(S[11:8]), .P(P[11:8]), .C(C[11:8]));
  summation_unit SUMU3 (.S(S[15:12]), .P(P[15:12]), .C(C[15:12]));

  assign Cout = C[16];
endmodule
