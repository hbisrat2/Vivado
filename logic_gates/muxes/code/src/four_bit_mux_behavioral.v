`timescale 1ns / 1ps
`default_nettype none



module four_bit_mux(Y,A,B,S);
    output reg [3:0]Y;
    input wire [3:0]A,B;
    input wire S;
    always@(A or B or S)
    begin
        if(S==1'b0)
            Y=A;
        else
            Y=B;
    end    
endmodule
