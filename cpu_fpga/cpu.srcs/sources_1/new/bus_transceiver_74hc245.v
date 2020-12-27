`timescale 1ns / 1ps

module bus_transceiver_74hc245(
    inout [7:0] A,
    inout [7:0] B,
    input dir,
    input oe
    );
    
    assign A = (oe == 0 && dir == 0) ? B : 8'hzz;
    assign B = (oe == 0 && dir == 1) ? A : 8'hzz; 
    
//    always @ (*) begin
//        if (oe == 1) begin
//            A_out <= 8'hzz;
//            B_out <= 8'hzz;
//        end
//        else begin
//            case (dir)
//                0: A_out <= B_in;
//                1: B_out <= A_in;
//                default: B_out <= A_in;
//            endcase
//        end
//    end
    
endmodule
