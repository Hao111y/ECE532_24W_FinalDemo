`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/13 16:35:38
// Design Name: 
// Module Name: Camera_read
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


module Camera_capture(
	input wire p_clock,
//	input wire [1:0] channel_selection,
	input wire vsync,
	input wire href,
	input wire [7:0] p_data,
	//output reg [15:0] pixel_data =0,//RGB565
	output wire [11:0] pixel_data,
	output reg [18:0] mem_addr=0,
	output reg pixel_valid = 0,
	output reg frame_done =0
    );
	
	reg vsync_ff1;
	
	reg [15:0] temp_data;
	reg [1:0] FSM_state = 0;
    reg pixel_half = 0;
	
	localparam WAIT_FRAME_START = 0;
	localparam ROW_CAPTURE = 1;
	
	
	always@(posedge p_clock)
	begin 
	vsync_ff1 <= vsync;
	
	if(~frame_done) begin
	   frame_done <= vsync_ff1;   
	end else begin
	   frame_done <= ~href;
	end

	case(FSM_state)
	
	WAIT_FRAME_START: begin //wait for VSYNC
	   FSM_state <= vsync ?  WAIT_FRAME_START : ROW_CAPTURE;
	   pixel_half <= 0;
	   mem_addr   <= 0;
	end
	
	ROW_CAPTURE: begin 
	   FSM_state <= vsync ? WAIT_FRAME_START : ROW_CAPTURE;
	   pixel_valid <= (href && pixel_half) ? 1 : 0; 
	   if (pixel_valid) begin
           if(mem_addr<307199) mem_addr<=mem_addr+1;
           else mem_addr<=19'b0;
       end
	   if (href) begin
	       pixel_half <= ~ pixel_half;
	       if (pixel_half) temp_data[7:0] <= p_data;
	       else temp_data[15:8] <= p_data;
	   end
	end
	
	endcase
	end
//	assign pixel_data = {temp_data[15:12],temp_data[11:8],temp_data[7:4]}; //use for RG B444
	assign pixel_data = {temp_data[11:8],temp_data[7:4],temp_data[3:0]}; //use for RG B444
/*
    if (channel_selection==2'b11) begin
        assign pixel_data = {temp_data[15:12],temp_data[11:8],temp_data[7:4]}; //use for EGB444
   end
   else begin
        assign pixel_data = {temp_data[15:12],temp_data[10:7],temp_data[4:1]};  //use for EGB565
   end
*/
    
endmodule
