`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 15:27:47
// Design Name: 
// Module Name: vector_mac
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

module vector_mac #(
        ACC_WIDTH = 27,
        VEC_WIDTH = 10
    )
    (
        input clk,
        input rst,
        input [VEC_WIDTH-1:0] in_data [31:0],
        input [31:0] in_sel,
        output reg [ACC_WIDTH-1:0] out,
        output out_ready
    );
    integer i;
    reg [VEC_WIDTH:0] stage1 [15:0];
    reg [VEC_WIDTH+1:0] stage2 [7:0];
    reg [VEC_WIDTH+2:0] stage3 [3:0];
    reg [VEC_WIDTH+3:0] stage4 [1:0];
    reg [VEC_WIDTH+4:0] stage5;
    
    reg [2:0] cycles_since_no_sel;
    assign out_ready = cycles_since_no_sel >= 5;
    
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            for(i = 0; i < 16; i = i + 1) begin
                stage1[i] <= 0;
            end
            
            for(i = 0; i < 8; i = i + 1) begin
                stage2[i] <= 0;
            end
            
            for(i = 0; i < 4; i = i + 1) begin
                stage3[i] <= 0;
            end
         
            for(i = 0; i < 2; i = i + 1) begin
                stage4[i] <= 0;
            end
            
            stage5 <= 0;
            cycles_since_no_sel <= 5;
            out <= 0;
        end else begin
            if(in_sel == 0) begin
                if(cycles_since_no_sel < 5) begin
                    cycles_since_no_sel <= cycles_since_no_sel + 1;
                end 
            end else begin
                cycles_since_no_sel <= 0;
            end
            
            for(i = 0; i < 16; i = i + 1) begin
                stage1[i] <= in_data[2*i] * in_sel[2*i] + in_data[2*i+1] * in_sel[2*i + 1];
            end
            
            for(i = 0; i < 8; i = i + 1) begin
                stage2[i] <= stage1[2*i] + stage1[2*i+1];
            end
            
            for(i = 0; i < 4; i = i + 1) begin
                stage3[i] <= stage2[2*i] + stage2[2*i+1];
            end
            
            for(i = 0; i < 2; i = i + 1) begin
                stage4[i] <= stage3[2*i] + stage3[2*i+1];
            end
            
            stage5 <= stage4[0] + stage4[1];
            out <= out + stage5;
        end
    end
endmodule
