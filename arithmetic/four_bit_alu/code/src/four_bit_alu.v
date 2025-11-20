`timescale 1ns / 1ps
`default_nettype none

// 4-bit Arithmetic Logic Unit (ALU)
module four_bit_alu (
    output wire [3:0] Result,
    output wire       Overflow,
    input  wire [3:0] opA,
    input  wire [3:0] opB,
    input  wire [1:0] ctrl
);

    // Internal wires
    wire [3:0] and_out;
    wire [3:0] addsub_out;
    wire       addsub_overflow;
    wire       opSel_for_addsub;

    // Bitwise AND result
    assign and_out = opA & opB;

    // Decide opSel for add_sub: 0 => add, 1 => subtract
    assign opSel_for_addsub = (ctrl == 2'b11) ? 1'b1 : 1'b0;

    // Instantiate the provided add_sub module (must be in the project)
    // Named port mapping used to avoid order-dependency
    add_sub addsub_inst (
        .opA(opA),
        .opB(opB),
        .Sum(addsub_out),
        .Overflow(addsub_overflow),
        .opSel(opSel_for_addsub)
    );

    // Result selection per the testbench logic:
    // if LSB ctrl[0] == 0 -> AND, else -> use add/sub result
    assign Result = (ctrl[0] == 1'b0) ? and_out : addsub_out;

    // Overflow is meaningful only for ADD (01) or SUB (11)
    assign Overflow = ((ctrl == 2'b01) || (ctrl == 2'b11)) ? addsub_overflow : 1'b0;

endmodule