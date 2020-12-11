`timescale 1ns / 1ps

module clk_tb();

    reg clk_100mhz;
    wire clk_5mhz;
    wire clk_40mhz;

    clock myclk (
        .clk_100 (clk_100mhz),
        .clk_40  (clk_40mhz),
        .clk_5   (clk_5mhz)
        );
    
    initial begin
        clk_100mhz = 0;
        forever #5 clk_100mhz = ~clk_100mhz;
    end

endmodule
