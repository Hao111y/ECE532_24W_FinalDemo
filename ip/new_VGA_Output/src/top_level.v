`timescale 1ns / 1ps

module top_level(
    input           CLK100MHZ,
    input           CPU_RESETN,
    output [3:0]    VGA_R,
    output [3:0]    VGA_G,
    output [3:0]    VGA_B,
    output          VGA_HS,
    output          VGA_VS,

    output [12:0]ddr2_addr,
    output [2:0]ddr2_ba,
    output ddr2_cas_n,
    output [0:0]ddr2_ck_n,
    output [0:0]ddr2_ck_p,
    output [0:0]ddr2_cke,
    output [0:0]ddr2_cs_n,
    output [1:0]ddr2_dm,
    inout [15:0]ddr2_dq,
    inout [1:0]ddr2_dqs_n,
    inout [1:0]ddr2_dqs_p,
    output [0:0]ddr2_odt,
    output ddr2_ras_n,
    output ddr2_we_n,
    
    output frame_bram_en_out,
    output frame_bram_clk_out,
    input [19:0] frame_bram_data_in,
    output [13:0] frame_bram_addr_out
    );

    wire clk_vga;
    wire clk_ddr;
    assign frame_bram_clk_out = clk_ddr;
    
    ddr_2_bram_top u2(
        .clk_ddr(clk_ddr),
        .clk_vga(clk_vga),
        .clk_100M(CLK100MHZ),
        .reset_n(CPU_RESETN),
        .vga_r(VGA_R),
        .vga_g(VGA_G),
        .vga_b(VGA_B),
        .vga_hs(VGA_HS),
        .vga_vs(VGA_VS),

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
        .frame_bram_en_out(frame_bram_en_out),
        .frame_bram_data_in(frame_bram_data_in),
        .frame_bram_addr_out(frame_bram_addr_out)
);
endmodule