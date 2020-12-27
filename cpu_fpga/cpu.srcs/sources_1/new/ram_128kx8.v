`timescale 1ns / 1ps

/*
 * Asynchronous, 128k X 8 RAM
 */
module ram_128kx8 # (filename = "memory.mem") (
    inout [7:0] data,
    input [16:0] addr,
    input ce1, ce2,
    input we,
    input oe, 
    input clk
    );
    
    reg [7:0] memory [0:131071];
    
    initial begin
        $readmemh(filename, memory, 0, 131071);
    end
    
    wire standby = ce1 | ~ce2;
    wire output_disable = ~ce1 & ce2 & oe & we;
    wire read = ~ce1 & ce2 & ~oe & we;
    wire write = ~ce1 & ce2 & ~we;
    
    assign data = read ? memory[addr] : 8'hZZ;
    
    always @ (posedge clk) begin
//        if (standby == 1 || output_disable == 1) data <= 8'hzz;
        if (write == 1) memory[addr] <= data;
    end
    
endmodule
