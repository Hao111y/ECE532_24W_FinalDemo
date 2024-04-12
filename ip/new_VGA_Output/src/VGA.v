`timescale 1ns / 1ps

// 25.175 MHz clock
module VGA_640x480(
    output reg [3:0]    vga_r,
    output reg [3:0]    vga_g,
    output reg [3:0]    vga_b,
    output reg          vga_hs,
    output reg          vga_vs,
    output wire         line_sync,
    output wire         frame_sync,
    input  wire [11:0]  rgb_in,
    input               clk,
    input               areset_n
    );
    // 640x480 @ 60Hz
    parameter H_SYNC_ACTIVE = 640;
    parameter H_SYNC_FRONT_PORCH = 16;
    parameter H_SYNC_CYC = 96;
    parameter H_SYNC_BACK_PORCH = 48;
    parameter H_SYNC_TOTAL = 800;

    parameter V_SYNC_ACTIVE = 480;
    parameter V_SYNC_FRONT_PORCH = 10;
    parameter V_SYNC_CYC = 2;
    parameter V_SYNC_BACK_PORCH = 33;
    parameter V_SYNC_TOTAL = 525;

    reg [9:0] h_counter = 0;
    reg [9:0] v_counter = 0;

    assign line_sync = ((v_counter < V_SYNC_ACTIVE) && (h_counter == (H_SYNC_TOTAL - 4))) ? 1 : 0;
    assign frame_sync = ((v_counter == (V_SYNC_TOTAL-1)) && (h_counter == (H_SYNC_TOTAL - 5))) ? 1 : 0;

    always @(posedge clk) begin
        if(~areset_n) begin
            h_counter <= 0;
            v_counter <= 0;
        end
        else if (h_counter == H_SYNC_TOTAL - 1) begin
            h_counter <= 0;
            if (v_counter == V_SYNC_TOTAL - 1) begin
                v_counter <= 0;
            end else begin
                v_counter <= v_counter + 1;
            end
        end else begin
            h_counter <= h_counter + 1;
        end
    end

    always @(posedge clk) begin
        if(~areset_n) begin
            vga_hs <= 0;
            vga_vs <= 0;
        end
        else begin
            if (h_counter < (H_SYNC_TOTAL - H_SYNC_BACK_PORCH) && h_counter >= (H_SYNC_ACTIVE + H_SYNC_FRONT_PORCH)) begin
                vga_hs <= 0;
            end
            else begin
                vga_hs <= 1;
            end
    
            if (v_counter < (V_SYNC_TOTAL - V_SYNC_BACK_PORCH) && v_counter > (V_SYNC_ACTIVE + V_SYNC_FRONT_PORCH)) begin
                vga_vs <= 0;
            end
            else begin
                vga_vs <= 1;
            end
        end
    end

    always @(posedge clk) begin
        if(~areset_n) begin
            vga_r <= 0;
            vga_g <= 0;
            vga_b <= 0;
        end
        else begin
            if (h_counter < H_SYNC_ACTIVE && v_counter < V_SYNC_ACTIVE) begin
                vga_r <= rgb_in[11:8];
                vga_g <= rgb_in[7:4];
                vga_b <= rgb_in[3:0];
            end
            else begin
                vga_r <= 4'b0000;
                vga_g <= 4'b0000;
                vga_b <= 4'b0000;
            end
        end
    end

endmodule

// 40.0 MHz clock
module VGA_800x600(
    vga_r,
    vga_g,
    vga_b,
    vga_hs,
    vga_vs,
    clk
    );
    output reg [3:0]    vga_r = 0;
    output reg [3:0]    vga_g = 0;
    output reg [3:0]    vga_b = 0;
    output reg          vga_hs = 1;
    output reg          vga_vs = 1;
    input  wire         clk;

    // 800x600 @ 60Hz
    parameter H_SYNC_ACTIVE = 800;
    parameter H_SYNC_FRONT_PORCH = 40;
    parameter H_SYNC_CYC = 128;
    parameter H_SYNC_BACK_PORCH = 88;
    parameter H_SYNC_TOTAL = 1056;

    parameter V_SYNC_ACTIVE = 600;
    parameter V_SYNC_FRONT_PORCH = 1;
    parameter V_SYNC_CYC = 4;
    parameter V_SYNC_BACK_PORCH = 23;
    parameter V_SYNC_TOTAL = 628;

    reg [10:0] h_counter = 0;
    reg [9:0] v_counter = 0;

    always @(posedge clk) begin
        if (h_counter == H_SYNC_TOTAL - 1) begin
            h_counter <= 0;
            if (v_counter == V_SYNC_TOTAL - 1) begin
                v_counter <= 0;
            end else begin
                v_counter <= v_counter + 1;
            end
        end else begin
            h_counter <= h_counter + 1;
        end
    end

    always @(posedge clk) begin
        if ((h_counter >= (H_SYNC_ACTIVE + H_SYNC_FRONT_PORCH)) && (h_counter < (H_SYNC_TOTAL - H_SYNC_BACK_PORCH))) begin
            vga_hs <= 0;
        end
        else begin
            vga_hs <= 1;
        end

        if ((v_counter >= (V_SYNC_ACTIVE + V_SYNC_FRONT_PORCH)) && (v_counter < (V_SYNC_TOTAL - V_SYNC_BACK_PORCH))) begin
            vga_vs <= 0;
        end
        else begin
            vga_vs <= 1;
        end
    end

    reg [3:0] counter = 0;
    always @(posedge clk) begin
        if (h_counter < H_SYNC_ACTIVE) begin
			if (clk) counter <= counter + 1;
			  if (counter == 0) begin
					vga_r <= vga_r + 1;
			  end
        end
        else begin
            vga_r <= 4'b0000;
            vga_g <= 4'b0000;
            vga_b <= 4'b0000;
				counter <= 4'b0000;
        end
    end
endmodule