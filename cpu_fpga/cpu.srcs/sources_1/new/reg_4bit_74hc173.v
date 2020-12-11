`timescale 1ns / 1ps

module reg_4bit_74hc173(
    input [3:0] data_in,
    input oe,
    input enable,
    input clk,
    input rst,
    output reg [3:0] data_out
    );
    
    // Keep track of data even in high Z state
    reg [3:0] data;
    
    always @ (posedge clk, posedge rst) begin
        if (rst == 1) data = 4'b0000;
        else if (enable == 0) data = data_in;
    end
    
    always @ (posedge clk, posedge rst, posedge oe, negedge oe) begin
        if (oe == 1) begin
            data_out = 4'hz;
        end
        else begin
            data_out = data;
        end
    end
endmodule
