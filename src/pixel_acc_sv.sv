module pixel_acc_sv(
    input clk,
    input rst,
    input run_acc,
    output acc_done,
    input [639:0] doutb,
    output [8:0] addrb,
    output reg enb,
    output [15:0] p_size,
    output [24:0] p_x,
    output [23:0] p_y
);
    
    reg  [639:0] row_buf;
    reg  [9:0] x_coord [31:0];
    reg  [8:0] y_coord;
    reg iter_done;
    
    reg mem_ready;
    
    wire [31:0] z_coord = 32'hFFFFFFFF;
    wire [31:0] w_in_sel = row_buf[639:639-31] & {32{mem_ready}};
    wire [2:0] state;
    
    assign state[2] = mem_ready;
    assign state[1] = (x_coord[31] == 'd639);
    assign state[0] = (y_coord == 'd479);
    
    wire [8:0] w_y_coord [31:0];

    genvar j;
    generate
    for(j = 0; j < 32; j = j + 1)
        assign w_y_coord[j] = y_coord;
    endgenerate
    wire w_vector_mac_rst;
    wire [26:0] w_x_acc;
    wire [26:0] w_y_acc;
    wire [18:0] w_z_acc;
    
    wire w_x_ready, w_y_ready, w_z_ready;
    
    assign acc_done = w_x_ready & w_y_ready & w_z_ready & iter_done;
    // State variables
    integer i;
    
    assign z_coord = 8'hFF;
    assign addrb = y_coord + 1;
    assign p_size = w_z_acc[18:3];
    assign p_x = w_x_acc[26:3];
    assign p_y = w_y_acc[26:3];
    assign w_vector_mac_rst = rst || ~run_acc;
    
    always @(posedge clk, posedge rst) begin
        if(rst || !run_acc) begin
            enb <= 0;
            y_coord <= 0;
            for(i = 0; i < 32; i = i + 1) begin
                x_coord[i] <= i;
            end
            mem_ready <= 0;
            row_buf <= 0;
            iter_done <= 0;
        end else begin
            casex(state) 
                3'b0??: begin
                    enb <= 1;
                    if(enb == 1) begin
                        mem_ready <= 1;
                        row_buf <= doutb;
                        enb <= 0;
                    end
                end
                3'b110: begin
                    mem_ready <= 0;
                    y_coord <= y_coord + 1;
                    for(i = 0; i < 32; i = i + 1) begin
                        x_coord[i] <= i;
                    end
                end
                3'b10?: begin
                    for(i = 0; i < 32; i = i + 1) begin
                        x_coord[i] <= x_coord[i] + 32;
                    end
                    row_buf <= row_buf << 32;
                end
                3'b111: begin
                    row_buf <= 0;
                    iter_done <= 1;
                end
            endcase
        end
    end
    
    vector_mac #(.ACC_WIDTH(27), .VEC_WIDTH(10)) x_acc(
        .clk(clk),
        .rst(w_vector_mac_rst),
        .in_data(x_coord),
        .in_sel(w_in_sel),
        .out(w_x_acc),
        .out_ready(w_x_ready)
    );
    
    vector_mac #(.ACC_WIDTH(27), .VEC_WIDTH(9)) y_acc(
        .clk(clk),
        .rst(w_vector_mac_rst),
        .in_data(w_y_coord),
        .in_sel(w_in_sel),
        .out(w_y_acc),
        .out_ready(w_y_ready)
    );    
    
    wire [0:0] w_in_sel_arr [31:0];
    
    generate
        genvar k;
        for(k = 0; k < 32; k++) begin
            assign w_in_sel_arr[0][k] = w_in_sel[k];
        end
    endgenerate
    
    vector_mac #(.ACC_WIDTH(19), .VEC_WIDTH(1)) z_acc(
        .clk(clk),
        .rst(w_vector_mac_rst),
        .in_data(w_in_sel_arr),
        .in_sel(w_in_sel),
        .out(w_z_acc),
        .out_ready(w_z_ready)
    );    

endmodule