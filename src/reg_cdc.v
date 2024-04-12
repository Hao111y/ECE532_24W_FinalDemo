`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 04:20:55 PM
// Design Name: 
// Module Name: reg_cdc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_cdc(
    input in_reg,
    output out_reg,
    input src_clk,
    input dst_clk
    
);

    xpm_cdc_single xpm_cdc_single_inst(.src_in(in_reg), .dest_out(out_reg), .src_clk(src_clk), .dest_clk(dst_clk));
endmodule
