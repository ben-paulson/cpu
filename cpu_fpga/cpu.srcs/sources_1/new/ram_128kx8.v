`timescale 1ns / 1ps

module ram_128kx8 # (filename = "memory.mem") (
    input [7:0] data_in,
    input [16:0] addr,
    input ce1, ce2,
    input we,
    input oe,
    output reg [7:0] data_out
    );
    
    reg [7:0] memory [0:131071];
    
    initial begin
        $readmemh(filename, memory, 0, 131071);
    end
    
    wire standby = ce1 | ~ce2;
    wire output_disable = ~ce1 & ce2 & oe & we;
    wire read = ~ce1 & ce2 & ~oe & we;
    wire write = ~ce1 & ce2 & ~we;
    
    always @ (*) begin
        if (standby == 1 || output_disable == 1) data_out <= 8'hzz;
        else if (read == 1) data_out <= memory[addr];
        else if (write == 1) memory[addr] <= data_in;
    end
    
endmodule
