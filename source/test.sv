`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leo Shen
// 
// Create Date: 04/15/2022 11:46:39 AM
// Design Name: 
// Module Name: Top level of SPI transfer
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
module test (
     // external clk & reset
     input  logic ext_clk
    ,input  logic ext_rst_n
	 // SPI bus from external ARM processor
	 ,input  logic spi_clk
	 ,input  logic spi_cs_n
	 ,input  logic spi_mosi
	 ,output logic spi_miso
	 // status LED
    ,output logic LED	 
);

// system clk and reset generator
logic sys_clk, sys_rst;
sys_ctrl sys_ctrl_inst (
      .ext_clk     (ext_clk)
	  ,.ext_rst_n   (ext_rst_n)
	  ,.sys_rst     (sys_rst)
	  ,.sys_clk     (sys_clk)
     ,.sys_clk_led (LED)
);

// SPI bus interface 
logic reg_wr, reg_rd;
logic [31:0] reg_wdata;
logic [31:0] reg_rdata;
logic [6:0]  reg_addr;

slave_spi
 #( 
    .DWIDTH      ( 32    )  //each register are 32 bit long
  , .ALINES      ( 7     )  // total 2^7 = 128 registers
  )
slave_spi_i
  (
     .clk         ( sys_clk      )
   , .rst         ( sys_rst      )
   , .spi_clk     ( spi_clk      )
   , .spi_cs_n    ( spi_cs_n     )
   , .spi_mosi    ( spi_mosi     )
   , .spi_miso    ( spi_miso     )
   , .wr          ( reg_wr       )
   , .rd          ( reg_rd       )
   , .addr        ( reg_addr     )
   , .wr_data     ( reg_wdata    )
   , .rd_data     ( reg_rdata    )
  );

// register bank 
logic [32*128-1:0] top_register_data; // distribute to the application layer
logic [32*128-1:0] top_register_dfbck; // collect from the application layer

register_bank
 #( 
    .DWIDTH      ( 32    )
  , .NUM_REG     ( 128   )
  , .ALINES      ( 7     )
  )
bank_0
  (
     .clk         ( sys_clk      )
   , .rst         ( sys_rst      )
   , .cs          ( '1           )
   , .wr          ( reg_wr       )
	, .rd          ( reg_rd       )
   , .addr        ( reg_addr     )
   , .din         ( reg_wdata    )
   , .dout        ( reg_rdata    )   
   , .dfbck       ( top_register_dfbck ) 
   , .regdata     ( top_register_data )
  );
  
 // register collect and distribute
(* preserve *)logic [31:0] top_reg_data[127:0];
(* preserve *)logic [31:0] top_reg_fbck[127:0]; 
genvar g;
generate 
  for (g=0; g<128; g++) begin : pack_unpack_registers
    assign top_register_dfbck[32*g +: 32] = top_reg_fbck[g]; // collect   
    assign top_reg_data[g]                = top_register_data[32*g +: 32]; // distribute  
  end    
endgenerate

// read only register assignment 
localparam HW_REVISION = 32'h00000001;
assign top_reg_fbck [0] = HW_REVISION;

// write register wire back 
genvar k;
generate 
  for (k=1; k<128; k++) begin : register_wireback
       assign top_reg_fbck [k] = top_reg_data [k]; 
  end    
endgenerate

endmodule
  
  
  