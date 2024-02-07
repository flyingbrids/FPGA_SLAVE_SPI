## Generated SDC file "C:/Project/CycloneIV_DevKit_FPGA/source/test.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

## DATE    "Tue Feb 06 17:21:45 2024"

##
## DEVICE  "EP4CE30F23C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {ext} -period 40.000 -waveform { 0.000 20.000 } [get_ports {ext_clk}]
create_clock -name {spi_master_clk} -period 125.000 -waveform { 0.000 62.500 } [get_ports {spi_clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 4 -master_clock {ext} [get_pins {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ext}] -rise_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {ext}] -rise_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {ext}] -fall_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {ext}] -fall_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {ext}] -rise_to [get_clocks {ext}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {ext}] -fall_to [get_clocks {ext}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ext}] -rise_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {ext}] -rise_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {ext}] -fall_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {ext}] -fall_to [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {ext}] -rise_to [get_clocks {ext}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {ext}] -fall_to [get_clocks {ext}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -exclusive -group [get_clocks {sys_ctrl_inst|main_pll_inst|altpll_component|auto_generated|pll1|clk[0]}] -group [get_clocks {spi_master_clk}] 


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

