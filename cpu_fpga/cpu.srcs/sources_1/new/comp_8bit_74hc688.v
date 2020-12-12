`timescale 1ns / 1ps

module comp_8bit_74hc688(
    input [7:0] P,
    input [7:0] Q,
    input oe,
    output reg equal
    );
    
    always @ (*) begin
        // output enable high forces output high
        if (oe == 1) equal <= 1'b1;
        else begin
            // output low if equal, high if not
            if (P == Q) equal <= 1'b0;
            else equal <= 1'b1;
        end
    end
    
endmodule
