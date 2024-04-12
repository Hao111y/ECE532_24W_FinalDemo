
################################################################
# This is a generated script based on design: top
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source top_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# reg_cdc, Camera_Config_TOP, Camera_capture, Threshold_standalone, bram_mux, divider_output, erosion_dilation, pixel_acc

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
   set_property BOARD_PART digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name top

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:blk_mem_gen:8.4\
utoronto.ca:user:graphics_packaged:1.0\
xilinx.com:user:physics_core:1.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:div_gen:5.1\
xilinx.com:ip:axi_gpio:2.0\
xilinx.com:ip:axi_uartlite:2.0\
xilinx.com:ip:mdm:3.2\
xilinx.com:ip:microblaze:11.0\
xilinx.com:ip:axi_intc:4.1\
xilinx.com:ip:xlslice:1.0\
xilinx.com:ip:lmb_bram_if_cntlr:4.0\
xilinx.com:ip:lmb_v10:3.0\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
reg_cdc\
Camera_Config_TOP\
Camera_capture\
Threshold_standalone\
bram_mux\
divider_output\
erosion_dilation\
pixel_acc\
"

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [ list \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_hier
proc create_hier_cell_microblaze_hier { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_hier() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M06_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M07_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 usb_uart

  # Create pins
  create_bd_pin -dir I -type clk ACLK
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir O -type rst Debug_SYS_Rst
  create_bd_pin -dir I -type rst SYS_Rst
  create_bd_pin -dir O -from 23 -to 0 ai_x
  create_bd_pin -dir O -from 23 -to 0 ai_y
  create_bd_pin -dir O -from 23 -to 0 ai_z
  create_bd_pin -dir O -from 8 -to 0 gpio_io_o
  create_bd_pin -dir O -from 0 -to 0 gpio_io_o1
  create_bd_pin -dir O -from 1 -to 0 gpio_io_o2
  create_bd_pin -dir I -type rst processor_rst

  # Create instance: ai_pos_gpio, and set properties
  set ai_pos_gpio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 ai_pos_gpio ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_ALL_OUTPUTS_2 {1} \
   CONFIG.C_GPIO2_WIDTH {24} \
   CONFIG.C_GPIO_WIDTH {32} \
   CONFIG.C_IS_DUAL {1} \
 ] $ai_pos_gpio

  # Create instance: axi_gpio_hsv_data, and set properties
  set axi_gpio_hsv_data [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_hsv_data ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {9} \
 ] $axi_gpio_hsv_data

  # Create instance: axi_gpio_hsv_type, and set properties
  set axi_gpio_hsv_type [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_hsv_type ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {2} \
 ] $axi_gpio_hsv_type

  # Create instance: axi_gpio_hsv_vld, and set properties
  set axi_gpio_hsv_vld [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_hsv_vld ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $axi_gpio_hsv_vld

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.UARTLITE_BOARD_INTERFACE {usb_uart} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_uartlite_0

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0 ]
  set_property -dict [ list \
   CONFIG.C_ADDR_TAG_BITS {0} \
   CONFIG.C_DCACHE_ADDR_TAG {0} \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_I_LMB {1} \
   CONFIG.C_USE_DCACHE {0} \
   CONFIG.C_USE_ICACHE {0} \
   CONFIG.G_TEMPLATE_LIST {10} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
   CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {8} \
   CONFIG.NUM_SI {1} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory $hier_obj microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {1} \
 ] $microblaze_0_xlconcat

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {8} \
 ] $xlconstant_2

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {15} \
   CONFIG.DIN_TO {0} \
   CONFIG.DIN_WIDTH {32} \
   CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {31} \
   CONFIG.DIN_TO {16} \
   CONFIG.DIN_WIDTH {32} \
   CONFIG.DOUT_WIDTH {16} \
 ] $xlslice_1

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins usb_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M06_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M07_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins ai_pos_gpio/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_gpio_hsv_vld/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_gpio_hsv_type/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins axi_gpio_hsv_data/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]

  # Create port connections
  connect_bd_net -net ai_pos_gpio_gpio2_io_o [get_bd_pins ai_z] [get_bd_pins ai_pos_gpio/gpio2_io_o]
  connect_bd_net -net ai_pos_gpio_gpio_io_o [get_bd_pins ai_pos_gpio/gpio_io_o] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net axi_gpio_hsv_data_gpio_io_o [get_bd_pins gpio_io_o] [get_bd_pins axi_gpio_hsv_data/gpio_io_o]
  connect_bd_net -net axi_gpio_hsv_type_gpio_io_o [get_bd_pins gpio_io_o2] [get_bd_pins axi_gpio_hsv_type/gpio_io_o]
  connect_bd_net -net axi_gpio_hsv_vld_gpio_io_o [get_bd_pins gpio_io_o1] [get_bd_pins axi_gpio_hsv_vld/gpio_io_o]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins Debug_SYS_Rst] [get_bd_pins mdm_1/Debug_SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins ACLK] [get_bd_pins ai_pos_gpio/s_axi_aclk] [get_bd_pins axi_gpio_hsv_data/s_axi_aclk] [get_bd_pins axi_gpio_hsv_type/s_axi_aclk] [get_bd_pins axi_gpio_hsv_vld/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins SYS_Rst] [get_bd_pins microblaze_0_local_memory/SYS_Rst]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins processor_rst] [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins ARESETN] [get_bd_pins ai_pos_gpio/s_axi_aresetn] [get_bd_pins axi_gpio_hsv_data/s_axi_aresetn] [get_bd_pins axi_gpio_hsv_type/s_axi_aresetn] [get_bd_pins axi_gpio_hsv_vld/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins ai_x] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins ai_y] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconcat_1/In0] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins xlconcat_0/In1] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins xlconcat_1/In1] [get_bd_pins xlslice_1/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: image_proc
proc create_hier_cell_image_proc { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_image_proc() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 8 -to 0 bram_addr
  create_bd_pin -dir O -from 639 -to 0 bram_din
  create_bd_pin -dir I -from 639 -to 0 bram_dout
  create_bd_pin -dir O bram_ena
  create_bd_pin -dir O bram_wea
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir O coord_valid
  create_bd_pin -dir I img_valid
  create_bd_pin -dir O -from 15 -to 0 p_size
  create_bd_pin -dir I -type rst rst
  create_bd_pin -dir O -from 23 -to 0 x_out
  create_bd_pin -dir O -from 23 -to 0 y_out

  # Create instance: bram_mux_0, and set properties
  set block_name bram_mux
  set block_cell_name bram_mux_0
  if { [catch {set bram_mux_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bram_mux_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: divider_output_0, and set properties
  set block_name divider_output
  set block_cell_name divider_output_0
  if { [catch {set divider_output_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $divider_output_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: erosion_dilation, and set properties
  set block_name erosion_dilation
  set block_cell_name erosion_dilation
  if { [catch {set erosion_dilation [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $erosion_dilation eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: pixel_acc_0, and set properties
  set block_name pixel_acc
  set block_cell_name pixel_acc_0
  if { [catch {set pixel_acc_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $pixel_acc_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: x_div, and set properties
  set x_div [ create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 x_div ]
  set_property -dict [ list \
   CONFIG.ARESETN {true} \
   CONFIG.FlowControl {Blocking} \
   CONFIG.OptimizeGoal {Resources} \
   CONFIG.OutTready {false} \
   CONFIG.clocks_per_division {8} \
   CONFIG.divide_by_zero_detect {false} \
   CONFIG.dividend_and_quotient_width {24} \
   CONFIG.divisor_width {16} \
   CONFIG.fractional_width {2} \
   CONFIG.latency {32} \
   CONFIG.remainder_type {Fractional} \
 ] $x_div

  # Create instance: y_div, and set properties
  set y_div [ create_bd_cell -type ip -vlnv xilinx.com:ip:div_gen:5.1 y_div ]
  set_property -dict [ list \
   CONFIG.ARESETN {true} \
   CONFIG.FlowControl {Blocking} \
   CONFIG.OptimizeGoal {Performance} \
   CONFIG.OutTready {false} \
   CONFIG.clocks_per_division {8} \
   CONFIG.divide_by_zero_detect {false} \
   CONFIG.dividend_and_quotient_width {24} \
   CONFIG.divisor_width {15} \
   CONFIG.fractional_width {2} \
   CONFIG.latency {32} \
   CONFIG.remainder_type {Fractional} \
 ] $y_div

  # Create port connections
  connect_bd_net -net bram_mux_0_addra_bram [get_bd_pins bram_addr] [get_bd_pins bram_mux_0/addra_bram]
  connect_bd_net -net bram_mux_0_ena_bram [get_bd_pins bram_ena] [get_bd_pins bram_mux_0/ena_bram]
  connect_bd_net -net clk_0 [get_bd_pins clk] [get_bd_pins divider_output_0/clk] [get_bd_pins erosion_dilation/clk] [get_bd_pins pixel_acc_0/clk] [get_bd_pins x_div/aclk] [get_bd_pins y_div/aclk]
  connect_bd_net -net divider_output_0_valid [get_bd_pins coord_valid] [get_bd_pins divider_output_0/valid]
  connect_bd_net -net divider_output_0_xout [get_bd_pins x_out] [get_bd_pins divider_output_0/xout]
  connect_bd_net -net divider_output_0_yout [get_bd_pins y_out] [get_bd_pins divider_output_0/yout]
  connect_bd_net -net douta_0_1 [get_bd_pins bram_dout] [get_bd_pins erosion_dilation/douta] [get_bd_pins pixel_acc_0/doutb]
  connect_bd_net -net erosion_dilation_addra [get_bd_pins bram_mux_0/addra] [get_bd_pins erosion_dilation/addra]
  connect_bd_net -net erosion_dilation_data_out [get_bd_pins bram_din] [get_bd_pins erosion_dilation/data_out]
  connect_bd_net -net erosion_dilation_ena [get_bd_pins bram_mux_0/ena] [get_bd_pins erosion_dilation/ena]
  connect_bd_net -net erosion_dilation_finish_ed [get_bd_pins bram_mux_0/sel] [get_bd_pins erosion_dilation/finish_ed] [get_bd_pins pixel_acc_0/run_acc]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets erosion_dilation_finish_ed]
  connect_bd_net -net erosion_dilation_wea [get_bd_pins bram_wea] [get_bd_pins erosion_dilation/wea]
  connect_bd_net -net pixel_acc_0_acc_done [get_bd_pins divider_output_0/acc_done] [get_bd_pins pixel_acc_0/acc_done]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets pixel_acc_0_acc_done]
  connect_bd_net -net pixel_acc_0_addrb [get_bd_pins bram_mux_0/addrb] [get_bd_pins pixel_acc_0/addrb]
  connect_bd_net -net pixel_acc_0_enb [get_bd_pins bram_mux_0/enb] [get_bd_pins pixel_acc_0/enb]
  connect_bd_net -net pixel_acc_0_p_size [get_bd_pins p_size] [get_bd_pins pixel_acc_0/p_size] [get_bd_pins x_div/s_axis_divisor_tdata] [get_bd_pins y_div/s_axis_divisor_tdata]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets pixel_acc_0_p_size]
  connect_bd_net -net pixel_acc_0_p_x [get_bd_pins pixel_acc_0/p_x] [get_bd_pins x_div/s_axis_dividend_tdata]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets pixel_acc_0_p_x]
  connect_bd_net -net pixel_acc_0_p_y [get_bd_pins pixel_acc_0/p_y] [get_bd_pins y_div/s_axis_dividend_tdata]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets pixel_acc_0_p_y]
  connect_bd_net -net pixel_acc_0_tvalid [get_bd_pins pixel_acc_0/tvalid] [get_bd_pins x_div/s_axis_dividend_tvalid] [get_bd_pins x_div/s_axis_divisor_tvalid] [get_bd_pins y_div/s_axis_dividend_tvalid] [get_bd_pins y_div/s_axis_divisor_tvalid]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets pixel_acc_0_tvalid]
  connect_bd_net -net rst_0 [get_bd_pins rst] [get_bd_pins divider_output_0/rst] [get_bd_pins erosion_dilation/rst] [get_bd_pins pixel_acc_0/rst]
  connect_bd_net -net run_ed_0_1 [get_bd_pins img_valid] [get_bd_pins erosion_dilation/run_ed] [get_bd_pins x_div/aresetn] [get_bd_pins y_div/aresetn]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets run_ed_0_1]
  connect_bd_net -net x_div_m_axis_dout_tdata [get_bd_pins divider_output_0/xdiv] [get_bd_pins x_div/m_axis_dout_tdata]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets x_div_m_axis_dout_tdata]
  connect_bd_net -net x_div_m_axis_dout_tvalid [get_bd_pins divider_output_0/xdiv_valid] [get_bd_pins x_div/m_axis_dout_tvalid]
  connect_bd_net -net x_div_s_axis_dividend_tready [get_bd_pins pixel_acc_0/tready_dividend_x] [get_bd_pins x_div/s_axis_dividend_tready]
  connect_bd_net -net x_div_s_axis_divisor_tready [get_bd_pins pixel_acc_0/tready_divisor_x] [get_bd_pins x_div/s_axis_divisor_tready]
  connect_bd_net -net y_div_m_axis_dout_tdata [get_bd_pins divider_output_0/ydiv] [get_bd_pins y_div/m_axis_dout_tdata]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets y_div_m_axis_dout_tdata]
  connect_bd_net -net y_div_m_axis_dout_tvalid [get_bd_pins divider_output_0/ydiv_valid] [get_bd_pins y_div/m_axis_dout_tvalid]
  connect_bd_net -net y_div_s_axis_dividend_tready [get_bd_pins pixel_acc_0/tready_dividend_y] [get_bd_pins y_div/s_axis_dividend_tready]
  connect_bd_net -net y_div_s_axis_divisor_tready [get_bd_pins pixel_acc_0/tready_divisor_y] [get_bd_pins y_div/s_axis_divisor_tready]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: camera
proc create_hier_cell_camera { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_camera() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I ext_cam_href
  create_bd_pin -dir I -type clk ext_cam_pclk
  create_bd_pin -dir I -from 7 -to 0 ext_cam_pdata
  create_bd_pin -dir I ext_cam_vsync
  create_bd_pin -dir O ext_config_done
  create_bd_pin -dir I -from 1 -to 0 ext_config_selection
  create_bd_pin -dir O ext_config_sioc
  create_bd_pin -dir O ext_config_siod
  create_bd_pin -dir I ext_config_start
  create_bd_pin -dir O frame_done_out
  create_bd_pin -dir O -from 639 -to 0 row_data
  create_bd_pin -dir O -from 8 -to 0 row_data_addr
  create_bd_pin -dir I -type rst rst_n
  create_bd_pin -dir I -from 8 -to 0 threshold_data
  create_bd_pin -dir I -from 1 -to 0 threshold_type
  create_bd_pin -dir I -from 0 -to 0 threshold_vld
  create_bd_pin -dir O wea

  # Create instance: Camera_Config_TOP_0, and set properties
  set block_name Camera_Config_TOP
  set block_cell_name Camera_Config_TOP_0
  if { [catch {set Camera_Config_TOP_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Camera_Config_TOP_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Camera_capture_0, and set properties
  set block_name Camera_capture
  set block_cell_name Camera_capture_0
  if { [catch {set Camera_capture_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Camera_capture_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Threshold_standalone_0, and set properties
  set block_name Threshold_standalone
  set block_cell_name Threshold_standalone_0
  if { [catch {set Threshold_standalone_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Threshold_standalone_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net Camera_Config_TOP_0_done [get_bd_pins ext_config_done] [get_bd_pins Camera_Config_TOP_0/done]
  connect_bd_net -net Camera_Config_TOP_0_sioc [get_bd_pins ext_config_sioc] [get_bd_pins Camera_Config_TOP_0/sioc]
  connect_bd_net -net Camera_Config_TOP_0_siod [get_bd_pins ext_config_siod] [get_bd_pins Camera_Config_TOP_0/siod]
  connect_bd_net -net Camera_capture_0_frame_done [get_bd_pins Camera_capture_0/frame_done] [get_bd_pins Threshold_standalone_0/frame_done_in]
  connect_bd_net -net Camera_capture_0_pixel_data [get_bd_pins Camera_capture_0/pixel_data] [get_bd_pins Threshold_standalone_0/pixel_data]
  connect_bd_net -net Camera_capture_0_pixel_valid [get_bd_pins Camera_capture_0/pixel_valid] [get_bd_pins Threshold_standalone_0/pixel_valid]
  connect_bd_net -net Threshold_standalone_0_frame_done_out [get_bd_pins frame_done_out] [get_bd_pins Threshold_standalone_0/frame_done_out]
  connect_bd_net -net Threshold_standalone_0_row_data [get_bd_pins row_data] [get_bd_pins Threshold_standalone_0/row_data]
  connect_bd_net -net Threshold_standalone_0_row_data_addr [get_bd_pins row_data_addr] [get_bd_pins Threshold_standalone_0/row_data_addr]
  connect_bd_net -net Threshold_standalone_0_wea [get_bd_pins wea] [get_bd_pins Threshold_standalone_0/wea]
  connect_bd_net -net clk_0_1 [get_bd_pins ext_cam_pclk] [get_bd_pins Camera_capture_0/p_clock] [get_bd_pins Threshold_standalone_0/clk]
  connect_bd_net -net clk_wiz_1_clk_25M [get_bd_pins clk] [get_bd_pins Camera_Config_TOP_0/clk]
  connect_bd_net -net ext_config_selection_0_1 [get_bd_pins ext_config_selection] [get_bd_pins Camera_Config_TOP_0/ext_config_selection]
  connect_bd_net -net href_0_1 [get_bd_pins ext_cam_href] [get_bd_pins Camera_capture_0/href]
  connect_bd_net -net mem_addr [get_bd_pins Camera_capture_0/mem_addr]
  connect_bd_net -net p_data_0_1 [get_bd_pins ext_cam_pdata] [get_bd_pins Camera_capture_0/p_data]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins rst_n] [get_bd_pins Camera_Config_TOP_0/rst_n] [get_bd_pins Threshold_standalone_0/rst_n]
  connect_bd_net -net start_config [get_bd_pins ext_config_start] [get_bd_pins Camera_Config_TOP_0/start]
  connect_bd_net -net threshold_data_1 [get_bd_pins threshold_data] [get_bd_pins Threshold_standalone_0/threshold_data]
  connect_bd_net -net threshold_type_1 [get_bd_pins threshold_type] [get_bd_pins Threshold_standalone_0/threshold_type]
  connect_bd_net -net threshold_vld_1 [get_bd_pins threshold_vld] [get_bd_pins Threshold_standalone_0/threshold_vld]
  connect_bd_net -net vsync_0_1 [get_bd_pins ext_cam_vsync] [get_bd_pins Camera_capture_0/vsync]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set usb_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 usb_uart ]

  # Create ports
  set VGA_B [ create_bd_port -dir O -from 3 -to 0 VGA_B ]
  set VGA_G [ create_bd_port -dir O -from 3 -to 0 VGA_G ]
  set VGA_HS [ create_bd_port -dir O VGA_HS ]
  set VGA_R [ create_bd_port -dir O -from 3 -to 0 VGA_R ]
  set VGA_VS [ create_bd_port -dir O VGA_VS ]
  set ext_areset_n [ create_bd_port -dir I -type rst ext_areset_n ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $ext_areset_n
  set ext_cam_href [ create_bd_port -dir I ext_cam_href ]
  set ext_cam_pclk [ create_bd_port -dir I -type clk ext_cam_pclk ]
  set ext_cam_pdata [ create_bd_port -dir I -from 7 -to 0 ext_cam_pdata ]
  set ext_cam_pwdn [ create_bd_port -dir O ext_cam_pwdn ]
  set ext_cam_rst [ create_bd_port -dir I ext_cam_rst ]
  set ext_cam_rst_p [ create_bd_port -dir O ext_cam_rst_p ]
  set ext_cam_vsync [ create_bd_port -dir I ext_cam_vsync ]
  set ext_cam_xclk [ create_bd_port -dir O -type clk ext_cam_xclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {24000000} \
 ] $ext_cam_xclk
  set ext_clk_100M [ create_bd_port -dir I -type clk ext_clk_100M ]
  set ext_config_done [ create_bd_port -dir O ext_config_done ]
  set ext_config_selection [ create_bd_port -dir I -from 1 -to 0 ext_config_selection ]
  set ext_config_sioc [ create_bd_port -dir O ext_config_sioc ]
  set ext_config_siod [ create_bd_port -dir O ext_config_siod ]
  set ext_config_start [ create_bd_port -dir I ext_config_start ]

  # Create instance: camera
  create_hier_cell_camera [current_bd_instance .] camera

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_1 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {151.366} \
   CONFIG.CLKOUT1_PHASE_ERROR {132.063} \
   CONFIG.CLKOUT2_JITTER {200.470} \
   CONFIG.CLKOUT2_PHASE_ERROR {132.063} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {202.114} \
   CONFIG.CLKOUT3_PHASE_ERROR {132.063} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {24} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLK_OUT1_PORT {clk_100M} \
   CONFIG.CLK_OUT2_PORT {clk_25M} \
   CONFIG.CLK_OUT3_PORT {clk_24M} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {6.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {6.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {24} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {25} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_1

  # Create instance: frame_buffer, and set properties
  set frame_buffer [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 frame_buffer ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_A {Always_Enabled} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {WRITE_FIRST} \
   CONFIG.Operating_Mode_B {WRITE_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Read_Width_A {640} \
   CONFIG.Read_Width_B {640} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Use_RSTB_Pin {false} \
   CONFIG.Write_Depth_A {480} \
   CONFIG.Write_Width_A {640} \
   CONFIG.Write_Width_B {640} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $frame_buffer

  # Create instance: graphics_packaged_0, and set properties
  set graphics_packaged_0 [ create_bd_cell -type ip -vlnv utoronto.ca:user:graphics_packaged:1.0 graphics_packaged_0 ]

  # Create instance: image_proc
  create_hier_cell_image_proc [current_bd_instance .] image_proc

  # Create instance: microblaze_hier
  create_hier_cell_microblaze_hier [current_bd_instance .] microblaze_hier

  # Create instance: physics_core_0, and set properties
  set physics_core_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:physics_core:1.0 physics_core_0 ]
  set_property -dict [ list \
   CONFIG.C_S00_AXI_ADDR_WIDTH {8} \
 ] $physics_core_0

  # Create instance: reg_cdc_0, and set properties
  set block_name reg_cdc
  set block_cell_name reg_cdc_0
  if { [catch {set reg_cdc_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $reg_cdc_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {4} \
   CONFIG.IN1_WIDTH {16} \
   CONFIG.IN2_WIDTH {4} \
   CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {4} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_hier_M06_AXI [get_bd_intf_pins microblaze_hier/M06_AXI] [get_bd_intf_pins physics_core_0/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_hier_M07_AXI [get_bd_intf_pins graphics_packaged_0/S00_AXI_0] [get_bd_intf_pins microblaze_hier/M07_AXI]
  connect_bd_intf_net -intf_net microblaze_hier_usb_uart [get_bd_intf_ports usb_uart] [get_bd_intf_pins microblaze_hier/usb_uart]

  # Create port connections
  connect_bd_net -net Camera_Config_TOP_0_done [get_bd_ports ext_config_done] [get_bd_pins camera/ext_config_done]
  connect_bd_net -net Camera_Config_TOP_0_sioc [get_bd_ports ext_config_sioc] [get_bd_pins camera/ext_config_sioc]
  connect_bd_net -net Camera_Config_TOP_0_siod [get_bd_ports ext_config_siod] [get_bd_pins camera/ext_config_siod]
  connect_bd_net -net Threshold_standalone_0_row_data [get_bd_pins camera/row_data] [get_bd_pins frame_buffer/dina]
  connect_bd_net -net Threshold_standalone_0_row_data_addr [get_bd_pins camera/row_data_addr] [get_bd_pins frame_buffer/addra]
  connect_bd_net -net Threshold_standalone_0_wea [get_bd_pins camera/wea] [get_bd_pins frame_buffer/wea]
  connect_bd_net -net bram_dout_1 [get_bd_pins frame_buffer/doutb] [get_bd_pins image_proc/bram_dout]
  connect_bd_net -net camera_frame_done_out [get_bd_pins camera/frame_done_out] [get_bd_pins reg_cdc_0/in_reg]
  connect_bd_net -net clk_0_1 [get_bd_ports ext_cam_pclk] [get_bd_pins camera/ext_cam_pclk] [get_bd_pins frame_buffer/clka] [get_bd_pins reg_cdc_0/src_clk]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets clk_0_1]
  connect_bd_net -net clk_wiz_1_clk_24M [get_bd_ports ext_cam_xclk] [get_bd_pins clk_wiz_1/clk_24M]
  connect_bd_net -net clk_wiz_1_clk_25M [get_bd_pins camera/clk] [get_bd_pins clk_wiz_1/clk_25M]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net coord_valid [get_bd_pins image_proc/coord_valid] [get_bd_pins physics_core_0/ip_pc_paddle_1_valid]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets coord_valid]
  connect_bd_net -net ext_cam_rst_1 [get_bd_ports ext_cam_pwdn] [get_bd_ports ext_cam_rst]
  connect_bd_net -net ext_clk_100M_1 [get_bd_ports ext_clk_100M] [get_bd_pins clk_wiz_1/clk_in1] [get_bd_pins graphics_packaged_0/clk_100]
  connect_bd_net -net ext_config_selection_0_1 [get_bd_ports ext_config_selection] [get_bd_pins camera/ext_config_selection]
  connect_bd_net -net graphics_packaged_0_vga_b [get_bd_ports VGA_B] [get_bd_pins graphics_packaged_0/vga_b]
  connect_bd_net -net graphics_packaged_0_vga_g [get_bd_ports VGA_G] [get_bd_pins graphics_packaged_0/vga_g]
  connect_bd_net -net graphics_packaged_0_vga_hs [get_bd_ports VGA_HS] [get_bd_pins graphics_packaged_0/vga_hs]
  connect_bd_net -net graphics_packaged_0_vga_r [get_bd_ports VGA_R] [get_bd_pins graphics_packaged_0/vga_r]
  connect_bd_net -net graphics_packaged_0_vga_vs [get_bd_ports VGA_VS] [get_bd_pins graphics_packaged_0/vga_vs]
  connect_bd_net -net href_0_1 [get_bd_ports ext_cam_href] [get_bd_pins camera/ext_cam_href]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets href_0_1]
  connect_bd_net -net image_proc_bram_addr [get_bd_pins frame_buffer/addrb] [get_bd_pins image_proc/bram_addr]
  connect_bd_net -net image_proc_bram_din [get_bd_pins frame_buffer/dinb] [get_bd_pins image_proc/bram_din]
  connect_bd_net -net image_proc_bram_ena [get_bd_pins frame_buffer/enb] [get_bd_pins image_proc/bram_ena]
  connect_bd_net -net image_proc_bram_wea [get_bd_pins frame_buffer/web] [get_bd_pins image_proc/bram_wea]
  connect_bd_net -net image_proc_p_size [get_bd_pins image_proc/p_size] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net image_proc_y_out [get_bd_pins image_proc/y_out] [get_bd_pins physics_core_0/ip_pc_paddle_1_Z]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins microblaze_hier/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins clk_wiz_1/clk_100M] [get_bd_pins frame_buffer/clkb] [get_bd_pins image_proc/clk] [get_bd_pins microblaze_hier/ACLK] [get_bd_pins physics_core_0/s00_axi_aclk] [get_bd_pins reg_cdc_0/dst_clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_hier_ai_x [get_bd_pins microblaze_hier/ai_x] [get_bd_pins physics_core_0/ip_pc_paddle_2_X]
  connect_bd_net -net microblaze_hier_ai_y [get_bd_pins microblaze_hier/ai_y] [get_bd_pins physics_core_0/ip_pc_paddle_2_Z]
  connect_bd_net -net microblaze_hier_ai_z [get_bd_pins microblaze_hier/ai_z] [get_bd_pins physics_core_0/ip_pc_paddle_2_Y]
  connect_bd_net -net microblaze_hier_gpio_io_o [get_bd_pins camera/threshold_data] [get_bd_pins microblaze_hier/gpio_io_o]
  connect_bd_net -net microblaze_hier_gpio_io_o1 [get_bd_pins camera/threshold_vld] [get_bd_pins microblaze_hier/gpio_io_o1]
  connect_bd_net -net microblaze_hier_gpio_io_o2 [get_bd_pins camera/threshold_type] [get_bd_pins microblaze_hier/gpio_io_o2]
  connect_bd_net -net p_data_0_1 [get_bd_ports ext_cam_pdata] [get_bd_pins camera/ext_cam_pdata]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets p_data_0_1]
  connect_bd_net -net reg_cdc_0_out_reg [get_bd_pins image_proc/img_valid] [get_bd_pins reg_cdc_0/out_reg]
  connect_bd_net -net reset_0_1 [get_bd_ports ext_areset_n] [get_bd_ports ext_cam_rst_p] [get_bd_pins clk_wiz_1/resetn] [get_bd_pins graphics_packaged_0/reset_n] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net rst_1 [get_bd_pins image_proc/rst] [get_bd_pins rst_clk_wiz_1_100M/peripheral_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_hier/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_hier/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins camera/rst_n] [get_bd_pins microblaze_hier/ARESETN] [get_bd_pins physics_core_0/s00_axi_aresetn] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net start_config [get_bd_ports ext_config_start] [get_bd_pins camera/ext_config_start]
  connect_bd_net -net vsync_0_1 [get_bd_ports ext_cam_vsync] [get_bd_pins camera/ext_cam_vsync]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets vsync_0_1]
  connect_bd_net -net x_out [get_bd_pins image_proc/x_out] [get_bd_pins physics_core_0/ip_pc_paddle_1_X]
set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets x_out]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins physics_core_0/ip_pc_paddle_1_Y] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins physics_core_0/ip_pc_paddle_2_valid] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconstant_1/dout]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x40000000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs microblaze_hier/ai_pos_gpio/S_AXI/Reg] SEG_ai_pos_gpio_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40030000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs microblaze_hier/axi_gpio_hsv_data/S_AXI/Reg] SEG_axi_gpio_hsv_data_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40020000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs microblaze_hier/axi_gpio_hsv_type/S_AXI/Reg] SEG_axi_gpio_hsv_type_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40010000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs microblaze_hier/axi_gpio_hsv_vld/S_AXI/Reg] SEG_axi_gpio_hsv_vld_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs microblaze_hier/axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs microblaze_hier/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs graphics_packaged_0/S00_AXI_0/reg0] SEG_graphics_packaged_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Instruction] [get_bd_addr_segs microblaze_hier/microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs microblaze_hier/microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_hier/microblaze_0/Data] [get_bd_addr_segs physics_core_0/S00_AXI/S00_AXI_reg] SEG_physics_core_0_S00_AXI_reg


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


