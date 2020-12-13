`timescale 1ns / 1ps

module pc_tb();

    reg clk, reset, write, load_from_src, source;
    reg [15:0] jumpu = 16'hdead, jumpc = 16'hbeef;
    wire [15:0] pc;
    
    pc program_counter (
        .clk           (clk),
        .reset         (reset),
        .write         (write),
        .load_from_src (load_from_src),
        .source        (source),
        .jumpu         (jumpu),
        .jumpc         (jumpc),
        .pc            (pc)
        );
        
    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 0;
        #10;
        reset = 1;
        write = 1;
        load_from_src = 1;
        source = 0;
        #100;
        load_from_src = 0;
        #30;
        source = 1;
        #30;
        load_from_src = 1;
        #30;
        write = 0;
        #30;
        reset = 0;
        #5;
        reset = 1;
    end

endmodule
