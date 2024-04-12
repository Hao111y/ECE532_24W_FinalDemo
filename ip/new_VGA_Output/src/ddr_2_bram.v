//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
//Date        : Mon Mar 25 18:03:05 2024
//Host        : BA3135WS03 running 64-bit major release  (build 9200)
//Command     : generate_target ddr_2_bram.bd
//Design      : ddr_2_bram
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ddr_2_bram,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ddr_2_bram,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=9,numNonXlnxBlks=0,numHierBlks=4,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=4,da_board_cnt=5,da_bram_cntlr_cnt=7,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "ddr_2_bram.hwdef" *) 
module ddr_2_bram
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORTB, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE, MEM_SIZE 8192, MEM_WIDTH 32, READ_LATENCY 1" *) input [11:0]BRAM_PORTB_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) input BRAM_PORTB_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]BRAM_PORTB_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input BRAM_PORTB_en;
  input [10:0]bram0_addr;
  output [12:0]bram0_ctrl_addr;
  output burst_complete_0;
  output [10:0]burst_count_total_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100M, CLK_DOMAIN ddr_2_bram_clk_in1_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_100M;
  output clk_ddr;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_VGA CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_VGA, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 25173501, INSERT_VIP 0, PHASE 0.0" *) output clk_vga;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr2, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) output [12:0]ddr2_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 BA" *) output [2:0]ddr2_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 CAS_N" *) output ddr2_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 CK_N" *) output [0:0]ddr2_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 CK_P" *) output [0:0]ddr2_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 CKE" *) output [0:0]ddr2_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 CS_N" *) output [0:0]ddr2_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 DM" *) output [1:0]ddr2_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 DQ" *) inout [15:0]ddr2_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 DQS_N" *) inout [1:0]ddr2_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 DQS_P" *) inout [1:0]ddr2_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 ODT" *) output [0:0]ddr2_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 RAS_N" *) output ddr2_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 ddr2 WE_N" *) output ddr2_we_n;
  output [15:0]frame_bram_addr_out;
  input [19:0]frame_bram_data_in;
  output frame_bram_en_out;
  input frame_sync;
  input line_sync;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_n;
  output start_single_burst_0;

  wire [11:0]BRAM_PORTB_0_1_ADDR;
  wire BRAM_PORTB_0_1_CLK;
  wire [15:0]BRAM_PORTB_0_1_DOUT;
  wire BRAM_PORTB_0_1_EN;
  wire Net1;
  wire S00_ACLK_1;
  wire [31:0]S00_AXI_1_ARADDR;
  wire [1:0]S00_AXI_1_ARBURST;
  wire [3:0]S00_AXI_1_ARCACHE;
  wire [0:0]S00_AXI_1_ARID;
  wire [7:0]S00_AXI_1_ARLEN;
  wire S00_AXI_1_ARLOCK;
  wire [2:0]S00_AXI_1_ARPROT;
  wire [3:0]S00_AXI_1_ARQOS;
  wire S00_AXI_1_ARREADY;
  wire [2:0]S00_AXI_1_ARSIZE;
  wire [0:0]S00_AXI_1_ARUSER;
  wire S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_AWADDR;
  wire [1:0]S00_AXI_1_AWBURST;
  wire [3:0]S00_AXI_1_AWCACHE;
  wire [0:0]S00_AXI_1_AWID;
  wire [7:0]S00_AXI_1_AWLEN;
  wire S00_AXI_1_AWLOCK;
  wire [2:0]S00_AXI_1_AWPROT;
  wire [3:0]S00_AXI_1_AWQOS;
  wire S00_AXI_1_AWREADY;
  wire [2:0]S00_AXI_1_AWSIZE;
  wire [0:0]S00_AXI_1_AWUSER;
  wire S00_AXI_1_AWVALID;
  wire [1:0]S00_AXI_1_BID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire [0:0]S00_AXI_1_BUSER;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire [1:0]S00_AXI_1_RID;
  wire S00_AXI_1_RLAST;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire [0:0]S00_AXI_1_RUSER;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire S00_AXI_1_WLAST;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire [0:0]S00_AXI_1_WUSER;
  wire S00_AXI_1_WVALID;
  wire [10:0]addra_0_1;
  wire [12:0]axi_bram_ctrl_0_bram_addr_a;
  wire axi_bram_ctrl_0_bram_clk_a;
  wire axi_bram_ctrl_0_bram_en_a;
  wire [3:0]axi_bram_ctrl_0_bram_we_a;
  wire [31:0]axi_bram_ctrl_0_bram_wrdata_a;
  wire [26:0]axi_interconnect_0_M00_AXI_ARADDR;
  wire [1:0]axi_interconnect_0_M00_AXI_ARBURST;
  wire [3:0]axi_interconnect_0_M00_AXI_ARCACHE;
  wire [1:0]axi_interconnect_0_M00_AXI_ARID;
  wire [7:0]axi_interconnect_0_M00_AXI_ARLEN;
  wire axi_interconnect_0_M00_AXI_ARLOCK;
  wire [2:0]axi_interconnect_0_M00_AXI_ARPROT;
  wire [3:0]axi_interconnect_0_M00_AXI_ARQOS;
  wire axi_interconnect_0_M00_AXI_ARREADY;
  wire [2:0]axi_interconnect_0_M00_AXI_ARSIZE;
  wire axi_interconnect_0_M00_AXI_ARVALID;
  wire [26:0]axi_interconnect_0_M00_AXI_AWADDR;
  wire [1:0]axi_interconnect_0_M00_AXI_AWBURST;
  wire [3:0]axi_interconnect_0_M00_AXI_AWCACHE;
  wire [1:0]axi_interconnect_0_M00_AXI_AWID;
  wire [7:0]axi_interconnect_0_M00_AXI_AWLEN;
  wire axi_interconnect_0_M00_AXI_AWLOCK;
  wire [2:0]axi_interconnect_0_M00_AXI_AWPROT;
  wire [3:0]axi_interconnect_0_M00_AXI_AWQOS;
  wire axi_interconnect_0_M00_AXI_AWREADY;
  wire [2:0]axi_interconnect_0_M00_AXI_AWSIZE;
  wire axi_interconnect_0_M00_AXI_AWVALID;
  wire [1:0]axi_interconnect_0_M00_AXI_BID;
  wire axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_BRESP;
  wire axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_RDATA;
  wire [1:0]axi_interconnect_0_M00_AXI_RID;
  wire axi_interconnect_0_M00_AXI_RLAST;
  wire axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_RRESP;
  wire axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_WDATA;
  wire axi_interconnect_0_M00_AXI_WLAST;
  wire axi_interconnect_0_M00_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M00_AXI_WSTRB;
  wire axi_interconnect_0_M00_AXI_WVALID;
  wire [15:0]bram_2_ddr_stream_0_BRAM_ADDR;
  wire bram_2_ddr_stream_0_BRAM_EN;
  wire [31:0]bram_2_ddr_stream_0_M00_AXI_ARADDR;
  wire [1:0]bram_2_ddr_stream_0_M00_AXI_ARBURST;
  wire [3:0]bram_2_ddr_stream_0_M00_AXI_ARCACHE;
  wire [0:0]bram_2_ddr_stream_0_M00_AXI_ARID;
  wire [7:0]bram_2_ddr_stream_0_M00_AXI_ARLEN;
  wire bram_2_ddr_stream_0_M00_AXI_ARLOCK;
  wire [2:0]bram_2_ddr_stream_0_M00_AXI_ARPROT;
  wire [3:0]bram_2_ddr_stream_0_M00_AXI_ARQOS;
  wire bram_2_ddr_stream_0_M00_AXI_ARREADY;
  wire [2:0]bram_2_ddr_stream_0_M00_AXI_ARSIZE;
  wire [0:0]bram_2_ddr_stream_0_M00_AXI_ARUSER;
  wire bram_2_ddr_stream_0_M00_AXI_ARVALID;
  wire [31:0]bram_2_ddr_stream_0_M00_AXI_AWADDR;
  wire [1:0]bram_2_ddr_stream_0_M00_AXI_AWBURST;
  wire [3:0]bram_2_ddr_stream_0_M00_AXI_AWCACHE;
  wire [0:0]bram_2_ddr_stream_0_M00_AXI_AWID;
  wire [7:0]bram_2_ddr_stream_0_M00_AXI_AWLEN;
  wire bram_2_ddr_stream_0_M00_AXI_AWLOCK;
  wire [2:0]bram_2_ddr_stream_0_M00_AXI_AWPROT;
  wire [3:0]bram_2_ddr_stream_0_M00_AXI_AWQOS;
  wire bram_2_ddr_stream_0_M00_AXI_AWREADY;
  wire [2:0]bram_2_ddr_stream_0_M00_AXI_AWSIZE;
  wire [0:0]bram_2_ddr_stream_0_M00_AXI_AWUSER;
  wire bram_2_ddr_stream_0_M00_AXI_AWVALID;
  wire [1:0]bram_2_ddr_stream_0_M00_AXI_BID;
  wire bram_2_ddr_stream_0_M00_AXI_BREADY;
  wire [1:0]bram_2_ddr_stream_0_M00_AXI_BRESP;
  wire [0:0]bram_2_ddr_stream_0_M00_AXI_BUSER;
  wire bram_2_ddr_stream_0_M00_AXI_BVALID;
  wire [31:0]bram_2_ddr_stream_0_M00_AXI_RDATA;
  wire [1:0]bram_2_ddr_stream_0_M00_AXI_RID;
  wire bram_2_ddr_stream_0_M00_AXI_RLAST;
  wire bram_2_ddr_stream_0_M00_AXI_RREADY;
  wire [1:0]bram_2_ddr_stream_0_M00_AXI_RRESP;
  wire [0:0]bram_2_ddr_stream_0_M00_AXI_RUSER;
  wire bram_2_ddr_stream_0_M00_AXI_RVALID;
  wire [31:0]bram_2_ddr_stream_0_M00_AXI_WDATA;
  wire bram_2_ddr_stream_0_M00_AXI_WLAST;
  wire bram_2_ddr_stream_0_M00_AXI_WREADY;
  wire [3:0]bram_2_ddr_stream_0_M00_AXI_WSTRB;
  wire [0:0]bram_2_ddr_stream_0_M00_AXI_WUSER;
  wire bram_2_ddr_stream_0_M00_AXI_WVALID;
  wire [19:0]bram_data_0_1;
  wire clk_in1_0_1;
  wire clk_wiz_0_clk_out1;
  wire [31:0]ddr_to_bram_vga_stre_0_M01_AXI_ARADDR;
  wire [1:0]ddr_to_bram_vga_stre_0_M01_AXI_ARBURST;
  wire [3:0]ddr_to_bram_vga_stre_0_M01_AXI_ARCACHE;
  wire [0:0]ddr_to_bram_vga_stre_0_M01_AXI_ARID;
  wire [7:0]ddr_to_bram_vga_stre_0_M01_AXI_ARLEN;
  wire ddr_to_bram_vga_stre_0_M01_AXI_ARLOCK;
  wire [2:0]ddr_to_bram_vga_stre_0_M01_AXI_ARPROT;
  wire ddr_to_bram_vga_stre_0_M01_AXI_ARREADY;
  wire [2:0]ddr_to_bram_vga_stre_0_M01_AXI_ARSIZE;
  wire ddr_to_bram_vga_stre_0_M01_AXI_ARVALID;
  wire [31:0]ddr_to_bram_vga_stre_0_M01_AXI_AWADDR;
  wire [1:0]ddr_to_bram_vga_stre_0_M01_AXI_AWBURST;
  wire [3:0]ddr_to_bram_vga_stre_0_M01_AXI_AWCACHE;
  wire [0:0]ddr_to_bram_vga_stre_0_M01_AXI_AWID;
  wire [7:0]ddr_to_bram_vga_stre_0_M01_AXI_AWLEN;
  wire ddr_to_bram_vga_stre_0_M01_AXI_AWLOCK;
  wire [2:0]ddr_to_bram_vga_stre_0_M01_AXI_AWPROT;
  wire ddr_to_bram_vga_stre_0_M01_AXI_AWREADY;
  wire [2:0]ddr_to_bram_vga_stre_0_M01_AXI_AWSIZE;
  wire ddr_to_bram_vga_stre_0_M01_AXI_AWVALID;
  wire [0:0]ddr_to_bram_vga_stre_0_M01_AXI_BID;
  wire ddr_to_bram_vga_stre_0_M01_AXI_BREADY;
  wire [1:0]ddr_to_bram_vga_stre_0_M01_AXI_BRESP;
  wire ddr_to_bram_vga_stre_0_M01_AXI_BVALID;
  wire [31:0]ddr_to_bram_vga_stre_0_M01_AXI_RDATA;
  wire [0:0]ddr_to_bram_vga_stre_0_M01_AXI_RID;
  wire ddr_to_bram_vga_stre_0_M01_AXI_RLAST;
  wire ddr_to_bram_vga_stre_0_M01_AXI_RREADY;
  wire [1:0]ddr_to_bram_vga_stre_0_M01_AXI_RRESP;
  wire ddr_to_bram_vga_stre_0_M01_AXI_RVALID;
  wire [31:0]ddr_to_bram_vga_stre_0_M01_AXI_WDATA;
  wire ddr_to_bram_vga_stre_0_M01_AXI_WLAST;
  wire ddr_to_bram_vga_stre_0_M01_AXI_WREADY;
  wire [3:0]ddr_to_bram_vga_stre_0_M01_AXI_WSTRB;
  wire ddr_to_bram_vga_stre_0_M01_AXI_WVALID;
  wire ddr_to_bram_vga_stre_0_burst_complete;
  wire [10:0]ddr_to_bram_vga_stre_0_burst_count_total;
  wire ddr_to_bram_vga_stre_0_start_single_burst;
  wire frame_sync_1;
  wire line_sync_1;
  wire [12:0]mig_7series_0_DDR2_ADDR;
  wire [2:0]mig_7series_0_DDR2_BA;
  wire mig_7series_0_DDR2_CAS_N;
  wire [0:0]mig_7series_0_DDR2_CKE;
  wire [0:0]mig_7series_0_DDR2_CK_N;
  wire [0:0]mig_7series_0_DDR2_CK_P;
  wire [0:0]mig_7series_0_DDR2_CS_N;
  wire [1:0]mig_7series_0_DDR2_DM;
  wire [15:0]mig_7series_0_DDR2_DQ;
  wire [1:0]mig_7series_0_DDR2_DQS_N;
  wire [1:0]mig_7series_0_DDR2_DQS_P;
  wire [0:0]mig_7series_0_DDR2_ODT;
  wire mig_7series_0_DDR2_RAS_N;
  wire mig_7series_0_DDR2_WE_N;
  wire mig_7series_0_mmcm_locked;
  wire mig_7series_0_ui_clk;
  wire mig_7series_0_ui_clk_sync_rst;
  wire [0:0]rst_mig_7series_0_81M_peripheral_aresetn;

  assign BRAM_PORTB_0_1_ADDR = BRAM_PORTB_addr[11:0];
  assign BRAM_PORTB_0_1_CLK = BRAM_PORTB_clk;
  assign BRAM_PORTB_0_1_EN = BRAM_PORTB_en;
  assign BRAM_PORTB_dout[15:0] = BRAM_PORTB_0_1_DOUT;
  assign Net1 = reset_n;
  assign addra_0_1 = bram0_addr[10:0];
  assign bram0_ctrl_addr[12:0] = axi_bram_ctrl_0_bram_addr_a;
  assign bram_data_0_1 = frame_bram_data_in[19:0];
  assign burst_complete_0 = ddr_to_bram_vga_stre_0_burst_complete;
  assign burst_count_total_0[10:0] = ddr_to_bram_vga_stre_0_burst_count_total;
  assign clk_ddr = S00_ACLK_1;
  assign clk_in1_0_1 = clk_100M;
  assign clk_vga = clk_wiz_0_clk_out1;
  assign ddr2_addr[12:0] = mig_7series_0_DDR2_ADDR;
  assign ddr2_ba[2:0] = mig_7series_0_DDR2_BA;
  assign ddr2_cas_n = mig_7series_0_DDR2_CAS_N;
  assign ddr2_ck_n[0] = mig_7series_0_DDR2_CK_N;
  assign ddr2_ck_p[0] = mig_7series_0_DDR2_CK_P;
  assign ddr2_cke[0] = mig_7series_0_DDR2_CKE;
  assign ddr2_cs_n[0] = mig_7series_0_DDR2_CS_N;
  assign ddr2_dm[1:0] = mig_7series_0_DDR2_DM;
  assign ddr2_odt[0] = mig_7series_0_DDR2_ODT;
  assign ddr2_ras_n = mig_7series_0_DDR2_RAS_N;
  assign ddr2_we_n = mig_7series_0_DDR2_WE_N;
  assign frame_bram_addr_out[15:0] = bram_2_ddr_stream_0_BRAM_ADDR;
  assign frame_bram_en_out = bram_2_ddr_stream_0_BRAM_EN;
  assign frame_sync_1 = frame_sync;
  assign line_sync_1 = line_sync;
  assign start_single_burst_0 = ddr_to_bram_vga_stre_0_start_single_burst;
  ddr_2_bram_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_bram_addr_a),
        .bram_clk_a(axi_bram_ctrl_0_bram_clk_a),
        .bram_en_a(axi_bram_ctrl_0_bram_en_a),
        .bram_rddata_a({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .bram_we_a(axi_bram_ctrl_0_bram_we_a),
        .bram_wrdata_a(axi_bram_ctrl_0_bram_wrdata_a),
        .s_axi_aclk(S00_ACLK_1),
        .s_axi_araddr(ddr_to_bram_vga_stre_0_M01_AXI_ARADDR[12:0]),
        .s_axi_arburst(ddr_to_bram_vga_stre_0_M01_AXI_ARBURST),
        .s_axi_arcache(ddr_to_bram_vga_stre_0_M01_AXI_ARCACHE),
        .s_axi_aresetn(Net1),
        .s_axi_arid(ddr_to_bram_vga_stre_0_M01_AXI_ARID),
        .s_axi_arlen(ddr_to_bram_vga_stre_0_M01_AXI_ARLEN),
        .s_axi_arlock(ddr_to_bram_vga_stre_0_M01_AXI_ARLOCK),
        .s_axi_arprot(ddr_to_bram_vga_stre_0_M01_AXI_ARPROT),
        .s_axi_arready(ddr_to_bram_vga_stre_0_M01_AXI_ARREADY),
        .s_axi_arsize(ddr_to_bram_vga_stre_0_M01_AXI_ARSIZE),
        .s_axi_arvalid(ddr_to_bram_vga_stre_0_M01_AXI_ARVALID),
        .s_axi_awaddr(ddr_to_bram_vga_stre_0_M01_AXI_AWADDR[12:0]),
        .s_axi_awburst(ddr_to_bram_vga_stre_0_M01_AXI_AWBURST),
        .s_axi_awcache(ddr_to_bram_vga_stre_0_M01_AXI_AWCACHE),
        .s_axi_awid(ddr_to_bram_vga_stre_0_M01_AXI_AWID),
        .s_axi_awlen(ddr_to_bram_vga_stre_0_M01_AXI_AWLEN),
        .s_axi_awlock(ddr_to_bram_vga_stre_0_M01_AXI_AWLOCK),
        .s_axi_awprot(ddr_to_bram_vga_stre_0_M01_AXI_AWPROT),
        .s_axi_awready(ddr_to_bram_vga_stre_0_M01_AXI_AWREADY),
        .s_axi_awsize(ddr_to_bram_vga_stre_0_M01_AXI_AWSIZE),
        .s_axi_awvalid(ddr_to_bram_vga_stre_0_M01_AXI_AWVALID),
        .s_axi_bid(ddr_to_bram_vga_stre_0_M01_AXI_BID),
        .s_axi_bready(ddr_to_bram_vga_stre_0_M01_AXI_BREADY),
        .s_axi_bresp(ddr_to_bram_vga_stre_0_M01_AXI_BRESP),
        .s_axi_bvalid(ddr_to_bram_vga_stre_0_M01_AXI_BVALID),
        .s_axi_rdata(ddr_to_bram_vga_stre_0_M01_AXI_RDATA),
        .s_axi_rid(ddr_to_bram_vga_stre_0_M01_AXI_RID),
        .s_axi_rlast(ddr_to_bram_vga_stre_0_M01_AXI_RLAST),
        .s_axi_rready(ddr_to_bram_vga_stre_0_M01_AXI_RREADY),
        .s_axi_rresp(ddr_to_bram_vga_stre_0_M01_AXI_RRESP),
        .s_axi_rvalid(ddr_to_bram_vga_stre_0_M01_AXI_RVALID),
        .s_axi_wdata(ddr_to_bram_vga_stre_0_M01_AXI_WDATA),
        .s_axi_wlast(ddr_to_bram_vga_stre_0_M01_AXI_WLAST),
        .s_axi_wready(ddr_to_bram_vga_stre_0_M01_AXI_WREADY),
        .s_axi_wstrb(ddr_to_bram_vga_stre_0_M01_AXI_WSTRB),
        .s_axi_wvalid(ddr_to_bram_vga_stre_0_M01_AXI_WVALID));
  ddr_2_bram_axi_bram_ctrl_0_bram_0 axi_bram_ctrl_0_bram
       (.addra(addra_0_1),
        .addrb(BRAM_PORTB_0_1_ADDR),
        .clka(axi_bram_ctrl_0_bram_clk_a),
        .clkb(BRAM_PORTB_0_1_CLK),
        .dina(axi_bram_ctrl_0_bram_wrdata_a),
        .doutb(BRAM_PORTB_0_1_DOUT),
        .ena(axi_bram_ctrl_0_bram_en_a),
        .enb(BRAM_PORTB_0_1_EN),
        .wea(axi_bram_ctrl_0_bram_we_a[0]));
  ddr_2_bram_axi_interconnect_0_0 axi_interconnect_0
       (.ACLK(S00_ACLK_1),
        .ARESETN(Net1),
        .M00_ACLK(mig_7series_0_ui_clk),
        .M00_ARESETN(rst_mig_7series_0_81M_peripheral_aresetn),
        .M00_AXI_araddr(axi_interconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_interconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_interconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_interconnect_0_M00_AXI_ARID),
        .M00_AXI_arlen(axi_interconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_interconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_interconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_interconnect_0_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_interconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_interconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_interconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_interconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_interconnect_0_M00_AXI_AWID),
        .M00_AXI_awlen(axi_interconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_interconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_interconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_interconnect_0_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_interconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_interconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_interconnect_0_M00_AXI_BID),
        .M00_AXI_bready(axi_interconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_interconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_interconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_interconnect_0_M00_AXI_RDATA),
        .M00_AXI_rid(axi_interconnect_0_M00_AXI_RID),
        .M00_AXI_rlast(axi_interconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(axi_interconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_interconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_interconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_interconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_interconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(axi_interconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_interconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_0_M00_AXI_WVALID),
        .S00_ACLK(S00_ACLK_1),
        .S00_ARESETN(Net1),
        .S00_AXI_araddr(S00_AXI_1_ARADDR),
        .S00_AXI_arburst(S00_AXI_1_ARBURST),
        .S00_AXI_arcache(S00_AXI_1_ARCACHE),
        .S00_AXI_arid(S00_AXI_1_ARID),
        .S00_AXI_arlen(S00_AXI_1_ARLEN),
        .S00_AXI_arlock(S00_AXI_1_ARLOCK),
        .S00_AXI_arprot(S00_AXI_1_ARPROT),
        .S00_AXI_arqos(S00_AXI_1_ARQOS),
        .S00_AXI_arready(S00_AXI_1_ARREADY),
        .S00_AXI_arsize(S00_AXI_1_ARSIZE),
        .S00_AXI_aruser(S00_AXI_1_ARUSER),
        .S00_AXI_arvalid(S00_AXI_1_ARVALID),
        .S00_AXI_awaddr(S00_AXI_1_AWADDR),
        .S00_AXI_awburst(S00_AXI_1_AWBURST),
        .S00_AXI_awcache(S00_AXI_1_AWCACHE),
        .S00_AXI_awid(S00_AXI_1_AWID),
        .S00_AXI_awlen(S00_AXI_1_AWLEN),
        .S00_AXI_awlock(S00_AXI_1_AWLOCK),
        .S00_AXI_awprot(S00_AXI_1_AWPROT),
        .S00_AXI_awqos(S00_AXI_1_AWQOS),
        .S00_AXI_awready(S00_AXI_1_AWREADY),
        .S00_AXI_awsize(S00_AXI_1_AWSIZE),
        .S00_AXI_awuser(S00_AXI_1_AWUSER),
        .S00_AXI_awvalid(S00_AXI_1_AWVALID),
        .S00_AXI_bid(S00_AXI_1_BID),
        .S00_AXI_bready(S00_AXI_1_BREADY),
        .S00_AXI_bresp(S00_AXI_1_BRESP),
        .S00_AXI_buser(S00_AXI_1_BUSER),
        .S00_AXI_bvalid(S00_AXI_1_BVALID),
        .S00_AXI_rdata(S00_AXI_1_RDATA),
        .S00_AXI_rid(S00_AXI_1_RID),
        .S00_AXI_rlast(S00_AXI_1_RLAST),
        .S00_AXI_rready(S00_AXI_1_RREADY),
        .S00_AXI_rresp(S00_AXI_1_RRESP),
        .S00_AXI_ruser(S00_AXI_1_RUSER),
        .S00_AXI_rvalid(S00_AXI_1_RVALID),
        .S00_AXI_wdata(S00_AXI_1_WDATA),
        .S00_AXI_wlast(S00_AXI_1_WLAST),
        .S00_AXI_wready(S00_AXI_1_WREADY),
        .S00_AXI_wstrb(S00_AXI_1_WSTRB),
        .S00_AXI_wuser(S00_AXI_1_WUSER),
        .S00_AXI_wvalid(S00_AXI_1_WVALID),
        .S01_ACLK(S00_ACLK_1),
        .S01_ARESETN(Net1),
        .S01_AXI_araddr(bram_2_ddr_stream_0_M00_AXI_ARADDR),
        .S01_AXI_arburst(bram_2_ddr_stream_0_M00_AXI_ARBURST),
        .S01_AXI_arcache(bram_2_ddr_stream_0_M00_AXI_ARCACHE),
        .S01_AXI_arid(bram_2_ddr_stream_0_M00_AXI_ARID),
        .S01_AXI_arlen(bram_2_ddr_stream_0_M00_AXI_ARLEN),
        .S01_AXI_arlock(bram_2_ddr_stream_0_M00_AXI_ARLOCK),
        .S01_AXI_arprot(bram_2_ddr_stream_0_M00_AXI_ARPROT),
        .S01_AXI_arqos(bram_2_ddr_stream_0_M00_AXI_ARQOS),
        .S01_AXI_arready(bram_2_ddr_stream_0_M00_AXI_ARREADY),
        .S01_AXI_arsize(bram_2_ddr_stream_0_M00_AXI_ARSIZE),
        .S01_AXI_aruser(bram_2_ddr_stream_0_M00_AXI_ARUSER),
        .S01_AXI_arvalid(bram_2_ddr_stream_0_M00_AXI_ARVALID),
        .S01_AXI_awaddr(bram_2_ddr_stream_0_M00_AXI_AWADDR),
        .S01_AXI_awburst(bram_2_ddr_stream_0_M00_AXI_AWBURST),
        .S01_AXI_awcache(bram_2_ddr_stream_0_M00_AXI_AWCACHE),
        .S01_AXI_awid(bram_2_ddr_stream_0_M00_AXI_AWID),
        .S01_AXI_awlen(bram_2_ddr_stream_0_M00_AXI_AWLEN),
        .S01_AXI_awlock(bram_2_ddr_stream_0_M00_AXI_AWLOCK),
        .S01_AXI_awprot(bram_2_ddr_stream_0_M00_AXI_AWPROT),
        .S01_AXI_awqos(bram_2_ddr_stream_0_M00_AXI_AWQOS),
        .S01_AXI_awready(bram_2_ddr_stream_0_M00_AXI_AWREADY),
        .S01_AXI_awsize(bram_2_ddr_stream_0_M00_AXI_AWSIZE),
        .S01_AXI_awuser(bram_2_ddr_stream_0_M00_AXI_AWUSER),
        .S01_AXI_awvalid(bram_2_ddr_stream_0_M00_AXI_AWVALID),
        .S01_AXI_bid(bram_2_ddr_stream_0_M00_AXI_BID),
        .S01_AXI_bready(bram_2_ddr_stream_0_M00_AXI_BREADY),
        .S01_AXI_bresp(bram_2_ddr_stream_0_M00_AXI_BRESP),
        .S01_AXI_buser(bram_2_ddr_stream_0_M00_AXI_BUSER),
        .S01_AXI_bvalid(bram_2_ddr_stream_0_M00_AXI_BVALID),
        .S01_AXI_rdata(bram_2_ddr_stream_0_M00_AXI_RDATA),
        .S01_AXI_rid(bram_2_ddr_stream_0_M00_AXI_RID),
        .S01_AXI_rlast(bram_2_ddr_stream_0_M00_AXI_RLAST),
        .S01_AXI_rready(bram_2_ddr_stream_0_M00_AXI_RREADY),
        .S01_AXI_rresp(bram_2_ddr_stream_0_M00_AXI_RRESP),
        .S01_AXI_ruser(bram_2_ddr_stream_0_M00_AXI_RUSER),
        .S01_AXI_rvalid(bram_2_ddr_stream_0_M00_AXI_RVALID),
        .S01_AXI_wdata(bram_2_ddr_stream_0_M00_AXI_WDATA),
        .S01_AXI_wlast(bram_2_ddr_stream_0_M00_AXI_WLAST),
        .S01_AXI_wready(bram_2_ddr_stream_0_M00_AXI_WREADY),
        .S01_AXI_wstrb(bram_2_ddr_stream_0_M00_AXI_WSTRB),
        .S01_AXI_wuser(bram_2_ddr_stream_0_M00_AXI_WUSER),
        .S01_AXI_wvalid(bram_2_ddr_stream_0_M00_AXI_WVALID));
  ddr_2_bram_bram_2_ddr_stream_0_0 bram_2_ddr_stream_0
       (.BRAM_ADDR(bram_2_ddr_stream_0_BRAM_ADDR),
        .BRAM_EN(bram_2_ddr_stream_0_BRAM_EN),
        .bram_data(bram_data_0_1),
        .frame_sync(frame_sync_1),
        .line_sync(line_sync_1),
        .m00_axi_aclk(S00_ACLK_1),
        .m00_axi_araddr(bram_2_ddr_stream_0_M00_AXI_ARADDR),
        .m00_axi_arburst(bram_2_ddr_stream_0_M00_AXI_ARBURST),
        .m00_axi_arcache(bram_2_ddr_stream_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(Net1),
        .m00_axi_arid(bram_2_ddr_stream_0_M00_AXI_ARID),
        .m00_axi_arlen(bram_2_ddr_stream_0_M00_AXI_ARLEN),
        .m00_axi_arlock(bram_2_ddr_stream_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(bram_2_ddr_stream_0_M00_AXI_ARPROT),
        .m00_axi_arqos(bram_2_ddr_stream_0_M00_AXI_ARQOS),
        .m00_axi_arready(bram_2_ddr_stream_0_M00_AXI_ARREADY),
        .m00_axi_arsize(bram_2_ddr_stream_0_M00_AXI_ARSIZE),
        .m00_axi_aruser(bram_2_ddr_stream_0_M00_AXI_ARUSER),
        .m00_axi_arvalid(bram_2_ddr_stream_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(bram_2_ddr_stream_0_M00_AXI_AWADDR),
        .m00_axi_awburst(bram_2_ddr_stream_0_M00_AXI_AWBURST),
        .m00_axi_awcache(bram_2_ddr_stream_0_M00_AXI_AWCACHE),
        .m00_axi_awid(bram_2_ddr_stream_0_M00_AXI_AWID),
        .m00_axi_awlen(bram_2_ddr_stream_0_M00_AXI_AWLEN),
        .m00_axi_awlock(bram_2_ddr_stream_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(bram_2_ddr_stream_0_M00_AXI_AWPROT),
        .m00_axi_awqos(bram_2_ddr_stream_0_M00_AXI_AWQOS),
        .m00_axi_awready(bram_2_ddr_stream_0_M00_AXI_AWREADY),
        .m00_axi_awsize(bram_2_ddr_stream_0_M00_AXI_AWSIZE),
        .m00_axi_awuser(bram_2_ddr_stream_0_M00_AXI_AWUSER),
        .m00_axi_awvalid(bram_2_ddr_stream_0_M00_AXI_AWVALID),
        .m00_axi_bid(bram_2_ddr_stream_0_M00_AXI_BID[0]),
        .m00_axi_bready(bram_2_ddr_stream_0_M00_AXI_BREADY),
        .m00_axi_bresp(bram_2_ddr_stream_0_M00_AXI_BRESP),
        .m00_axi_buser(bram_2_ddr_stream_0_M00_AXI_BUSER),
        .m00_axi_bvalid(bram_2_ddr_stream_0_M00_AXI_BVALID),
        .m00_axi_rdata(bram_2_ddr_stream_0_M00_AXI_RDATA),
        .m00_axi_rid(bram_2_ddr_stream_0_M00_AXI_RID[0]),
        .m00_axi_rlast(bram_2_ddr_stream_0_M00_AXI_RLAST),
        .m00_axi_rready(bram_2_ddr_stream_0_M00_AXI_RREADY),
        .m00_axi_rresp(bram_2_ddr_stream_0_M00_AXI_RRESP),
        .m00_axi_ruser(bram_2_ddr_stream_0_M00_AXI_RUSER),
        .m00_axi_rvalid(bram_2_ddr_stream_0_M00_AXI_RVALID),
        .m00_axi_wdata(bram_2_ddr_stream_0_M00_AXI_WDATA),
        .m00_axi_wlast(bram_2_ddr_stream_0_M00_AXI_WLAST),
        .m00_axi_wready(bram_2_ddr_stream_0_M00_AXI_WREADY),
        .m00_axi_wstrb(bram_2_ddr_stream_0_M00_AXI_WSTRB),
        .m00_axi_wuser(bram_2_ddr_stream_0_M00_AXI_WUSER),
        .m00_axi_wvalid(bram_2_ddr_stream_0_M00_AXI_WVALID));
  ddr_2_bram_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_0_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(S00_ACLK_1));
  ddr_2_bram_ddr_to_bram_vga_stre_0_0 ddr_to_bram_vga_stre_0
       (.burst_complete(ddr_to_bram_vga_stre_0_burst_complete),
        .burst_count_total(ddr_to_bram_vga_stre_0_burst_count_total),
        .frame_sync(frame_sync_1),
        .line_sync(line_sync_1),
        .m00_axi_aclk(S00_ACLK_1),
        .m00_axi_araddr(S00_AXI_1_ARADDR),
        .m00_axi_arburst(S00_AXI_1_ARBURST),
        .m00_axi_arcache(S00_AXI_1_ARCACHE),
        .m00_axi_aresetn(Net1),
        .m00_axi_arid(S00_AXI_1_ARID),
        .m00_axi_arlen(S00_AXI_1_ARLEN),
        .m00_axi_arlock(S00_AXI_1_ARLOCK),
        .m00_axi_arprot(S00_AXI_1_ARPROT),
        .m00_axi_arqos(S00_AXI_1_ARQOS),
        .m00_axi_arready(S00_AXI_1_ARREADY),
        .m00_axi_arsize(S00_AXI_1_ARSIZE),
        .m00_axi_aruser(S00_AXI_1_ARUSER),
        .m00_axi_arvalid(S00_AXI_1_ARVALID),
        .m00_axi_awaddr(S00_AXI_1_AWADDR),
        .m00_axi_awburst(S00_AXI_1_AWBURST),
        .m00_axi_awcache(S00_AXI_1_AWCACHE),
        .m00_axi_awid(S00_AXI_1_AWID),
        .m00_axi_awlen(S00_AXI_1_AWLEN),
        .m00_axi_awlock(S00_AXI_1_AWLOCK),
        .m00_axi_awprot(S00_AXI_1_AWPROT),
        .m00_axi_awqos(S00_AXI_1_AWQOS),
        .m00_axi_awready(S00_AXI_1_AWREADY),
        .m00_axi_awsize(S00_AXI_1_AWSIZE),
        .m00_axi_awuser(S00_AXI_1_AWUSER),
        .m00_axi_awvalid(S00_AXI_1_AWVALID),
        .m00_axi_bid(S00_AXI_1_BID[0]),
        .m00_axi_bready(S00_AXI_1_BREADY),
        .m00_axi_bresp(S00_AXI_1_BRESP),
        .m00_axi_buser(S00_AXI_1_BUSER),
        .m00_axi_bvalid(S00_AXI_1_BVALID),
        .m00_axi_rdata(S00_AXI_1_RDATA),
        .m00_axi_rid(S00_AXI_1_RID[0]),
        .m00_axi_rlast(S00_AXI_1_RLAST),
        .m00_axi_rready(S00_AXI_1_RREADY),
        .m00_axi_rresp(S00_AXI_1_RRESP),
        .m00_axi_ruser(S00_AXI_1_RUSER),
        .m00_axi_rvalid(S00_AXI_1_RVALID),
        .m00_axi_wdata(S00_AXI_1_WDATA),
        .m00_axi_wlast(S00_AXI_1_WLAST),
        .m00_axi_wready(S00_AXI_1_WREADY),
        .m00_axi_wstrb(S00_AXI_1_WSTRB),
        .m00_axi_wuser(S00_AXI_1_WUSER),
        .m00_axi_wvalid(S00_AXI_1_WVALID),
        .m01_axi_aclk(S00_ACLK_1),
        .m01_axi_araddr(ddr_to_bram_vga_stre_0_M01_AXI_ARADDR),
        .m01_axi_arburst(ddr_to_bram_vga_stre_0_M01_AXI_ARBURST),
        .m01_axi_arcache(ddr_to_bram_vga_stre_0_M01_AXI_ARCACHE),
        .m01_axi_aresetn(Net1),
        .m01_axi_arid(ddr_to_bram_vga_stre_0_M01_AXI_ARID),
        .m01_axi_arlen(ddr_to_bram_vga_stre_0_M01_AXI_ARLEN),
        .m01_axi_arlock(ddr_to_bram_vga_stre_0_M01_AXI_ARLOCK),
        .m01_axi_arprot(ddr_to_bram_vga_stre_0_M01_AXI_ARPROT),
        .m01_axi_arready(ddr_to_bram_vga_stre_0_M01_AXI_ARREADY),
        .m01_axi_arsize(ddr_to_bram_vga_stre_0_M01_AXI_ARSIZE),
        .m01_axi_arvalid(ddr_to_bram_vga_stre_0_M01_AXI_ARVALID),
        .m01_axi_awaddr(ddr_to_bram_vga_stre_0_M01_AXI_AWADDR),
        .m01_axi_awburst(ddr_to_bram_vga_stre_0_M01_AXI_AWBURST),
        .m01_axi_awcache(ddr_to_bram_vga_stre_0_M01_AXI_AWCACHE),
        .m01_axi_awid(ddr_to_bram_vga_stre_0_M01_AXI_AWID),
        .m01_axi_awlen(ddr_to_bram_vga_stre_0_M01_AXI_AWLEN),
        .m01_axi_awlock(ddr_to_bram_vga_stre_0_M01_AXI_AWLOCK),
        .m01_axi_awprot(ddr_to_bram_vga_stre_0_M01_AXI_AWPROT),
        .m01_axi_awready(ddr_to_bram_vga_stre_0_M01_AXI_AWREADY),
        .m01_axi_awsize(ddr_to_bram_vga_stre_0_M01_AXI_AWSIZE),
        .m01_axi_awvalid(ddr_to_bram_vga_stre_0_M01_AXI_AWVALID),
        .m01_axi_bid(ddr_to_bram_vga_stre_0_M01_AXI_BID),
        .m01_axi_bready(ddr_to_bram_vga_stre_0_M01_AXI_BREADY),
        .m01_axi_bresp(ddr_to_bram_vga_stre_0_M01_AXI_BRESP),
        .m01_axi_buser(1'b0),
        .m01_axi_bvalid(ddr_to_bram_vga_stre_0_M01_AXI_BVALID),
        .m01_axi_rdata(ddr_to_bram_vga_stre_0_M01_AXI_RDATA),
        .m01_axi_rid(ddr_to_bram_vga_stre_0_M01_AXI_RID),
        .m01_axi_rlast(ddr_to_bram_vga_stre_0_M01_AXI_RLAST),
        .m01_axi_rready(ddr_to_bram_vga_stre_0_M01_AXI_RREADY),
        .m01_axi_rresp(ddr_to_bram_vga_stre_0_M01_AXI_RRESP),
        .m01_axi_ruser(1'b0),
        .m01_axi_rvalid(ddr_to_bram_vga_stre_0_M01_AXI_RVALID),
        .m01_axi_wdata(ddr_to_bram_vga_stre_0_M01_AXI_WDATA),
        .m01_axi_wlast(ddr_to_bram_vga_stre_0_M01_AXI_WLAST),
        .m01_axi_wready(ddr_to_bram_vga_stre_0_M01_AXI_WREADY),
        .m01_axi_wstrb(ddr_to_bram_vga_stre_0_M01_AXI_WSTRB),
        .m01_axi_wvalid(ddr_to_bram_vga_stre_0_M01_AXI_WVALID),
        .start_single_burst(ddr_to_bram_vga_stre_0_start_single_burst));
  ddr_2_bram_mig_7series_0_0 mig_7series_0
       (.aresetn(rst_mig_7series_0_81M_peripheral_aresetn),
        .ddr2_addr(mig_7series_0_DDR2_ADDR),
        .ddr2_ba(mig_7series_0_DDR2_BA),
        .ddr2_cas_n(mig_7series_0_DDR2_CAS_N),
        .ddr2_ck_n(mig_7series_0_DDR2_CK_N),
        .ddr2_ck_p(mig_7series_0_DDR2_CK_P),
        .ddr2_cke(mig_7series_0_DDR2_CKE),
        .ddr2_cs_n(mig_7series_0_DDR2_CS_N),
        .ddr2_dm(mig_7series_0_DDR2_DM),
        .ddr2_dq(ddr2_dq[15:0]),
        .ddr2_dqs_n(ddr2_dqs_n[1:0]),
        .ddr2_dqs_p(ddr2_dqs_p[1:0]),
        .ddr2_odt(mig_7series_0_DDR2_ODT),
        .ddr2_ras_n(mig_7series_0_DDR2_RAS_N),
        .ddr2_we_n(mig_7series_0_DDR2_WE_N),
        .mmcm_locked(mig_7series_0_mmcm_locked),
        .s_axi_araddr(axi_interconnect_0_M00_AXI_ARADDR),
        .s_axi_arburst(axi_interconnect_0_M00_AXI_ARBURST),
        .s_axi_arcache(axi_interconnect_0_M00_AXI_ARCACHE),
        .s_axi_arid(axi_interconnect_0_M00_AXI_ARID),
        .s_axi_arlen(axi_interconnect_0_M00_AXI_ARLEN),
        .s_axi_arlock(axi_interconnect_0_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_interconnect_0_M00_AXI_ARPROT),
        .s_axi_arqos(axi_interconnect_0_M00_AXI_ARQOS),
        .s_axi_arready(axi_interconnect_0_M00_AXI_ARREADY),
        .s_axi_arsize(axi_interconnect_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_interconnect_0_M00_AXI_AWADDR),
        .s_axi_awburst(axi_interconnect_0_M00_AXI_AWBURST),
        .s_axi_awcache(axi_interconnect_0_M00_AXI_AWCACHE),
        .s_axi_awid(axi_interconnect_0_M00_AXI_AWID),
        .s_axi_awlen(axi_interconnect_0_M00_AXI_AWLEN),
        .s_axi_awlock(axi_interconnect_0_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_interconnect_0_M00_AXI_AWPROT),
        .s_axi_awqos(axi_interconnect_0_M00_AXI_AWQOS),
        .s_axi_awready(axi_interconnect_0_M00_AXI_AWREADY),
        .s_axi_awsize(axi_interconnect_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
        .s_axi_bid(axi_interconnect_0_M00_AXI_BID),
        .s_axi_bready(axi_interconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(axi_interconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(axi_interconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(axi_interconnect_0_M00_AXI_RDATA),
        .s_axi_rid(axi_interconnect_0_M00_AXI_RID),
        .s_axi_rlast(axi_interconnect_0_M00_AXI_RLAST),
        .s_axi_rready(axi_interconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(axi_interconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(axi_interconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(axi_interconnect_0_M00_AXI_WDATA),
        .s_axi_wlast(axi_interconnect_0_M00_AXI_WLAST),
        .s_axi_wready(axi_interconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(axi_interconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_interconnect_0_M00_AXI_WVALID),
        .sys_clk_i(S00_ACLK_1),
        .sys_rst(Net1),
        .ui_clk(mig_7series_0_ui_clk),
        .ui_clk_sync_rst(mig_7series_0_ui_clk_sync_rst));
  ddr_2_bram_rst_mig_7series_0_81M_0 rst_mig_7series_0_81M
       (.aux_reset_in(1'b1),
        .dcm_locked(mig_7series_0_mmcm_locked),
        .ext_reset_in(mig_7series_0_ui_clk_sync_rst),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_mig_7series_0_81M_peripheral_aresetn),
        .slowest_sync_clk(mig_7series_0_ui_clk));
endmodule

module ddr_2_bram_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_aruser,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awuser,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_buser,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_ruser,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wuser,
    S00_AXI_wvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_araddr,
    S01_AXI_arburst,
    S01_AXI_arcache,
    S01_AXI_arid,
    S01_AXI_arlen,
    S01_AXI_arlock,
    S01_AXI_arprot,
    S01_AXI_arqos,
    S01_AXI_arready,
    S01_AXI_arsize,
    S01_AXI_aruser,
    S01_AXI_arvalid,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awid,
    S01_AXI_awlen,
    S01_AXI_awlock,
    S01_AXI_awprot,
    S01_AXI_awqos,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awuser,
    S01_AXI_awvalid,
    S01_AXI_bid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_buser,
    S01_AXI_bvalid,
    S01_AXI_rdata,
    S01_AXI_rid,
    S01_AXI_rlast,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_ruser,
    S01_AXI_rvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wuser,
    S01_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [26:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [1:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [26:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [1:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [1:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [1:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [0:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input [0:0]S00_AXI_aruser;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [0:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input [0:0]S00_AXI_awuser;
  input S00_AXI_awvalid;
  output [1:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_buser;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [1:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_ruser;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wuser;
  input S00_AXI_wvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_araddr;
  input [1:0]S01_AXI_arburst;
  input [3:0]S01_AXI_arcache;
  input [0:0]S01_AXI_arid;
  input [7:0]S01_AXI_arlen;
  input S01_AXI_arlock;
  input [2:0]S01_AXI_arprot;
  input [3:0]S01_AXI_arqos;
  output S01_AXI_arready;
  input [2:0]S01_AXI_arsize;
  input [0:0]S01_AXI_aruser;
  input S01_AXI_arvalid;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [0:0]S01_AXI_awid;
  input [7:0]S01_AXI_awlen;
  input S01_AXI_awlock;
  input [2:0]S01_AXI_awprot;
  input [3:0]S01_AXI_awqos;
  output S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input [0:0]S01_AXI_awuser;
  input S01_AXI_awvalid;
  output [1:0]S01_AXI_bid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output [0:0]S01_AXI_buser;
  output S01_AXI_bvalid;
  output [31:0]S01_AXI_rdata;
  output [1:0]S01_AXI_rid;
  output S01_AXI_rlast;
  input S01_AXI_rready;
  output [1:0]S01_AXI_rresp;
  output [0:0]S01_AXI_ruser;
  output S01_AXI_rvalid;
  input [31:0]S01_AXI_wdata;
  input S01_AXI_wlast;
  output S01_AXI_wready;
  input [3:0]S01_AXI_wstrb;
  input [0:0]S01_AXI_wuser;
  input S01_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire S01_ACLK_1;
  wire S01_ARESETN_1;
  wire axi_interconnect_0_ACLK_net;
  wire axi_interconnect_0_ARESETN_net;
  wire [31:0]axi_interconnect_0_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARCACHE;
  wire [0:0]axi_interconnect_0_to_s00_couplers_ARID;
  wire [7:0]axi_interconnect_0_to_s00_couplers_ARLEN;
  wire axi_interconnect_0_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARQOS;
  wire axi_interconnect_0_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARSIZE;
  wire [0:0]axi_interconnect_0_to_s00_couplers_ARUSER;
  wire axi_interconnect_0_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWCACHE;
  wire [0:0]axi_interconnect_0_to_s00_couplers_AWID;
  wire [7:0]axi_interconnect_0_to_s00_couplers_AWLEN;
  wire axi_interconnect_0_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWQOS;
  wire axi_interconnect_0_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWSIZE;
  wire [0:0]axi_interconnect_0_to_s00_couplers_AWUSER;
  wire axi_interconnect_0_to_s00_couplers_AWVALID;
  wire [1:0]axi_interconnect_0_to_s00_couplers_BID;
  wire axi_interconnect_0_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_BRESP;
  wire [0:0]axi_interconnect_0_to_s00_couplers_BUSER;
  wire axi_interconnect_0_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_RDATA;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RID;
  wire axi_interconnect_0_to_s00_couplers_RLAST;
  wire axi_interconnect_0_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RRESP;
  wire [0:0]axi_interconnect_0_to_s00_couplers_RUSER;
  wire axi_interconnect_0_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_WDATA;
  wire axi_interconnect_0_to_s00_couplers_WLAST;
  wire axi_interconnect_0_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_0_to_s00_couplers_WSTRB;
  wire [0:0]axi_interconnect_0_to_s00_couplers_WUSER;
  wire axi_interconnect_0_to_s00_couplers_WVALID;
  wire [31:0]axi_interconnect_0_to_s01_couplers_ARADDR;
  wire [1:0]axi_interconnect_0_to_s01_couplers_ARBURST;
  wire [3:0]axi_interconnect_0_to_s01_couplers_ARCACHE;
  wire [0:0]axi_interconnect_0_to_s01_couplers_ARID;
  wire [7:0]axi_interconnect_0_to_s01_couplers_ARLEN;
  wire axi_interconnect_0_to_s01_couplers_ARLOCK;
  wire [2:0]axi_interconnect_0_to_s01_couplers_ARPROT;
  wire [3:0]axi_interconnect_0_to_s01_couplers_ARQOS;
  wire axi_interconnect_0_to_s01_couplers_ARREADY;
  wire [2:0]axi_interconnect_0_to_s01_couplers_ARSIZE;
  wire [0:0]axi_interconnect_0_to_s01_couplers_ARUSER;
  wire axi_interconnect_0_to_s01_couplers_ARVALID;
  wire [31:0]axi_interconnect_0_to_s01_couplers_AWADDR;
  wire [1:0]axi_interconnect_0_to_s01_couplers_AWBURST;
  wire [3:0]axi_interconnect_0_to_s01_couplers_AWCACHE;
  wire [0:0]axi_interconnect_0_to_s01_couplers_AWID;
  wire [7:0]axi_interconnect_0_to_s01_couplers_AWLEN;
  wire axi_interconnect_0_to_s01_couplers_AWLOCK;
  wire [2:0]axi_interconnect_0_to_s01_couplers_AWPROT;
  wire [3:0]axi_interconnect_0_to_s01_couplers_AWQOS;
  wire axi_interconnect_0_to_s01_couplers_AWREADY;
  wire [2:0]axi_interconnect_0_to_s01_couplers_AWSIZE;
  wire [0:0]axi_interconnect_0_to_s01_couplers_AWUSER;
  wire axi_interconnect_0_to_s01_couplers_AWVALID;
  wire [1:0]axi_interconnect_0_to_s01_couplers_BID;
  wire axi_interconnect_0_to_s01_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s01_couplers_BRESP;
  wire [0:0]axi_interconnect_0_to_s01_couplers_BUSER;
  wire axi_interconnect_0_to_s01_couplers_BVALID;
  wire [31:0]axi_interconnect_0_to_s01_couplers_RDATA;
  wire [1:0]axi_interconnect_0_to_s01_couplers_RID;
  wire axi_interconnect_0_to_s01_couplers_RLAST;
  wire axi_interconnect_0_to_s01_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s01_couplers_RRESP;
  wire [0:0]axi_interconnect_0_to_s01_couplers_RUSER;
  wire axi_interconnect_0_to_s01_couplers_RVALID;
  wire [31:0]axi_interconnect_0_to_s01_couplers_WDATA;
  wire axi_interconnect_0_to_s01_couplers_WLAST;
  wire axi_interconnect_0_to_s01_couplers_WREADY;
  wire [3:0]axi_interconnect_0_to_s01_couplers_WSTRB;
  wire [0:0]axi_interconnect_0_to_s01_couplers_WUSER;
  wire axi_interconnect_0_to_s01_couplers_WVALID;
  wire [26:0]m00_couplers_to_axi_interconnect_0_ARADDR;
  wire [1:0]m00_couplers_to_axi_interconnect_0_ARBURST;
  wire [3:0]m00_couplers_to_axi_interconnect_0_ARCACHE;
  wire [1:0]m00_couplers_to_axi_interconnect_0_ARID;
  wire [7:0]m00_couplers_to_axi_interconnect_0_ARLEN;
  wire m00_couplers_to_axi_interconnect_0_ARLOCK;
  wire [2:0]m00_couplers_to_axi_interconnect_0_ARPROT;
  wire [3:0]m00_couplers_to_axi_interconnect_0_ARQOS;
  wire m00_couplers_to_axi_interconnect_0_ARREADY;
  wire [2:0]m00_couplers_to_axi_interconnect_0_ARSIZE;
  wire m00_couplers_to_axi_interconnect_0_ARVALID;
  wire [26:0]m00_couplers_to_axi_interconnect_0_AWADDR;
  wire [1:0]m00_couplers_to_axi_interconnect_0_AWBURST;
  wire [3:0]m00_couplers_to_axi_interconnect_0_AWCACHE;
  wire [1:0]m00_couplers_to_axi_interconnect_0_AWID;
  wire [7:0]m00_couplers_to_axi_interconnect_0_AWLEN;
  wire m00_couplers_to_axi_interconnect_0_AWLOCK;
  wire [2:0]m00_couplers_to_axi_interconnect_0_AWPROT;
  wire [3:0]m00_couplers_to_axi_interconnect_0_AWQOS;
  wire m00_couplers_to_axi_interconnect_0_AWREADY;
  wire [2:0]m00_couplers_to_axi_interconnect_0_AWSIZE;
  wire m00_couplers_to_axi_interconnect_0_AWVALID;
  wire [1:0]m00_couplers_to_axi_interconnect_0_BID;
  wire m00_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_BRESP;
  wire m00_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_RDATA;
  wire [1:0]m00_couplers_to_axi_interconnect_0_RID;
  wire m00_couplers_to_axi_interconnect_0_RLAST;
  wire m00_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_RRESP;
  wire m00_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_WDATA;
  wire m00_couplers_to_axi_interconnect_0_WLAST;
  wire m00_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m00_couplers_to_axi_interconnect_0_WSTRB;
  wire m00_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [0:0]s00_couplers_to_xbar_ARID;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire [0:0]s00_couplers_to_xbar_ARUSER;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [0:0]s00_couplers_to_xbar_AWID;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire [0:0]s00_couplers_to_xbar_AWUSER;
  wire s00_couplers_to_xbar_AWVALID;
  wire [1:0]s00_couplers_to_xbar_BID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BUSER;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [1:0]s00_couplers_to_xbar_RID;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RUSER;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WUSER;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]s01_couplers_to_xbar_ARADDR;
  wire [1:0]s01_couplers_to_xbar_ARBURST;
  wire [3:0]s01_couplers_to_xbar_ARCACHE;
  wire [0:0]s01_couplers_to_xbar_ARID;
  wire [7:0]s01_couplers_to_xbar_ARLEN;
  wire s01_couplers_to_xbar_ARLOCK;
  wire [2:0]s01_couplers_to_xbar_ARPROT;
  wire [3:0]s01_couplers_to_xbar_ARQOS;
  wire [1:1]s01_couplers_to_xbar_ARREADY;
  wire [2:0]s01_couplers_to_xbar_ARSIZE;
  wire [0:0]s01_couplers_to_xbar_ARUSER;
  wire s01_couplers_to_xbar_ARVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [0:0]s01_couplers_to_xbar_AWID;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire s01_couplers_to_xbar_AWLOCK;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [3:0]s01_couplers_to_xbar_AWQOS;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire [0:0]s01_couplers_to_xbar_AWUSER;
  wire s01_couplers_to_xbar_AWVALID;
  wire [3:2]s01_couplers_to_xbar_BID;
  wire s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BUSER;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [63:32]s01_couplers_to_xbar_RDATA;
  wire [3:2]s01_couplers_to_xbar_RID;
  wire [1:1]s01_couplers_to_xbar_RLAST;
  wire s01_couplers_to_xbar_RREADY;
  wire [3:2]s01_couplers_to_xbar_RRESP;
  wire [1:1]s01_couplers_to_xbar_RUSER;
  wire [1:1]s01_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_WDATA;
  wire s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [3:0]s01_couplers_to_xbar_WSTRB;
  wire [0:0]s01_couplers_to_xbar_WUSER;
  wire s01_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [1:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARUSER;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [1:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWUSER;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [1:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BUSER;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [1:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RUSER;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WUSER;
  wire [0:0]xbar_to_m00_couplers_WVALID;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[26:0] = m00_couplers_to_axi_interconnect_0_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_interconnect_0_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_interconnect_0_ARCACHE;
  assign M00_AXI_arid[1:0] = m00_couplers_to_axi_interconnect_0_ARID;
  assign M00_AXI_arlen[7:0] = m00_couplers_to_axi_interconnect_0_ARLEN;
  assign M00_AXI_arlock = m00_couplers_to_axi_interconnect_0_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_interconnect_0_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_couplers_to_axi_interconnect_0_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_interconnect_0_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_interconnect_0_ARVALID;
  assign M00_AXI_awaddr[26:0] = m00_couplers_to_axi_interconnect_0_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_interconnect_0_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_interconnect_0_AWCACHE;
  assign M00_AXI_awid[1:0] = m00_couplers_to_axi_interconnect_0_AWID;
  assign M00_AXI_awlen[7:0] = m00_couplers_to_axi_interconnect_0_AWLEN;
  assign M00_AXI_awlock = m00_couplers_to_axi_interconnect_0_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_interconnect_0_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_couplers_to_axi_interconnect_0_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_interconnect_0_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_interconnect_0_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_interconnect_0_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_interconnect_0_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_0_WDATA;
  assign M00_AXI_wlast = m00_couplers_to_axi_interconnect_0_WLAST;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_interconnect_0_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_interconnect_0_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_interconnect_0_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_0_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[1:0] = axi_interconnect_0_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_0_to_s00_couplers_BRESP;
  assign S00_AXI_buser[0] = axi_interconnect_0_to_s00_couplers_BUSER;
  assign S00_AXI_bvalid = axi_interconnect_0_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_0_to_s00_couplers_RDATA;
  assign S00_AXI_rid[1:0] = axi_interconnect_0_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_0_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_0_to_s00_couplers_RRESP;
  assign S00_AXI_ruser[0] = axi_interconnect_0_to_s00_couplers_RUSER;
  assign S00_AXI_rvalid = axi_interconnect_0_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_0_to_s00_couplers_WREADY;
  assign S01_ACLK_1 = S01_ACLK;
  assign S01_ARESETN_1 = S01_ARESETN;
  assign S01_AXI_arready = axi_interconnect_0_to_s01_couplers_ARREADY;
  assign S01_AXI_awready = axi_interconnect_0_to_s01_couplers_AWREADY;
  assign S01_AXI_bid[1:0] = axi_interconnect_0_to_s01_couplers_BID;
  assign S01_AXI_bresp[1:0] = axi_interconnect_0_to_s01_couplers_BRESP;
  assign S01_AXI_buser[0] = axi_interconnect_0_to_s01_couplers_BUSER;
  assign S01_AXI_bvalid = axi_interconnect_0_to_s01_couplers_BVALID;
  assign S01_AXI_rdata[31:0] = axi_interconnect_0_to_s01_couplers_RDATA;
  assign S01_AXI_rid[1:0] = axi_interconnect_0_to_s01_couplers_RID;
  assign S01_AXI_rlast = axi_interconnect_0_to_s01_couplers_RLAST;
  assign S01_AXI_rresp[1:0] = axi_interconnect_0_to_s01_couplers_RRESP;
  assign S01_AXI_ruser[0] = axi_interconnect_0_to_s01_couplers_RUSER;
  assign S01_AXI_rvalid = axi_interconnect_0_to_s01_couplers_RVALID;
  assign S01_AXI_wready = axi_interconnect_0_to_s01_couplers_WREADY;
  assign axi_interconnect_0_ACLK_net = ACLK;
  assign axi_interconnect_0_ARESETN_net = ARESETN;
  assign axi_interconnect_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARID = S00_AXI_arid[0];
  assign axi_interconnect_0_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_interconnect_0_to_s00_couplers_ARLOCK = S00_AXI_arlock;
  assign axi_interconnect_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARUSER = S00_AXI_aruser[0];
  assign axi_interconnect_0_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_0_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWID = S00_AXI_awid[0];
  assign axi_interconnect_0_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign axi_interconnect_0_to_s00_couplers_AWLOCK = S00_AXI_awlock;
  assign axi_interconnect_0_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWUSER = S00_AXI_awuser[0];
  assign axi_interconnect_0_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_0_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_0_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_0_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_0_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_0_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_0_to_s00_couplers_WUSER = S00_AXI_wuser[0];
  assign axi_interconnect_0_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign axi_interconnect_0_to_s01_couplers_ARADDR = S01_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s01_couplers_ARBURST = S01_AXI_arburst[1:0];
  assign axi_interconnect_0_to_s01_couplers_ARCACHE = S01_AXI_arcache[3:0];
  assign axi_interconnect_0_to_s01_couplers_ARID = S01_AXI_arid[0];
  assign axi_interconnect_0_to_s01_couplers_ARLEN = S01_AXI_arlen[7:0];
  assign axi_interconnect_0_to_s01_couplers_ARLOCK = S01_AXI_arlock;
  assign axi_interconnect_0_to_s01_couplers_ARPROT = S01_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s01_couplers_ARQOS = S01_AXI_arqos[3:0];
  assign axi_interconnect_0_to_s01_couplers_ARSIZE = S01_AXI_arsize[2:0];
  assign axi_interconnect_0_to_s01_couplers_ARUSER = S01_AXI_aruser[0];
  assign axi_interconnect_0_to_s01_couplers_ARVALID = S01_AXI_arvalid;
  assign axi_interconnect_0_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign axi_interconnect_0_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign axi_interconnect_0_to_s01_couplers_AWID = S01_AXI_awid[0];
  assign axi_interconnect_0_to_s01_couplers_AWLEN = S01_AXI_awlen[7:0];
  assign axi_interconnect_0_to_s01_couplers_AWLOCK = S01_AXI_awlock;
  assign axi_interconnect_0_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s01_couplers_AWQOS = S01_AXI_awqos[3:0];
  assign axi_interconnect_0_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign axi_interconnect_0_to_s01_couplers_AWUSER = S01_AXI_awuser[0];
  assign axi_interconnect_0_to_s01_couplers_AWVALID = S01_AXI_awvalid;
  assign axi_interconnect_0_to_s01_couplers_BREADY = S01_AXI_bready;
  assign axi_interconnect_0_to_s01_couplers_RREADY = S01_AXI_rready;
  assign axi_interconnect_0_to_s01_couplers_WDATA = S01_AXI_wdata[31:0];
  assign axi_interconnect_0_to_s01_couplers_WLAST = S01_AXI_wlast;
  assign axi_interconnect_0_to_s01_couplers_WSTRB = S01_AXI_wstrb[3:0];
  assign axi_interconnect_0_to_s01_couplers_WUSER = S01_AXI_wuser[0];
  assign axi_interconnect_0_to_s01_couplers_WVALID = S01_AXI_wvalid;
  assign m00_couplers_to_axi_interconnect_0_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_interconnect_0_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_interconnect_0_BID = M00_AXI_bid[1:0];
  assign m00_couplers_to_axi_interconnect_0_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_interconnect_0_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_0_RID = M00_AXI_rid[1:0];
  assign m00_couplers_to_axi_interconnect_0_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_interconnect_0_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_interconnect_0_WREADY = M00_AXI_wready;
  m00_couplers_imp_AY1WHU m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_interconnect_0_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_interconnect_0_ARCACHE),
        .M_AXI_arid(m00_couplers_to_axi_interconnect_0_ARID),
        .M_AXI_arlen(m00_couplers_to_axi_interconnect_0_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_interconnect_0_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arqos(m00_couplers_to_axi_interconnect_0_ARQOS),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_interconnect_0_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_interconnect_0_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_interconnect_0_AWCACHE),
        .M_AXI_awid(m00_couplers_to_axi_interconnect_0_AWID),
        .M_AXI_awlen(m00_couplers_to_axi_interconnect_0_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_interconnect_0_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awqos(m00_couplers_to_axi_interconnect_0_AWQOS),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_interconnect_0_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bid(m00_couplers_to_axi_interconnect_0_BID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rid(m00_couplers_to_axi_interconnect_0_RID),
        .M_AXI_rlast(m00_couplers_to_axi_interconnect_0_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wlast(m00_couplers_to_axi_interconnect_0_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_aruser(xbar_to_m00_couplers_ARUSER),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awuser(xbar_to_m00_couplers_AWUSER),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_buser(xbar_to_m00_couplers_BUSER),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_ruser(xbar_to_m00_couplers_RUSER),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wuser(xbar_to_m00_couplers_WUSER),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_J7BXMR s00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s00_couplers_to_xbar_ARID),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_aruser(s00_couplers_to_xbar_ARUSER),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s00_couplers_to_xbar_AWID),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awuser(s00_couplers_to_xbar_AWUSER),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s00_couplers_to_xbar_BID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_buser(s00_couplers_to_xbar_BUSER),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rid(s00_couplers_to_xbar_RID),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_ruser(s00_couplers_to_xbar_RUSER),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wuser(s00_couplers_to_xbar_WUSER),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_interconnect_0_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_0_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_0_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_0_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_0_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_0_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_0_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_0_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_0_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_0_to_s00_couplers_ARSIZE),
        .S_AXI_aruser(axi_interconnect_0_to_s00_couplers_ARUSER),
        .S_AXI_arvalid(axi_interconnect_0_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_0_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_0_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_0_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_0_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_0_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_0_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_0_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_0_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_0_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_0_to_s00_couplers_AWSIZE),
        .S_AXI_awuser(axi_interconnect_0_to_s00_couplers_AWUSER),
        .S_AXI_awvalid(axi_interconnect_0_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_0_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_0_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s00_couplers_BRESP),
        .S_AXI_buser(axi_interconnect_0_to_s00_couplers_BUSER),
        .S_AXI_bvalid(axi_interconnect_0_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_0_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_0_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s00_couplers_RRESP),
        .S_AXI_ruser(axi_interconnect_0_to_s00_couplers_RUSER),
        .S_AXI_rvalid(axi_interconnect_0_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_interconnect_0_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_0_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s00_couplers_WSTRB),
        .S_AXI_wuser(axi_interconnect_0_to_s00_couplers_WUSER),
        .S_AXI_wvalid(axi_interconnect_0_to_s00_couplers_WVALID));
  s01_couplers_imp_8YT0ED s01_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s01_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s01_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s01_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s01_couplers_to_xbar_ARID),
        .M_AXI_arlen(s01_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s01_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s01_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s01_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s01_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s01_couplers_to_xbar_ARSIZE),
        .M_AXI_aruser(s01_couplers_to_xbar_ARUSER),
        .M_AXI_arvalid(s01_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s01_couplers_to_xbar_AWID),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s01_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s01_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awuser(s01_couplers_to_xbar_AWUSER),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s01_couplers_to_xbar_BID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_buser(s01_couplers_to_xbar_BUSER),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s01_couplers_to_xbar_RDATA),
        .M_AXI_rid(s01_couplers_to_xbar_RID),
        .M_AXI_rlast(s01_couplers_to_xbar_RLAST),
        .M_AXI_rready(s01_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s01_couplers_to_xbar_RRESP),
        .M_AXI_ruser(s01_couplers_to_xbar_RUSER),
        .M_AXI_rvalid(s01_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wuser(s01_couplers_to_xbar_WUSER),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(S01_ACLK_1),
        .S_ARESETN(S01_ARESETN_1),
        .S_AXI_araddr(axi_interconnect_0_to_s01_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_0_to_s01_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_0_to_s01_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_0_to_s01_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_0_to_s01_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_0_to_s01_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_0_to_s01_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_0_to_s01_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_0_to_s01_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_0_to_s01_couplers_ARSIZE),
        .S_AXI_aruser(axi_interconnect_0_to_s01_couplers_ARUSER),
        .S_AXI_arvalid(axi_interconnect_0_to_s01_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_0_to_s01_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_0_to_s01_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_0_to_s01_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_0_to_s01_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_0_to_s01_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_0_to_s01_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_0_to_s01_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_0_to_s01_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_0_to_s01_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_0_to_s01_couplers_AWSIZE),
        .S_AXI_awuser(axi_interconnect_0_to_s01_couplers_AWUSER),
        .S_AXI_awvalid(axi_interconnect_0_to_s01_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_0_to_s01_couplers_BID),
        .S_AXI_bready(axi_interconnect_0_to_s01_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s01_couplers_BRESP),
        .S_AXI_buser(axi_interconnect_0_to_s01_couplers_BUSER),
        .S_AXI_bvalid(axi_interconnect_0_to_s01_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s01_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_0_to_s01_couplers_RID),
        .S_AXI_rlast(axi_interconnect_0_to_s01_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_0_to_s01_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s01_couplers_RRESP),
        .S_AXI_ruser(axi_interconnect_0_to_s01_couplers_RUSER),
        .S_AXI_rvalid(axi_interconnect_0_to_s01_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s01_couplers_WDATA),
        .S_AXI_wlast(axi_interconnect_0_to_s01_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_0_to_s01_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s01_couplers_WSTRB),
        .S_AXI_wuser(axi_interconnect_0_to_s01_couplers_WUSER),
        .S_AXI_wvalid(axi_interconnect_0_to_s01_couplers_WVALID));
  ddr_2_bram_xbar_0 xbar
       (.aclk(axi_interconnect_0_ACLK_net),
        .aresetn(axi_interconnect_0_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_aruser(xbar_to_m00_couplers_ARUSER),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awuser(xbar_to_m00_couplers_AWUSER),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_buser(xbar_to_m00_couplers_BUSER),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_ruser(xbar_to_m00_couplers_RUSER),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wuser(xbar_to_m00_couplers_WUSER),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({s01_couplers_to_xbar_ARADDR,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({s01_couplers_to_xbar_ARBURST,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({s01_couplers_to_xbar_ARCACHE,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,s01_couplers_to_xbar_ARID,1'b0,s00_couplers_to_xbar_ARID}),
        .s_axi_arlen({s01_couplers_to_xbar_ARLEN,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({s01_couplers_to_xbar_ARLOCK,s00_couplers_to_xbar_ARLOCK}),
        .s_axi_arprot({s01_couplers_to_xbar_ARPROT,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({s01_couplers_to_xbar_ARQOS,s00_couplers_to_xbar_ARQOS}),
        .s_axi_arready({s01_couplers_to_xbar_ARREADY,s00_couplers_to_xbar_ARREADY}),
        .s_axi_arsize({s01_couplers_to_xbar_ARSIZE,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_aruser({s01_couplers_to_xbar_ARUSER,s00_couplers_to_xbar_ARUSER}),
        .s_axi_arvalid({s01_couplers_to_xbar_ARVALID,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s01_couplers_to_xbar_AWADDR,s00_couplers_to_xbar_AWADDR}),
        .s_axi_awburst({s01_couplers_to_xbar_AWBURST,s00_couplers_to_xbar_AWBURST}),
        .s_axi_awcache({s01_couplers_to_xbar_AWCACHE,s00_couplers_to_xbar_AWCACHE}),
        .s_axi_awid({1'b0,s01_couplers_to_xbar_AWID,1'b0,s00_couplers_to_xbar_AWID}),
        .s_axi_awlen({s01_couplers_to_xbar_AWLEN,s00_couplers_to_xbar_AWLEN}),
        .s_axi_awlock({s01_couplers_to_xbar_AWLOCK,s00_couplers_to_xbar_AWLOCK}),
        .s_axi_awprot({s01_couplers_to_xbar_AWPROT,s00_couplers_to_xbar_AWPROT}),
        .s_axi_awqos({s01_couplers_to_xbar_AWQOS,s00_couplers_to_xbar_AWQOS}),
        .s_axi_awready({s01_couplers_to_xbar_AWREADY,s00_couplers_to_xbar_AWREADY}),
        .s_axi_awsize({s01_couplers_to_xbar_AWSIZE,s00_couplers_to_xbar_AWSIZE}),
        .s_axi_awuser({s01_couplers_to_xbar_AWUSER,s00_couplers_to_xbar_AWUSER}),
        .s_axi_awvalid({s01_couplers_to_xbar_AWVALID,s00_couplers_to_xbar_AWVALID}),
        .s_axi_bid({s01_couplers_to_xbar_BID,s00_couplers_to_xbar_BID}),
        .s_axi_bready({s01_couplers_to_xbar_BREADY,s00_couplers_to_xbar_BREADY}),
        .s_axi_bresp({s01_couplers_to_xbar_BRESP,s00_couplers_to_xbar_BRESP}),
        .s_axi_buser({s01_couplers_to_xbar_BUSER,s00_couplers_to_xbar_BUSER}),
        .s_axi_bvalid({s01_couplers_to_xbar_BVALID,s00_couplers_to_xbar_BVALID}),
        .s_axi_rdata({s01_couplers_to_xbar_RDATA,s00_couplers_to_xbar_RDATA}),
        .s_axi_rid({s01_couplers_to_xbar_RID,s00_couplers_to_xbar_RID}),
        .s_axi_rlast({s01_couplers_to_xbar_RLAST,s00_couplers_to_xbar_RLAST}),
        .s_axi_rready({s01_couplers_to_xbar_RREADY,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp({s01_couplers_to_xbar_RRESP,s00_couplers_to_xbar_RRESP}),
        .s_axi_ruser({s01_couplers_to_xbar_RUSER,s00_couplers_to_xbar_RUSER}),
        .s_axi_rvalid({s01_couplers_to_xbar_RVALID,s00_couplers_to_xbar_RVALID}),
        .s_axi_wdata({s01_couplers_to_xbar_WDATA,s00_couplers_to_xbar_WDATA}),
        .s_axi_wlast({s01_couplers_to_xbar_WLAST,s00_couplers_to_xbar_WLAST}),
        .s_axi_wready({s01_couplers_to_xbar_WREADY,s00_couplers_to_xbar_WREADY}),
        .s_axi_wstrb({s01_couplers_to_xbar_WSTRB,s00_couplers_to_xbar_WSTRB}),
        .s_axi_wuser({s01_couplers_to_xbar_WUSER,s00_couplers_to_xbar_WUSER}),
        .s_axi_wvalid({s01_couplers_to_xbar_WVALID,s00_couplers_to_xbar_WVALID}));
endmodule

module m00_couplers_imp_AY1WHU
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_aruser,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_buser,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_ruser,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wuser,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [26:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [1:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [26:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [1:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [1:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [1:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [1:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_aruser;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [1:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awuser;
  input S_AXI_awvalid;
  output [1:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_buser;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [1:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_ruser;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wuser;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [26:0]auto_cc_to_m00_couplers_ARADDR;
  wire [1:0]auto_cc_to_m00_couplers_ARBURST;
  wire [3:0]auto_cc_to_m00_couplers_ARCACHE;
  wire [1:0]auto_cc_to_m00_couplers_ARID;
  wire [7:0]auto_cc_to_m00_couplers_ARLEN;
  wire [0:0]auto_cc_to_m00_couplers_ARLOCK;
  wire [2:0]auto_cc_to_m00_couplers_ARPROT;
  wire [3:0]auto_cc_to_m00_couplers_ARQOS;
  wire auto_cc_to_m00_couplers_ARREADY;
  wire [2:0]auto_cc_to_m00_couplers_ARSIZE;
  wire auto_cc_to_m00_couplers_ARVALID;
  wire [26:0]auto_cc_to_m00_couplers_AWADDR;
  wire [1:0]auto_cc_to_m00_couplers_AWBURST;
  wire [3:0]auto_cc_to_m00_couplers_AWCACHE;
  wire [1:0]auto_cc_to_m00_couplers_AWID;
  wire [7:0]auto_cc_to_m00_couplers_AWLEN;
  wire [0:0]auto_cc_to_m00_couplers_AWLOCK;
  wire [2:0]auto_cc_to_m00_couplers_AWPROT;
  wire [3:0]auto_cc_to_m00_couplers_AWQOS;
  wire auto_cc_to_m00_couplers_AWREADY;
  wire [2:0]auto_cc_to_m00_couplers_AWSIZE;
  wire auto_cc_to_m00_couplers_AWVALID;
  wire [1:0]auto_cc_to_m00_couplers_BID;
  wire auto_cc_to_m00_couplers_BREADY;
  wire [1:0]auto_cc_to_m00_couplers_BRESP;
  wire auto_cc_to_m00_couplers_BVALID;
  wire [31:0]auto_cc_to_m00_couplers_RDATA;
  wire [1:0]auto_cc_to_m00_couplers_RID;
  wire auto_cc_to_m00_couplers_RLAST;
  wire auto_cc_to_m00_couplers_RREADY;
  wire [1:0]auto_cc_to_m00_couplers_RRESP;
  wire auto_cc_to_m00_couplers_RVALID;
  wire [31:0]auto_cc_to_m00_couplers_WDATA;
  wire auto_cc_to_m00_couplers_WLAST;
  wire auto_cc_to_m00_couplers_WREADY;
  wire [3:0]auto_cc_to_m00_couplers_WSTRB;
  wire auto_cc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_cc_ARADDR;
  wire [1:0]m00_couplers_to_auto_cc_ARBURST;
  wire [3:0]m00_couplers_to_auto_cc_ARCACHE;
  wire [1:0]m00_couplers_to_auto_cc_ARID;
  wire [7:0]m00_couplers_to_auto_cc_ARLEN;
  wire [0:0]m00_couplers_to_auto_cc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_cc_ARPROT;
  wire [3:0]m00_couplers_to_auto_cc_ARQOS;
  wire m00_couplers_to_auto_cc_ARREADY;
  wire [3:0]m00_couplers_to_auto_cc_ARREGION;
  wire [2:0]m00_couplers_to_auto_cc_ARSIZE;
  wire [0:0]m00_couplers_to_auto_cc_ARUSER;
  wire m00_couplers_to_auto_cc_ARVALID;
  wire [31:0]m00_couplers_to_auto_cc_AWADDR;
  wire [1:0]m00_couplers_to_auto_cc_AWBURST;
  wire [3:0]m00_couplers_to_auto_cc_AWCACHE;
  wire [1:0]m00_couplers_to_auto_cc_AWID;
  wire [7:0]m00_couplers_to_auto_cc_AWLEN;
  wire [0:0]m00_couplers_to_auto_cc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_cc_AWPROT;
  wire [3:0]m00_couplers_to_auto_cc_AWQOS;
  wire m00_couplers_to_auto_cc_AWREADY;
  wire [3:0]m00_couplers_to_auto_cc_AWREGION;
  wire [2:0]m00_couplers_to_auto_cc_AWSIZE;
  wire [0:0]m00_couplers_to_auto_cc_AWUSER;
  wire m00_couplers_to_auto_cc_AWVALID;
  wire [1:0]m00_couplers_to_auto_cc_BID;
  wire m00_couplers_to_auto_cc_BREADY;
  wire [1:0]m00_couplers_to_auto_cc_BRESP;
  wire [0:0]m00_couplers_to_auto_cc_BUSER;
  wire m00_couplers_to_auto_cc_BVALID;
  wire [31:0]m00_couplers_to_auto_cc_RDATA;
  wire [1:0]m00_couplers_to_auto_cc_RID;
  wire m00_couplers_to_auto_cc_RLAST;
  wire m00_couplers_to_auto_cc_RREADY;
  wire [1:0]m00_couplers_to_auto_cc_RRESP;
  wire [0:0]m00_couplers_to_auto_cc_RUSER;
  wire m00_couplers_to_auto_cc_RVALID;
  wire [31:0]m00_couplers_to_auto_cc_WDATA;
  wire m00_couplers_to_auto_cc_WLAST;
  wire m00_couplers_to_auto_cc_WREADY;
  wire [3:0]m00_couplers_to_auto_cc_WSTRB;
  wire [0:0]m00_couplers_to_auto_cc_WUSER;
  wire m00_couplers_to_auto_cc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[26:0] = auto_cc_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_cc_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_cc_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[1:0] = auto_cc_to_m00_couplers_ARID;
  assign M_AXI_arlen[7:0] = auto_cc_to_m00_couplers_ARLEN;
  assign M_AXI_arlock = auto_cc_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_cc_to_m00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_cc_to_m00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_cc_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_cc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[26:0] = auto_cc_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_cc_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_cc_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[1:0] = auto_cc_to_m00_couplers_AWID;
  assign M_AXI_awlen[7:0] = auto_cc_to_m00_couplers_AWLEN;
  assign M_AXI_awlock = auto_cc_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_cc_to_m00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_cc_to_m00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_cc_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_cc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_cc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_cc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_cc_to_m00_couplers_WDATA;
  assign M_AXI_wlast = auto_cc_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_cc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_cc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bid[1:0] = m00_couplers_to_auto_cc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_cc_BRESP;
  assign S_AXI_buser[0] = m00_couplers_to_auto_cc_BUSER;
  assign S_AXI_bvalid = m00_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_auto_cc_RDATA;
  assign S_AXI_rid[1:0] = m00_couplers_to_auto_cc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_cc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_cc_RRESP;
  assign S_AXI_ruser[0] = m00_couplers_to_auto_cc_RUSER;
  assign S_AXI_rvalid = m00_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_cc_WREADY;
  assign auto_cc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_cc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_cc_to_m00_couplers_BID = M_AXI_bid[1:0];
  assign auto_cc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_cc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_cc_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_cc_to_m00_couplers_RID = M_AXI_rid[1:0];
  assign auto_cc_to_m00_couplers_RLAST = M_AXI_rlast;
  assign auto_cc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_cc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_cc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_cc_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_cc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_cc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_cc_ARID = S_AXI_arid[1:0];
  assign m00_couplers_to_auto_cc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_cc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_cc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_cc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_cc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_cc_ARUSER = S_AXI_aruser[0];
  assign m00_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_cc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_cc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_cc_AWID = S_AXI_awid[1:0];
  assign m00_couplers_to_auto_cc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_cc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_cc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_cc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_cc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_cc_AWUSER = S_AXI_awuser[0];
  assign m00_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_cc_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_auto_cc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_auto_cc_WUSER = S_AXI_wuser[0];
  assign m00_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  ddr_2_bram_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_m00_couplers_ARADDR),
        .m_axi_arburst(auto_cc_to_m00_couplers_ARBURST),
        .m_axi_arcache(auto_cc_to_m00_couplers_ARCACHE),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arid(auto_cc_to_m00_couplers_ARID),
        .m_axi_arlen(auto_cc_to_m00_couplers_ARLEN),
        .m_axi_arlock(auto_cc_to_m00_couplers_ARLOCK),
        .m_axi_arprot(auto_cc_to_m00_couplers_ARPROT),
        .m_axi_arqos(auto_cc_to_m00_couplers_ARQOS),
        .m_axi_arready(auto_cc_to_m00_couplers_ARREADY),
        .m_axi_arsize(auto_cc_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(auto_cc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_cc_to_m00_couplers_AWADDR),
        .m_axi_awburst(auto_cc_to_m00_couplers_AWBURST),
        .m_axi_awcache(auto_cc_to_m00_couplers_AWCACHE),
        .m_axi_awid(auto_cc_to_m00_couplers_AWID),
        .m_axi_awlen(auto_cc_to_m00_couplers_AWLEN),
        .m_axi_awlock(auto_cc_to_m00_couplers_AWLOCK),
        .m_axi_awprot(auto_cc_to_m00_couplers_AWPROT),
        .m_axi_awqos(auto_cc_to_m00_couplers_AWQOS),
        .m_axi_awready(auto_cc_to_m00_couplers_AWREADY),
        .m_axi_awsize(auto_cc_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(auto_cc_to_m00_couplers_AWVALID),
        .m_axi_bid(auto_cc_to_m00_couplers_BID),
        .m_axi_bready(auto_cc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_cc_to_m00_couplers_BRESP),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(auto_cc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_cc_to_m00_couplers_RDATA),
        .m_axi_rid(auto_cc_to_m00_couplers_RID),
        .m_axi_rlast(auto_cc_to_m00_couplers_RLAST),
        .m_axi_rready(auto_cc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_cc_to_m00_couplers_RRESP),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(auto_cc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_cc_to_m00_couplers_WDATA),
        .m_axi_wlast(auto_cc_to_m00_couplers_WLAST),
        .m_axi_wready(auto_cc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_cc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_cc_to_m00_couplers_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(m00_couplers_to_auto_cc_ARADDR[26:0]),
        .s_axi_arburst(m00_couplers_to_auto_cc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_cc_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(m00_couplers_to_auto_cc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_cc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_cc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_cc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_cc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_cc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_cc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_cc_ARSIZE),
        .s_axi_aruser(m00_couplers_to_auto_cc_ARUSER),
        .s_axi_arvalid(m00_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_cc_AWADDR[26:0]),
        .s_axi_awburst(m00_couplers_to_auto_cc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_cc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_cc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_cc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_cc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_cc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_cc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_cc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_cc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_cc_AWSIZE),
        .s_axi_awuser(m00_couplers_to_auto_cc_AWUSER),
        .s_axi_awvalid(m00_couplers_to_auto_cc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_cc_BID),
        .s_axi_bready(m00_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_cc_BRESP),
        .s_axi_buser(m00_couplers_to_auto_cc_BUSER),
        .s_axi_bvalid(m00_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_cc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_cc_RID),
        .s_axi_rlast(m00_couplers_to_auto_cc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_cc_RRESP),
        .s_axi_ruser(m00_couplers_to_auto_cc_RUSER),
        .s_axi_rvalid(m00_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_cc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_cc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_cc_WSTRB),
        .s_axi_wuser(m00_couplers_to_auto_cc_WUSER),
        .s_axi_wvalid(m00_couplers_to_auto_cc_WVALID));
endmodule

module s00_couplers_imp_J7BXMR
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_aruser,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awuser,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_buser,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_ruser,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wuser,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_aruser,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_buser,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_ruser,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wuser,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output [0:0]M_AXI_aruser;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [0:0]M_AXI_awuser;
  output M_AXI_awvalid;
  input [1:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_buser;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [1:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_ruser;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wuser;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_aruser;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awuser;
  input S_AXI_awvalid;
  output [1:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_buser;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [1:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_ruser;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wuser;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [0:0]s00_couplers_to_s00_couplers_ARID;
  wire [7:0]s00_couplers_to_s00_couplers_ARLEN;
  wire s00_couplers_to_s00_couplers_ARLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [3:0]s00_couplers_to_s00_couplers_ARQOS;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire [0:0]s00_couplers_to_s00_couplers_ARUSER;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [0:0]s00_couplers_to_s00_couplers_AWID;
  wire [7:0]s00_couplers_to_s00_couplers_AWLEN;
  wire s00_couplers_to_s00_couplers_AWLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [3:0]s00_couplers_to_s00_couplers_AWQOS;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire [0:0]s00_couplers_to_s00_couplers_AWUSER;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire [1:0]s00_couplers_to_s00_couplers_BID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire [0:0]s00_couplers_to_s00_couplers_BUSER;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [1:0]s00_couplers_to_s00_couplers_RID;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RUSER;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire [0:0]s00_couplers_to_s00_couplers_WUSER;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[0] = s00_couplers_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arlock = s00_couplers_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_couplers_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_aruser[0] = s00_couplers_to_s00_couplers_ARUSER;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[0] = s00_couplers_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awlock = s00_couplers_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_couplers_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awuser[0] = s00_couplers_to_s00_couplers_AWUSER;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wuser[0] = s00_couplers_to_s00_couplers_WUSER;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bid[1:0] = s00_couplers_to_s00_couplers_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_buser[0] = s00_couplers_to_s00_couplers_BUSER;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rid[1:0] = s00_couplers_to_s00_couplers_RID;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_ruser[0] = s00_couplers_to_s00_couplers_RUSER;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARID = S_AXI_arid[0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_s00_couplers_ARLOCK = S_AXI_arlock;
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARUSER = S_AXI_aruser[0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWID = S_AXI_awid[0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_s00_couplers_AWLOCK = S_AXI_awlock;
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWUSER = S_AXI_awuser[0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BID = M_AXI_bid[1:0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BUSER = M_AXI_buser[0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RID = M_AXI_rid[1:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RUSER = M_AXI_ruser[0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WUSER = S_AXI_wuser[0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s01_couplers_imp_8YT0ED
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_aruser,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awuser,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_buser,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_ruser,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wuser,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_aruser,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_buser,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_ruser,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wuser,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output [0:0]M_AXI_aruser;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [0:0]M_AXI_awuser;
  output M_AXI_awvalid;
  input [1:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_buser;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [1:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_ruser;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wuser;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_aruser;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awuser;
  input S_AXI_awvalid;
  output [1:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_buser;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [1:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_ruser;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wuser;
  input S_AXI_wvalid;

  wire [31:0]s01_couplers_to_s01_couplers_ARADDR;
  wire [1:0]s01_couplers_to_s01_couplers_ARBURST;
  wire [3:0]s01_couplers_to_s01_couplers_ARCACHE;
  wire [0:0]s01_couplers_to_s01_couplers_ARID;
  wire [7:0]s01_couplers_to_s01_couplers_ARLEN;
  wire s01_couplers_to_s01_couplers_ARLOCK;
  wire [2:0]s01_couplers_to_s01_couplers_ARPROT;
  wire [3:0]s01_couplers_to_s01_couplers_ARQOS;
  wire s01_couplers_to_s01_couplers_ARREADY;
  wire [2:0]s01_couplers_to_s01_couplers_ARSIZE;
  wire [0:0]s01_couplers_to_s01_couplers_ARUSER;
  wire s01_couplers_to_s01_couplers_ARVALID;
  wire [31:0]s01_couplers_to_s01_couplers_AWADDR;
  wire [1:0]s01_couplers_to_s01_couplers_AWBURST;
  wire [3:0]s01_couplers_to_s01_couplers_AWCACHE;
  wire [0:0]s01_couplers_to_s01_couplers_AWID;
  wire [7:0]s01_couplers_to_s01_couplers_AWLEN;
  wire s01_couplers_to_s01_couplers_AWLOCK;
  wire [2:0]s01_couplers_to_s01_couplers_AWPROT;
  wire [3:0]s01_couplers_to_s01_couplers_AWQOS;
  wire s01_couplers_to_s01_couplers_AWREADY;
  wire [2:0]s01_couplers_to_s01_couplers_AWSIZE;
  wire [0:0]s01_couplers_to_s01_couplers_AWUSER;
  wire s01_couplers_to_s01_couplers_AWVALID;
  wire [1:0]s01_couplers_to_s01_couplers_BID;
  wire s01_couplers_to_s01_couplers_BREADY;
  wire [1:0]s01_couplers_to_s01_couplers_BRESP;
  wire [0:0]s01_couplers_to_s01_couplers_BUSER;
  wire s01_couplers_to_s01_couplers_BVALID;
  wire [31:0]s01_couplers_to_s01_couplers_RDATA;
  wire [1:0]s01_couplers_to_s01_couplers_RID;
  wire s01_couplers_to_s01_couplers_RLAST;
  wire s01_couplers_to_s01_couplers_RREADY;
  wire [1:0]s01_couplers_to_s01_couplers_RRESP;
  wire [0:0]s01_couplers_to_s01_couplers_RUSER;
  wire s01_couplers_to_s01_couplers_RVALID;
  wire [31:0]s01_couplers_to_s01_couplers_WDATA;
  wire s01_couplers_to_s01_couplers_WLAST;
  wire s01_couplers_to_s01_couplers_WREADY;
  wire [3:0]s01_couplers_to_s01_couplers_WSTRB;
  wire [0:0]s01_couplers_to_s01_couplers_WUSER;
  wire s01_couplers_to_s01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s01_couplers_to_s01_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s01_couplers_to_s01_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s01_couplers_to_s01_couplers_ARCACHE;
  assign M_AXI_arid[0] = s01_couplers_to_s01_couplers_ARID;
  assign M_AXI_arlen[7:0] = s01_couplers_to_s01_couplers_ARLEN;
  assign M_AXI_arlock = s01_couplers_to_s01_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s01_couplers_to_s01_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s01_couplers_to_s01_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s01_couplers_to_s01_couplers_ARSIZE;
  assign M_AXI_aruser[0] = s01_couplers_to_s01_couplers_ARUSER;
  assign M_AXI_arvalid = s01_couplers_to_s01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s01_couplers_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s01_couplers_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s01_couplers_to_s01_couplers_AWCACHE;
  assign M_AXI_awid[0] = s01_couplers_to_s01_couplers_AWID;
  assign M_AXI_awlen[7:0] = s01_couplers_to_s01_couplers_AWLEN;
  assign M_AXI_awlock = s01_couplers_to_s01_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s01_couplers_to_s01_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s01_couplers_to_s01_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s01_couplers_to_s01_couplers_AWSIZE;
  assign M_AXI_awuser[0] = s01_couplers_to_s01_couplers_AWUSER;
  assign M_AXI_awvalid = s01_couplers_to_s01_couplers_AWVALID;
  assign M_AXI_bready = s01_couplers_to_s01_couplers_BREADY;
  assign M_AXI_rready = s01_couplers_to_s01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s01_couplers_to_s01_couplers_WDATA;
  assign M_AXI_wlast = s01_couplers_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s01_couplers_to_s01_couplers_WSTRB;
  assign M_AXI_wuser[0] = s01_couplers_to_s01_couplers_WUSER;
  assign M_AXI_wvalid = s01_couplers_to_s01_couplers_WVALID;
  assign S_AXI_arready = s01_couplers_to_s01_couplers_ARREADY;
  assign S_AXI_awready = s01_couplers_to_s01_couplers_AWREADY;
  assign S_AXI_bid[1:0] = s01_couplers_to_s01_couplers_BID;
  assign S_AXI_bresp[1:0] = s01_couplers_to_s01_couplers_BRESP;
  assign S_AXI_buser[0] = s01_couplers_to_s01_couplers_BUSER;
  assign S_AXI_bvalid = s01_couplers_to_s01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s01_couplers_to_s01_couplers_RDATA;
  assign S_AXI_rid[1:0] = s01_couplers_to_s01_couplers_RID;
  assign S_AXI_rlast = s01_couplers_to_s01_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s01_couplers_to_s01_couplers_RRESP;
  assign S_AXI_ruser[0] = s01_couplers_to_s01_couplers_RUSER;
  assign S_AXI_rvalid = s01_couplers_to_s01_couplers_RVALID;
  assign S_AXI_wready = s01_couplers_to_s01_couplers_WREADY;
  assign s01_couplers_to_s01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s01_couplers_to_s01_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s01_couplers_to_s01_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s01_couplers_to_s01_couplers_ARID = S_AXI_arid[0];
  assign s01_couplers_to_s01_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s01_couplers_to_s01_couplers_ARLOCK = S_AXI_arlock;
  assign s01_couplers_to_s01_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s01_couplers_to_s01_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s01_couplers_to_s01_couplers_ARREADY = M_AXI_arready;
  assign s01_couplers_to_s01_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s01_couplers_to_s01_couplers_ARUSER = S_AXI_aruser[0];
  assign s01_couplers_to_s01_couplers_ARVALID = S_AXI_arvalid;
  assign s01_couplers_to_s01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_s01_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_s01_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_s01_couplers_AWID = S_AXI_awid[0];
  assign s01_couplers_to_s01_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s01_couplers_to_s01_couplers_AWLOCK = S_AXI_awlock;
  assign s01_couplers_to_s01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_s01_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s01_couplers_to_s01_couplers_AWREADY = M_AXI_awready;
  assign s01_couplers_to_s01_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_s01_couplers_AWUSER = S_AXI_awuser[0];
  assign s01_couplers_to_s01_couplers_AWVALID = S_AXI_awvalid;
  assign s01_couplers_to_s01_couplers_BID = M_AXI_bid[1:0];
  assign s01_couplers_to_s01_couplers_BREADY = S_AXI_bready;
  assign s01_couplers_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign s01_couplers_to_s01_couplers_BUSER = M_AXI_buser[0];
  assign s01_couplers_to_s01_couplers_BVALID = M_AXI_bvalid;
  assign s01_couplers_to_s01_couplers_RDATA = M_AXI_rdata[31:0];
  assign s01_couplers_to_s01_couplers_RID = M_AXI_rid[1:0];
  assign s01_couplers_to_s01_couplers_RLAST = M_AXI_rlast;
  assign s01_couplers_to_s01_couplers_RREADY = S_AXI_rready;
  assign s01_couplers_to_s01_couplers_RRESP = M_AXI_rresp[1:0];
  assign s01_couplers_to_s01_couplers_RUSER = M_AXI_ruser[0];
  assign s01_couplers_to_s01_couplers_RVALID = M_AXI_rvalid;
  assign s01_couplers_to_s01_couplers_WDATA = S_AXI_wdata[31:0];
  assign s01_couplers_to_s01_couplers_WLAST = S_AXI_wlast;
  assign s01_couplers_to_s01_couplers_WREADY = M_AXI_wready;
  assign s01_couplers_to_s01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s01_couplers_to_s01_couplers_WUSER = S_AXI_wuser[0];
  assign s01_couplers_to_s01_couplers_WVALID = S_AXI_wvalid;
endmodule
