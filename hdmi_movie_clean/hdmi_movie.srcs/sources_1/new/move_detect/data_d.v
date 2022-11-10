`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/08 21:53:51
// Design Name: 
// Module Name: data_d
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


module data_d #(
	parameter delay=7
)
(
	input sclk,
	input rst_n,
	input wr_en,
	input [23:0]data,
	output  rd_en,
	output[23:0] data_de
    );

reg	[delay:0]	wr_en_r;

always@(posedge sclk or negedge rst_n)
	if(!rst_n)
		wr_en_r <= 0;
	else
		wr_en_r <= {wr_en_r[delay-1:0],wr_en};
		
//lag delay clock
assign	rd_en 	= 	wr_en_r[delay-1];	

wire full;
wire empty;
		
fifo_delay u0_fifo_delay (
  .clk(sclk),      // input wire clk
  .din(data),      // input wire [23 : 0] din
  .wr_en(wr_en),  // input wire wr_en
  .rd_en(rd_en),  // input wire rd_en
  .dout(data_de),    // output wire [23 : 0] dout
  .full(	full	),    // output wire full
  .empty(	empty)  // output wire empty
);	
	
endmodule
