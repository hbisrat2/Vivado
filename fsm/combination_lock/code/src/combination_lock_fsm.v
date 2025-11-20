`timescale 1ns / 1ps

module combination_lock_fsm(
    output reg  [2:0] state,
    output wire [3:0] Lock,
    input  wire       Key1,
    input  wire       Key2,
    input  wire [3:0] Password,
    input  wire       Reset,
    input  wire       Clk
);

    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;

    reg [2:0] nextState;

    always @(*) begin
        case (state)
            S0: begin
                if (Key1 && (Password == 4'b1101))
                    nextState = S1;
                else
                    nextState = S0;
            end

            S1: begin
                if (Key2 && (Password == 4'b0111))
                    nextState = S2;
                else if (Key2 && (Password != 4'b0111))
                    nextState = S0;
                else
                    nextState = S1;
            end

            S2: begin
                if (Key1 && (Password == 4'b1001))
                    nextState = S3;
                else if (Key1 && (Password != 4'b1001))
                    nextState = S0;
                else
                    nextState = S2;
            end

            S3: begin
                if (Key2 && (Password == 4'b0001))
                    nextState = S4;
                else if (Key2 && (Password != 4'b0001))
                    nextState = S0;
                else
                    nextState = S3;
            end

            S4: begin
                nextState = S4;
            end

            default: nextState = S0;
        endcase
    end

    always @(posedge Clk) begin
        if (Reset)
            state <= S0;
        else
            state <= nextState;
    end

    assign Lock = (state == S4) ? 4'b1111 : 4'b0000;

endmodule
