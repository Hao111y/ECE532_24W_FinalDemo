`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/27 00:22:23
// Design Name: 
// Module Name: update_threshold_tb
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

module update_threshold_tb(

    );
reg fast_clk;
reg clk;
reg rst_n;
reg href;
reg vsync;
reg [7:0] pixel_data;
reg [8:0] threshold_data;
reg [1:0] threshold_type;
reg       threshold_vld;


always #4 clk = ~clk;    
always #1 fast_clk = ~fast_clk;


initial begin
threshold_data=0;
threshold_type=0;
threshold_vld=0;
fast_clk=0;
clk=0;
rst_n=0;
href=0;
vsync=0;
pixel_data=8'hff;
#100
rst_n=1;

#100;    
threshold_data = 9'd220;
threshold_type = 2'b00;
threshold_vld  = 1;
#20;
threshold_vld  = 0;
#100;    
threshold_data = 9'd50;
threshold_type = 2'b01;
threshold_vld  = 1;
#20;
threshold_vld  = 0;
#100;    
threshold_data = 9'd80;
threshold_type = 2'b10;
threshold_vld  = 1;
#20;
threshold_vld  = 0;
#100;    
threshold_data = 9'd75;
threshold_type = 2'b11;
threshold_vld  = 1;
#20;
threshold_vld  = 0;
//#100
//vsync = 1;
//#10

vsync = 0;
    repeat (30) begin
        #100 
        vsync = 1;
        #8
        vsync = 0;
        repeat (480) begin
            href = 0;
            #8 
            href = 1;                    
            repeat (1280)
                 begin 
                    #8//#100
                    pixel_data = pixel_data + 30;
                    href = 1;
                     //write 1 data
        //            href = 0;
                 end
                 
        end
    end




    repeat (30) begin
        #100 
        vsync = 1;
        #8
        vsync = 0;
        repeat (480) begin
            href = 0;
            #8 
            href = 1;                    
            repeat (1280)
                 begin 
                    #8//#100
                    pixel_data = pixel_data + 30;
                    href = 1;
                     //write 1 data
        //            href = 0;
                 end
                 
        end
    end
end


wire    [11:0]  pixel_data_rgb;
wire            pixel_valid_internal;
wire            frame_done_internal; 

Camera_capture camera_front(
.p_clock(clk),
.vsync(vsync),
.href(href),
.p_data(pixel_data),
.pixel_data(pixel_data_rgb),
.pixel_valid(pixel_valid_internal),
.frame_done(frame_done_internal)
);

Threshold_standalone threshold_after_camera(
.clk(clk),
.rst_n(rst_n),
.pixel_data(pixel_data_rgb),
.pixel_valid(pixel_valid_internal),
.frame_done_in(frame_done_internal),
.threshold_data(threshold_data),
.threshold_type(threshold_type),
.threshold_vld(threshold_vld)
);

    
    
endmodule

