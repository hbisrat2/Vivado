`timescale 1ns / 1ps
`default_nettype none

module adder_2bit(Carry, Sum, A, B);
    output wire Carry;
    output wire [1:0] Sum;
    input wire [1:0] A, B;

    wire C0;

    // Each full adder includes internal gate delays
    full_adder fa0(Sum[0], C0, A[0], B[0], 1'b0);
    full_adder fa1(Sum[1], Carry, A[1], B[1], C0);

endmodule
