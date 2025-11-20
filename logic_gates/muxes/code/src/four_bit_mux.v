`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2025 03:22:08 PM
// Design Name: 
// Module Name: four_bit_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_mux(Y,A,B,S);
/ * d e c l a r e o u t p u t and i n p u t p o r t s * /
/ / o u t p u t i s a 4 b i t wide wire
    input wire [3:0]A,B;  / / A and B are 4 b i t wide wires
    input wire S; // s e l e c t i s s t i l l 1 b i t wide
    output wire [3:0]Y;
    //initiate user defined modules
    two_one_mux MUX0(Y[0],A[0],B[0],S);
    two_one_mux MUX1(Y[1],A[1],B[1],S);
    two_one_mux MUX2(Y[2],A[2],B[2],S);
    two_one_mux MUX3(Y[3],A[3],B[3],S);
     //you need two more module initiation
endmodule
