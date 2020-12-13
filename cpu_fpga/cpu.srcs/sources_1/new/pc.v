`timescale 1ns / 1ps

module pc(
    input clk,
    input reset,
    input write,
    input load_from_src,
    input source,
    input [15:0] jumpu,
    input [15:0] jumpc,
    output [15:0] pc
    );
    
    wire [15:0] pc_sel;
    wire rco_0, rco_1, rco_2;
    
    // Transceivers act as muxes for loading the PC
    
    bus_transceiver_74hc245 j_pc0 (
        .A_in  (jumpu[7:0]),
        .B_in  (0),
        .dir   (1),
        .oe    (~source),
        .A_out (),
        .B_out (pc_sel[7:0])
        );
        
    bus_transceiver_74hc245 j_pc1 (
        .A_in  (jumpu[15:8]),
        .B_in  (0),
        .dir   (1),
        .oe    (~source),
        .A_out (),
        .B_out (pc_sel[15:8])
        );
        
    bus_transceiver_74hc245 br_pc0 (
        .A_in  (jumpc[7:0]),
        .B_in  (0),
        .dir   (1),
        .oe    (source),
        .A_out (),
        .B_out (pc_sel[7:0])
        );
        
    bus_transceiver_74hc245 br_pc1 (
        .A_in  (jumpc[15:8]),
        .B_in  (0),
        .dir   (1),
        .oe    (source),
        .A_out (),
        .B_out (pc_sel[15:8])
        );
        
    // Use four 4-bit counters to store the PC value
    
    counter_4bit_74hc161 counter0 (
        .data_in (pc_sel[3:0]),
        .clk     (clk),
        .load    (load_from_src),
        .enable  (write),
        .clr     (reset),
        .cnt     (pc[3:0]),
        .rco     (rco_0)
        );
        
    counter_4bit_74hc161 counter1 (
        .data_in (pc_sel[7:4]),
        .clk     (clk),
        .load    (load_from_src),
        .enable  (write & (~load_from_src | rco_0)),
        .clr     (reset),
        .cnt     (pc[7:4]),
        .rco     (rco_1)
        );
        
    counter_4bit_74hc161 counter2 (
        .data_in (pc_sel[11:8]),
        .clk     (clk),
        .load    (load_from_src),
        .enable  (write & (~load_from_src | (rco_1 & rco_0))),
        .clr     (reset),
        .cnt     (pc[11:8]),
        .rco     (rco_2)
        );
    
    counter_4bit_74hc161 counter3 (
        .data_in (pc_sel[15:12]),
        .clk     (clk),
        .load    (load_from_src),
        .enable  (write & (~load_from_src | (rco_2 & rco_1 & rco_0))),
        .clr     (reset),
        .cnt     (pc[15:12]),
        .rco     ()
        );
    
endmodule
