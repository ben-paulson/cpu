`timescale 1ns / 1ps

module reg_8bit_74hc374(
    input [7:0] data_in,
    input oe,
    input clk,
    output reg [7:0] data_out
    );
    
    always @ (posedge clk) begin
        if (oe == 1) data_out = 8'bzzzzzzzz;
        else data_out = data_in;
    end
    
endmodule
