`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/19 22:52:49
// Design Name: 
// Module Name: position
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

`timescale 1ns/1ns

module position( 
		input	        clk, 
		input	        rst_n, 
		input	        ie, 
		input           post_frame_href,
		input  [10:0]   hcnt, 
		input  [10:0]   vcnt, 
		input	        idat, 
		output reg [10:0]	x_max, 
		output reg [10:0]	x_min, 
		output reg [10:0]	y_max, 
		output reg [10:0]	y_min
);

wire comp_tc = (hcnt  == 11'd0) && post_frame_href; //该模块是一帧执行一次
			
		
reg [10:0] x_maxr; 

always @( posedge clk  or  negedge rst_n)  //求取最右边的像素位置
	if (!rst_n) 
		x_maxr <= 0;
	else if(comp_tc) 
		x_maxr <= 0;
	else if(ie == 1) 
		begin
			if ((idat == 1'b1) && (x_maxr <= hcnt))
				x_maxr <= hcnt;
			else
				x_maxr <= x_maxr;
		end		

reg [10:0] x_minr;

always @( posedge clk or negedge rst_n)
	if (!rst_n)
		//x_minr <= 11'd640;   //640->64
		x_minr<=11'd480;
	else  if(comp_tc)
		//x_minr <= 11'd640;   //640->64
		x_minr<=11'd480;
	else  if(ie == 1) 
		begin
			if ((idat == 1'b1)&&(x_minr > hcnt )) //求取最左边的像素位置
				x_minr <= hcnt;
			else
				x_minr <= x_minr;
		end

reg [10:0] y_maxr;
always @( posedge clk  or  negedge rst_n)
	if (!rst_n)
		y_maxr <= 0;
	else  if(comp_tc)
		y_maxr <= 0;
	else  if(ie)
		begin
			if ((idat == 1'b1)&&(y_maxr <= vcnt )) //求取最下边的像素位置
				y_maxr <= vcnt;
			else
				y_maxr <= y_maxr;
		end

reg [10:0]y_minr;

always @( posedge clk  or  negedge rst_n) 
	if (!rst_n)
		//y_minr <= 11'd480;  //480->48
		y_minr<=11'd272;
	else  if(comp_tc)
		//y_minr <= 11'd480;  //480->48
		y_minr<=11'd272;
	else  if(ie)
		begin
			if ((idat == 1'b1)&&(y_minr > vcnt)) //求取最上边的像素位置
				y_minr <= vcnt;
			else
				y_minr <= y_minr;
		end
	
//reg [10:0]x_max,y_max,x_min,y_min; 

always @( posedge clk  or  negedge rst_n)
	if (!rst_n) 
		begin
			x_max <= 0;
			y_max <= 0;
			x_min <= 0;
			y_min <= 0;
		end
	else  if(comp_tc)  //第二帧来的时候，将上一帧算的x_maxr等值赋给x_max
		begin
			x_max <= x_maxr;
			y_max <= y_maxr;
			x_min <= x_minr;
			y_min <= y_minr;
		end		

//ila_pos ila_pos_inst (
//	.clk(clk), // input wire clk
//
//	.probe0(ie), // input wire [0:0]  probe0  
//	.probe1(post_frame_href), // input wire [0:0]  probe1 
//	.probe2(hcnt), // input wire [10:0]  probe2 
//	.probe3(vcnt), // input wire [10:0]  probe3 
//	.probe4(idat), // input wire [0:0]  probe4 
//	.probe5(x_max), // input wire [10:0]  probe5 
//	.probe6(x_min), // input wire [10:0]  probe6 
//	.probe7(y_max), // input wire [10:0]  probe7 
//	.probe8(y_min) // input wire [10:0]  probe8
//);
		
endmodule 
