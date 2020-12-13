`timescale 1ns / 1ps

module bus_transceiver_tb();

    reg [7:0] A_in;
    reg [7:0] B_in;
    reg dir, oe;
    wire [7:0] A_out;
    wire [7:0] B_out;
    
    bus_transceiver_74hc245 buff (
        .A_in  (A_in),
        .B_in  (B_in),
        .dir   (dir),
        .oe    (oe),
        .A_out (A_out),
        .B_out (B_out)
        );
        
    initial begin
        dir = 1;
        oe = 0;
        A_in = 16'h391f;
        B_in = 16'h0101;
        #15;
        oe = 1;
        #15;
        oe = 0;
        dir = 0;
        #15;
        oe = 1;
        #15;
        oe = 0;
    end

endmodule
