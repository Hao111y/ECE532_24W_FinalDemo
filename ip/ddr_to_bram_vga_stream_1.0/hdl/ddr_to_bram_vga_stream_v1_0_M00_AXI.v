`timescale 1 ns / 1 ps

	module ddr_to_bram_vga_stream_v1_0_M00_AXI_2 #
	(
		// Users to add parameters here
		
		// User parameters ends
		// Do not modify the parameters beyond this line

		// Base address of targeted slave
		parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 32'h00000000,
		parameter  C_M2_TARGET_SLAVE_BASE_ADDR	= 32'h00000000,
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
		input wire frame_sync,

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
		// Second AXI Master (M2) ports
		input wire  M2_AXI_ACLK,
		input wire  M2_AXI_ARESETN,

		// Address Write Channel
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M2_AXI_AWID,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M2_AXI_AWADDR,
		output wire [7 : 0] M2_AXI_AWLEN,
		output wire [2 : 0] M2_AXI_AWSIZE,
		output wire [1 : 0] M2_AXI_AWBURST,
		output wire M2_AXI_AWLOCK,
		output wire [3 : 0] M2_AXI_AWCACHE,
		output wire [2 : 0] M2_AXI_AWPROT,
		output wire [3 : 0] M2_AXI_AWQOS,
		output wire [C_M_AXI_AWUSER_WIDTH-1 : 0] M2_AXI_AWUSER,
		output wire M2_AXI_AWVALID,
		input wire M2_AXI_AWREADY,

		// Write Data Channel
		output wire [C_M_AXI_DATA_WIDTH-1 : 0] M2_AXI_WDATA,
		output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M2_AXI_WSTRB,
		output wire M2_AXI_WLAST,
		output wire [C_M_AXI_WUSER_WIDTH-1 : 0] M2_AXI_WUSER,
		output wire M2_AXI_WVALID,
		input wire M2_AXI_WREADY,

		// Write Response Channel
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M2_AXI_BID,
		input wire [1 : 0] M2_AXI_BRESP,
		input wire [C_M_AXI_BUSER_WIDTH-1 : 0] M2_AXI_BUSER,
		input wire M2_AXI_BVALID,
		output wire M2_AXI_BREADY,

		// Address Read Channel
		output wire [C_M_AXI_ID_WIDTH-1 : 0] M2_AXI_ARID,
		output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M2_AXI_ARADDR,
		output wire [7 : 0] M2_AXI_ARLEN,
		output wire [2 : 0] M2_AXI_ARSIZE,
		output wire [1 : 0] M2_AXI_ARBURST,
		output wire M2_AXI_ARLOCK,
		output wire [3 : 0] M2_AXI_ARCACHE,
		output wire [2 : 0] M2_AXI_ARPROT,
		output wire [3 : 0] M2_AXI_ARQOS,
		output wire [C_M_AXI_ARUSER_WIDTH-1 : 0] M2_AXI_ARUSER,
		output wire M2_AXI_ARVALID,
		input wire M2_AXI_ARREADY,

		// Read Data Channel
		input wire [C_M_AXI_ID_WIDTH-1 : 0] M2_AXI_RID,
		input wire [C_M_AXI_DATA_WIDTH-1 : 0] M2_AXI_RDATA,
		input wire [1 : 0] M2_AXI_RRESP,
		input wire M2_AXI_RLAST,
		input wire [C_M_AXI_RUSER_WIDTH-1 : 0] M2_AXI_RUSER,
		input wire M2_AXI_RVALID,
		output wire M2_AXI_RREADY,

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
	localparam integer BURST_COUNT_TOTAL = 960;

	// total number of burst transfers is master length divided by burst length and burst size
	 localparam integer C_NO_BURSTS_REQ = 10;

	// AXI4LITE signals
	//AXI4 internal temp signals
	wire [C_M_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awvalid;
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	axi_wdata;
	reg  	axi_wlast;
	reg  	axi_wvalid;
	reg  	axi_bready;
	wire [PIXEL_COUNT_POW + PIXEL_HEIGHT_POW + FRAME_BUFFER_COUNT_POW : 0] 	axi_araddr;
	reg  	axi_arvalid;
	reg  	axi_rready;

	//AXI4 internal temp signals
	wire [PIXEL_COUNT_POW+LINE_COUNT_POW : 0] 	m2_axi_awaddr;
	reg  	m2_axi_awvalid;
	reg [C_M_AXI_DATA_WIDTH-1 : 0] 	m2_axi_wdata;
	reg  	m2_axi_wlast;
	reg  	m2_axi_wvalid;
	reg  	m2_axi_bready;
	wire [C_M_AXI_ADDR_WIDTH-1 : 0] 	m2_axi_araddr;
	reg  	m2_axi_arvalid;
	reg  	m2_axi_rready;

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

	//Interface response error flags
	wire  	write_resp_error;
	wire  	read_resp_error;
	wire  	wnext;
	wire  	rnext;
	reg  	init_txn_ff;
	reg  	init_txn_ff2;
	reg  	init_txn_edge;
	wire  	init_txn_pulse;
	reg 	init_txn_pulse_delay;
	reg 	init_txn_pulse_delay_2;
	
	reg    frame_sync_d1;
	reg    frame_sync_d2;
	wire   frame_sync_pulse;


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

	//*******************************************************************************
	//I/O Connections. Write Address (AW)
	assign M2_AXI_AWID	= 'b0;
	//The AXI address is a concatenation of the target base address + active offset range
	assign M2_AXI_AWADDR	= C_M2_TARGET_SLAVE_BASE_ADDR + m2_axi_awaddr;
	//Burst LENgth is number of transaction beats, minus 1
	assign M2_AXI_AWLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^SIZE bytes, otherwise narrow bursts are used
	assign M2_AXI_AWSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M2_AXI_AWBURST	= 2'b01;
	assign M2_AXI_AWLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M2_AXI_AWCACHE	= 4'b0010;
	assign M2_AXI_AWPROT	= 3'h0;
	assign M2_AXI_AWQOS	= 4'h0;
	assign M2_AXI_AWUSER	= 'b1;
	assign M2_AXI_AWVALID	= m2_axi_awvalid;
	//Write Data(W)
	assign M2_AXI_WDATA	= m2_axi_wdata;
	//All bursts are complete and aligned in this example
	assign M2_AXI_WSTRB	= {(C_M_AXI_DATA_WIDTH/8){1'b1}};
	assign M2_AXI_WLAST	= m2_axi_wlast;
	assign M2_AXI_WUSER	= 'b0;
	assign M2_AXI_WVALID	= m2_axi_wvalid;
	//Write Response (B)
	assign M2_AXI_BREADY	= m2_axi_bready;
	//Read Address (AR)
	assign M2_AXI_ARID	= 'b0;
	assign M2_AXI_ARADDR	= C_M2_TARGET_SLAVE_BASE_ADDR + m2_axi_araddr;
	//Burst LENgth is number of transaction beats, minus 1
	assign M2_AXI_ARLEN	= C_M_AXI_BURST_LEN - 1;
	//Size should be C_M_AXI_DATA_WIDTH, in 2^n bytes, otherwise narrow bursts are used
	assign M2_AXI_ARSIZE	= clogb2((C_M_AXI_DATA_WIDTH/8)-1);
	//INCR burst type is usually used, except for keyhole bursts
	assign M2_AXI_ARBURST	= 2'b01;
	assign M2_AXI_ARLOCK	= 1'b0;
	//Update value to 4'b0011 if coherent accesses to be used via the Zynq ACP port. Not Allocated, Modifiable, not Bufferable. Not Bufferable since this example is meant to test memory, not intermediate cache. 
	assign M2_AXI_ARCACHE	= 4'b0010;
	assign M2_AXI_ARPROT	= 3'h0;
	assign M2_AXI_ARQOS	= 4'h0;
	assign M2_AXI_ARUSER	= 'b1;
	assign M2_AXI_ARVALID	= m2_axi_arvalid;
	//Read and Read Response (R)
	assign M2_AXI_RREADY	= m2_axi_rready;


	//Burst size in bytes
	assign burst_size_bytes	= C_M_AXI_BURST_LEN * C_M_AXI_DATA_WIDTH/8;
	assign init_txn_pulse	= (!init_txn_ff2) && init_txn_ff;
	assign frame_sync_pulse = (!frame_sync_d2) && frame_sync_d1;
	
	
	always @(posedge M_AXI_ACLK) begin
		if(M_AXI_ARESETN == 0) begin
			init_txn_pulse_delay <= 1'b0;
			init_txn_pulse_delay_2 <= 1'b0;
		end
		else begin
			init_txn_pulse_delay <= init_txn_pulse;
			init_txn_pulse_delay_2 <= init_txn_pulse_delay;
		end
	end

	//Generate a pulse to initiate AXI transaction.
	always @(posedge M_AXI_ACLK)										      
	  begin                                                                        
	    // Initiates AXI transaction delay    
	    if (M_AXI_ARESETN == 0 )                                                   
	      begin                                                                    
	        init_txn_ff <= 1'b0;
	        init_txn_ff2 <= 1'b0;
	        frame_sync_d1 <= 1'b0;
	        frame_sync_d2 <= 1'b0;
	      end                                                                               
	    else                                                                       
	      begin  
	        init_txn_ff <= line_sync;
	        init_txn_ff2 <= init_txn_ff;
	        frame_sync_d1 <= frame_sync;
	        frame_sync_d2 <= frame_sync_d1;
	      end                                                                      
	  end

	always @(posedge M_AXI_ACLK) begin
		if(M_AXI_ARESETN == 0) begin
			burst_count_total <= 0;
			burst_complete <= 1'b0;
		end
		else begin
		    if(frame_sync_pulse) begin
		        burst_count_total <= 0;
		    end
			if(burst_count_total == BURST_COUNT_TOTAL) begin
				burst_count_total <= 0;
			end
			else if(burst_complete) begin
				burst_count_total <= burst_count_total + 1;
			end

			if (init_txn_pulse_delay_2) begin
				burst_complete <= 1'b0;
			end
			else if(M_AXI_RLAST & M_AXI_RREADY) begin
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
			if (init_txn_pulse_delay_2) begin
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
			m2_axi_awvalid <= 1'b0;
	      end                                                              
	    // If previously not valid , start next transaction                
	    else if (~m2_axi_awvalid && start_single_burst)
	      begin                                                            
	        m2_axi_awvalid <= 1'b1;
	      end                                                              
	    /* Once asserted, VALIDs cannot be deasserted, so axi_awvalid      
	    must wait until transaction is accepted */                         
	    else if (M2_AXI_AWREADY && m2_axi_awvalid)                             
	      begin                                                            
	        m2_axi_awvalid <= 1'b0;                                           
	      end                                                              
	    else                                                               
	      m2_axi_awvalid <= m2_axi_awvalid;                                      
	    end

	// Address is determined by the burst count
	// TODO: Fix address calculation (need to include read_index and the fact that its byte address)
	assign axi_awaddr = 'b0;
	assign m2_axi_awaddr = (burst_count_total << 10);
	assign m2_axi_araddr = 'b0;
	assign axi_araddr = (burst_count_total << 10);

	//--------------------
	//Write BRAM Read DDR
	//--------------------

	// Set read_index to 0 at the start of a burst
	  always @(posedge M_AXI_ACLK)                                          
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || start_single_burst)                  
	      begin                                                             
	        read_index <= 0;                                                
	      end                                                               
	    else if (M_AXI_RVALID && axi_rready)              
	      begin                                                             
	        read_index <= read_index + 1;                                   
	      end                                                               
	    else                                                                
	      read_index <= read_index;
	  end

	  always @(posedge M_AXI_ACLK)                                                      
	  begin                                                                             
	    if (M_AXI_ARESETN == 0)                                                        
	      begin                                                                         
	        axi_rready <= 1'b0;
			m2_axi_wvalid <= 1'b0;
			m2_axi_wlast <= 1'b0;
	      end
		else if (start_single_burst) begin
			axi_rready <= 1'b1;
		end
		else begin
			if (axi_rready && M_AXI_RVALID) begin
				if(M_AXI_RLAST) begin
					m2_axi_wlast <= 1'b1;
				end
				axi_rready <= 1'b0;
				m2_axi_wdata <= M_AXI_RDATA;
				m2_axi_wvalid <= 1'b1;
			end
			if (m2_axi_wlast) begin
				m2_axi_wlast <= 1'b0;
			end

			if (~burst_complete && M2_AXI_WREADY && m2_axi_wvalid) begin
				m2_axi_wvalid <= 1'b0;
				axi_rready <= 1'b1;
			end
			else if(burst_complete && M2_AXI_WREADY && m2_axi_wvalid) begin
				m2_axi_wvalid <= 1'b0;
			end
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
			m2_axi_bready <= 1'b0;
	      end                                                               
	    // accept/acknowledge bresp with axi_bready by the master           
	    // when M_AXI_BVALID is asserted by slave                           
	    else if (M2_AXI_BVALID && ~m2_axi_bready)                               
	      begin                                                             
	        m2_axi_bready <= 1'b1;                                             
	      end                                                               
	    // deassert after one clock cycle                                   
	    else if (m2_axi_bready)                                                
	      begin                                                             
	        m2_axi_bready <= 1'b0;                                             
	      end                                                               
	    // retain the previous value                                        
	    else                                                                
	      m2_axi_bready <= m2_axi_bready;
	  end                                                                   
	                                                                        
	                                                                        
	//Flag any write response errors                                        
	  assign write_resp_error = m2_axi_bready & M2_AXI_BVALID & M2_AXI_BRESP[1]; 


	//----------------------------
	//Read Address Channel
	//----------------------------

	  always @(posedge M_AXI_ACLK)                                 
	  begin                                                              
	                                                                     
	    if (M_AXI_ARESETN == 0)                                         
	      begin                                                          
	        axi_arvalid <= 1'b0;
			m2_axi_arvalid <= 1'b0;                                        
	      end                                                            
	    // If previously not valid , start next transaction              
	    else if (~axi_arvalid && start_single_burst)                
	      begin                                                          
	        axi_arvalid <= 1'b1;                                         
	      end                                                            
	    else if (M_AXI_ARREADY && axi_arvalid)                           
	      begin                                                          
	        axi_arvalid <= 1'b0;                                         
	      end                                                            
	    else                                                             
	      axi_arvalid <= axi_arvalid;                                    
	  end

	//--------------------------------
	//Read BRAM Write DDR Channel
	//--------------------------------                                                            
	  always @(posedge M_AXI_ACLK)
	  begin                                                                 
	    if (M_AXI_ARESETN == 0 || init_txn_pulse_delay_2 == 1'b1 )                  
	      begin                                                             
	        axi_wvalid <= 1'b0;
			axi_wdata <= 0;
			axi_wlast <= 0;
			m2_axi_rready <= 1'b0;
	      end              
	  end
	endmodule
