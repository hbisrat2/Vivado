`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 11:43:47 AM
// Design Name: 
// Module Name: mux_4bit_4to1
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


module mux_4bit_4to1(Y,A,B,C,D,S);
    output reg[3:0]Y;
    input wire[3:0]A,B,C,D;
    input wire[1:0]S;
    always@(*)
        case(S)
            2'b00 : Y=A; //when S ==2'b00
            2'b01: Y = B; // Select B
            2'b10: Y = C; // Select C            
            2'b11 : Y=D; //when S == 2'b11
        endcase
endmodule
