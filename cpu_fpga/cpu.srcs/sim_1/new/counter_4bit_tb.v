`timescale 1ns / 1ps

module counter_4bit_tb();

    reg clk;
    reg [3:0] data_in;
    reg load, enable, clr;
    wire [3:0] cnt;
    wire rco;
    
    counter_4bit_74hc161 counter (
        .data_in (data_in),
        .clk     (clk),
        .load    (load),
        .enable  (enable),
        .clr     (clr),
        .cnt     (cnt),
        .rco     (rco)
        );

    // Make clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        clr = 0;
        #3;
        clr = 1;
        data_in = 4'b1010;
        load = 1;
        enable = 1;
        #70;
        clr = 0;
        #15;
        clr = 1;
        #15;
        load = 0;
        #15;
        load = 1;
        #100;
        enable = 0;
        #20;
        load = 0;
    end

endmodule
