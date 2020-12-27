`timescale 1ns / 1ps

module reg_file(
    input [3:0] addr1,
    input [3:0] addr2,
    input [3:0] wa,
    input we,
    input hold,
    input clk,
    input addr_sel,
    input [7:0] data_in,
    output [7:0] rs1,
    output [7:0] rs2
    );
    
    wire [7:0] d_in1, d_in2;
    wire [3:0] r1_addr, r2_addr;
    
    bus_transceiver_74hc245 d_in_buf (
        .A   (data_in),
        .B   (d_in1),
        .dir (1),
        .oe  (we)
        );
    
    bus_transceiver_74hc245 rw_buf (
        .A   (d_in1),
        .B   (d_in2),
        .dir (1),
        .oe  (we)
        );
        
    mux_2t1_74hc157 ram1_addr_mux (
        .A        (addr1),
        .B        (wa),
        .select   (~we | addr_sel),
        .strobe   (0), // ignore strobe
        .data_out (r1_addr)
        );
        
    mux_2t1_74hc157 ram2_addr_mux (
        .A        (addr2),
        .B        (wa),
        .select   (~we | addr_sel),
        .strobe   (0), // ignore strobe
        .data_out (r2_addr)
        );
        
    ram_128kx8 # ("test_rf.mem") ram0 (
        .data     (d_in1),
        .addr     ({13'h0000, r1_addr}),
        .ce1      (0),
        .ce2      (1),
        .we       (we),
        .oe       (hold),
        .clk      (clk)
        );
        
    ram_128kx8 # ("test_rf.mem") ram1  (
        .data     (d_in2),
        .addr     ({13'h0000, r2_addr}),
        .ce1      (0),
        .ce2      (1),
        .we       (we),
        .oe       (hold),
        .clk      (clk)
        );
        
    assign rs1 = d_in1;
    assign rs2 = d_in2;
    
endmodule
