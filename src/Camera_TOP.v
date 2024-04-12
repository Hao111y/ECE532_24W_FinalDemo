`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/13 16:13:56
// Design Name: 
// Module Name: Camera_TOP
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


module Camera_Config_TOP
    #(
    parameter CLK_FREQ_SET=25_000_000
    )
    (
    input wire clk,
    input wire [1:0] ext_config_selection,
    input wire rst_n,
    input wire start,
    output wire sioc,
    output wire siod,
    output wire done
    );
    wire [7:0] mem_addr;
    wire [15:0] mem_dout;
    /*
    wire [7:0] mem_addr_1;
    wire [15:0] mem_dout_1;   
    wire [7:0] mem_addr_2;
    wire [15:0] mem_dout_2;*/
    
    wire [7:0] SCCB_addr;
    wire [7:0] SCCB_data;
    wire SCCB_start;
    wire SCCB_ready;
    wire config_start_p;
        
    camera_mem_config camera_mem_config1(
        .clk(clk),
        .config_selection(ext_config_selection),
        .addr(mem_addr),
        .dout(mem_dout)
    );
    
    /*
    camera_config_settings settings_1(
        .clk(clk),
        .addr(mem_addr),
        .dout(mem_dout)
    );*/
    
    edge_detect start_edge_p (
        .clk(clk),
        .rst(rst_n),
        .signal(start),
        .p_edge(config_start_p)
    );
    
    OV7670_Config_25k 
    #(
        .CLK_FREQ(CLK_FREQ_SET)
    )
    OV_config
    (
        .clk(clk),
        .SCCB_interface_ready(SCCB_ready),
        .rom_data(mem_dout),
        .start(config_start_p),
        .rom_addr(mem_addr),
        .done(done),
        .SCCB_interface_addr(SCCB_addr),
        .SCCB_interface_data(SCCB_data),
        .SCCB_interface_start(SCCB_start)
    );
    
    SCCB_interface 
    #(
        .CAMERA_FREQ(CLK_FREQ_SET)
    )
    SCCB_module(
        .clk(clk),
        .rst_n(rst_n),
        .start(SCCB_start),
        .address(SCCB_addr),
        .data(SCCB_data),
        .ready(SCCB_ready),
        .SIOC_oe(sioc),
        .SIOD_oe(siod)
    );
    
    
endmodule
