//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
//Date        : Mon Mar 25 18:03:05 2024
//Host        : BA3135WS03 running 64-bit major release  (build 9200)
//Command     : generate_target ddr_2_bram_wrapper.bd
//Design      : ddr_2_bram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ddr_2_bram_wrapper
   (BRAM_PORTB_addr,
    BRAM_PORTB_clk,
    BRAM_PORTB_dout,
    BRAM_PORTB_en,
    bram0_addr,
    bram0_ctrl_addr,
    burst_complete_0,
    burst_count_total_0,
    clk_100M,
    clk_ddr,
    clk_vga,
    ddr2_addr,
    ddr2_ba,
    ddr2_cas_n,
    ddr2_ck_n,
    ddr2_ck_p,
    ddr2_cke,
    ddr2_cs_n,
    ddr2_dm,
    ddr2_dq,
    ddr2_dqs_n,
    ddr2_dqs_p,
    ddr2_odt,
    ddr2_ras_n,
    ddr2_we_n,
    frame_bram_addr_out,
    frame_bram_data_in,
    frame_bram_en_out,
    frame_sync,
    line_sync,
    reset_n,
    start_single_burst_0);
  input [11:0]BRAM_PORTB_addr;
  input BRAM_PORTB_clk;
  output [15:0]BRAM_PORTB_dout;
  input BRAM_PORTB_en;
  input [10:0]bram0_addr;
  output [12:0]bram0_ctrl_addr;
  output burst_complete_0;
  output [10:0]burst_count_total_0;
  input clk_100M;
  output clk_ddr;
  output clk_vga;
  output [12:0]ddr2_addr;
  output [2:0]ddr2_ba;
  output ddr2_cas_n;
  output [0:0]ddr2_ck_n;
  output [0:0]ddr2_ck_p;
  output [0:0]ddr2_cke;
  output [0:0]ddr2_cs_n;
  output [1:0]ddr2_dm;
  inout [15:0]ddr2_dq;
  inout [1:0]ddr2_dqs_n;
  inout [1:0]ddr2_dqs_p;
  output [0:0]ddr2_odt;
  output ddr2_ras_n;
  output ddr2_we_n;
  output [15:0]frame_bram_addr_out;
  input [19:0]frame_bram_data_in;
  output frame_bram_en_out;
  input frame_sync;
  input line_sync;
  input reset_n;
  output start_single_burst_0;

  wire [11:0]BRAM_PORTB_addr;
  wire BRAM_PORTB_clk;
  wire [15:0]BRAM_PORTB_dout;
  wire BRAM_PORTB_en;
  wire [10:0]bram0_addr;
  wire [12:0]bram0_ctrl_addr;
  wire burst_complete_0;
  wire [10:0]burst_count_total_0;
  wire clk_100M;
  wire clk_ddr;
  wire clk_vga;
  wire [12:0]ddr2_addr;
  wire [2:0]ddr2_ba;
  wire ddr2_cas_n;
  wire [0:0]ddr2_ck_n;
  wire [0:0]ddr2_ck_p;
  wire [0:0]ddr2_cke;
  wire [0:0]ddr2_cs_n;
  wire [1:0]ddr2_dm;
  wire [15:0]ddr2_dq;
  wire [1:0]ddr2_dqs_n;
  wire [1:0]ddr2_dqs_p;
  wire [0:0]ddr2_odt;
  wire ddr2_ras_n;
  wire ddr2_we_n;
  wire [15:0]frame_bram_addr_out;
  wire [19:0]frame_bram_data_in;
  wire frame_bram_en_out;
  wire frame_sync;
  wire line_sync;
  wire reset_n;
  wire start_single_burst_0;

  ddr_2_bram ddr_2_bram_i
       (.BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_clk(BRAM_PORTB_clk),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en),
        .bram0_addr(bram0_addr),
        .bram0_ctrl_addr(bram0_ctrl_addr),
        .burst_complete_0(burst_complete_0),
        .burst_count_total_0(burst_count_total_0),
        .clk_100M(clk_100M),
        .clk_ddr(clk_ddr),
        .clk_vga(clk_vga),
        .ddr2_addr(ddr2_addr),
        .ddr2_ba(ddr2_ba),
        .ddr2_cas_n(ddr2_cas_n),
        .ddr2_ck_n(ddr2_ck_n),
        .ddr2_ck_p(ddr2_ck_p),
        .ddr2_cke(ddr2_cke),
        .ddr2_cs_n(ddr2_cs_n),
        .ddr2_dm(ddr2_dm),
        .ddr2_dq(ddr2_dq),
        .ddr2_dqs_n(ddr2_dqs_n),
        .ddr2_dqs_p(ddr2_dqs_p),
        .ddr2_odt(ddr2_odt),
        .ddr2_ras_n(ddr2_ras_n),
        .ddr2_we_n(ddr2_we_n),
        .frame_bram_addr_out(frame_bram_addr_out),
        .frame_bram_data_in(frame_bram_data_in),
        .frame_bram_en_out(frame_bram_en_out),
        .frame_sync(frame_sync),
        .line_sync(line_sync),
        .reset_n(reset_n),
        .start_single_burst_0(start_single_burst_0));
endmodule
