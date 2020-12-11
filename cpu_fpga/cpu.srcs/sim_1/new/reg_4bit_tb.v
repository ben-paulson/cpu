`timescale 1ns / 1ps

module reg_4bit_tb();

    reg clk;
    reg [3:0] d_in;
    reg oe;
    reg enable;
    reg rst;
    wire [3:0] d_out;
    
    reg_4bit_74hc173 register(
        .data_in  (d_in),
        .oe       (oe),
        .rst      (rst),
        .enable   (enable),
        .clk      (clk),
        .data_out (d_out)
        );

    // Make clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        enable = 0;
        rst = 0;
        oe = 0; // enable output
        d_in = 4'h0;
        #23;
        d_in = 4'hC;
        #23;
        d_in = 4'h3;
        #7;
        oe = 1; // high impedance
        #15;
        oe = 0;
        #23;
        rst = 1;
        #16;
        rst = 0;
        d_in = 4'h7;
        #16;
        oe = 1;
        #25;
        oe = 0;
        enable = 1;
        d_in = 4'h8;
        #25;
        d_in = 4'h9;
        #15;
        enable = 0;
        #16;
        d_in = 4'h3;
        
    end

endmodule
