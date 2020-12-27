`timescale 1ns / 1ps

module ram_128kx8_tb();

    wire [7:0] data;
    wire [7:0] data_in = 8'h34;
    reg [16:0] addr;
    reg ce1, ce2, we, oe;
    
    wire write = ~ce1 & ce2 & ~we;
    assign data = write ? data_in : 8'hZZ;
    
    ram_128kx8 ram (
        .data  (data),
        .addr  (addr),
        .ce1   (ce1),
        .ce2   (ce2),
        .we    (we),
        .oe    (oe)
        );
        
    initial begin
        // Read from addr 0
        ce1 = 0;
        ce2 = 1;
        oe = 0;
        we = 1;
        addr = 17'h00000;
        #15;
        // Read from addr 5
        addr = 17'h00005;
        #15;
        // Write to addr 5
        we = 0;
        #15;
        // Read from addr 5
        we = 1;
        #15;
        // Standby
        ce1 = 1;
        #15;
        ce2 = 0;
        #15;
        // Output disable
        ce1 = 0;
        ce2 = 1;
        oe = 1;
        #15;
        // Read again
        oe = 0;
    end

endmodule
