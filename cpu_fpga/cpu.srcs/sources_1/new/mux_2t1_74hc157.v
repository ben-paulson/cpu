`timescale 1ns / 1ps

module mux_2t1_74hc157(
    input [3:0] A, // 4-bit data widths because
    input [3:0] B, // 74hc157 is a quad 2-input mux
    input select,
    input strobe,
    output reg [3:0] data_out
    );
    
    always @ (*) begin
        // Strobe is essentially an enable input
        if (strobe == 0) begin
            case (select)
                0: data_out <= A;
                1: data_out <= B;
                default: data_out <= 4'b0000;
            endcase
        end
        else data_out <= 4'b0000;
    end
    
endmodule
