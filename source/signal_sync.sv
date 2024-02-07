`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leo Shen
// 
// Create Date: 04/15/2022 11:46:39 AM
// Design Name: 
// Module Name: 
// Project Name: signal sync
// Target Devices: 
// Tool Versions: 
// Description: handle the signal crossing from one clock to the other clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module signal_sync    (                      
                       input  logic  sig_in
                      ,input  logic  clk_b          // Clock B
                      ,input  logic  rst_b          // Reset B
                      ,output logic  sig_sync       // Signal out on domain B
                      ,output logic  pulse_sync     // pulse out on domain B
                      );

(* preserve *) logic sig_b1;
(* preserve *) logic sig_b2;                       
logic sig_b3 ;

always_ff @ (posedge clk_b or posedge rst_b) begin
  if (rst_b) begin
    sig_b1   <= '0 ;
    sig_b2   <= '0 ;
    sig_b3   <= '0 ;
    pulse_sync <= '0 ;
  end else begin
    sig_b1   <= sig_in  ;
    sig_b2   <= sig_b1  ;
    sig_b3   <= sig_b2  ;
    pulse_sync  <= ~sig_b3 & sig_b2 ; // rising edge
  end
end 

assign sig_sync = sig_b2;

endmodule