`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/13 16:05:13
// Design Name: 
// Module Name: camera_mem_config
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


module camera_mem_config
    (
    input wire clk,
    input wire [1:0] config_selection,
    input wire [7:0] addr,
    output reg [15:0] dout
    );
    //FFFF is end of rom, FFF0 is delay
    always @(posedge clk) begin
    if (config_selection==2'b11) begin
        case(addr) 
        0:  dout <= 16'h12_80; //reset
        1:  dout <= 16'hFF_F0; //delay
        2:  dout <= 16'h12_04; // COM7,     set RGB color output
        3:  dout <= 16'h11_80; // CLKRC     internal PLL matches input clock
        4:  dout <= 16'h0C_00; // COM3,     default settings
        5:  dout <= 16'h3E_00; // COM14,    no scaling, normal pclock
        6:  dout <= 16'h04_00; // COM1,     disable CCIR656
        7:  dout <= 16'h40_d0; //COM15,     RGB565, full output range
        8:  dout <= 16'h3a_04; //TSLB       set correct output data sequence (magic)
        9:  dout <= 16'h14_18; //COM9       MAX AGC value x4
        10: dout <= 16'h4F_B3; //MTX1       all of these are magical matrix coefficients
        11: dout <= 16'h50_B3; //MTX2
        12: dout <= 16'h51_00; //MTX3
        13: dout <= 16'h52_3d; //MTX4
        14: dout <= 16'h53_A7; //MTX5
        15: dout <= 16'h54_E4; //MTX6
        16: dout <= 16'h58_9E; //MTXS
        17: dout <= 16'h3D_C0; //COM13      sets gamma enable, does not preserve reserved bits, may be wrong?
        18: dout <= 16'h17_14; //HSTART     start high 8 bits
        19: dout <= 16'h18_02; //HSTOP      stop high 8 bits //these kill the odd colored line
        20: dout <= 16'h32_80; //HREF       edge offset
        21: dout <= 16'h19_03; //VSTART     start high 8 bits
        22: dout <= 16'h1A_7B; //VSTOP      stop high 8 bits
        23: dout <= 16'h03_0A; //VREF       vsync edge offset
        24: dout <= 16'h0F_41; //COM6       reset timings
        25: dout <= 16'h1E_00; //MVFP       disable mirror / flip //might have magic value of 03
        26: dout <= 16'h33_0B; //CHLF       //magic value from the internet
        27: dout <= 16'h3C_78; //COM12      no HREF when VSYNC low
        28: dout <= 16'h69_00; //GFIX       fix gain control
        29: dout <= 16'h74_00; //REG74      Digital gain control
        30: dout <= 16'hB0_84; //RSVD       magic value from the internet *required* for good color
        31: dout <= 16'hB1_0c; //ABLC1
        32: dout <= 16'hB2_0e; //RSVD       more magic internet values
        33: dout <= 16'hB3_80; //THL_ST
        //begin mystery scaling numbers
        34: dout <= 16'h70_3a;
        35: dout <= 16'h71_35;
        36: dout <= 16'h72_11;
        37: dout <= 16'h73_f0;
        38: dout <= 16'ha2_02;
        //gamma curve values
        39: dout <= 16'h7a_20;
        40: dout <= 16'h7b_10;
        41: dout <= 16'h7c_1e;
        42: dout <= 16'h7d_35;
        43: dout <= 16'h7e_5a;
        44: dout <= 16'h7f_69;
        45: dout <= 16'h80_76;
        46: dout <= 16'h81_80;
        47: dout <= 16'h82_88;
        48: dout <= 16'h83_8f;
        49: dout <= 16'h84_96;
        50: dout <= 16'h85_a3;
        51: dout <= 16'h86_af;
        52: dout <= 16'h87_c4;
        53: dout <= 16'h88_d7;
        54: dout <= 16'h89_e8;
        //AGC and AEC
        54: dout <= 16'h13_e0; //COM8, disable AGC / AEC
        55: dout <= 16'h00_00; //set gain reg to 0 for AGC
        56: dout <= 16'h10_00; //set ARCJ reg to 0
        57: dout <= 16'h0d_40; //magic reserved bit for COM4
        58: dout <= 16'h14_18; //COM9, 4x gain + magic bit
        59: dout <= 16'ha5_05; // BD50MAX
        60: dout <= 16'hab_07; //DB60MAX
        61: dout <= 16'h24_95; //AGC upper limit
        62: dout <= 16'h25_33; //AGC lower limit
        63: dout <= 16'h26_e3; //AGC/AEC fast mode op region
        64: dout <= 16'h9f_78; //HAECC1
        65: dout <= 16'ha0_68; //HAECC2
        66: dout <= 16'ha1_03; //magic
        67: dout <= 16'ha6_d8; //HAECC3
        68: dout <= 16'ha7_d8; //HAECC4
        69: dout <= 16'ha8_f0; //HAECC5
        70: dout <= 16'ha9_90; //HAECC6
        71: dout <= 16'haa_94; //HAECC7
        72: dout <= 16'h13_e5; //COM8, enable AGC / AEC
        73: dout <= 16'h8c_03; //RGB444 enable, set format to RGBx
        
        default: dout <= 16'hFF_FF;         //mark end of ROM
        endcase
    end
    else if(config_selection==2'b10) begin
    case(addr)
    0: dout <=16'h12_80;  //reset all register to default values
	1 : dout <=16'h12_04;  //set output format to RGB
//	 2: dout <=16'h15_20;  //pclk will not toggle during horizontal blank
	 3: dout <=16'h40_d0;	//RGB565
	 
	// These are values scalped from https://github.com/jonlwowski012/OV7670_NEXYS4_Verilog/blob/master/ov7670_registers_verilog.v
    4: dout <= 16'h12_04; // COM7,     set RGB color output
    5: dout <= 16'h11_80; // CLKRC     internal PLL matches input clock
    6: dout <= 16'h0C_00; // COM3,     default settings
    7: dout <= 16'h3E_00; // COM14,    no scaling, normal pclock
    8: dout <= 16'h04_00; // COM1,     disable CCIR656
    9: dout <= 16'h40_d0; //COM15,     RGB565, full output range
    10: dout <= 16'h3a_04; //TSLB       set correct output data sequence (magic)
	 11: dout <= 16'h14_18; //COM9       MAX AGC value x4 0001_1000
    12: dout <= 16'h4F_B3; //MTX1       all of these are magical matrix coefficients
    13: dout <= 16'h50_B3; //MTX2
    14: dout <= 16'h51_00; //MTX3
    15: dout <= 16'h52_3d; //MTX4
    16: dout <= 16'h53_A7; //MTX5
    17: dout <= 16'h54_E4; //MTX6
    18: dout <= 16'h58_9E; //MTXS
    19: dout <= 16'h3D_C0; //COM13      sets gamma enable, does not preserve reserved bits, may be wrong?
    20: dout <= 16'h17_14; //HSTART     start high 8 bits
    21: dout <= 16'h18_02; //HSTOP      stop high 8 bits //these kill the odd colored line
    22: dout <= 16'h32_80; //HREF       edge offset
    23: dout <= 16'h19_03; //VSTART     start high 8 bits
    24: dout <= 16'h1A_7B; //VSTOP      stop high 8 bits
    25: dout <= 16'h03_0A; //VREF       vsync edge offset
    26: dout <= 16'h0F_41; //COM6       reset timings
    27: dout <= 16'h1E_00; //MVFP       disable mirror / flip //might have magic value of 03
    28: dout <= 16'h33_0B; //CHLF       //magic value from the internet
    29: dout <= 16'h3C_78; //COM12      no HREF when VSYNC low
    30: dout <= 16'h69_00; //GFIX       fix gain control
    31: dout <= 16'h74_00; //REG74      Digital gain control
    32: dout <= 16'hB0_84; //RSVD       magic value from the internet *required* for good color
    33: dout <= 16'hB1_0c; //ABLC1
    34: dout <= 16'hB2_0e; //RSVD       more magic internet values
    35: dout <= 16'hB3_80; //THL_ST
    //begin mystery scaling numbers
    36: dout <= 16'h70_3a;
    37: dout <= 16'h71_35;
    38: dout <= 16'h72_11;
    39: dout <= 16'h73_f0;
    40: dout <= 16'ha2_02;
    //gamma curve values
    41: dout <= 16'h7a_20;
    42: dout <= 16'h7b_10;
    43: dout <= 16'h7c_1e;
    44: dout <= 16'h7d_35;
    45: dout <= 16'h7e_5a;
    46: dout <= 16'h7f_69;
    47: dout <= 16'h80_76;
    48: dout <= 16'h81_80;
    49: dout <= 16'h82_88;
    50: dout <= 16'h83_8f;
    51: dout <= 16'h84_96;
    52: dout <= 16'h85_a3;
    53: dout <= 16'h86_af;
    54: dout <= 16'h87_c4;
    55: dout <= 16'h88_d7;
    56: dout <= 16'h89_e8;
    //AGC and AEC
    57: dout <= 16'h13_e0; //COM8, disable AGC / AEC
    58: dout <= 16'h00_00; //set gain reg to 0 for AGC
    59: dout <= 16'h10_00; //set ARCJ reg to 0
    60: dout <= 16'h0d_40; //magic reserved bit for COM4
    61: dout <= 16'h14_18; //COM9, 4x gain + magic bit
    62: dout <= 16'ha5_05; // BD50MAX
    63: dout <= 16'hab_07; //DB60MAX
    64: dout <= 16'h24_95; //AGC upper limit
    65: dout <= 16'h25_33; //AGC lower limit
    66: dout <= 16'h26_e3; //AGC/AEC fast mode op region
    67: dout <= 16'h9f_78; //HAECC1
    68: dout <= 16'ha0_68; //HAECC2
    69: dout <= 16'ha1_03; //magic
    70: dout <= 16'ha6_d8; //HAECC3
    71: dout <= 16'ha7_d8; //HAECC4
    72: dout <= 16'ha8_f0; //HAECC5
    73: dout <= 16'ha9_90; //HAECC6
    74: dout <= 16'haa_94; //HAECC7
    75: dout <= 16'h13_e5; //COM8, enable AGC / AEC
    76: dout <= 16'h1E_23; //Mirror Image
    77: dout <= 16'h69_06; //gain of RGB(manually adjusted)
default: dout <= 16'hFF_FF;
endcase
    end
    else if(config_selection==2'b01) begin
            case(addr) 
        
         0:  dout <= 16'h12_80; //reset
    
        1:  dout <= 16'hFF_F0; //delay
    
        2:  dout <= 16'h12_04; // COM7,     set RGB color output
    
        3:  dout <= 16'h11_80; // CLKRC     internal PLL matches input clock
    
        4:  dout <= 16'h0C_00; // COM3,     default settings
    
        5:  dout <= 16'h3E_00; // COM14,    no scaling, normal pclock
    
        6:  dout <= 16'h04_00; // COM1,     disable CCIR656
    
        7:  dout <= 16'h40_d0; //COM15,     ***RGB444, full output range***
    
        8:  dout <= 16'h3a_04; //TSLB       set correct output data sequence (magic)
    
        9:  dout <= 16'h14_50; //COM9       MAX AGC value x4
    
       
    
        10: dout <= 16'h4F_B3; //MTX1       all of these are magical matrix coefficients
    
        11: dout <= 16'h50_B3; //MTX2
    
        12: dout <= 16'h51_00; //MTX3
    
        13: dout <= 16'h52_3d; //MTX4
    
        14: dout <= 16'h53_A7; //MTX5
    
        15: dout <= 16'h54_E4; //MTX6
    
        16: dout <= 16'h58_9E; //MTXS
    
        17: dout <= 16'h3D_C0; //COM13      sets gamma enable, does not preserve reserved bits, may be wrong?
    
        18: dout <= 16'h17_14; //HSTART     start high 8 bits
    
        19: dout <= 16'h18_02; //HSTOP      stop high 8 bits //these kill the odd colored line
    
        20: dout <= 16'h32_80; //HREF       edge offset
    
        21: dout <= 16'h19_03; //VSTART     start high 8 bits
    
        22: dout <= 16'h1A_7B; //VSTOP      stop high 8 bits
    
        23: dout <= 16'h03_0A; //VREF       vsync edge offset
    
        24: dout <= 16'h0F_41; //COM6       reset timings
    
        25: dout <= 16'h1E_00; //MVFP       disable mirror / flip //might have magic value of 03
    
        26: dout <= 16'h33_0B; //CHLF       //magic value from the internet
    
        27: dout <= 16'h3C_78; //COM12      no HREF when VSYNC low
    
        28: dout <= 16'h69_0b; //GFIX       fix gain control
    
        29: dout <= 16'h74_00; //REG74      Digital gain control
    
        30: dout <= 16'hB0_84; //RSVD       magic value from the internet *required* for good color
    
        31: dout <= 16'hB1_0c; //ABLC1
    
        32: dout <= 16'hB2_0e; //RSVD       more magic internet values
    
        33: dout <= 16'hB3_80; //THL_ST
    
//        //begin mystery scaling numbers
    
        34: dout <= 16'h70_3a;
    
        35: dout <= 16'h71_35;
    
        36: dout <= 16'h72_11;
    
        37: dout <= 16'h73_f0;
    
        38: dout <= 16'ha2_02;
    
      
    
        39: dout <= 16'h8c_02; //RGB444 enable, set format to RGBx
    
//        //AGC and AEC
    
        40: dout <= 16'h13_e7; //COM8, disable AGC / AEC
    
        41: dout <= 16'h00_00; //set gain reg to 0 for AGC
    
        42: dout <= 16'h10_00; //set ARCJ reg to 0
    
        43: dout <= 16'h0d_40; //magic reserved bit for COM4
    
        44: dout <= 16'h14_18; //COM9, 4x gain + magic bit
    
        45: dout <= 16'ha5_05; // BD50MAX
    
        46: dout <= 16'hab_07; //DB60MAX
    
        47: dout <= 16'h24_95; //AGC upper limit
    
        48: dout <= 16'h25_33; //AGC lower limit
    
        49: dout <= 16'h26_e3; //AGC/AEC fast mode op region
    
        50: dout <= 16'h9f_78; //HAECC1
    
        51: dout <= 16'ha0_68; //HAECC2
    
        52: dout <= 16'ha1_03; //magic
    
        53: dout <= 16'ha6_d8; //HAECC3
    
        54: dout <= 16'ha7_d8; //HAECC4
    
        55: dout <= 16'ha8_f0; //HAECC5
    
        56: dout <= 16'ha9_90; //HAECC6
    
        57: dout <= 16'haa_94; //HAECC7
    
        58: dout <= 16'h13_e7; //COM8, enable AGC / AEC
    
//        59: dout <= 16'h6f_93; //[3]: 0=RB,1=RGB [2]:0=2x,1=4x [1]=1 [0]: 0=advance, 1=normal auto
    
        default: dout <= 16'hFF_FF;         //mark end of ROM
     
        endcase
    end
    else begin
            case(addr) 
        
         0:  dout <= 16'h12_80; //reset
    
        1:  dout <= 16'hFF_F0; //delay
    
        2:  dout <= 16'h12_04; // COM7,     set RGB color output
    
        3:  dout <= 16'h11_80; // CLKRC     internal PLL matches input clock
    
        4:  dout <= 16'h0C_00; // COM3,     default settings
    
        5:  dout <= 16'h3E_00; // COM14,    no scaling, normal pclock
    
        6:  dout <= 16'h04_00; // COM1,     disable CCIR656
    
        7:  dout <= 16'h40_d0; //COM15,     ***RGB444, full output range***
    
        8:  dout <= 16'h3a_04; //TSLB       set correct output data sequence (magic)
    
        9:  dout <= 16'h14_18; //COM9       MAX AGC value x4
    
       
    
        10: dout <= 16'h4F_B3; //MTX1       all of these are magical matrix coefficients
    
        11: dout <= 16'h50_B3; //MTX2
    
        12: dout <= 16'h51_00; //MTX3
    
        13: dout <= 16'h52_3d; //MTX4
    
        14: dout <= 16'h53_A7; //MTX5
    
        15: dout <= 16'h54_E4; //MTX6
    
        16: dout <= 16'h58_9E; //MTXS
    
        17: dout <= 16'h3D_C0; //COM13      sets gamma enable, does not preserve reserved bits, may be wrong?
    
        18: dout <= 16'h17_14; //HSTART     start high 8 bits
    
        19: dout <= 16'h18_02; //HSTOP      stop high 8 bits //these kill the odd colored line
    
        20: dout <= 16'h32_80; //HREF       edge offset
    
        21: dout <= 16'h19_03; //VSTART     start high 8 bits
    
        22: dout <= 16'h1A_7B; //VSTOP      stop high 8 bits
    
        23: dout <= 16'h03_0A; //VREF       vsync edge offset
    
        24: dout <= 16'h0F_41; //COM6       reset timings
    
        25: dout <= 16'h1E_00; //MVFP       disable mirror / flip //might have magic value of 03
    
        26: dout <= 16'h33_0B; //CHLF       //magic value from the internet
    
        27: dout <= 16'h3C_78; //COM12      no HREF when VSYNC low
    
        28: dout <= 16'h69_00; //GFIX       fix gain control
    
        29: dout <= 16'h74_00; //REG74      Digital gain control
    
        30: dout <= 16'hB0_84; //RSVD       magic value from the internet *required* for good color
    
        31: dout <= 16'hB1_0c; //ABLC1
    
        32: dout <= 16'hB2_0e; //RSVD       more magic internet values
    
        33: dout <= 16'hB3_80; //THL_ST
    
//        //begin mystery scaling numbers
    
        34: dout <= 16'h70_3a;
    
        35: dout <= 16'h71_35;
    
        36: dout <= 16'h72_11;
    
        37: dout <= 16'h73_f0;
    
        38: dout <= 16'ha2_02;
    
      
    
        39: dout <= 16'h8c_02; //RGB444 enable, set format to RGBx
    
//        //AGC and AEC
    
        40: dout <= 16'h13_e0; //COM8, disable AGC / AEC
    
        41: dout <= 16'h00_00; //set gain reg to 0 for AGC
    
        42: dout <= 16'h10_00; //set ARCJ reg to 0
    
        43: dout <= 16'h0d_40; //magic reserved bit for COM4
    
        44: dout <= 16'h14_18; //COM9, 4x gain + magic bit
    
        45: dout <= 16'ha5_05; // BD50MAX
    
        46: dout <= 16'hab_07; //DB60MAX
    
        47: dout <= 16'h24_95; //AGC upper limit
    
        48: dout <= 16'h25_33; //AGC lower limit
    
        49: dout <= 16'h26_e3; //AGC/AEC fast mode op region
    
        50: dout <= 16'h9f_78; //HAECC1
    
        51: dout <= 16'ha0_68; //HAECC2
    
        52: dout <= 16'ha1_03; //magic
    
        53: dout <= 16'ha6_d8; //HAECC3
    
        54: dout <= 16'ha7_d8; //HAECC4
    
        55: dout <= 16'ha8_f0; //HAECC5
    
        56: dout <= 16'ha9_90; //HAECC6
    
        57: dout <= 16'haa_94; //HAECC7
    
        58: dout <= 16'h13_e7; //COM8, enable AGC / AEC
    
//        59: dout <= 16'h6f_93; //[3]: 0=RB,1=RGB [2]:0=2x,1=4x [1]=1 [0]: 0=advance, 1=normal auto
    
        default: dout <= 16'hFF_FF;         //mark end of ROM
     
        endcase
    end
    end
endmodule
