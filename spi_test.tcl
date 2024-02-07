# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: spi_test
# Generated on: Wed Feb 07 15:57:15 2024

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "test"]} {
		puts "Project test is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists test]} {
		project_open -revision test test
	} else {
		project_new -revision test test
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE EP4CE30F23C7
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 13.1
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "18:45:44  FEBRUARY 05, 2024"
	set_global_assignment -name LAST_QUARTUS_VERSION 13.1
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (VHDL)"
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT VHDL -section_id eda_simulation
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 484
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "2.5 V"
	set_global_assignment -name SDC_FILE source/test.out.sdc
	set_global_assignment -name SYSTEMVERILOG_FILE source/test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE source/sys_ctrl.sv
	set_global_assignment -name QIP_FILE ip/main_pll.qip
	set_global_assignment -name SYSTEMVERILOG_FILE source/reset_sync.sv
	set_global_assignment -name SYSTEMVERILOG_FILE source/slave_spi.sv
	set_global_assignment -name SYSTEMVERILOG_FILE source/signal_sync.sv
	set_global_assignment -name SYSTEMVERILOG_FILE source/register_bank.sv
	set_global_assignment -name SYSTEMVERILOG_FILE source/heartBeatPulse.sv
	set_global_assignment -name ENABLE_SIGNALTAP ON
	set_global_assignment -name USE_SIGNALTAP_FILE output_files/stp1.stp
	set_global_assignment -name SIGNALTAP_FILE output_files/stp1.stp
	set_global_assignment -name SLD_NODE_CREATOR_ID 110 -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_ENTITY_NAME sld_signaltap -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_RAM_BLOCK_TYPE=AUTO" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_NODE_INFO=805334528" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_POWER_UP_TRIGGER=0" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_STORAGE_QUALIFIER_INVERSION_MASK_LENGTH=0" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_ATTRIBUTE_MEM_MODE=OFF" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_STATE_FLOW_USE_GENERATED=0" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_STATE_BITS=11" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_BUFFER_FULL_STOP=1" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_CURRENT_RESOURCE_WIDTH=1" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_TRIGGER_LEVEL=1" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_TRIGGER_IN_ENABLED=0" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_TRIGGER_LEVEL_PIPELINE=1" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_ENABLE_ADVANCED_TRIGGER=1" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_DATA_BITS=82" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_TRIGGER_BITS=82" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_NODE_CRC_LOWORD=14412" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_ADVANCED_TRIGGER_ENTITY=sld_reserved_test_auto_signaltap_0_1_6b51," -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_INVERSION_MASK=00000000000000000000000000" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_INVERSION_MASK_LENGTH=26" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_SEGMENT_SIZE=4096" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_NODE_CRC_HIWORD=14038" -section_id auto_signaltap_0
	set_global_assignment -name SLD_NODE_PARAMETER_ASSIGNMENT "SLD_SAMPLE_DEPTH=4096" -section_id auto_signaltap_0
	set_global_assignment -name SLD_FILE db/stp1_auto_stripped.stp
	set_location_assignment PIN_C1 -to LED
	set_location_assignment PIN_AA11 -to ext_clk
	set_location_assignment PIN_T1 -to ext_rst_n
	set_location_assignment PIN_AA15 -to spi_clk
	set_location_assignment PIN_AA16 -to spi_cs_n
	set_location_assignment PIN_AB16 -to spi_miso
	set_location_assignment PIN_W14 -to spi_mosi
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_clk -to "sys_ctrl:sys_ctrl_inst|sys_clk" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[0] -to "register_bank:bank_0|addr[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[1] -to "register_bank:bank_0|addr[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[2] -to "register_bank:bank_0|addr[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[3] -to "register_bank:bank_0|addr[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[4] -to "register_bank:bank_0|addr[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[5] -to "register_bank:bank_0|addr[5]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[6] -to "register_bank:bank_0|addr[6]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[7] -to "register_bank:bank_0|din[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[8] -to "register_bank:bank_0|din[10]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[9] -to "register_bank:bank_0|din[11]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[10] -to "register_bank:bank_0|din[12]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[11] -to "register_bank:bank_0|din[13]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[12] -to "register_bank:bank_0|din[14]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[13] -to "register_bank:bank_0|din[15]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[14] -to "register_bank:bank_0|din[16]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[15] -to "register_bank:bank_0|din[17]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[16] -to "register_bank:bank_0|din[18]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[17] -to "register_bank:bank_0|din[19]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[18] -to "register_bank:bank_0|din[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[19] -to "register_bank:bank_0|din[20]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[20] -to "register_bank:bank_0|din[21]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[21] -to "register_bank:bank_0|din[22]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[22] -to "register_bank:bank_0|din[23]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[23] -to "register_bank:bank_0|din[24]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[24] -to "register_bank:bank_0|din[25]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[25] -to "register_bank:bank_0|din[26]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[26] -to "register_bank:bank_0|din[27]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[27] -to "register_bank:bank_0|din[28]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[28] -to "register_bank:bank_0|din[29]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[29] -to "register_bank:bank_0|din[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[30] -to "register_bank:bank_0|din[30]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[31] -to "register_bank:bank_0|din[31]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[32] -to "register_bank:bank_0|din[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[33] -to "register_bank:bank_0|din[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[34] -to "register_bank:bank_0|din[5]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[35] -to "register_bank:bank_0|din[6]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[36] -to "register_bank:bank_0|din[7]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[37] -to "register_bank:bank_0|din[8]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[38] -to "register_bank:bank_0|din[9]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[39] -to "register_bank:bank_0|dout[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[40] -to "register_bank:bank_0|dout[10]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[41] -to "register_bank:bank_0|dout[11]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[42] -to "register_bank:bank_0|dout[12]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[43] -to "register_bank:bank_0|dout[13]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[44] -to "register_bank:bank_0|dout[14]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[45] -to "register_bank:bank_0|dout[15]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[46] -to "register_bank:bank_0|dout[16]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[47] -to "register_bank:bank_0|dout[17]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[48] -to "register_bank:bank_0|dout[18]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[49] -to "register_bank:bank_0|dout[19]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[50] -to "register_bank:bank_0|dout[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[51] -to "register_bank:bank_0|dout[20]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[52] -to "register_bank:bank_0|dout[21]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[53] -to "register_bank:bank_0|dout[22]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[54] -to "register_bank:bank_0|dout[23]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[55] -to "register_bank:bank_0|dout[24]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[56] -to "register_bank:bank_0|dout[25]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[57] -to "register_bank:bank_0|dout[26]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[58] -to "register_bank:bank_0|dout[27]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[59] -to "register_bank:bank_0|dout[28]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[60] -to "register_bank:bank_0|dout[29]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[61] -to "register_bank:bank_0|dout[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[62] -to "register_bank:bank_0|dout[30]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[63] -to "register_bank:bank_0|dout[31]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[64] -to "register_bank:bank_0|dout[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[65] -to "register_bank:bank_0|dout[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[66] -to "register_bank:bank_0|dout[5]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[67] -to "register_bank:bank_0|dout[6]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[68] -to "register_bank:bank_0|dout[7]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[69] -to "register_bank:bank_0|dout[8]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[70] -to "register_bank:bank_0|dout[9]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[71] -to "slave_spi:slave_spi_i|bit_cnt[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[72] -to "slave_spi:slave_spi_i|bit_cnt[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[73] -to "slave_spi:slave_spi_i|bit_cnt[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[74] -to "slave_spi:slave_spi_i|bit_cnt[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[75] -to "slave_spi:slave_spi_i|bit_cnt[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[76] -to "slave_spi:slave_spi_i|rd" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[0] -to "register_bank:bank_0|addr[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[1] -to "register_bank:bank_0|addr[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[2] -to "register_bank:bank_0|addr[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[3] -to "register_bank:bank_0|addr[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[4] -to "register_bank:bank_0|addr[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[5] -to "register_bank:bank_0|addr[5]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[6] -to "register_bank:bank_0|addr[6]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[7] -to "register_bank:bank_0|din[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[8] -to "register_bank:bank_0|din[10]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[9] -to "register_bank:bank_0|din[11]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[10] -to "register_bank:bank_0|din[12]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[11] -to "register_bank:bank_0|din[13]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[12] -to "register_bank:bank_0|din[14]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[13] -to "register_bank:bank_0|din[15]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[14] -to "register_bank:bank_0|din[16]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[15] -to "register_bank:bank_0|din[17]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[16] -to "register_bank:bank_0|din[18]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[17] -to "register_bank:bank_0|din[19]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[18] -to "register_bank:bank_0|din[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[19] -to "register_bank:bank_0|din[20]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[20] -to "register_bank:bank_0|din[21]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[21] -to "register_bank:bank_0|din[22]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[22] -to "register_bank:bank_0|din[23]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[23] -to "register_bank:bank_0|din[24]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[24] -to "register_bank:bank_0|din[25]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[25] -to "register_bank:bank_0|din[26]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[26] -to "register_bank:bank_0|din[27]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[27] -to "register_bank:bank_0|din[28]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[28] -to "register_bank:bank_0|din[29]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[29] -to "register_bank:bank_0|din[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[30] -to "register_bank:bank_0|din[30]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[31] -to "register_bank:bank_0|din[31]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[32] -to "register_bank:bank_0|din[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[33] -to "register_bank:bank_0|din[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[34] -to "register_bank:bank_0|din[5]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[35] -to "register_bank:bank_0|din[6]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[36] -to "register_bank:bank_0|din[7]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[37] -to "register_bank:bank_0|din[8]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[38] -to "register_bank:bank_0|din[9]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[39] -to "register_bank:bank_0|dout[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[40] -to "register_bank:bank_0|dout[10]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[41] -to "register_bank:bank_0|dout[11]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[42] -to "register_bank:bank_0|dout[12]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[43] -to "register_bank:bank_0|dout[13]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[44] -to "register_bank:bank_0|dout[14]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[45] -to "register_bank:bank_0|dout[15]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[46] -to "register_bank:bank_0|dout[16]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[47] -to "register_bank:bank_0|dout[17]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[48] -to "register_bank:bank_0|dout[18]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[49] -to "register_bank:bank_0|dout[19]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[50] -to "register_bank:bank_0|dout[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[51] -to "register_bank:bank_0|dout[20]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[52] -to "register_bank:bank_0|dout[21]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[53] -to "register_bank:bank_0|dout[22]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[54] -to "register_bank:bank_0|dout[23]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[55] -to "register_bank:bank_0|dout[24]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[56] -to "register_bank:bank_0|dout[25]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[57] -to "register_bank:bank_0|dout[26]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[58] -to "register_bank:bank_0|dout[27]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[59] -to "register_bank:bank_0|dout[28]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[60] -to "register_bank:bank_0|dout[29]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[61] -to "register_bank:bank_0|dout[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[62] -to "register_bank:bank_0|dout[30]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[63] -to "register_bank:bank_0|dout[31]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[64] -to "register_bank:bank_0|dout[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[65] -to "register_bank:bank_0|dout[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[66] -to "register_bank:bank_0|dout[5]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[67] -to "register_bank:bank_0|dout[6]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[68] -to "register_bank:bank_0|dout[7]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[69] -to "register_bank:bank_0|dout[8]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[70] -to "register_bank:bank_0|dout[9]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[71] -to "slave_spi:slave_spi_i|bit_cnt[0]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[72] -to "slave_spi:slave_spi_i|bit_cnt[1]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[73] -to "slave_spi:slave_spi_i|bit_cnt[2]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[74] -to "slave_spi:slave_spi_i|bit_cnt[3]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[75] -to "slave_spi:slave_spi_i|bit_cnt[4]" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[76] -to "slave_spi:slave_spi_i|rd" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[77] -to "slave_spi:slave_spi_i|wr" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[78] -to spi_clk -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[79] -to spi_cs_n -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[80] -to spi_miso -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_trigger_in[81] -to spi_mosi -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[77] -to "slave_spi:slave_spi_i|wr" -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[78] -to spi_clk -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[79] -to spi_cs_n -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[80] -to spi_miso -section_id auto_signaltap_0
	set_instance_assignment -name CONNECT_TO_SLD_NODE_ENTITY_PORT acq_data_in[81] -to spi_mosi -section_id auto_signaltap_0
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
