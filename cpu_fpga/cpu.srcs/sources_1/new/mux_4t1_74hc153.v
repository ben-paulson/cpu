`timescale 1ns / 1ps

module mux_4t1_74hc153(
    input [1:0] A, // 2-bit data widths because
    input [1:0] B, // 74hc153 is a quad 2-input mux
    input [1:0] C,
    input [1:0] D,
    input [1:0] select,
    input strobe,
    output reg [1:0] data_out
    );
    
    always @ (*) begin
        // Strobe is essentially an enable input
        if (strobe == 0) begin
            case (select)
                0: data_out <= A;
                1: data_out <= B;
                2: data_out <= C;
                3: data_out <= D;
                default: data_out <= 2'b00;
            endcase
        end
        else data_out <= 2'b00;
    end
    
endmodule
