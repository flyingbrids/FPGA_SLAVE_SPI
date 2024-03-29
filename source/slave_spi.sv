`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leo Shen
// 
// Create Date: 04/15/2022 11:46:39 AM
// Design Name: 
// Module Name: 
// Project Name: slave_spi 
// Target Devices: 
// Tool Versions: 
// Description: handle spi w/r <-> parallel data to/from register bank
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module slave_spi
  #( 
     parameter                       DWIDTH    = 16 // register data width
   , parameter                       ALINES    = 7  // register addr width
   )                                 
   ( input   logic                   clk  
   , input   logic                   rst  
   , input   logic                   spi_clk    
   , input   logic                   spi_cs_n   
   , input   logic                   spi_mosi   
   , output  logic                   spi_miso   
   , output  logic                   wr  
   , output  logic                   rd 
   , output  logic   [ALINES-1:0]    addr = '0    
   , output  logic   [DWIDTH-1:0]    wr_data
   , input   logic   [DWIDTH-1:0]    rd_data                    
   ) ;                                         
                                         
logic [$clog2(DWIDTH)-1:0] bit_cnt      ;
logic           [ALINES:0] word_cnt     ;
logic         [DWIDTH-1:0] spi_wdata_sr ;
logic         [DWIDTH-1:0] spi_rdata_sr ;
logic         [ALINES-1:0] spi_addr     ; 
logic                      reset        ; 
logic                      wr_en        ;
logic                      rd_en        ;
logic                      first_rdata  ;

enum logic [1:0] { PROC_ADDR  = 2'd0
                 , PROC_WRITE = 2'd1
                 , PROC_READ  = 2'd2      
                 } slave_spi_fsm;

always @(negedge spi_clk) begin
    spi_miso = first_rdata? rd_data[DWIDTH-1] : spi_rdata_sr[DWIDTH-1] ;
end

assign reset = spi_cs_n | rst ;

logic   [ALINES-1:0]    address; 

// State machine 
always @(posedge spi_clk or posedge reset) begin
  if (reset) begin
    slave_spi_fsm <= PROC_ADDR ;
    bit_cnt       <= '0 ; 
    word_cnt      <= '0 ; 
    spi_addr      <= '0 ;
    spi_rdata_sr  <= 1'b0 ;
    spi_wdata_sr  <= '0 ; 
    rd_en         <= 1'b0;	
    wr_en         <= 1'b0;
    address       <= '0;
    first_rdata   <= '0;
    end
  else begin
    case (slave_spi_fsm)
    
      PROC_ADDR : begin
        
        spi_addr     <= {spi_addr[ALINES-2:0], spi_mosi};
        wr_en        <= 1'b0 ; 
        spi_wdata_sr <= '0 ; 
          
        if (bit_cnt==7) begin
            bit_cnt <= '0 ; 
          if (spi_mosi) begin
            slave_spi_fsm <= PROC_READ ;
			   rd_en <= 1'b1;
			   first_rdata <= '1;
          end 
          else begin
            slave_spi_fsm <= PROC_WRITE ;
          end
        end
        else begin
          bit_cnt <= bit_cnt + 1'b1     ; 
          slave_spi_fsm <= PROC_ADDR ; 
          if (bit_cnt==6) begin
            address <= {spi_addr[ALINES-2:0], spi_mosi} ;  // latch spi address
            addr    <= {spi_addr[ALINES-2:0], spi_mosi} ; 
          end      
        end
      end           
       
      PROC_WRITE : begin
       
        bit_cnt      <= bit_cnt + 1'b1 ;
        spi_wdata_sr <= {spi_wdata_sr[DWIDTH-2:0], spi_mosi} ;        
        
        if (bit_cnt==DWIDTH-1) begin
          address       <= address + 1'b1; 
          addr          <= address;
          word_cnt      <= word_cnt + 1'b1; 
          wr_data       <= {spi_wdata_sr[DWIDTH-2:0], spi_mosi} ; 
          wr_en         <= 1'b1 ; 
          
          if (word_cnt == 2**ALINES-1) begin
            slave_spi_fsm <= PROC_ADDR ;
            end
          else begin 
            slave_spi_fsm <= PROC_WRITE ;
            end
          end
          else begin
				slave_spi_fsm <= PROC_WRITE ;
				word_cnt      <= word_cnt ;
				wr_data       <= wr_data ; 
				wr_en         <= 1'b0 ; 
          end
      end         
      
      PROC_READ : begin
        bit_cnt      <= bit_cnt + 1'b1 ;
        wr_en        <= 1'b0 ;
        spi_wdata_sr <= '0 ;         
        
        if (bit_cnt==(DWIDTH/2)-1) begin  // get data ready in the midth of spi cycle
          addr <= addr + 1'b1 ; 
		    rd_en <= 1'b1;
		  end else begin
		    rd_en <= 1'b0;		
		  end
        
        if (bit_cnt==DWIDTH-1) begin
          word_cnt      <= word_cnt + 1'b1; 
          spi_rdata_sr  <= rd_data;        
          if (word_cnt == 2**ALINES-1)
            slave_spi_fsm <= PROC_ADDR ;
        end else if (bit_cnt == 0 & first_rdata) begin
            spi_rdata_sr <= {rd_data[DWIDTH-2:0], 1'b0};
            first_rdata <= '0;
        end else begin
            spi_rdata_sr <= {spi_rdata_sr[DWIDTH-2:0], 1'b0};
        end
        
      end   
      
      default : begin
        slave_spi_fsm <= PROC_ADDR ;
        bit_cnt       <= '0        ; 
        wr_en         <= 1'b0      ; 
        rd_en         <= 1'b0      ;
        word_cnt      <= '0        ; 
        spi_addr      <= '0        ;
        wr_data       <= '0        ; 
        spi_rdata_sr  <= '0        ; 
        spi_wdata_sr  <= '0        ; 
        first_rdata   <= '0;
        end
        
    endcase
     end
  end

// multi-bit data crossing to sys_clk domain  
signal_sync reg_wr_sync (
       .sig_in(wr_en),                    
       .clk_b (clk),      
       .rst_b (rst),       
       .pulse_sync (wr)  
);

signal_sync reg_rd_sync (
       .sig_in(rd_en),                    
       .clk_b (clk),      
       .rst_b (rst),       
       .pulse_sync (rd)  
);
  
endmodule