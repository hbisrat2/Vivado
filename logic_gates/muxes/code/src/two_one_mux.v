`timescale 1ns / 1ps // NOTE: t h a t symbol i s a b a c k t i c k ( below Esc ) not a quote
`default_nettype none
/*T h is module d e s c r i b e s a 1?b i t wide m u l t i p l e x e r u s i ng s t r u c t u r a l c o n s t r u c t s *
* and gate?l e v e l p r i m i t i v e s b u i l t i n t o V e r i l o g*/
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2025 03:04:53 PM
// Design Name: 
// Module Name: two_one_mux
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


module two_one_mux(Y,A,B,S); / / define the module name and its interface
    input wire A, B, S; //A, B, and S are inputs
    output wire Y; //Y is a output
    wire notS; //creating an internal line
    wire andA; //creating an internal line
    wire andB; //creating an internal line
	//start gate level logic
    not not0(notS,S);
    and and0(andA,notS,A);
    and and1(andB,S,B);
    or or0(Y,andA,andB);
endmodule
