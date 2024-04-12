//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
//Date        : Tue Apr  2 15:41:33 2024
//Host        : BA3135WS15 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (AXI_FB_A_addr,
    AXI_FB_A_clk,
    AXI_FB_A_din,
    AXI_FB_A_dout,
    AXI_FB_A_en,
    AXI_FB_A_rst,
    AXI_FB_A_we,
    AXI_FB_B_addr,
    AXI_FB_B_clk,
    AXI_FB_B_din,
    AXI_FB_B_dout,
    AXI_FB_B_en,
    AXI_FB_B_rst,
    AXI_FB_B_we,
    BRAM_FB_A_addr,
    BRAM_FB_A_clk,
    BRAM_FB_A_din,
    BRAM_FB_A_dout,
    BRAM_FB_A_en,
    BRAM_FB_A_we,
    BRAM_FB_B_addr,
    BRAM_FB_B_clk,
    BRAM_FB_B_din,
    BRAM_FB_B_dout,
    BRAM_FB_B_en,
    BRAM_FB_B_we,
    BRAM_PORTB_addr,
    BRAM_PORTB_clk,
    BRAM_PORTB_dout,
    BRAM_PORTB_en,
    S00_AXI_0_araddr,
    S00_AXI_0_arprot,
    S00_AXI_0_arready,
    S00_AXI_0_arvalid,
    S00_AXI_0_awaddr,
    S00_AXI_0_awprot,
    S00_AXI_0_awready,
    S00_AXI_0_awvalid,
    S00_AXI_0_bready,
    S00_AXI_0_bresp,
    S00_AXI_0_bvalid,
    S00_AXI_0_rdata,
    S00_AXI_0_rready,
    S00_AXI_0_rresp,
    S00_AXI_0_rvalid,
    S00_AXI_0_wdata,
    S00_AXI_0_wready,
    S00_AXI_0_wstrb,
    S00_AXI_0_wvalid,
    bram_addra_in,
    bram_addra_out,
    clk_100,
    clk_25,
    debug_burst_count,
    debug_state,
    frame_sync,
    line_sync,
    reset_n);
  output [19:0]AXI_FB_A_addr;
  output AXI_FB_A_clk;
  output [31:0]AXI_FB_A_din;
  input [31:0]AXI_FB_A_dout;
  output AXI_FB_A_en;
  output AXI_FB_A_rst;
  output [3:0]AXI_FB_A_we;
  output [19:0]AXI_FB_B_addr;
  output AXI_FB_B_clk;
  output [31:0]AXI_FB_B_din;
  input [31:0]AXI_FB_B_dout;
  output AXI_FB_B_en;
  output AXI_FB_B_rst;
  output [3:0]AXI_FB_B_we;
  input [17:0]BRAM_FB_A_addr;
  input BRAM_FB_A_clk;
  input [11:0]BRAM_FB_A_din;
  output [11:0]BRAM_FB_A_dout;
  input BRAM_FB_A_en;
  input [0:0]BRAM_FB_A_we;
  input [17:0]BRAM_FB_B_addr;
  input BRAM_FB_B_clk;
  input [11:0]BRAM_FB_B_din;
  output [11:0]BRAM_FB_B_dout;
  input BRAM_FB_B_en;
  input [0:0]BRAM_FB_B_we;
  input [10:0]BRAM_PORTB_addr;
  input BRAM_PORTB_clk;
  output [15:0]BRAM_PORTB_dout;
  input BRAM_PORTB_en;
  input [7:0]S00_AXI_0_araddr;
  input [2:0]S00_AXI_0_arprot;
  output S00_AXI_0_arready;
  input S00_AXI_0_arvalid;
  input [7:0]S00_AXI_0_awaddr;
  input [2:0]S00_AXI_0_awprot;
  output S00_AXI_0_awready;
  input S00_AXI_0_awvalid;
  input S00_AXI_0_bready;
  output [1:0]S00_AXI_0_bresp;
  output S00_AXI_0_bvalid;
  output [31:0]S00_AXI_0_rdata;
  input S00_AXI_0_rready;
  output [1:0]S00_AXI_0_rresp;
  output S00_AXI_0_rvalid;
  input [31:0]S00_AXI_0_wdata;
  output S00_AXI_0_wready;
  input [3:0]S00_AXI_0_wstrb;
  input S00_AXI_0_wvalid;
  input [9:0]bram_addra_in;
  output [11:0]bram_addra_out;
  input clk_100;
  output clk_25;
  output [5:0]debug_burst_count;
  output [3:0]debug_state;
  input frame_sync;
  input line_sync;
  input reset_n;

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
  wire [10:0]BRAM_PORTB_addr;
  wire BRAM_PORTB_clk;
  wire [15:0]BRAM_PORTB_dout;
  wire BRAM_PORTB_en;
  wire [7:0]S00_AXI_0_araddr;
  wire [2:0]S00_AXI_0_arprot;
  wire S00_AXI_0_arready;
  wire S00_AXI_0_arvalid;
  wire [7:0]S00_AXI_0_awaddr;
  wire [2:0]S00_AXI_0_awprot;
  wire S00_AXI_0_awready;
  wire S00_AXI_0_awvalid;
  wire S00_AXI_0_bready;
  wire [1:0]S00_AXI_0_bresp;
  wire S00_AXI_0_bvalid;
  wire [31:0]S00_AXI_0_rdata;
  wire S00_AXI_0_rready;
  wire [1:0]S00_AXI_0_rresp;
  wire S00_AXI_0_rvalid;
  wire [31:0]S00_AXI_0_wdata;
  wire S00_AXI_0_wready;
  wire [3:0]S00_AXI_0_wstrb;
  wire S00_AXI_0_wvalid;
  wire [9:0]bram_addra_in;
  wire [11:0]bram_addra_out;
  wire clk_100;
  wire clk_25;
  wire [5:0]debug_burst_count;
  wire [3:0]debug_state;
  wire frame_sync;
  wire line_sync;
  wire reset_n;

  design_1 design_1_i
       (.AXI_FB_A_addr(AXI_FB_A_addr),
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
        .bram_addra_in(bram_addra_in),
        .bram_addra_out(bram_addra_out),
        .clk_100(clk_100),
        .clk_25(clk_25),
        .debug_burst_count(debug_burst_count),
        .debug_state(debug_state),
        .frame_sync(frame_sync),
        .line_sync(line_sync),
        .reset_n(reset_n));
endmodule
