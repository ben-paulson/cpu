`timescale 1ns / 1ps

module cpu_tb();

    reg clk_in1;
    wire clk_out1;

    clock myclk (
        .clk_100 (clk_in1),
        .clk_5 (clk_out1)
        );
    
    initial begin
        clk_in1 = 0;
        forever #5 clk_in1 = ~clk_in1;
    end

endmodule
