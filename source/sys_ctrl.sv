`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leo Shen
// 
// Create Date: 04/15/2022 11:46:39 AM
// Design Name: 
// Module Name: sys_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: clock and reset generation
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module sys_ctrl (
      input  logic ext_clk
	  ,input  logic ext_rst_n
	  ,output logic sys_rst
	  ,output logic sys_clk
     ,output logic sys_clk_led
);

logic pll_reset;
reset_sync ext_reset_sync(
           .sync_clk       (ext_clk)
          ,.clk_en         ('1)
          ,.external_rst   (~ext_rst_n)
          ,.sync_rst_out   (pll_reset)
          ,.sync_rst_out_n ()
);

logic pll_locked;
main_pll	main_pll_inst (
			.areset ( pll_reset )
		  ,.inclk0 ( ext_clk )
		  ,.c0     ( sys_clk ) // 100MHz
		  ,.locked ( pll_locked  )
);


reset_sync sys_reset_sync(
           .sync_clk       (sys_clk)
          ,.clk_en         (pll_locked)
          ,.external_rst   (pll_reset)
          ,.sync_rst_out   (sys_rst)
          ,.sync_rst_out_n ()
);

heartBeatPulse #(
    .FREQ(100000000) // Hz
) 
sys_clk_tick( 
          .clk(sys_clk)
		   ,.rst(sys_rst) 
			,.tick(sys_clk_led)
);


endmodule