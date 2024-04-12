`timescale 1ns / 1ps

module get_next_line #
(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH = 16,
    parameter LINE_COUNT_POW = 1,
    parameter LINE_WIDTH = 640,
    parameter PIXEL_COUNT_POW = 10
)
(
    clk,
    reset_n,
    clkb,
    rstb,
    enb,
    wenb,
    addrb,
    dinb,
    doutb,

    rgb_out,
    start_next_line,
    frame_sync
);
    input wire clk;
    input wire reset_n;
    output wire clkb;
    output wire rstb;
    output reg enb;
    output reg [DATA_WIDTH/8-1:0] wenb;
    output wire [ADDRESS_WIDTH-1:0] addrb;
    output reg [DATA_WIDTH-1:0] dinb;
    input wire [DATA_WIDTH-1:0] doutb;

    output reg [11:0] rgb_out;
    input wire start_next_line;
    input wire frame_sync;

    reg [LINE_COUNT_POW-1:0] curr_line;
    reg [PIXEL_COUNT_POW-1:0] pixel_count;


    // 
    assign rstb = ~reset_n;
    assign clkb = clk;
    assign addrb = {curr_line, pixel_count};

    always @(posedge clk) begin
        if (!reset_n) begin
            enb <= 1'b0;
            wenb <= 0;
            dinb <= 0;
            curr_line <= 0;
            pixel_count <= 0;
        end
        else begin
            if(frame_sync) begin
                curr_line <= 1;
            end
            if (start_next_line) begin
                curr_line <= curr_line + 1;
                pixel_count <= 0;
                enb <= 1'b1;
            end
            else if (pixel_count < LINE_WIDTH) begin
                pixel_count <= pixel_count + 1;
                rgb_out <= doutb[11:0];
            end
            else begin
                enb <= 1'b0;
            end
        end
    end

endmodule
