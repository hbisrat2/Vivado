`timescale 1ns / 1ps
`default_nettype none

module d_flip_flop_behavioral(Q, notQ, D, Clk);
    output reg Q;
    output wire notQ;
    input wire D, Clk;

    always @(posedge Clk)
        Q <= D;

    assign notQ = ~Q;

endmodule
