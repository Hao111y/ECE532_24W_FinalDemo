##Clock and reset
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports ext_clk_100M]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports ext_clk_100M]
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports ext_areset_n]

##Switches
set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports {ext_config_selection[0]}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {ext_config_selection[1]}]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports ext_cam_rst]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports ext_config_display]
##Buttons
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports ext_config_start]

##LEDs
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports ext_config_done]

##PMOD JD
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports ext_cam_href]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports ext_cam_pclk]
create_clock -period 41.670 -name pclk -waveform {0.000 20.830} -add [get_ports ext_cam_pclk]

set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[7]}]
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[6]}]
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[5]}]
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[4]}]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[3]}]
set_property -dict {PACKAGE_PIN J4 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[2]}]
set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[1]}]
set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33} [get_ports {ext_cam_pdata[0]}]
set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports ext_config_sioc]
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS33} [get_ports ext_config_siod]

set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports ext_cam_vsync]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports ext_config_start]
set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports {ext_config_selection[0]}]
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {ext_config_selection[1]}]

set_property -dict {PACKAGE_PIN E7 IOSTANDARD LVCMOS33} [get_ports ext_cam_pwdn]
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33} [get_ports ext_cam_rst_p]
set_property -dict {PACKAGE_PIN G4 IOSTANDARD LVCMOS33} [get_ports ext_cam_xclk]

##VGA Connector

set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {VGA_R[0]}]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {VGA_R[1]}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports {VGA_R[2]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {VGA_R[3]}]

set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS33} [get_ports {VGA_G[0]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {VGA_G[1]}]
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {VGA_G[2]}]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS33} [get_ports {VGA_G[3]}]

set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports {VGA_B[0]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports {VGA_B[1]}]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports {VGA_B[2]}]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports {VGA_B[3]}]

set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS33} [get_ports VGA_HS]
set_property -dict {PACKAGE_PIN B12 IOSTANDARD LVCMOS33} [get_ports VGA_VS]

## USB-Uart Interface
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports usb_uart_rxd]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports usb_uart_txd]


