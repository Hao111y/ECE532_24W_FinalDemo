//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3.1 (win64) Build 2489853 Tue Mar 26 04:20:25 MDT 2019
//Date        : Wed Apr  3 03:52:40 2024
//Host        : BA3135WS15 running 64-bit major release  (build 9200)
//Command     : generate_target top_wrapper.bd
//Design      : top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module top_wrapper
   (VGA_B,
    VGA_G,
    VGA_HS,
    VGA_R,
    VGA_VS,
    ext_areset_n,
    ext_cam_href,
    ext_cam_pclk,
    ext_cam_pdata,
    ext_cam_pwdn,
    ext_cam_rst,
    ext_cam_rst_p,
    ext_cam_vsync,
    ext_cam_xclk,
    ext_clk_100M,
    ext_config_done,
    ext_config_selection,
    ext_config_sioc,
    ext_config_siod,
    ext_config_start,
    usb_uart_rxd,
    usb_uart_txd);
  output [3:0]VGA_B;
  output [3:0]VGA_G;
  output VGA_HS;
  output [3:0]VGA_R;
  output VGA_VS;
  input ext_areset_n;
  input ext_cam_href;
  input ext_cam_pclk;
  input [7:0]ext_cam_pdata;
  output ext_cam_pwdn;
  input ext_cam_rst;
  output ext_cam_rst_p;
  input ext_cam_vsync;
  output ext_cam_xclk;
  input ext_clk_100M;
  output ext_config_done;
  input [1:0]ext_config_selection;
  output ext_config_sioc;
  output ext_config_siod;
  input ext_config_start;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [3:0]VGA_B;
  wire [3:0]VGA_G;
  wire VGA_HS;
  wire [3:0]VGA_R;
  wire VGA_VS;
  wire ext_areset_n;
  wire ext_cam_href;
  wire ext_cam_pclk;
  wire [7:0]ext_cam_pdata;
  wire ext_cam_pwdn;
  wire ext_cam_rst;
  wire ext_cam_rst_p;
  wire ext_cam_vsync;
  wire ext_cam_xclk;
  wire ext_clk_100M;
  wire ext_config_done;
  wire [1:0]ext_config_selection;
  wire ext_config_sioc;
  wire ext_config_siod;
  wire ext_config_start;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  top top_i
       (.VGA_B(VGA_B),
        .VGA_G(VGA_G),
        .VGA_HS(VGA_HS),
        .VGA_R(VGA_R),
        .VGA_VS(VGA_VS),
        .ext_areset_n(ext_areset_n),
        .ext_cam_href(ext_cam_href),
        .ext_cam_pclk(ext_cam_pclk),
        .ext_cam_pdata(ext_cam_pdata),
        .ext_cam_pwdn(ext_cam_pwdn),
        .ext_cam_rst(ext_cam_rst),
        .ext_cam_rst_p(ext_cam_rst_p),
        .ext_cam_vsync(ext_cam_vsync),
        .ext_cam_xclk(ext_cam_xclk),
        .ext_clk_100M(ext_clk_100M),
        .ext_config_done(ext_config_done),
        .ext_config_selection(ext_config_selection),
        .ext_config_sioc(ext_config_sioc),
        .ext_config_siod(ext_config_siod),
        .ext_config_start(ext_config_start),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
