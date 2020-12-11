`timescale 1ns / 1ps

module reg_8bit_tb();

    reg clk;
    reg [7:0] d_in;
    reg oe;
    wire [7:0] d_out;
    
    reg_8bit_74hc374 register(
        .data_in  (d_in),
        .oe       (oe),
        .clk      (clk),
        .data_out (d_out)
        );

    // Make clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        oe = 0; // enable output
        d_in = 8'h00;
        #23;
        d_in = 8'h7C;
        #23;
        d_in = 8'h34;
        #7;
        oe = 1; // high impedance
        #15;
        oe = 0;
    end

endmodule
