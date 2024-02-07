`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leo Shen
// 
// Create Date: 04/15/2022 11:46:39 AM
// Design Name: 
// Module Name: 
// Project Name: reset_sync 
// Target Devices: 
// Tool Versions: 
// Description: use double flip-flops to sync reset to its associated clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module reset_sync        (input  logic  sync_clk          // Clock source 
                         ,input  logic  clk_en            // Clock enable/valid  
                         ,input  logic  external_rst     // External reset
                         ,output logic  sync_rst_out     // Sync Reset active high
                         ,output logic  sync_rst_out_n   // Sync Reset active low
                        );

(* preserve *) logic meta_rst_out ;
logic async_rst;
  
assign async_rst = external_rst | ~clk_en ; // if lock is lost or external reset asserted
                        
always_ff @ (posedge sync_clk or posedge async_rst) begin
  if (async_rst) begin
    sync_rst_out   <= 1'b1;
    meta_rst_out   <= 1'b1;
    sync_rst_out_n <= 1'b0;
  end else begin
    meta_rst_out   <= 1'b0;
    sync_rst_out   <= meta_rst_out ;
    sync_rst_out_n <= ~meta_rst_out ;
  end
end 


endmodule