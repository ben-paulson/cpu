`timescale 1ns / 1ps

module mux_8t1_74hc151(
    input D0,
    input D1, // 2-bit data widths because
    input D2, // 74hc153 is a quad 2-input mux
    input D3,
    input D4,
    input D5,
    input D6,
    input D7,
    input [2:0] select,
    input strobe,
    output reg data_out
    );
    
    always @ (*) begin
        // Strobe is essentially an enable input
        if (strobe == 0) begin
            case (select)
                0: data_out <= D0;
                1: data_out <= D1;
                2: data_out <= D2;
                3: data_out <= D3;
                4: data_out <= D4;
                5: data_out <= D5;
                6: data_out <= D6;
                7: data_out <= D7;
                default: data_out <= 1'b0;
            endcase
        end
        else data_out <= 1'b0;
    end
    
endmodule
