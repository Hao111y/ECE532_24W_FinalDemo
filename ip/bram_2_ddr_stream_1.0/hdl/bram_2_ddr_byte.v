
`timescale 1 ns / 1 ps

	module bram_2_ddr_stream_v1_0_M00_AXI #
	(
		// Users to add parameters here
		
		// User parameters ends
		// Do not modify the parameters beyond this line

		// Base address of targeted slave
		parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 32'h00000000,
		// Burst Length. Supports 1, 2, 4, 8, 16, 32, 64, 128, 256 burst lengths
		parameter integer C_M_AXI_BURST_LEN	= 256,
		// Thread ID Width
		parameter integer C_M_AXI_ID_WIDTH	= 1,
		// Width of Address Busa
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
		parameter integer C_M_AXI_BUSER_WIDTH	= 0,

		// Extra parameters
		parameter FRAME_BUFFER_COUNT = 2,
		parameter LINE_COUNT = 2,
		parameter PIXEL_COUNT = 640,
		parameter PIXEL_HEIGHT = 480
	)
	(
		input wire line_sync, // Inidicates start of new line (start a new burst copy for the next line)

		// Bram Wires
		output [15:0] BRAM_ADDR,
		input [7:0] bram_data,
		output BRAM_EN,

// *******************************************************************************
		// AXI4LITE signals
		input wire  M_AXI_ACLK,
		input wire  M_AXI_ARESETN,

		// Address Write Channel
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_AWID,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
		output wire [7 : 0] M_AXI_AWLEN,
		output wire [2 : 0] M_AXI_AWSIZE,
		output wire [1 : 0] M_AXI_AWBURST,
		output wire M_AXI_AWLOCK,
		output wire [3 : 0] M_AXI_AWCACHE,
		output wire [2 : 0] M_AXI_AWPROT,
		output wire [3 : 0] M_AXI_AWQOS,
		output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] M_AXI_AWUSER,
		output wire M_AXI_AWVALID,
		input wire M_AXI_AWREADY,

		// Write Data Channel
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
		output wire M_AXI_WLAST,
		output wire [C_M_AXI_WUSER_WIDTH-1 : 0] M_AXI_WUSER,
		output wire M_AXI_WVALID,
		input wire M_AXI_WREADY,

		// Write Response Channel
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_BID,
		input wire [1 : 0] M_AXI_BRESP,
		input wire [C_M_AXI_BUSER_WIDTH-1 : 0] M_AXI_BUSER,
		input wire M_AXI_BVALID,
		output wire M_AXI_BREADY,

		// Address Read Channel
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_ARID,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
		output wire [7 : 0] M_AXI_ARLEN,
		output wire [2 : 0] M_AXI_ARSIZE,
		output wire [1 : 0] M_AXI_ARBURST,
		output wire M_AXI_ARLOCK,
		output wire [3 : 0] M_AXI_ARCACHE,
		output wire [2 : 0] M_AXI_ARPROT,
		output wire [3 : 0] M_AXI_ARQOS,
		output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] M_AXI_ARUSER,
		output wire M_AXI_ARVALID,
		input wire M_AXI_ARREADY,

		// Read Data Channel
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_RID,
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
		input wire [1 : 0] M_AXI_RRESP,
		input wire M_AXI_RLAST,
		input wire [C_M_AXI_RUSER_WIDTH-1 : 0] M_AXI_RUSER,
		input wire M_AXI_RVALID,
		output wire M_AXI_RREADY,

// *******************************************************************************
        // Debuig Wires
        output burst_count_total,
        output start_single_burst,
		output burst_complete
	);
                 
	  function integer clogb2 (input integer bit_depth);              
	  begin                                                           
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                   
	      bit_depth = bit_depth >> 1;                                 
	    end                                                           
	  endfunction                                                     

	// C_TRANSACTIONS_NUM is the width of the index counter for 
	// number of write or read transaction.
	localparam integer C_TRANSACTIONS_NUM = clogb2(C_M_AXI_BURST_LEN-1);

	//
	localparam integer PIXEL_COUNT_POW = 10;
	localparam integer LINE_COUNT_POW = 1;
	localparam integer PIXEL_HEIGHT_POW = 9;
	localparam integer FRAME_BUFFER_COUNT_POW = 1;

	localparam integer BURST_COUNT = 2;
	localparam integer BURST_COUNT_TOTAL = 960; // 2 bursts per line at 480 lines

	// total number of burst transfers is master length divided by burst length and burst size
	 localparam integer C_NO_BURSTS_REQ = 10;

	// AXI4LITE signals
	//AXI4 internal temp signals
	wire [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awvalid;
	wire [C_M_AXI_DATA_WIDTH-1 : 0] 	axi_wdata;
	reg  	axi_wlast;
	reg  	axi_wvalid;
	reg  	axi_bready;
	wire [PIXEL_COUNT_POW + PIXEL_HEIGHT_POW + FRAME_BUFFER_COUNT_POW : 0] 	axi_araddr;
	reg  	axi_arvalid;
	reg  	axi_rready;

	// Bram wires
	wire [15:0] bram_addr;
	reg bram_en;

	//write beat count in a burst
	reg [C_TRANSACTIONS_NUM : 0] 	write_index;

	//read beat count in a burst
	reg [C_TRANSACTIONS_NUM : 0] 	read_index;

	//size of C_M_AXI_BURST_LEN length burst in bytes
	wire [C_TRANSACTIONS_NUM+2 : 0] 	burst_size_bytes;
	
	//The burst counters are used to track the number of burst transfers of C_M_AXI_BURST_LEN burst length needed to transfer 2^C_MASTER_LENGTH bytes of data.
	reg [C_NO_BURSTS_REQ : 0] 	burst_count_total;
	reg [C_NO_BURSTS_REQ : 0] 	burst_count_line;
	reg  	start_single_burst;
	reg 	burst_complete;
	reg		write_ready;
	reg		read_ready;
	reg  	error_reg;
	reg [8:0] write_count;

	//Interface response error flags
	wire  	write_resp_error;
	wire  	read_resp_error;
	wire  	wnext;
	wire  	rnext;
	reg  	init_txn_ff;
	reg  	init_txn_ff2;
	reg  	init_txn_edge;
	wire  	init_txn_pulse;


	// I/O Connections assignments

	//I/O Connections. Write Address (AW)
	assign M_AXI_AWID	= 'b0;
	//The AXI address is a concatenation of the target base address + active offset range
	assign M_AXI_AWADDR	= C_M_TARGET_SLAVE_BASE_ADDR + axi_awaddr;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_AWLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
	assign M_AXI_AWSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_AWBURST	= 2'b01;
	assign M_AXI_AWLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_AWCACHE	= 4'b0010;
	assign M_AXI_AWPROT	= 3'h0;
	assign M_AXI_AWQOS	= 4'h0;
	assign M_AXI_AWUSER	= 'b1;
	assign M_AXI_AWVALID	= axi_awvalid;
	//Write Data(W)
	assign M_AXI_WDATA	= axi_wdata;
	//All bursts are complete and aligned in this example
	assign M_AXI_WSTRB	= {(C_M_AXI_DATA_WIDTH/8){1'b1}};
	assign M_AXI_WLAST	= axi_wlast;
	assign M_AXI_WUSER	= 'b0;
	assign M_AXI_WVALID	= axi_wvalid;
	//Write Response (B)
	assign M_AXI_BREADY	= axi_bready;
	//Read Address (AR)
	assign M_AXI_ARID	= 'b0;
	assign M_AXI_ARADDR	= C_M_TARGET_SLAVE_BASE_ADDR + axi_araddr;
	//Burst LENgth is number of transaction beats, minus 1
	assign M_AXI_ARLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
	assign M_AXI_ARSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M_AXI_ARBURST	= 2'b01;
	assign M_AXI_ARLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M_AXI_ARCACHE	= 4'b0010;
	assign M_AXI_ARPROT	= 3'h0;
	assign M_AXI_ARQOS	= 4'h0;
	assign M_AXI_ARUSER	= 'b1;
	assign M_AXI_ARVALID	= axi_arvalid;
	//Read and Read Response (R)
	assign M_AXI_RREADY	= axi_rready;

	// BRAM Wires
	assign BRAM_ADDR = bram_addr;
	assign BRAM_EN = bram_en;


	//Burst size in bytes
	assign burst_size_bytes	= C_M_AXI_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
	assign init_txn_pulse	= (!init_txn_ff2) && init_txn_ff;


	//Generate a pulse to initiate AXI transaction.
	always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    // Initiates AXI transaction delay    
	    if (M_AXI_ARESETN == 0 )                                                   
	      begin                                                                    
	        init_txn_ff <= 1'b0;                                                   
	        init_txn_ff2 <= 1'b0;                                                   
	      end                                                                               
	    else                                                                       
	      begin  
	        init_txn_ff <= line_sync;
	        init_txn_ff2 <= init_txn_ff;                                                                 
	      end                                                                      
	  end

	always @(posedge M_AXI_ACLK) begin
		if(M_AXI_ARESETN == 0) begin
			burst_count_total <= 0;
			burst_complete <= 1'b0;
		end
		else begin
			if(burst_count_total == BURST_COUNT_TOTAL) begin
				burst_count_total <= 0;
			end
			else if(burst_complete) begin
				burst_count_total <= burst_count_total + 1;
			end

			if (init_txn_pulse) begin
				burst_complete <= 1'b0;
			end
			else if(write_count == 255 && M_AXI_WREADY && axi_wvalid) begin
				burst_complete <= 1'b1;
			end
			else if(burst_complete) begin
				burst_complete <= 1'b0;
			end
		end
	end

	// Burst start logic
	always @(posedge M_AXI_ACLK) begin
		if(M_AXI_ARESETN == 0) begin
			burst_count_line <= 0;
			start_single_burst <= 1'b0;
		end
		else begin
			if (init_txn_pulse) begin
				burst_count_line <= 0;
				start_single_burst <= 1'b1;
			end
			else if (burst_complete && (burst_count_line < 1)) begin
				burst_count_line <= burst_count_line + 1;
				start_single_burst <= 1'b1;
			end
			else begin
				start_single_burst <= 1'b0;
			end
		end
	end


	//--------------------
	//BRAM and DDR Write Address Channel
	//--------------------
	  always @(posedge M_AXI_ACLK)
	  begin
	    if (M_AXI_ARESETN == 0)                                           
	      begin                                                            
			axi_awvalid <= 1'b0;
	      end                                                              
	    // If previously not valid , start next transaction                
	    else if (~axi_awvalid && start_single_burst)
	      begin                                                            
	        axi_awvalid <= 1'b1;
	      end                                                              
	    /* Once asserted, VALIDs cannot be deasserted, so axi_awvalid      
	    must wait until transaction is accepted */                         
	    else if (M_AXI_AWREADY && axi_awvalid)                             
	      begin                                                            
	        axi_awvalid <= 1'b0;                                           
	      end                                                              
	    else                                                               
	      axi_awvalid <= axi_awvalid;                                      
	    end

	// Address is determined by the burst count
	// TODO: Fix address calculation (need to include read_index and the fact that its byte address)
	assign axi_awaddr = burst_count_total << 10; // Left shift by 10 because each burst has len 256 with 32 bit data width (2^8 * 2^2 = 2^10)
	assign axi_araddr = burst_count_total << 10;
	assign bram_addr = (burst_count_total << 6) + (write_count >> 2);
	// assign axi_wdata = {{16{bram_data[write_count[1:0] * 2 + 1]}} , {16{bram_data[write_count[1:0] * 2]}}}; // Convert 8 bit data to 16 bit data
	assign axi_wdata = (write_count[1:0] == 1) ? {{16{bram_data[1]}}, {16{bram_data[0]}}} : (write_count[1:0] == 2) ? {{16{bram_data[3]}}, {16{bram_data[2]}}} : (write_count[1:0] == 3) ? {{16{bram_data[5]}}, {16{bram_data[4]}}} : {{16{bram_data[7]}}, {16{bram_data[6]}}};

	// genvar i;
	// generate
	// 	for (i = 0; i < 4; i = i + 1) begin : gen_mux
	// 		wire selected_bit_1 = bram_data[i*2 + 1];
	// 		wire selected_bit_0 = bram_data[i*2];
	// 		assign axi_wdata = (write_count[1:0] == i) ? {{16{selected_bit_1}}, {16{selected_bit_0}}} : axi_wdata;
	// 	end
	// endgenerate

	//--------------------
	//Read Bram write DDR
	//--------------------

	// Set read_index to 0 at the start of a burst
	  always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0)                  
	      begin                                                             
	        read_index <= 0;
	      end
	  end

	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0)                                                        
	      begin
			axi_wvalid <= 1'b0;
			axi_wlast <= 1'b0;
			write_count <= 9'b111111111;
			bram_en <= 1'b0;
	      end
		else if (start_single_burst && ~axi_wvalid) begin
			axi_wvalid <= 1'b1;
			axi_wlast <= 1'b0;
			write_count <= 9'b0;
			bram_en <= 1'b1;
		end
		else if (M_AXI_WREADY && axi_wvalid) begin
			axi_wvalid <= 1'b0;
			write_count <= write_count + 1;
			axi_wlast <= 1'b0;
		end
		else if(write_count < 255 && ~axi_wvalid) begin
			axi_wvalid <= 1'b1;
			axi_wlast <= 1'b0;
		end
		else if(write_count == 255 && ~axi_wvalid) begin
			axi_wvalid <= 1'b1;
			axi_wlast <= 1'b1;
			bram_en <= 1'b0;
		end
		else begin
			axi_wvalid <= axi_wvalid;
			axi_wlast <= axi_wlast;
			bram_en <= bram_en;
		end
	  end

	//----------------------------
	//Write Response (B) Channel
	//----------------------------

	  always @(posedge M_AXI_ACLK)                                     
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || start_single_burst )                                            
	      begin                                                             
	        axi_bready <= 1'b0;
	      end                                                               
	    // accept/acknowledge bresp with axi_bready by the master           
	    // when M_AXI_BVALID is asserted by slave                           
	    else if (M_AXI_BVALID && ~axi_bready)                               
	      begin                                                             
	        axi_bready <= 1'b1;                                             
	      end                                                               
	    // deassert after one clock cycle                                   
	    else if (axi_bready)                                                
	      begin                                                             
	        axi_bready <= 1'b0;                                             
	      end                                                               
	    // retain the previous value                                        
	    else                                                                
	      axi_bready <= axi_bready;
	  end                                                                   
	                                                                        
	                                                                        
	//Flag any write response errors                                        
	  assign write_resp_error = axi_bready & M_AXI_BVALID & M_AXI_BRESP[1]; 


	//----------------------------
	//Read Address Channel
	//----------------------------

	  always @(posedge M_AXI_ACLK)                                 
	  begin                                                              
	                                                                     
	    if (M_AXI_ARESETN == 0)                                         
	      begin                                                          
			axi_arvalid <= 1'b0;                                        
	      end                                 
	  end

	//--------------------------------
	//Read BRAM Write DDR Channel
	//--------------------------------                                                            
	  always @(posedge M_AXI_ACLK)
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse == 1'b1 )                  
	      begin
			axi_rready <= 1'b0;
	      end              
	  end
	endmodule
	