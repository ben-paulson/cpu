`timescale 1ns / 1ps

module cpu_tb();

    reg clk;

    // Make clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        // todo
    end

endmodule
