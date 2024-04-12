`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/12 11:35:24
// Design Name: 
// Module Name: Threshold_standalone
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


module Threshold_standalone(
    input                   clk,
    input                   rst_n,
    input   [11:0]          pixel_data,
    input                   pixel_valid,
    input                   frame_done_in,
    //--------------------------------------
    input   [8:0]           threshold_data,
    input   [1:0]           threshold_type,
    input                   threshold_vld,  
    //---------------------------------------   
    output  reg [639:0]     row_data,
    output  reg [8:0]       row_data_addr,
    output  reg             wea,
    output  wire             frame_done_out
    );

    
    localparam FSM_IDLE = 0;
    localparam FSM_WAIT_ROW = 1;
    localparam ROW_PIXEL_NUM = 640;
    localparam MAX_ROW = 480;
    reg frame_done_ff2, frame_done_ff1;
    
    reg [9:0]   row_cnt   = 0;
    reg [1:0]   cur_state = 0; 
    reg [1:0]   nxt_state = 0; 
    
    reg     [8:0]  hsv_hrange_h =  9'd310;
    reg     [8:0]  hsv_hrange_l =  9'd50;
    reg     [8:0]  hsv_srange   =  9'd95;
    reg     [7:0]  hsv_vrange   =  8'd80;
    reg            threshold_vld_r = 0;
    
    reg            temp_pixel_data;
    wire    [7:0]  red_w;
    wire    [7:0]  green_w;
    wire    [7:0]  blue_w;
    wire           hsv_valid;
    wire           frame_done_delay;
    
    wire    [8:0]   hsv_h;
    wire    [8:0]   hsv_s;
    wire    [7:0]   hsv_v;
    assign red_w    = {pixel_data[11:8],4'b0};
    assign green_w  = {pixel_data[7:4],4'b0};
    assign blue_w   = {pixel_data[3:0],4'b0};
    
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hsv_hrange_h <=  9'd310;
            hsv_hrange_l <=  9'd50;  
            hsv_srange   <=  9'd95;  
            hsv_vrange   <=  8'd80;
            threshold_vld_r <= 0;  
        end
        else begin
            frame_done_ff2 <= frame_done_ff1;
            frame_done_ff1 <= frame_done_in;
            threshold_vld_r <= threshold_vld;
            if (threshold_vld_r) begin
                case (threshold_type)
                    2'b00: begin
                        hsv_hrange_h <= threshold_data;
                    end
                    2'b01: begin
                        hsv_hrange_l <= threshold_data;
                    end
                    2'b10: begin
                        hsv_srange <= threshold_data;
                    end
                    2'b11: begin
                        hsv_vrange <= threshold_data[7:0];
                    end                    
                endcase
            end
            else begin
                hsv_hrange_h <= hsv_hrange_h;
                hsv_hrange_l <= hsv_hrange_l;
                hsv_srange <= hsv_srange;
                hsv_vrange <= hsv_vrange;
            end
        end
    end
    
    //---------FSM segment 1-----------
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cur_state   <= FSM_IDLE;
//            row_cnt     <= 0;
        end
        else begin
            cur_state <= nxt_state;
        end
    end
    
    //---------FSM segment 2-----------
    always @(*) begin
        nxt_state = cur_state;
        case (cur_state)
        
            FSM_IDLE: begin
                nxt_state = frame_done_delay ? FSM_IDLE : FSM_WAIT_ROW;
            end
            FSM_WAIT_ROW:begin
                //nxt_state = vsync ? FSM_IDLE : FSM_WAIT_ROW;
                if (frame_done_delay) begin
                    nxt_state = FSM_IDLE;
                end
                /*else if (row_cnt==ROW_NUM) begin
                    nxt_state = FSM_WRITE_ROW;
                end*/
                else begin
                    nxt_state = FSM_WAIT_ROW;
                end
            end
            /*FSM_WRITE_ROW:begin
                nxt_state = vsync ? FSM_IDLE : FSM_WAIT_ROW;
            end*/
//            FSM_FRAME_DONE:begin
//            end
            
        endcase        
    end
    
    //---------FSM segment 3-----------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            row_cnt         <= 0;
//            temp_red        <= 0;
            row_data        <= 0;
            row_data_addr   <= 0;
            wea             <= 0;
        end
        else begin
            case (cur_state)
                FSM_IDLE:begin
                    row_cnt         <= 0;
                    
                    row_data        <= 0;
                    row_data_addr   <= 0;
                    wea             <= 0;
                end
                FSM_WAIT_ROW:begin
                    wea <= (hsv_valid &&(row_cnt==ROW_PIXEL_NUM-1)) ? 1 : 0; 
                    if (wea) begin
                        if (row_data_addr < MAX_ROW-1) begin
                            row_data_addr <= row_data_addr + 1;
                        end
                        else begin
                            row_data_addr <= 0;
                        end
                        
                    end
                    
                    
                    if (hsv_valid) begin
                        if (row_cnt < ROW_PIXEL_NUM-1) begin
                            row_cnt <= row_cnt + 1;                            
                        end
                        else begin
                            row_cnt <= 0;
                        end
                        row_data [row_cnt] <= ((hsv_h>hsv_hrange_h||hsv_h<hsv_hrange_l)&&(hsv_s>hsv_srange)&&(hsv_v)>hsv_vrange)?1:0;
                    end
//                    single_row_data [row_cnt] <=                     
                end
//                FSM_WRITE_ROW:begin
//                end
            endcase
        end
    end
    
    RGB2HSV rgb2hsvmodule (
    .clk(clk),
    .reset_n(rst_n),
    .rgb_r(red_w),
    .rgb_g(green_w),
    .rgb_b(blue_w),
    .hsv_h(hsv_h),
    .hsv_s(hsv_s),
    .hsv_v(hsv_v),
    .pixel_v(pixel_valid),
    .hsv_valid(hsv_valid),
    .de(frame_done_in),
    .hsv_de(frame_done_delay)
    );
    
    assign frame_done_out = frame_done_ff2;
endmodule