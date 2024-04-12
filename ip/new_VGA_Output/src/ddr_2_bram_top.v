`timescale 1ns / 1ps

module ddr_2_bram_top(
    input reset_n,
    output [3:0] vga_r,
    output [3:0] vga_g,
    output [3:0] vga_b,
    output vga_hs,
    output vga_vs,

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
    input [19:0] frame_bram_data_in,
    output [13:0] frame_bram_addr_out,
    output clk_ddr,
    output clk_vga,
    input clk_100M
);

    wire line_sync;
    wire line_sync_200;
    wire frame_sync;
    wire frame_sync_200;

    wire [12:0] BRAM_PORTB_addr, BRAM_PORTB_addr_vga;
    wire BRAM_PORTB_clk;
    wire [15:0] BRAM_PORTB_dout, BRAM_PORTB_dout_vga;
    wire BRAM_PORTB_en, BRAM_PORTB_en_vga;
    
    wire [11:0] rgb_out;

    assign BRAM_PORTB_clk = clk_ddr;
    
    xpm_cdc_pulse #(.RST_USED(0)) sync1(.src_pulse(line_sync), .src_clk(clk_vga), .src_rst(0), .dest_rst(0), .dest_clk(clk_ddr), .dest_pulse(line_sync_200));
    xpm_cdc_pulse #(.RST_USED(0)) sync2(.src_pulse(frame_sync), .src_clk(clk_vga), .src_rst(0), .dest_rst(0), .dest_clk(clk_ddr), .dest_pulse(frame_sync_200));
    xpm_cdc_array_single #(.WIDTH(16)) sync3(.src_in(BRAM_PORTB_dout), .dest_out(BRAM_PORTB_dout_vga), .src_clk(clk_ddr), .dest_clk(clk_vga));
    xpm_cdc_array_single #(.WIDTH(13)) sync4(.src_in(BRAM_PORTB_addr_vga), .dest_out(BRAM_PORTB_addr), .src_clk(clk_vga), .dest_clk(clk_ddr));
    xpm_cdc_single sync5(.src_in(BRAM_PORTB_en_vga), .dest_out(BRAM_PORTB_en), .src_clk(clk_vga), .dest_clk(clk_ddr));

    wire [12:0] addr0;
    ddr_2_bram_wrapper u0(
        .BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_clk(BRAM_PORTB_clk),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en),
        .line_sync(line_sync_200),
        .frame_sync(frame_sync_200),
        .reset_n(reset_n),
        .bram0_addr(addr0[12:2]),
        .bram0_ctrl_addr(addr0),
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
        .frame_bram_addr_out(frame_bram_addr_out),
        .clk_ddr(clk_ddr),
        .clk_vga(clk_vga),
        .clk_100M(clk_100M)
    );

    get_next_line u1(
        .clk(clk_vga),
        .reset_n(reset_n),
        .clkb(),
        .rstb(),
        .enb(BRAM_PORTB_en_vga),
        .wenb(),
        .addrb(BRAM_PORTB_addr_vga),
        .dinb(),
        .doutb(BRAM_PORTB_dout_vga),
        .rgb_out(rgb_out),
        .start_next_line(line_sync),
        .frame_sync(frame_sync)
    );

    VGA_640x480 u2(
        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b),
        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .line_sync(line_sync),
        .frame_sync(frame_sync),
        .rgb_in(rgb_out),
        .clk(clk_vga),
        .areset_n(reset_n)
    );

endmodule
