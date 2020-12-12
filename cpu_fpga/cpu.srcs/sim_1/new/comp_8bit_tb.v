`timescale 1ns / 1ps

module comp_8bit_tb();

    reg [7:0] P;
    reg [7:0] Q;
    reg oe;
    wire equal;
    
    comp_8bit_74hc688 comparator (
        .P     (P),
        .Q     (Q),
        .oe    (oe),
        .equal (equal)
        );
        
    initial begin
        #3;
        P = 8'h00;
        Q = 8'h01;
        oe = 0;
        #15;
        P = 8'h01;
        #15;
        Q = 8'hab;
        P = 8'hab;
        #15;
        oe = 1;
        #15;
    end

endmodule
