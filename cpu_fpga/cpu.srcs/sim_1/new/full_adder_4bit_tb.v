`timescale 1ns / 1ps

module full_adder_4bit_tb();

    reg [3:0] A;
    reg [3:0] B;
    reg cin;
    wire [3:0] sum;
    wire cout;
    
    full_adder_4bit_74hc283 full_adder (
        .A    (A),
        .B    (B),
        .cin  (cin),
        .sum  (sum),
        .cout (cout)
        );
        
    initial begin
        #3;
        A = 4'b0000;
        B = 4'b0001;
        cin = 1'b0;
        #15;
        A = 4'b1110;
        #15;
        cin = 1'b1;
        #15;
        cin = 1'b0;
        A = 4'b1111;
        B = 4'b1111;
        #15;
        cin = 1'b1;
    end

endmodule
