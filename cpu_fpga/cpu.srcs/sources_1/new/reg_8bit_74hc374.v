`timescale 1ns / 1ps

module reg_8bit_74hc374(
    input [7:0] data_in,
    input oe,
    input clk,
    output reg [7:0] data_out
    );
    
    // Keep track of data even in high Z state
    reg [7:0] data;
    
    always @ (posedge clk) begin
        data = data_in;
    end
    
    always @ (posedge clk, posedge oe, negedge oe) begin
        if (oe == 1) begin
            data_out = 8'hzz;
        end
        else begin
            data_out = data;
        end
    end
    
endmodule
