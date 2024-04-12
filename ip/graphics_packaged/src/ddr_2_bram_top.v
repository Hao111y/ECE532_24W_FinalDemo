`timescale 1ns / 1ps

module ddr_2_bram_top(
    input clk_100,
    input reset_n,
    output [3:0] vga_r,
    output [3:0] vga_g,
    output [3:0] vga_b,
    output vga_hs,
    output vga_vs,
    
    input [7:0]S00_AXI_0_araddr,
    input [2:0]S00_AXI_0_arprot,
    output S00_AXI_0_arready,
    input S00_AXI_0_arvalid,
    input [7:0]S00_AXI_0_awaddr,
    input [2:0]S00_AXI_0_awprot,
    output S00_AXI_0_awready,
    input S00_AXI_0_awvalid,
    input S00_AXI_0_bready,
    output [1:0]S00_AXI_0_bresp,
    output S00_AXI_0_bvalid,
    output [31:0]S00_AXI_0_rdata,
    input S00_AXI_0_rready,
    output [1:0]S00_AXI_0_rresp,
    output S00_AXI_0_rvalid,
    input [31:0]S00_AXI_0_wdata,
    output S00_AXI_0_wready,
    input [3:0]S00_AXI_0_wstrb,
    input S00_AXI_0_wvalid,
    
    output wire [5:0]debug_burst_count,
    output wire [3:0]debug_state
    );
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
    
    xpm_cdc_pulse sync1(.src_pulse(line_sync), .src_clk(clk_25), .dest_clk(clk_100), .dest_pulse(line_sync_100));
    xpm_cdc_pulse sync2(.src_pulse(frame_sync), .src_clk(clk_25), .dest_clk(clk_100), .dest_pulse(frame_sync_100));
    
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
        
        .S00_AXI_0_araddr(S00_AXI_0_araddr),
        .S00_AXI_0_arprot(S00_AXI_0_arprot),
        .S00_AXI_0_arready(S00_AXI_0_arready),
        .S00_AXI_0_arvalid(S00_AXI_0_arvalid),
        .S00_AXI_0_awaddr(S00_AXI_0_awaddr),
        .S00_AXI_0_awprot(S00_AXI_0_awprot),
        .S00_AXI_0_awready(S00_AXI_0_awready),
        .S00_AXI_0_awvalid(S00_AXI_0_awvalid),
        .S00_AXI_0_bready(S00_AXI_0_bready),
        .S00_AXI_0_bresp(S00_AXI_0_bresp),
        .S00_AXI_0_bvalid(S00_AXI_0_bvalid),
        .S00_AXI_0_rdata(S00_AXI_0_rdata),
        .S00_AXI_0_rready(S00_AXI_0_rready),
        .S00_AXI_0_rresp(S00_AXI_0_rresp),
        .S00_AXI_0_rvalid(S00_AXI_0_rvalid),
        .S00_AXI_0_wdata(S00_AXI_0_wdata),
        .S00_AXI_0_wready(S00_AXI_0_wready),
        .S00_AXI_0_wstrb(S00_AXI_0_wstrb),
        .S00_AXI_0_wvalid(S00_AXI_0_wvalid),
        
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
        .bram_addra_out(bram_addra_in),
        
        .debug_burst_count(debug_burst_count),
        .debug_state(debug_state)
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

endmodule
