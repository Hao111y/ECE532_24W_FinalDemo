################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name clk_100 -period 10 [get_ports clk_100]
create_clock -name BRAM_PORTB_clk -period 10 [get_ports BRAM_PORTB_clk]
create_clock -name BRAM_FB_A_clk -period 10 [get_ports BRAM_FB_A_clk]
create_clock -name BRAM_FB_B_clk -period 10 [get_ports BRAM_FB_B_clk]

################################################################################