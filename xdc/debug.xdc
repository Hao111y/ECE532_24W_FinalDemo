connect_debug_port u_ila_0/probe0 [get_nets [list {top_i/image_proc/divider_output_0/inst/ydiv_valid[0]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[1]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[2]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[3]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[4]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[5]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[6]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[7]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[8]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[9]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[10]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[11]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[12]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[13]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[14]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[15]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[16]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[17]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[18]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[19]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[20]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[21]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[22]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[23]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[24]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[25]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[26]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[27]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[28]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[29]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[30]} {top_i/image_proc/divider_output_0/inst/ydiv_valid[31]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list top_i/image_proc/divider_output_0/inst/x_debug]]
connect_debug_port u_ila_0/probe12 [get_nets [list top_i/image_proc/divider_output_0/inst/y_debug]]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list top_i/clk_wiz_1/inst/clk_100M]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {top_i/p_data_0_1[0]} {top_i/p_data_0_1[1]} {top_i/p_data_0_1[2]} {top_i/p_data_0_1[3]} {top_i/p_data_0_1[4]} {top_i/p_data_0_1[5]} {top_i/p_data_0_1[6]} {top_i/p_data_0_1[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 24 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {top_i/image_proc/pixel_acc_0_p_y[0]} {top_i/image_proc/pixel_acc_0_p_y[1]} {top_i/image_proc/pixel_acc_0_p_y[2]} {top_i/image_proc/pixel_acc_0_p_y[3]} {top_i/image_proc/pixel_acc_0_p_y[4]} {top_i/image_proc/pixel_acc_0_p_y[5]} {top_i/image_proc/pixel_acc_0_p_y[6]} {top_i/image_proc/pixel_acc_0_p_y[7]} {top_i/image_proc/pixel_acc_0_p_y[8]} {top_i/image_proc/pixel_acc_0_p_y[9]} {top_i/image_proc/pixel_acc_0_p_y[10]} {top_i/image_proc/pixel_acc_0_p_y[11]} {top_i/image_proc/pixel_acc_0_p_y[12]} {top_i/image_proc/pixel_acc_0_p_y[13]} {top_i/image_proc/pixel_acc_0_p_y[14]} {top_i/image_proc/pixel_acc_0_p_y[15]} {top_i/image_proc/pixel_acc_0_p_y[16]} {top_i/image_proc/pixel_acc_0_p_y[17]} {top_i/image_proc/pixel_acc_0_p_y[18]} {top_i/image_proc/pixel_acc_0_p_y[19]} {top_i/image_proc/pixel_acc_0_p_y[20]} {top_i/image_proc/pixel_acc_0_p_y[21]} {top_i/image_proc/pixel_acc_0_p_y[22]} {top_i/image_proc/pixel_acc_0_p_y[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 24 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {top_i/image_proc/pixel_acc_0_p_x[0]} {top_i/image_proc/pixel_acc_0_p_x[1]} {top_i/image_proc/pixel_acc_0_p_x[2]} {top_i/image_proc/pixel_acc_0_p_x[3]} {top_i/image_proc/pixel_acc_0_p_x[4]} {top_i/image_proc/pixel_acc_0_p_x[5]} {top_i/image_proc/pixel_acc_0_p_x[6]} {top_i/image_proc/pixel_acc_0_p_x[7]} {top_i/image_proc/pixel_acc_0_p_x[8]} {top_i/image_proc/pixel_acc_0_p_x[9]} {top_i/image_proc/pixel_acc_0_p_x[10]} {top_i/image_proc/pixel_acc_0_p_x[11]} {top_i/image_proc/pixel_acc_0_p_x[12]} {top_i/image_proc/pixel_acc_0_p_x[13]} {top_i/image_proc/pixel_acc_0_p_x[14]} {top_i/image_proc/pixel_acc_0_p_x[15]} {top_i/image_proc/pixel_acc_0_p_x[16]} {top_i/image_proc/pixel_acc_0_p_x[17]} {top_i/image_proc/pixel_acc_0_p_x[18]} {top_i/image_proc/pixel_acc_0_p_x[19]} {top_i/image_proc/pixel_acc_0_p_x[20]} {top_i/image_proc/pixel_acc_0_p_x[21]} {top_i/image_proc/pixel_acc_0_p_x[22]} {top_i/image_proc/pixel_acc_0_p_x[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {top_i/image_proc/pixel_acc_0_p_size[0]} {top_i/image_proc/pixel_acc_0_p_size[1]} {top_i/image_proc/pixel_acc_0_p_size[2]} {top_i/image_proc/pixel_acc_0_p_size[3]} {top_i/image_proc/pixel_acc_0_p_size[4]} {top_i/image_proc/pixel_acc_0_p_size[5]} {top_i/image_proc/pixel_acc_0_p_size[6]} {top_i/image_proc/pixel_acc_0_p_size[7]} {top_i/image_proc/pixel_acc_0_p_size[8]} {top_i/image_proc/pixel_acc_0_p_size[9]} {top_i/image_proc/pixel_acc_0_p_size[10]} {top_i/image_proc/pixel_acc_0_p_size[11]} {top_i/image_proc/pixel_acc_0_p_size[12]} {top_i/image_proc/pixel_acc_0_p_size[13]} {top_i/image_proc/pixel_acc_0_p_size[14]} {top_i/image_proc/pixel_acc_0_p_size[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 24 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {top_i/image_proc/divider_output_0/inst/yout[0]} {top_i/image_proc/divider_output_0/inst/yout[1]} {top_i/image_proc/divider_output_0/inst/yout[2]} {top_i/image_proc/divider_output_0/inst/yout[3]} {top_i/image_proc/divider_output_0/inst/yout[4]} {top_i/image_proc/divider_output_0/inst/yout[5]} {top_i/image_proc/divider_output_0/inst/yout[6]} {top_i/image_proc/divider_output_0/inst/yout[7]} {top_i/image_proc/divider_output_0/inst/yout[8]} {top_i/image_proc/divider_output_0/inst/yout[9]} {top_i/image_proc/divider_output_0/inst/yout[10]} {top_i/image_proc/divider_output_0/inst/yout[11]} {top_i/image_proc/divider_output_0/inst/yout[12]} {top_i/image_proc/divider_output_0/inst/yout[13]} {top_i/image_proc/divider_output_0/inst/yout[14]} {top_i/image_proc/divider_output_0/inst/yout[15]} {top_i/image_proc/divider_output_0/inst/yout[16]} {top_i/image_proc/divider_output_0/inst/yout[17]} {top_i/image_proc/divider_output_0/inst/yout[18]} {top_i/image_proc/divider_output_0/inst/yout[19]} {top_i/image_proc/divider_output_0/inst/yout[20]} {top_i/image_proc/divider_output_0/inst/yout[21]} {top_i/image_proc/divider_output_0/inst/yout[22]} {top_i/image_proc/divider_output_0/inst/yout[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list top_i/clk_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list top_i/image_proc/erosion_dilation_finish_ed]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list top_i/href_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list top_i/image_proc/pixel_acc_0_acc_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list top_i/image_proc/pixel_acc_0_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list top_i/image_proc/run_ed_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list top_i/vsync_0_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list top_i/image_proc/divider_output_0/inst/xdiv_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list top_i/image_proc/divider_output_0/inst/ydiv_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_clk_100M]
