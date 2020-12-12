`timescale 1ns / 1ps

module mux_tb();

    // 2t1 mux signals
    wire [3:0] A_2t1 = 4'b0101;
    wire [3:0] B_2t1 = 4'b1010;
    reg select_2t1;
    wire [3:0] data_out_2t1;
    
    // 4t1 mux signals
    wire [1:0] A_4t1 = 2'b00;
    wire [1:0] B_4t1 = 2'b01;
    wire [1:0] C_4t1 = 2'b10;
    wire [1:0] D_4t1 = 2'b11;
    reg [1:0] select_4t1;
    wire [1:0] data_out_4t1;
    
    // 8t1 mux signals
    wire D0_8t1 = 1'b0;
    wire D1_8t1 = 1'b1;
    wire D2_8t1 = 1'b0;
    wire D3_8t1 = 1'b1;
    wire D4_8t1 = 1'b0;
    wire D5_8t1 = 1'b1;
    wire D6_8t1 = 1'b0;
    wire D7_8t1 = 1'b1;
    reg [2:0] select_8t1;
    wire data_out_8t1;
    
    mux_2t1_74hc157 mux_2t1 (
        .A        (A_2t1),
        .B        (B_2t1),
        .select   (select_2t1),
        .strobe   (0), // ignore strobe
        .data_out (data_out_2t1)
        );
        
    mux_4t1_74hc153 mux_4t1 (
        .A        (A_4t1),
        .B        (B_4t1),
        .C        (C_4t1),
        .D        (D_4t1),
        .select   (select_4t1),
        .strobe   (0), // ignore strobe
        .data_out (data_out_4t1)
        );
        
    mux_8t1_74hc151 mux_8t1 (
        .D0       (D0_8t1),
        .D1       (D1_8t1),
        .D2       (D2_8t1),
        .D3       (D3_8t1),
        .D4       (D4_8t1),
        .D5       (D5_8t1),
        .D6       (D6_8t1),
        .D7       (D7_8t1),
        .select   (select_8t1),
        .strobe   (0), // ignore strobe
        .data_out (data_out_8t1)
        );
        
    integer i;
    initial begin
        #3;
        // 2t1 mux
        for (i = 0; i < 2; i = i + 1) begin
            select_2t1 = i;
            #15;
        end
        select_2t1 = 0;
        // 4t1 mux
        for (i = 0; i < 4; i = i + 1) begin
            select_4t1 = i;
            #15;
        end
        select_4t1 = 0;
        // 8t1 mux
        for (i = 0; i < 8; i = i + 1) begin
            select_8t1 = i;
            #15;
        end
    end

endmodule
