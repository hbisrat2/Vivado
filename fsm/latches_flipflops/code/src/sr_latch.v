`timescale 1ns / 1ps
`default_nettype none

module sr_latch(Q, notQ, En, S, R);
    output wire Q, notQ;
    input wire En, S, R;

    // Intermediate nets
    wire nandSEN, nandREN;

    // Each NAND gate has a 2ns delay
    nand #2 nand0(nandSEN, S, En);
    nand #2 nand1(nandREN, R, En);
    nand #2 nand2(Q, nandSEN, notQ);
    nand #2 nand3(notQ, nandREN, Q);

endmodule
