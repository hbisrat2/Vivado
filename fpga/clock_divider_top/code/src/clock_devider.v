
`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2025 09:34:16 AM
// Design Name: 
// Module Name: clock_devider
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



module clock_divider(ClkOut, ClkIn);
output wire [3:0] ClkOut;
input wire ClkIn;
parameter n = 25;
reg [n:0] Count;
always @(posedge ClkIn)
    Count <= Count + 1;
assign ClkOut[3:0] = Count[n:n-3];
endmodule

