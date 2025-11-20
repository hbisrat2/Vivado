`timescale 1ns / 1ps
`default_nettype none

module up_counter(Count, Carry2, En, Clk, Rst);
output reg [2:0] Count;
output wire Carry2;
input wire En, Clk, Rst;
wire [2:0] Carry, Sum;
Threebitcounter UC1(Sum, Carry2, Count, En);
always @(posedge Clk or posedge Rst)
    if (Rst)
        Count <= 0;
    else
        Count <= Sum;
endmodule

module Threebitcounter(Sum, Carry2, Count, En);
input wire En;
input wire [2:0] Count;
output wire [2:0] Sum;
output wire Carry2;
wire [2:0] Carry;
half_adder HA0(Sum[0], Carry[0], Count[0], En);
half_adder HA1(Sum[1], Carry[1], Count[1], Carry[0]);
half_adder HA2(Sum[2], Carry[2], Count[2], Carry[1]);
assign Carry2 = Carry [2];
endmodule
