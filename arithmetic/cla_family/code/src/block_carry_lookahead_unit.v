module block_carry_lookahead_unit (Gstar, Pstar, C, G, P, C0);
  output wire Gstar, Pstar;
  output wire [3:1] C;
  input  wire [3:0] G, P;
  input  wire C0;
  assign #4 C[1] = G[0] | (P[0] & C0);
  assign #4 C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C0);
  assign #4 C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0);
  assign #4 Gstar = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
  assign #4 Pstar = P[3] & P[2] & P[1] & P[0];
endmodule
