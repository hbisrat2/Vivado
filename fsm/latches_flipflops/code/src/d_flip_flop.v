`timescale 1ns / 1ps
`default_nettype none

module d_flip_flop(Q, notQ, Clk, D);
    output wire Q, notQ;
    input wire Clk, D;

    wire notClk, notnotClk;
    wire Qm, notQm;

    // Inverter with 2ns delay
    not #2 inv0(notClk, Clk);

    // Master latch (enabled when Clk = 0)
    d_latch master(Qm, notQm, notClk, D);

    // Slave latch (enabled when Clk = 1)
    d_latch slave(Q, notQ, Clk, Qm);

endmodule
