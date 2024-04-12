`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 16:38:43
// Design Name: 
// Module Name: divider_output
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


module divider_output(
        input clk,
        input rst,
        input [31:0] xdiv,
        (* mark_debug = "true" *) input xdiv_valid,
        input [31:0] ydiv,
        (* mark_debug = "true" *) input ydiv_valid,
        input acc_done,
        (* mark_debug = "true" *) output reg signed [23:0] xout,
        (* mark_debug = "true" *) output reg [23:0] yout,
        (* mark_debug = "true" *) output reg valid
    );
    
    reg [2:0] state;
    localparam START = 0;
    localparam WAITDIV = 1;
    localparam WAITINV = 2;
    
    (* mark_debug = "true" *) wire [8:0] x_debug;
    (* mark_debug = "true" *) wire [7:0] y_debug;
    
    assign x_debug = xdiv[11:2];
    assign y_debug = ydiv[10:2];
    
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            state <= 0;
            valid <= 0;
        end else begin
            case(state) 
                START: begin
                    if(acc_done) begin
                        state <= WAITDIV;
                    end
                end
                WAITDIV: begin
                    if(xdiv_valid & ydiv_valid) begin
                        state <= WAITINV;
                        valid <= 1;
                    end
                end
                WAITINV: begin
                    if(!acc_done) begin
                        state <= START;
                        valid <= 0;
                    end
                end
            endcase
        end
    end
    
    
    always @(posedge clk) begin
        if(rst) begin
            xout <= 0;
            yout <= 0;
        end else begin
            xout <= ((xdiv[11:2] << 1) - 640) << 8;
            yout <= (ydiv[10:3] + 700) << 8;
        end
    end
endmodule
