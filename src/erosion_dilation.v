module erosion_dilation (
    input clk,
    input rst,
    input run_ed,
    output reg [639:0] data_out,
    input [639:0] douta,
    output reg [8:0] addra,
    output reg ena,
    output reg wea,
    output reg finish_ed
);
    reg run_ed_f1, run_ed_f2;
    
    /* FSM */
    localparam RESET = 0;
    localparam LD_START = 1;
    localparam DO_CONV = 2;
    localparam FINISH_CONV = 3;
    localparam ST_ROW = 4;
    localparam SHIFT_D = 5;
    localparam LD_ROW = 6;
    localparam DONE = 7;
    
    reg [2:0] state;
    
    reg erode_done;
    reg [2:0] num_conv;
    reg [8:0] read_head;
    reg [8:0] write_head;
    reg [1:0] ready;
    reg [1:0] start;
    
    reg [639:0] data_shift [2:0];
    
    reg [1:0] rst_counter;
    
    integer i, j;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            run_ed_f1 <= 0;
            run_ed_f2 <= 0;
        end begin
            run_ed_f1 <= run_ed;
            run_ed_f2 <= run_ed_f1;
        end
    end
    
    always @(posedge clk, posedge rst) begin
        if(rst || !run_ed_f2) begin
            state <= RESET;
            finish_ed <= 0;
            erode_done <= 0;
            num_conv <= 0;
            read_head <= 0;
            write_head <= 1;
            ready <= 0;
            start <= 0;
            addra <= 0;
            wea <= 0;
            ena <= 0;
            rst_counter <= 0; 
            for(j = 0; j < 3; j = j + 1) begin
                data_shift[j] <= 0;
            end
        end else begin
            case (state) 
                RESET: begin
                    if(run_ed_f2) begin
                        if(rst_counter == 3) begin
                            state <= LD_ROW;
                            wea <= 0;
                            addra <= 0;
                        end else begin
                            if(~rst_counter[1]) begin
                                wea <= 1;
                                addra <= 0;
                            end else begin
                                wea <= 1;
                                addra <= 639;
                            end
                            rst_counter <= rst_counter + 1;
                        end
                    end
                end
                LD_START: begin
                    state <= LD_ROW;
                end
                DO_CONV: begin
                    state <= ST_ROW;
                end
                ST_ROW: begin
                    if(ready == 2) begin
                        ready <= 0;
                        ena <= 0;
                        wea <= 0;
                        if(write_head == 478) begin
                            state <= FINISH_CONV;
                        end else begin
                            write_head <= write_head + 1;
                            state <= SHIFT_D;
                        end
                    end
                end
                FINISH_CONV: begin
                    start <= 0;
                    read_head <= 0;
                    write_head <= 1;
                    if(num_conv == 5) begin
                        if(!erode_done) begin
                            erode_done <= 1;
                            num_conv <= 0;
                            state <= LD_START;
                        end else begin
                            state <= DONE;
                        end
                    end else begin
                        num_conv <= num_conv + 1;
                        state <= LD_START;
                    end
                end
                SHIFT_D: begin
                    state <= LD_ROW;
                end
                LD_ROW: begin
                    if(ready == 2) begin
                        ena <= 0;
                        ready <= 0;
                        read_head <= read_head + 1;
                        if(start == 2) begin
                            state <= DO_CONV;
                        end else begin
                            start <= start + 1;
                            state <= LD_START;
                        end
                    end
                end
            endcase
                /* Data path */    
            case(state)
                SHIFT_D, LD_START: begin
                    ready <= 0;
                    wea <= 0;
                    ena <= 0;
                    data_shift[0] <= data_shift[1];
                    data_shift[1] <= data_shift[2];
                end
                LD_ROW: begin
                    addra <= read_head;
                    ready <= ready + 1;
                    ena <= 1;
                    if(ready == 2) begin
                        data_shift[2] <= douta;
                    end
                end
                ST_ROW: begin
                    addra <= write_head;
                    ready <= ready + 1;
                    ena <= 1;
                    wea <= 1;
                end
                FINISH_CONV: begin
                    ready <= 0;
                    wea <= 0;
                    ena <= 0;
                    write_head <= 1;
                    read_head <= 0;
                end
                DONE: begin
                    finish_ed <= 1;
                end
            endcase
        end
    end
    
    always @(*) begin
        data_out[0] = 0;
        data_out[639] = 0;
        for(i = 1; i < 639; i = i + 1) begin
            if(!erode_done) begin
                data_out[i] = data_shift[0][i - 1] &
                               data_shift[0][i] &
                               data_shift[0][i + 1] &
                               data_shift[1][i - 1] &
                               data_shift[1][i] &
                               data_shift[1][i + 1] &
                               data_shift[2][i - 1] &
                               data_shift[2][i] &
                               data_shift[2][i + 1];
            end else begin
                data_out[i] = data_shift[0][i - 1] |
                               data_shift[0][i] |
                               data_shift[0][i + 1] |
                               data_shift[1][i - 1] |
                               data_shift[1][i] |
                               data_shift[1][i + 1] |
                               data_shift[2][i - 1] |
                               data_shift[2][i] |
                               data_shift[2][i + 1];
            end
        end
    end 
    
endmodule 