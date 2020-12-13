`timescale 1ns / 1ps

module bus_transceiver_74hc245(
    input [7:0] A_in,
    input [7:0] B_in,
    input dir,
    input oe,
    output reg [7:0] A_out,
    output reg [7:0] B_out
    );
    
    always @ (*) begin
        if (oe == 1) begin
            A_out <= 8'hzz;
            B_out <= 8'hzz;
        end
        else begin
            case (dir)
                0: A_out <= B_in;
                1: B_out <= A_in;
                default: B_out <= A_in;
            endcase
        end
    end
    
endmodule
