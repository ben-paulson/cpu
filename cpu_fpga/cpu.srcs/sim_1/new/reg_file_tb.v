`timescale 1ns / 1ps

module reg_file_tb();

    reg [3:0] addr1, addr2, wa;
    reg we, hold, addr_sel, clk;
    reg [7:0] data_in;
    wire [7:0] rs1, rs2;
    
    reg_file register_file (
        .addr1   (addr1),
        .addr2   (addr2),
        .wa      (wa),
        .we      (we),
        .hold    (hold),
        .addr_sel (addr_sel),
        .data_in (data_in),
        .rs1     (rs1),
        .rs2     (rs2),
        .clk     (clk)
        );
        
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
        
    integer i;
    integer j;
        
    initial begin
        addr1 = 4'h0;
        addr2 = 4'h0;
        wa = 4'h0;
        data_in = 8'h01;
        we = 0; // Write 1 to address x0
        #20;
        hold = 1;
        addr1 = 4'h0;
        addr2 = 4'h1;
        we = 1;
        addr_sel = 1;
        #3;
        //we = 1;
        hold = 0;
//        addr1 = 4'h0; // rs1 = x0
//        addr2 = 4'h1; // rs2 = x1
        #20;
        hold = 1;
        data_in = 8'hab;
        wa = 4'h4;
//        we = 1;
        addr_sel = 0;
        #3;
        hold = 0;
//        data_in = 8'hab;
//        wa = 4'h4;
        we = 0; // Write ab to address x4
        #20;
        hold = 1;
        addr1 = 4'h0;
        addr2 = 4'h4;
        we = 1;
        addr_sel = 1;
        #3;
        hold = 0;
        //we = 1;
//        addr1 = 4'h0; // rs1 = x0
//        addr2 = 4'h4; // rs2 = x4
        #20;
        hold = 1;
        data_in = 8'h12;
        wa = 4'h4;
        addr_sel = 0;
//        we = 0;
        #3;
        hold = 0;
//        data_in = 8'h12;
//        wa = 4'h4;
        we = 0; // Write 12 to address x4
        #20;
        hold = 1;
        addr1 = 4'h0;
        addr2 = 4'h4;
        we = 1;
        addr_sel = 1;
        #3;
        hold = 0;
        //we = 1;
//        addr1 = 4'h0; // rs1 = x0
//        addr2 = 4'h4; // rs2 = x4
        #20;
        hold = 1;
        data_in = 8'h34;
        wa = 4'h5;
        addr_sel = 0;
//        we = 0;
        #3;
        hold = 0;
//        data_in = 8'h34;
//        wa = 4'h5;
        we = 0; // Write 34 to address x5
        #20;
        hold = 1;
        addr1 = 4'h4;
        addr2 = 4'h5;
        we = 1;
        addr_sel = 1;
        #3;
        hold = 0;
        //we = 1;
//        addr1 = 4'h4; // rs1 = x4
//        addr2 = 4'h5; // rs2 = x5
        #20;
        addr1 = 4'h4; // rs1 = x4
        addr2 = 4'h0; // rs2 = x0
        hold = 1;
        we = 1;
        addr_sel = 1;
        #3;
        //we = 1;
        hold = 0;
//        addr1 = 4'h4; // rs1 = x4
//        addr2 = 4'h0; // rs2 = x0
        #20;
        we = 1; // Read all addresses
        
//        for (j = 0; j < 2; j = j + 1) begin
//        addr1 = 4'h0;
//        addr2 = 4'h0;
//        we = 0;
//        wa = 4'h0;
//        data_in = 4'ha + j;
//        #15;
//        we = 0;
//        #15;
//        we = 1;
//        #15;
//        addr2 = 4'h1;
//        #15;
//        wa = 4'ha;
//        data_in = 4'h8;
//        #5;
//        we = 0;
//        #15;
//        we = 1;
//        #5;
//        addr1 = 4'ha;
//        addr2 = 4'h7;
//        #1;
//        addr1 = 4'h0;
//        addr2 = 4'h1;
        for (i = 0; i < 8; i = i + 1) begin
            addr1 = i;
            addr2 = i + 1;
            wa = i;
            #10;
        end
//        we = 1;
//        for (i = 0; i < 8; i = i + 1) begin
//            addr1 = i;
//            addr2 = i + 1;
//            #5;
//        end
//        end
        
    end

endmodule
