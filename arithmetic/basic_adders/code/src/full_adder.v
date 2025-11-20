`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2025 03:36:12 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(S,Cout,A,B,Cin);

    input wire A,B,Cin;//1-bit wire
    output wire Cout,S;

    wire andBCin,andACin,andAB; //1-bitwire
// use data flow to descrive the gate level
    assign S=A^B^Cin; //the hat is for XOR
    assign andAB = A&B;// the ampersand & is for and
//fill in the code for BCin and ACin
    assign andBCin = Cin&B;
    assign andACin = A&Cin;
    assign Cout = andAB | andBCin | andACin; //| is for or
//the above line is missing something
endmodule
