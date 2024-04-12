module pixel_acc(
    input clk,
    input rst,
    input run_acc,
    output acc_done,
    input [639:0] doutb,
    output [8:0] addrb,
    output enb,
    output [15:0] p_size,
    output [23:0] p_x,
    output [23:0] p_y,
    output reg tvalid,
    input tready_divisor_x,
    input tready_dividend_x,
    input tready_divisor_y,
    input tready_dividend_y
);
    pixel_acc_sv pixel_acc_s(
        .clk(clk),
        .rst(rst),
        .run_acc(run_acc),
        .acc_done(acc_done),
        .doutb(doutb),
        .addrb(addrb),
        .enb(enb),
        .p_size(p_size),
        .p_x(p_x),
        .p_y(p_y)
    );
    
    reg done;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            done <= 0;
            tvalid <= 0;
        end else begin
            if(!done) begin
                if(acc_done) begin
                    tvalid <= 1;
                    done <= 1;
                end
            end else begin  
                if(tready_divisor_x & tready_dividend_x & tready_divisor_y & tready_dividend_y) begin
                    tvalid <= 0;
                end
                if(!acc_done) begin
                    tvalid <= 0;
                    done <= 0;
                end
            end
        end
    end
    
endmodule