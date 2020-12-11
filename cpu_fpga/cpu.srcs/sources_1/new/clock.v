`timescale 1ns / 1ps

module clock(
    input clk_100,
    output clk_40,
    output reg clk_5
    );
    
    initial clk_5 = 0;
    
    clk_wiz_0 clk_vga (
        .clk_out1(clk_40),
        .clk_in1(clk_100)
        );
    
    reg [3:0] clk_cnt = 0;
    
    always @ (posedge clk_40) begin
        clk_cnt = clk_cnt + 1;
        if (clk_cnt == 4'b0100) begin
            clk_5 = ~clk_5;
            clk_cnt = 0;
        end
    end
    
endmodule
