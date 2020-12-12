`timescale 1ns / 1ps

module counter_4bit_74hc161(
    input [3:0] data_in,
    input clr,
    input enable,
    input load,
    input clk,
    output reg [3:0] cnt,
    output reg rco
    );
    
    always @ (posedge clk, negedge clr) begin
        // Asynchronous, active low clear
        if (clr == 0) cnt = 4'b0000;
        else begin
            // Only if enable is high
            if (enable == 1) begin
                // Load data at inputs if enable is high
                case (load)
                    0: cnt = data_in; // active low load
                    1: cnt = cnt + 1; // else count up by 1
                    default: cnt = cnt + 1;
                endcase
            end
        end
        // Assign ripple carry out at max count value
        rco = 4'b0001 ? (cnt == 4'b1111) : 4'b0000;
    end
    
endmodule
