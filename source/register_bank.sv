`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leo Shen
// 
// Create Date: 04/15/2022 11:46:39 AM
// Design Name: 
// Module Name: register_bank
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
module register_bank
  #(
     parameter           DWIDTH = 16
   , parameter           NUM_REG = 8
   , parameter           ALINES  = 7
   )
   (	
     input   logic                       clk 
   , input   logic                       rst     
   , input   logic                       cs                          
   , input   logic                       wr      
   , input   logic                       rd	
   , input   logic  [ALINES-1:0]         addr                        
   , input   logic  [DWIDTH-1:0]         din                         
   , input   logic  [DWIDTH*NUM_REG-1:0] dfbck              
   , output  logic  [DWIDTH*NUM_REG-1:0] regdata
   , output  logic  [NUM_REG-1:0]        decd                        
   , output  logic  [DWIDTH-1:0]         dout = '0                      
   ) ;                  

logic [DWIDTH-1:0] dfbck_packed [0:NUM_REG-1];
logic [DWIDTH-1:0] regdata_packed [0:NUM_REG-1];
genvar i;
generate 
for (i=0; i<NUM_REG; i++) begin : write2reg
  assign regdata[DWIDTH*(i+1)-1: DWIDTH*i] = regdata_packed[i];   
  assign dfbck_packed[i] = dfbck[DWIDTH*(i+1)-1: DWIDTH*i] ;   
  assign decd[i] = cs && (addr==i) ? 1'b1 : 1'b0; 
     
  always @(posedge clk or posedge rst) begin
    if (rst)
      case (i)
		1: regdata_packed[i] <= 32'h5AA55AA5; // default value of register 1
      default: regdata_packed[i] <= '0; // all other registers initialize to read all 0s
      endcase 
    else if (wr && decd[i])
      regdata_packed[i] <= din ; 
  end    
end
endgenerate

always @(posedge clk ) begin
  for (int j=0; j<NUM_REG; j++) 
    if (decd[j] & rd)    
      dout <= dfbck_packed[j];
end         
	
	
endmodule   