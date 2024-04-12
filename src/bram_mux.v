`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 04:29:17 PM
// Design Name: 
// Module Name: bram_mux
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


module bram_mux(
    input [8:0] addra,
    input [8:0] addrb,
    output [8:0] addra_bram,
    input ena,
    input enb,
    output ena_bram,
    input sel
    );
    assign addra_bram = sel ? addrb : addra ;
    assign ena_bram = sel ? enb : ena;
endmodule
