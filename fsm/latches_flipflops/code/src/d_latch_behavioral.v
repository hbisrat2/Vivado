`timescale 1ns / 1ps
`default_nettype none

module d_latch_behavioral(Q, notQ, D, En);
    output reg Q;
    output wire notQ;
    input wire D, En;

    always @(En or D) begin
        if (En)
            Q = D;
    end

    assign notQ = ~Q;

endmodule
