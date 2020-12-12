`timescale 1ns / 1ps

module full_adder_4bit_74hc283(
    input [3:0] A,
    input [3:0] B,
    input cin,
    output [3:0] sum,
    output cout
    );
    
    wire [4:0] big_sum = A + B + cin;
    assign sum = big_sum[3:0];
    assign cout = big_sum[4];
    
endmodule
