`timescale 1ns / 1ps
`default_nettype none

module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);
    output reg Carry_reg;
    output reg [1:0] Sum_reg;
    input wire Clk;
    input wire [1:0] A, B;

    // Internal registers for inputs
    reg [1:0] A_reg, B_reg;
    wire [1:0] Sum;
    wire Carry;

    // Instantiate your 2-bit adder
    adder_2bit add_inst(Carry, Sum, A_reg, B_reg);

    // Input registers (2-bit flip-flops)
    always @(posedge Clk) begin
        A_reg <= A;
        B_reg <= B;
    end

    // Output registers (for synchronous outputs)
    always @(posedge Clk) begin
        Carry_reg <= Carry;
        Sum_reg <= Sum;
    end

endmodule
