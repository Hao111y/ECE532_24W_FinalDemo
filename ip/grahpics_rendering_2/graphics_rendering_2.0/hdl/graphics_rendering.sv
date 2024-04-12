`timescale 1 ns / 1 ps

module graphics_rendering #
(
    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH	= 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH	= 8,


    // Base address of targeted slave
    parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
    // Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
    parameter integer C_M_AXI_BURST_LEN	= 64,
    // Thread ID Width
    parameter integer C_M_AXI_ID_WIDTH	= 1,
    // Width of Address Bus
    parameter integer C_M_AXI_ADDR_WIDTH	= 32,
    // Width of Data Bus
    parameter integer C_M_AXI_DATA_WIDTH	= 32,
    // Width of User Write Address Bus
    parameter integer C_M_AXI_AWUSER_WIDTH	= 0,
    // Width of User Read Address Bus
    parameter integer C_M_AXI_ARUSER_WIDTH	= 0,
    // Width of User Write Data Bus
    parameter integer C_M_AXI_WUSER_WIDTH	= 0,
    // Width of User Read Data Bus
    parameter integer C_M_AXI_RUSER_WIDTH	= 0,
    // Width of User Response Bus
    parameter integer C_M_AXI_BUSER_WIDTH	= 0
)
(
    input wire start_frame,
    input wire cur_frame,
    output wire busy,
    
    input wire [15:0]   bram0_dinb,
    input wire [15:0]   bram1_dinb,
    input wire [15:0]   bram2_dinb,
    input wire [15:0]   bram3_dinb,
    input wire [15:0]   bram4_dinb,
    output reg [13:0]   bram_addrb,
    output wire         bram0_enb,
    output wire         bram1_enb,
    output wire         bram2_enb,
    output wire         bram3_enb,
    output wire         bram4_enb,
		
	output wire [3:0] debug_state,
    output wire [5:0] debug_burst_count,

    // AXI Full Master Interface  
    input wire  M_AXI_ACLK,
    input wire  M_AXI_ARESETN,
    
    output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_AWID,
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
    output wire [7 : 0] M_AXI_AWLEN,
    output wire [2 : 0] M_AXI_AWSIZE,
    output wire [1 : 0] M_AXI_AWBURST,
    output wire  M_AXI_AWLOCK,
    output wire [3 : 0] M_AXI_AWCACHE,
    output wire [2 : 0] M_AXI_AWPROT,
    output wire [3 : 0] M_AXI_AWQOS,
    output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] M_AXI_AWUSER,
    output wire  M_AXI_AWVALID,
    input wire  M_AXI_AWREADY,

    output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
    output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
    output wire  M_AXI_WLAST,
    output wire [C_M_AXI_WUSER_WIDTH-1 : 0] M_AXI_WUSER,
    output wire  M_AXI_WVALID,
    input wire  M_AXI_WREADY,
    
    input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_BID,
    input wire [1 : 0] M_AXI_BRESP,
    input wire [C_M_AXI_BUSER_WIDTH-1 : 0] M_AXI_BUSER,
    input wire  M_AXI_BVALID,
    output wire  M_AXI_BREADY,
    
    output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_ARID,
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
    output wire [7 : 0] M_AXI_ARLEN,
    output wire [2 : 0] M_AXI_ARSIZE,
    output wire [1 : 0] M_AXI_ARBURST,
    output wire  M_AXI_ARLOCK,
    output wire [3 : 0] M_AXI_ARCACHE,
    output wire [2 : 0] M_AXI_ARPROT,
    output wire [3 : 0] M_AXI_ARQOS,
    output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] M_AXI_ARUSER,
    output wire  M_AXI_ARVALID,
    input wire  M_AXI_ARREADY,
    
    input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_RID,
    input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
    input wire [1 : 0] M_AXI_RRESP,
    input wire  M_AXI_RLAST,
    input wire [C_M_AXI_RUSER_WIDTH-1 : 0] M_AXI_RUSER,
    input wire  M_AXI_RVALID,
    output wire  M_AXI_RREADY,

    // AXI Lite Slave Interface  
    input wire  S_AXI_ACLK,
    input wire  S_AXI_ARESETN,
    
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    input wire [2 : 0] S_AXI_AWPROT, 
    input wire  S_AXI_AWVALID,
    output wire  S_AXI_AWREADY,
    
    input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    input wire  S_AXI_WVALID,
    output wire  S_AXI_WREADY,
    
    output wire [1 : 0] S_AXI_BRESP,
    output wire  S_AXI_BVALID,
    input wire  S_AXI_BREADY,
    
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
    input wire [2 : 0] S_AXI_ARPROT,
    input wire  S_AXI_ARVALID, 
    output wire  S_AXI_ARREADY,
    
    output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,  
    output wire [1 : 0] S_AXI_RRESP,
    output wire  S_AXI_RVALID,
    input wire  S_AXI_RREADY
);

// AXI Full
reg [31:0]  ddr_awaddr;
wire        ddr_awready;
reg         ddr_awvalid;

reg         ddr_bready;
reg  [1:0]  ddr_bresp;
wire        ddr_bvalid;

reg [31:0]  ddr_wdata;
wire        ddr_wready;
reg         ddr_wvalid;

reg [3:0]   ddr_wdstrb;
reg         ddr_wlast;
wire aresetn;

assign M_AXI_AWID	    = 'b0;
assign M_AXI_AWADDR	    = C_M_TARGET_SLAVE_BASE_ADDR + ddr_awaddr;
assign M_AXI_AWLEN	    = 8'd64;
assign M_AXI_AWSIZE	    = 3'b010;
assign M_AXI_AWBURST	= 2'b01;
assign M_AXI_AWLOCK	    = 1'b0;
assign M_AXI_AWCACHE	= 4'b0010;
assign M_AXI_AWPROT	    = 3'h0;
assign M_AXI_AWQOS	    = 4'h0;
assign M_AXI_AWUSER	    = 'b1;
assign M_AXI_AWVALID	= ddr_awvalid;

assign M_AXI_WDATA	= ddr_wdata;
assign M_AXI_WSTRB	= ddr_wdstrb;
assign M_AXI_WLAST	= ddr_wlast;
assign M_AXI_WVALID	= ddr_wvalid;
assign M_AXI_WUSER	= 'b0;

assign M_AXI_BREADY	= ddr_bready;

assign M_AXI_ARID	= 'b0;
assign M_AXI_ARADDR	= 0;
assign M_AXI_ARLEN	= 0;
assign M_AXI_ARSIZE	= 0;
assign M_AXI_ARBURST	= 2'b01;
assign M_AXI_ARLOCK	= 1'b0;
assign M_AXI_ARCACHE	= 4'b0010;
assign M_AXI_ARPROT	= 3'h0;
assign M_AXI_ARQOS	= 4'h0;
assign M_AXI_ARUSER	= 'b1;
assign M_AXI_ARVALID	= 1'b0;

assign M_AXI_RREADY	= 1'b0;

assign aresetn = M_AXI_ARESETN;
assign ddr_awready = M_AXI_AWREADY;
assign ddr_bvalid = M_AXI_BVALID;
assign ddr_wready = M_AXI_WREADY;

// AXI Lite
reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
reg  	axi_awready;
reg  	axi_wready;
reg [1 : 0] 	axi_bresp;
reg  	axi_bvalid;
reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
reg  	axi_arready;
reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
reg [1 : 0] 	axi_rresp;
reg  	axi_rvalid;

assign S_AXI_AWREADY	= axi_awready;
assign S_AXI_WREADY	= axi_wready;
assign S_AXI_BRESP	= axi_bresp;
assign S_AXI_BVALID	= axi_bvalid;
assign S_AXI_ARREADY	= axi_arready;
assign S_AXI_RDATA	= axi_rdata;
assign S_AXI_RRESP	= axi_rresp;
assign S_AXI_RVALID	= axi_rvalid;


//////////////////////////////////////////////////////////////////////////////
////////  Reading Sprite Data from BRAMs and Writing into DRAM ///////////////
//////////////////////////////////////////////////////////////////////////////
// Resizing and Masking are all taken care by the following Statemachine.

// Each WORD is 2 Bytes (Only [11:0] have the valid Pixel
// and bit12 is Mask bit).
localparam CLEAR_VALUE = 32'h00070007;
localparam SPRITE_CNT    = 5;
localparam SPRITE_PIXELS_TABLE = 128;
localparam SPRITE_PIXELS = 64;

localparam ALPHA_PADDLE1 = 26;
localparam BETA_PADDLE1 = 13;

localparam ALPHA_PADDLE2 = 26;
localparam BETA_PADDLE2 = 13;

localparam ALPHA_BALL = 24;
localparam BETA_BALL = 11;

localparam ALPHA_NET = 4;
localparam BETA_NET = 13;

localparam ALPHA_TABLE = 4;
localparam BETA_TABLE = 13;

// 0 - Table, 1 - Net, 2 - Paddle1, 3 - Paddle2, 4 - Ball
localparam [19:0]   Z_value_4 = {1'b1, 3'd2, 16'd272}; // Paddle1
localparam [19:0]   Z_value_3 = {1'b1, 3'd4, 16'd442}; // Ball
localparam [19:0]   Z_value_2 = {1'b1, 3'd0, 16'd450}; // Table
localparam [19:0]   Z_value_1 = {1'b1, 3'd1, 16'd450}; // Net
localparam [19:0]   Z_value_0 = {1'b1, 3'd3, 16'd500}; // Paddle2

localparam signed [15:0]   X_value_4 = 16'd142;
localparam signed [15:0]   X_value_3 = 16'd157;
localparam signed [15:0]   X_value_2 = 16'd11;
localparam signed [15:0]   X_value_1 = 16'd11;
localparam signed [15:0]   X_value_0 = 16'd142;

localparam signed [15:0]   Y_value_4 = 16'd129;
localparam signed [15:0]   Y_value_3 = 16'd113;
localparam signed [15:0]   Y_value_2 = 16'd98;
localparam signed [15:0]   Y_value_1 = 16'd98;
localparam signed [15:0]   Y_value_0 = 16'd129;

localparam signed [15:0]   pixel_count_4 = 16'd36;
localparam signed [15:0]   pixel_count_3 = 16'd6;
localparam signed [15:0]   pixel_count_2 = 16'd97;
localparam signed [15:0]   pixel_count_1 = 16'd97;
localparam signed [15:0]   pixel_count_0 = 16'd20;

// DDR
wire [31:0] ddr_addr_gen;
wire [19:0] Address_bound;

// Other
reg [5:0] burst_count;
assign debug_burst_count = burst_count;
 
reg [2:0] sprite_input_idx;
reg [2:0] sprite_output_idx; // 0: Table, 1: Net, 2: Paddle1, 3: Paddle2, 4: Ball
reg [15:0] Z_value;
reg [8:0] X_value;
reg [7:0] Y_value;
reg [8:0] pixel_count_x;
reg [8:0] pixel_count_y;
reg [8:0] ddr_i;
reg [8:0] ddr_j;
reg [23:0]  I_index;
reg [23:0]  J_index;

reg bram_enb[4:0];
assign bram0_enb = bram_enb[0];
assign bram1_enb = bram_enb[1];
assign bram2_enb = bram_enb[2];
assign bram3_enb = bram_enb[3];
assign bram4_enb = bram_enb[4];

wire [15:0] bram_dinb;
assign bram_dinb =  (sprite_output_idx == 4) ? bram4_dinb : (sprite_output_idx == 3) ? bram3_dinb : (sprite_output_idx == 2) ? bram2_dinb :
                    (sprite_output_idx == 1) ? bram1_dinb: (sprite_output_idx == 0) ? bram0_dinb : 16'b0;

// Change this so that each new line is 640 pixels down
assign ddr_addr_gen = cur_frame ? Y_value*2048 + X_value*4 + ddr_i*2048 + ddr_j*4: 2048*240 + Y_value*2048 + X_value*4 + ddr_i*2048 + ddr_j*4;
assign Address_bound = cur_frame ? 2048*240 - 1: 2*2048*240 - 1;
// assign ddr_addr_gen = Y_value*2048 + X_value*4 + ddr_i*2048 + ddr_j*4;
// assign Address_bound = 2048*240 - 1;


// AXI4-Lite registers. Microblaze can read and write to these registers
reg [19:0] Z_value_array[4:0];
reg [8:0] X_value_array[4:0];
reg [7:0] Y_value_array[4:0];
reg [8:0] pixel_count_array[4:0];


// States
reg [3:0] state;
assign debug_state = state;

localparam [3:0]IDLE            = 4'd0,
                CLEAR_ADDR_CHECK     = 4'd1,
                CLEAR_BURST_INIT    = 4'd2,
                CLEAR               = 4'd3,
                DECODE          = 4'd4,
                
                ADDRESS_CHECK   = 4'd5,
                BRAM_ADDR_INIT1  = 4'd6,
                BRAM_ADDR_INIT2  = 4'd7,
                BRAM_ADDR_INIT3  = 4'd8,
                DDR_BURST_INIT  = 4'd9,
                BRAM_ADDR_EN1    = 4'd10,
                BRAM_ADDR_EN2    = 4'd11,
                BRAM_ADDR_EN3    = 4'd12,
                DDR_SEND_DATA   = 4'd13;
               
always @(posedge M_AXI_ACLK) begin
    if (~aresetn) begin
        bram_addrb          <= 14'd0;
        for(int i = 0; i < SPRITE_CNT; i=i+1)begin
            bram_enb[i]     <= 1'b0;
        end
        burst_count         <= 6'd0;

        ddr_awaddr          <= 32'd0;
        ddr_awvalid         <= 1'b0;
        ddr_wdata           <= 32'h0;
        ddr_wvalid          <= 1'b0;
        
        sprite_input_idx    <= 3'b0;
        sprite_output_idx   <= 3'b0;
        Z_value             <= 16'b0;
        X_value             <= 8'b0;
        Y_value             <= 7'b0;
        pixel_count_x       <= 8'b0;
        pixel_count_y       <= 8'b0;
        ddr_i               <= 8'b0;
        ddr_j               <= 8'b0;
        ddr_wdstrb          <= 4'b1111;
        ddr_wlast           <= 1'b0;

        I_index            <= 24'b0;
        J_index            <= 24'b0;
        
        state               <= IDLE;
        // state               <= CLEAR_ADDR_CHECK;
        // state               <= DECODE;
    end else begin
        case (state)
           IDLE : begin
                X_value     <= 0;
                Y_value     <= 0;
                Z_value     <= 0;
                ddr_i       <= 0;
                ddr_j       <= 0;
                ddr_wdstrb  <= 4'b1111;
                burst_count <= 6'd0;

                sprite_input_idx <= 3'b0;
                sprite_output_idx <= 3'b0;
                for (int i=0; i < SPRITE_CNT; i=i+1) begin
                    bram_enb[i]     <= 1'b0;
                end
                
                if (start_frame ) begin 
                    state               <= CLEAR_ADDR_CHECK;
                    // state               <= DECODE;
                end else begin
                    state   <= IDLE;
                end
            end

            CLEAR_ADDR_CHECK: begin
                if(ddr_addr_gen >= Address_bound) begin
                    state       <= DECODE;
                end
                else begin
                    state       <= CLEAR_BURST_INIT;
                end
                
                if(ddr_j >= 320) begin
                    ddr_j       <= 0;
                    ddr_i       <= ddr_i + 1;
                end
            end

            CLEAR_BURST_INIT: begin
                if(ddr_awvalid == 1'b0 && ddr_wvalid == 1'b0) begin
                    ddr_awaddr      <= ddr_addr_gen;
                    ddr_awvalid     <= 1'b1;
                    ddr_wvalid      <= 1'b1;
                    ddr_wdata       <= CLEAR_VALUE;
                    ddr_wlast       <= 1'b0;
                end else begin
                    if (ddr_awvalid == 1'b1 && ddr_awready == 1'b1) begin
                        ddr_awvalid     <= 1'b0;
                        burst_count     <= 6'd0;
                        state           <= CLEAR;
                    end
                end
            end

            CLEAR : begin
                if(ddr_wvalid == 1'b1 && ddr_wready == 1'b1) begin
                    ddr_j           <= ddr_j + 1;
                    burst_count     <= burst_count + 1;
                    if(burst_count == 'd62) begin
                        ddr_wlast  <= 1'b1;
                    end
                    else if(burst_count == 'd63) begin
                        state           <= CLEAR_ADDR_CHECK;
                        ddr_wlast   <= 1'b0;
                        ddr_wvalid  <= 1'b0;
                    end
                end
            end
            
            DECODE: begin
                if(Z_value_array[sprite_input_idx][19] && (sprite_input_idx < 5)) begin
                    sprite_output_idx = Z_value_array[sprite_input_idx][18:16];
                    Z_value     <= Z_value_array[sprite_input_idx][15:0];
                    X_value     <= X_value_array[sprite_input_idx];
                    Y_value     <= Y_value_array[sprite_input_idx];
                    pixel_count_y <= pixel_count_array[sprite_input_idx];
                    pixel_count_x <= Z_value_array[sprite_input_idx][18:17] == 2'b0 ? pixel_count_array[sprite_input_idx] * 3 : pixel_count_array[sprite_input_idx];

                    bram_enb[0] <= 1'b0;
                    bram_enb[1] <= 1'b0;
                    bram_enb[2] <= 1'b0;
                    bram_enb[3] <= 1'b0;
                    bram_enb[4] <= 1'b0;
                    
                    ddr_i       <= 0;
                    ddr_j       <= 0;
                    
                    state <= ADDRESS_CHECK;
                end
                else if(sprite_input_idx == 5) begin
                    state       <= IDLE;
                end
                else begin
                    state       <= DECODE;
                end
                
                sprite_input_idx <= sprite_input_idx + 1;
            end
            ADDRESS_CHECK: begin
                if(ddr_i >= (pixel_count_y-1)) begin
                    state       <= DECODE;
                end
                else if((ddr_i == (pixel_count_y-1)) && (ddr_j >= pixel_count_x)) begin
                    state       <= DECODE;
                end
                else begin
                    state      <= BRAM_ADDR_INIT1;
                end

                if(ddr_j >= pixel_count_x) begin
                    ddr_j       <= 0;
                    ddr_i       <= ddr_i + 1;
                end
            end
            // If three cycle delay is too long for drawing the table, replace z_value*alpha with a constant and jump to BRAM_ADDR_INIT3
            BRAM_ADDR_INIT1: begin
                I_index <= ((ddr_i << 1) + 1) * Z_value;
                J_index <= ((ddr_j << 1) + 1) * Z_value;
                state <= BRAM_ADDR_INIT2;
            end
            BRAM_ADDR_INIT2: begin
                case(sprite_output_idx)
                    3'd0: begin
                        I_index <= (I_index * ALPHA_TABLE) >> (BETA_TABLE) ;
                        J_index <= (J_index * ALPHA_TABLE) >> (BETA_TABLE);
                    end
                    3'd1: begin
                        I_index <= (I_index  * ALPHA_NET) >> (BETA_NET);
                        J_index <= (J_index * ALPHA_NET) >> (BETA_NET);
                    end
                    3'd2: begin
                        I_index <= (I_index  * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                        J_index <= (J_index * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                    end
                    3'd3: begin
                        I_index <= (I_index  * ALPHA_PADDLE2) >> (BETA_PADDLE2);
                        J_index <= (J_index * ALPHA_PADDLE2) >> (BETA_PADDLE2);
                    end
                    3'd4: begin
                        I_index <= (I_index  * ALPHA_BALL) >> (BETA_BALL);
                        J_index <= (J_index * ALPHA_BALL) >> (BETA_BALL);
                    end
                    default: begin
                        I_index <= (I_index  * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                        J_index <= (J_index * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                    end
                endcase
                state <= BRAM_ADDR_INIT3;
            end
            // TODO: Change BRAM size to 64 or 128 (Most Likely 64)
            BRAM_ADDR_INIT3: begin
                bram_addrb                          <= (sprite_output_idx[2:1] == 2'b0) ? I_index * SPRITE_PIXELS_TABLE + J_index : I_index * SPRITE_PIXELS + J_index; // If table or net, 128, else 64
                bram_enb[sprite_output_idx]         <= 1'b1;
                state                               <= DDR_BURST_INIT;
            end
            DDR_BURST_INIT: begin
                if(ddr_awvalid == 1'b0 && ddr_wvalid == 1'b0) begin
                    ddr_awaddr      <= ddr_addr_gen;
                    ddr_awvalid     <= 1'b1;
                    ddr_wdata       <= {4'd0, bram_dinb[11:0],4'd0,bram_dinb[11:0]};
                    ddr_wvalid      <= 1'b1;
                    ddr_wlast       <= 1'b0;
                    ddr_wdstrb          <= (bram_dinb[12] || (ddr_j >= pixel_count_x)) ? 4'b0000 : 4'b1111;
                    bram_enb[sprite_output_idx]     <= 1'b0;
                end else begin
                   if (ddr_awvalid == 1'b1 && ddr_awready == 1'b1) begin
                      ddr_awvalid     <= 1'b0;
                   end
                   if (ddr_wvalid == 1'b1 && ddr_wready == 1'b1) begin
                      ddr_wvalid      <= 1'b0;
                      ddr_j           <= ddr_j + 1;
                      burst_count     <= 6'd1;  // For next 
                      state           <= BRAM_ADDR_EN1;
                   end
                end
            end
            BRAM_ADDR_EN1: begin
                case(sprite_output_idx)
                    3'd0: begin
                        I_index <= ((ddr_i << 1) + 1) * Z_value;
                        J_index <= ((ddr_j << 1) + 1) * Z_value;
                    end
                    3'd1: begin
                        I_index <= ((ddr_i << 1) + 1) * Z_value;
                        J_index <= ((ddr_j << 1) + 1) * Z_value;
                    end
                    3'd2: begin
                        I_index <= ((ddr_i << 1) + 1) * Z_value;
                        J_index <= ((ddr_j << 1) + 1) * Z_value;
                    end
                    3'd3: begin
                        I_index <= ((ddr_i << 1) + 1) * Z_value;
                        J_index <= ((ddr_j << 1) + 1) * Z_value;
                    end
                    3'd4: begin
                        I_index <= ((ddr_i << 1) + 1) * Z_value;
                        J_index <= ((ddr_j << 1) + 1) * Z_value;
                    end
                    default: begin
                        I_index <= ((ddr_i << 1) + 1) * Z_value;
                        J_index <= ((ddr_j << 1) + 1) * Z_value;
                    end
                endcase
                state <= BRAM_ADDR_EN2;
            end
            BRAM_ADDR_EN2: begin
                case(sprite_output_idx)
                    3'd0: begin
                        I_index <= (I_index * ALPHA_TABLE) >> (BETA_TABLE) ;
                        J_index <= (J_index * ALPHA_TABLE) >> (BETA_TABLE);
                    end
                    3'd1: begin
                        I_index <= (I_index  * ALPHA_NET) >> (BETA_NET);
                        J_index <= (J_index * ALPHA_NET) >> (BETA_NET);
                    end
                    3'd2: begin
                        I_index <= (I_index  * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                        J_index <= (J_index * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                    end
                    3'd3: begin
                        I_index <= (I_index  * ALPHA_PADDLE2) >> (BETA_PADDLE2);
                        J_index <= (J_index * ALPHA_PADDLE2) >> (BETA_PADDLE2);
                    end
                    3'd4: begin
                        I_index <= (I_index  * ALPHA_BALL) >> (BETA_BALL);
                        J_index <= (J_index * ALPHA_BALL) >> (BETA_BALL);
                    end
                    default: begin
                        I_index <= (I_index  * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                        J_index <= (J_index * ALPHA_PADDLE1) >> (BETA_PADDLE1);
                    end
                endcase
                state <= BRAM_ADDR_EN3;
            end
            BRAM_ADDR_EN3: begin
                if(ddr_j < pixel_count_x) begin
                    bram_addrb                      <= (sprite_output_idx[2:1] == 2'b0) ? I_index * SPRITE_PIXELS_TABLE + J_index : I_index * SPRITE_PIXELS + J_index; // If table or net, 128, else 64
                    bram_enb[sprite_output_idx]     <= 1'b1;
                    state                           <= DDR_SEND_DATA;
                end
                else begin
                    state                           <= DDR_SEND_DATA;
                end
            end
            DDR_SEND_DATA: begin
                if(ddr_wvalid == 1'b0 && burst_count == 'd63) begin  // Odd Burst Count
                    ddr_wdata       <= {4'd0, bram_dinb[11:0],4'd0,bram_dinb[11:0]};
                    ddr_wvalid          <= 1'b1;
                    ddr_wlast           <= 1'b1;
                    ddr_wdstrb          <= (bram_dinb[12] || (ddr_j >= pixel_count_x)) ? 4'b0000 : 4'b1111;
                end
                else if(ddr_wvalid == 1'b0) begin
                    ddr_wvalid      <= 1'b1;
                    ddr_wlast       <= 1'b0;
                    ddr_wdata       <= {4'd0, bram_dinb[11:0],4'd0,bram_dinb[11:0]};
                    ddr_wdstrb          <= (bram_dinb[12] || (ddr_j >= pixel_count_x)) ? 4'b0000 : 4'b1111;
                end
                else if(ddr_wvalid == 1'b1 && ddr_wready == 1'b1) begin
                    ddr_wvalid <= 1'b0;
                    ddr_j       <= ddr_j + 1;
                    if(burst_count == 'd63) begin
                        state       <= ADDRESS_CHECK;
                    end
                    else begin
                        burst_count <= burst_count + 1;
                        state       <= BRAM_ADDR_EN1;
                    end
                end
                else begin
                    state <= DDR_SEND_DATA;
                end
            end
   
        endcase
     end
 end

assign busy = ~(state == IDLE);


// Response Channel
always @(posedge M_AXI_ACLK) begin
    if (~aresetn) begin
        ddr_bready          <= 1'b0;
        ddr_bresp           <= 2'b0;
    end else begin
        if (ddr_bvalid && ~ddr_bready) begin
            ddr_bready      <= 1'b1; 
        end 
        else if(ddr_bready && ddr_bvalid) begin
            ddr_bready      <= 1'b0;
            ddr_bresp       <= M_AXI_BRESP;
        end  
    end
end







//*********************************************************************************************
//                                   AXI4-Lite Interface
//*********************************************************************************************
//******************************** READ AND WRITE REGISTERS ***********************************
// reg [19:0] Z_value_array[0];                                             (0x00) (0)
// reg [8:0] X_value_array[0];                                              (0x04) (1)
// reg [7:0] Y_value_array[0];                                              (0x08) (2)
// reg [8:0] pixel_count_array[0];                                          (0x0C) (3)

// reg [19:0] Z_value_array[1];                                             (0x10) (4)
// reg [8:0] X_value_array[1];                                              (0x14) (5)
// reg [7:0] Y_value_array[1];                                              (0x18) (6)
// reg [8:0] pixel_count_array[1];                                          (0x1C) (7)

// reg [19:0] Z_value_array[2];                                             (0x20) (8)
// reg [8:0] X_value_array[2];                                              (0x24) (9)
// reg [7:0] Y_value_array[2];                                              (0x28) (A)
// reg [8:0] pixel_count_array[2];                                          (0x2C) (B)

// reg [19:0] Z_value_array[3];                                             (0x30) (C)
// reg [8:0] X_value_array[3];                                              (0x34) (D)
// reg [7:0] Y_value_array[3];                                              (0x38) (E)
// reg [8:0] pixel_count_array[3];                                          (0x3C) (F)

// reg [19:0] Z_value_array[4];                                             (0x40) (10)
// reg [8:0] X_value_array[4];                                              (0x44) (11)
// reg [7:0] Y_value_array[4];                                              (0x48) (12)
// reg [8:0] pixel_count_array[4];                                          (0x4C) (13)

// AXI_AW
always @( posedge S_AXI_ACLK )
begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
        axi_awready <= 1'b0;
        axi_awaddr <= 0;
    end 
    else begin    
        if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID) begin
            axi_awready <= 1'b1;
            axi_awaddr <= S_AXI_AWADDR;
        end
        else begin
            axi_awready <= 1'b0;
        end
    end 
end  

// AXI_W
always @( posedge S_AXI_ACLK )
begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
        axi_wready <= 1'b0;
    end 
    else begin    
        if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID) begin
            axi_wready <= 1'b1;
        end
        else begin
            axi_wready <= 1'b0;
        end
    end 
end       

wire slv_reg_wren;
assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 )begin
        Z_value_array[0] = Z_value_0;
        Z_value_array[1] = Z_value_1;
        Z_value_array[2] = Z_value_2;
        Z_value_array[3] = Z_value_3;
        Z_value_array[4] = Z_value_4;
        X_value_array[0] = X_value_0;
        X_value_array[1] = X_value_1;
        X_value_array[2] = X_value_2;
        X_value_array[3] = X_value_3;
        X_value_array[4] = X_value_4;
        Y_value_array[0] = Y_value_0;
        Y_value_array[1] = Y_value_1;
        Y_value_array[2] = Y_value_2;
        Y_value_array[3] = Y_value_3;
        Y_value_array[4] = Y_value_4;
        pixel_count_array[0] = pixel_count_0;
        pixel_count_array[1] = pixel_count_1;
        pixel_count_array[2] = pixel_count_2;
        pixel_count_array[3] = pixel_count_3;
        pixel_count_array[4] = pixel_count_4;
    end 
    else if (slv_reg_wren) begin
        case ( axi_awaddr[C_S_AXI_ADDR_WIDTH - 1 : 2] )
            'h0     :   Z_value_array[0]        <=  S_AXI_WDATA[19:0];
            'h1     :   X_value_array[0]        <=  S_AXI_WDATA[8:0];
            'h2     :   Y_value_array[0]        <=  S_AXI_WDATA[7:0];
            'h3     :   pixel_count_array[0]    <=  S_AXI_WDATA[8:0];

            'h4     :   Z_value_array[1]        <=  S_AXI_WDATA[19:0];
            'h5     :   X_value_array[1]        <=  S_AXI_WDATA[8:0];
            'h6     :   Y_value_array[1]        <=  S_AXI_WDATA[7:0];
            'h7     :   pixel_count_array[1]    <=  S_AXI_WDATA[8:0];

            'h8     :   Z_value_array[2]        <=  S_AXI_WDATA[19:0];
            'h9     :   X_value_array[2]        <=  S_AXI_WDATA[8:0];
            'hA     :   Y_value_array[2]        <=  S_AXI_WDATA[7:0];
            'hB     :   pixel_count_array[2]    <=  S_AXI_WDATA[8:0];

            'hC     :   Z_value_array[3]        <=  S_AXI_WDATA[19:0];
            'hD     :   X_value_array[3]        <=  S_AXI_WDATA[8:0];
            'hE     :   Y_value_array[3]        <=  S_AXI_WDATA[7:0];
            'hF     :   pixel_count_array[3]    <=  S_AXI_WDATA[8:0];

            'h10    :   Z_value_array[4]        <=  S_AXI_WDATA[19:0];
            'h11    :   X_value_array[4]        <=  S_AXI_WDATA[8:0];
            'h12    :   Y_value_array[4]        <=  S_AXI_WDATA[7:0];
            'h13    :   pixel_count_array[4]    <=  S_AXI_WDATA[8:0];
            default : begin
            end
        endcase
    end
end

// AXI_B
always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
        axi_bvalid  <= 0;
        axi_bresp   <= 2'b0;
    end 
    else begin    
        if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID) begin
            axi_bvalid <= 1'b1;
            axi_bresp  <= 2'b0; // 'OKAY' response 
        end
        else if (S_AXI_BREADY && axi_bvalid) begin
            axi_bvalid <= 1'b0;
        end
    end
end

// AXI_AR
always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
        axi_arready <= 1'b0;
        axi_araddr  <= 32'b0;
    end 
    else begin    
        if (~axi_arready && S_AXI_ARVALID) begin
            axi_arready <= 1'b1;
            axi_araddr  <= S_AXI_ARADDR;
        end
        else begin
            axi_arready <= 1'b0;
        end
    end 
end

// AXI_R
always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 ) begin
        axi_rvalid <= 0;
        axi_rresp  <= 0;
    end 
    else begin    
        if (axi_arready && S_AXI_ARVALID && ~axi_rvalid) begin
            axi_rvalid <= 1'b1;
            axi_rresp  <= 2'b0;
        end   
        else if (axi_rvalid && S_AXI_RREADY) begin
            axi_rvalid <= 1'b0;
        end                
    end
end    

wire slv_reg_rden;
assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
always @( posedge S_AXI_ACLK ) begin
    if ( S_AXI_ARESETN == 1'b0 )begin
        axi_rdata <= 0;
    end 
    else if (slv_reg_rden) begin
        case ( axi_araddr[C_S_AXI_ADDR_WIDTH - 1 : 2] )
            'h0     :   axi_rdata <= {12'b0, Z_value_array[0]};
            'h1     :   axi_rdata <= {23'b0, X_value_array[0]};
            'h2     :   axi_rdata <= {24'b0, Y_value_array[0]};
            'h3     :   axi_rdata <= {23'b0, pixel_count_array[0]};
            'h4     :   axi_rdata <= {12'b0, Z_value_array[1]};
            'h5     :   axi_rdata <= {23'b0, X_value_array[1]};
            'h6     :   axi_rdata <= {24'b0, Y_value_array[1]};
            'h7     :   axi_rdata <= {23'b0, pixel_count_array[1]};
            'h8     :   axi_rdata <= {12'b0, Z_value_array[2]};
            'h9     :   axi_rdata <= {23'b0, X_value_array[2]};
            'hA     :   axi_rdata <= {24'b0, Y_value_array[2]};
            'hB     :   axi_rdata <= {23'b0, pixel_count_array[2]};
            'hC     :   axi_rdata <= {12'b0, Z_value_array[3]};
            'hD     :   axi_rdata <= {23'b0, X_value_array[3]};
            'hE     :   axi_rdata <= {24'b0, Y_value_array[3]};
            'hF     :   axi_rdata <= {23'b0, pixel_count_array[3]};
            'h10    :   axi_rdata <= {12'b0, Z_value_array[4]};
            'h11    :   axi_rdata <= {23'b0, X_value_array[4]};
            'h12    :   axi_rdata <= {24'b0, Y_value_array[4]};
            'h13    :   axi_rdata <= {23'b0, pixel_count_array[4]};
            default : axi_rdata <= 0;
        endcase
    end
end

endmodule