`timescale 1ns / 1ps

module bus_transceiver_tb();

    wire [7:0] A = 8'h10;
    wire [7:0] B;
    reg dir, oe;
    
    bus_transceiver_74hc245 buff (
        .A   (A),
        .B   (B),
        .dir (dir),
        .oe  (oe)
        );
        
    initial begin
        dir = 1;
        oe = 0;
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
