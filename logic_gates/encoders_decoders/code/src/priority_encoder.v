
`timescale 1ns / 1ps
`default_nettype none

module priority_encoder (
    input wire [3:0] W, 
    output reg [1:0] Y,  
    output reg zero      
);

    always @(*) begin
        casex (W)
            4'b0000: begin Y = 2'bXX; zero = 1'b1; end  // No inputs active
            4'b0001: begin Y = 2'b00; zero = 1'b0; end  // w0 active
            4'b001X: begin Y = 2'b01; zero = 1'b0; end  // w1 has priority
            4'b01XX: begin Y = 2'b10; zero = 1'b0; end  // w2 has priority
            4'b1XXX: begin Y = 2'b11; zero = 1'b0; end  // w3 has highest priority
            default: begin Y = 2'bXX; zero = 1'b1; end  // safety default
        endcase
    end

endmodule
