`timescale 1ns / 1ps


module ddr_2_bram_tb(

    );
    reg reset_n;
    reg clk_100;
    wire clk_25;
    wire line_sync;
    wire line_sync_100;
    wire frame_sync;
    wire frame_sync_100;

    wire [12:0] BRAM_PORTB_addr;
    wire BRAM_PORTB_clk;
    wire [15:0] BRAM_PORTB_dout;
    wire BRAM_PORTB_en;

    wire [11:0] rgb_out;

    wire [3:0] vga_r;
    wire [3:0] vga_g;
    wire [3:0] vga_b;
    wire vga_hs;
    wire vga_vs;
    
    assign line_sync_100 = line_sync;
    assign frame_sync_100 = frame_sync;

    wire [12:0] bram_addra_in;
    
    
    // Connect the bram ports for frame buffer between axi controller and bram
    wire [19:0]AXI_FB_A_addr;
    wire AXI_FB_A_clk;
    wire [31:0]AXI_FB_A_din;
    wire [31:0]AXI_FB_A_dout;
    wire AXI_FB_A_en;
    wire AXI_FB_A_rst;
    wire [3:0]AXI_FB_A_we;
    
    wire [19:0]AXI_FB_B_addr;
    wire AXI_FB_B_clk;
    wire [31:0]AXI_FB_B_din;
    wire [31:0]AXI_FB_B_dout;
    wire AXI_FB_B_en;
    wire AXI_FB_B_rst;
    wire [3:0]AXI_FB_B_we;
    
    wire [17:0]BRAM_FB_A_addr;
    wire BRAM_FB_A_clk;
    wire [11:0]BRAM_FB_A_din;
    wire [11:0]BRAM_FB_A_dout;
    wire BRAM_FB_A_en;
    wire [0:0]BRAM_FB_A_we;
    
    wire [17:0]BRAM_FB_B_addr;
    wire BRAM_FB_B_clk;
    wire [11:0]BRAM_FB_B_din;
    wire [11:0]BRAM_FB_B_dout;
    wire BRAM_FB_B_en;
    wire [0:0]BRAM_FB_B_we;
    
    assign AXI_FB_A_dout = {20'b0, BRAM_FB_A_dout};
    assign AXI_FB_B_dout = {20'b0, BRAM_FB_B_dout};

    assign BRAM_FB_A_addr = AXI_FB_A_addr[19:2];
    assign BRAM_FB_A_clk = AXI_FB_A_clk;
    assign BRAM_FB_A_din = AXI_FB_A_din[11:0];
    assign BRAM_FB_A_en = AXI_FB_A_en;
    assign BRAM_FB_A_we = AXI_FB_A_we[0];
    assign BRAM_FB_B_addr = AXI_FB_B_addr[19:2];
    assign BRAM_FB_B_clk = AXI_FB_B_clk;
    assign BRAM_FB_B_din = AXI_FB_B_din[11:0];
    assign BRAM_FB_B_en = AXI_FB_B_en;
    assign BRAM_FB_B_we = AXI_FB_B_we[0];
    
    // Instantiate the main blockk diagram
    design_1_wrapper u0(
        .AXI_FB_A_addr(AXI_FB_A_addr),
        .AXI_FB_A_clk(AXI_FB_A_clk),
        .AXI_FB_A_din(AXI_FB_A_din),
        .AXI_FB_A_dout(AXI_FB_A_dout),
        .AXI_FB_A_en(AXI_FB_A_en),
        .AXI_FB_A_rst(AXI_FB_A_rst),
        .AXI_FB_A_we(AXI_FB_A_we),
        .AXI_FB_B_addr(AXI_FB_B_addr),
        .AXI_FB_B_clk(AXI_FB_B_clk),
        .AXI_FB_B_din(AXI_FB_B_din),
        .AXI_FB_B_dout(AXI_FB_B_dout),
        .AXI_FB_B_en(AXI_FB_B_en),
        .AXI_FB_B_rst(AXI_FB_B_rst),
        .AXI_FB_B_we(AXI_FB_B_we),
        .BRAM_FB_A_addr(BRAM_FB_A_addr),
        .BRAM_FB_A_clk(BRAM_FB_A_clk),
        .BRAM_FB_A_din(BRAM_FB_A_din),
        .BRAM_FB_A_dout(BRAM_FB_A_dout),
        .BRAM_FB_A_en(BRAM_FB_A_en),
        .BRAM_FB_A_we(BRAM_FB_A_we),
        .BRAM_FB_B_addr(BRAM_FB_B_addr),
        .BRAM_FB_B_clk(BRAM_FB_B_clk),
        .BRAM_FB_B_din(BRAM_FB_B_din),
        .BRAM_FB_B_dout(BRAM_FB_B_dout),
        .BRAM_FB_B_en(BRAM_FB_B_en),
        .BRAM_FB_B_we(BRAM_FB_B_we),
        
        .BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_clk(BRAM_PORTB_clk),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en),
        .clk_100(clk_100),
        .clk_25(clk_25),
        .line_sync(line_sync_100),
        .frame_sync(frame_sync_100),
        .reset_n(reset_n),
        .bram_addra_in(bram_addra_in[11:2]),
        .bram_addra_out(bram_addra_in)
    );

    get_next_line u1(
        .clk(clk_25),
        .reset_n(reset_n),
        .clkb(BRAM_PORTB_clk),
        .rstb(),
        .enb(BRAM_PORTB_en),
        .wenb(),
        .addrb(BRAM_PORTB_addr),
        .dinb(),
        .doutb(BRAM_PORTB_dout),
        .rgb_out(rgb_out),
        .start_next_line(line_sync),
        .frame_sync(frame_sync)
    );

    VGA_640x480 u2(
        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b),
        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .line_sync(line_sync),
        .frame_sync(frame_sync),
        .rgb_in(rgb_out),
        .clk(clk_25),
        .areset_n(reset_n)
    );

    // Clock generation
    initial begin
        clk_100 = 0;
        forever begin
            #1 clk_100 = ~clk_100;
        end
    end

    // Reset generation
    initial begin
        reset_n = 0;
        #100 reset_n = 1;
    end

endmodule
