`timescale 1ns / 1ps
`default_nettype none

module d_latch(Q, notQ, En, D);
    output wire Q, notQ;
    input wire En, D;

    wire Dbar, S, R;
    // Inverter with 2ns delay
    not #2 not0(Dbar, D);

    // Generate S and R signals gated by En
    and #2 and0(S, D, En);
    and #2 and1(R, Dbar, En);

    // Instantiate SR latch from previous module
    sr_latch latch_inst(Q, notQ, 1'b1, S, R); // En tied high inside latch

endmodule
