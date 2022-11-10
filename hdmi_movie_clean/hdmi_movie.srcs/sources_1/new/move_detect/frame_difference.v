`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/19 13:46:56
// Design Name: 
// Module Name: frame_difference
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


module frame_difference(
	input 			sclk 			,           
	input 			rst_n 			, 
	input   [7:0]   Threshold		,	
	
	input 			per_vsync		,			
	input 			per_href		,			
	input			per_clken		,
	input	[7:0]	per_data		,			

	output          post_vsync 		,
	output          post_href 		,
	output			post_clken		,
	output  [7:0]   post_data 		
);

wire  	[7:0]     	Dim				;	
//reg  	[7:0]     	frame_data_sub	;	 
reg  	[8:0]     	frame_data_sub	;	 
reg  	[7:0]		data_dis		;

reg		[16:0]		addra			;
reg		[16:0]		addrb           ;

wire  		     	per_clken1		;
wire  	[23:0]     	per_data1       ;

reg		[7:0]		frame_data1		;	
wire    [7:0]		frame_data2		;

data_d #(
	.delay(6)
)
data_d_0
(
	.sclk		(sclk					),
	.rst_n		(rst_n					),
	.wr_en		(per_clken				),
	.rd_en		(per_clken1				),
	.data		({16'd0,per_data}		),	       
	.data_de     (per_data1		        )
);

ram_buf ram_buf_0 (
  .clka				(sclk		), 
  .wea				(per_clken1	), 
  .addra			(addra		), 
  .dina				(per_data1[7:0]	), 
  .clkb				(sclk		), 
  .addrb			(addrb		), 
  .doutb			(frame_data2)  
);

always@(posedge	sclk)
	if(rst_n==0)
		frame_data1	<=	'd0;
	else if(per_clken)
		frame_data1	<=	per_data;
	else
		frame_data1	<=	'd0;

always@(posedge	sclk)
	if(rst_n==0)
		addra	<=	'd0;
	else if(addra==480*272-1&&per_clken1)
		addra	<=	'd0;
	else if(per_clken1)
		addra	<= addra + 1'b1;
	else
		addra	<= addra;

always@(posedge	sclk)
	if(rst_n==0)
		addrb	<=	'd0;
	else if(addrb==480*272-1&&per_clken)
		addrb	<=	'd0;
	else if(per_clken)
		addrb	<= addrb + 1'b1;
	else
		addrb	<= addrb;

//lag 4 clocks signal sync  
reg	[2:0]	post_vsync_r;
reg	[2:0]	post_href_r;	
reg	[2:0]	post_clken_r;

always@(posedge sclk)
begin
	if(!rst_n)
		begin
		post_vsync_r <= 0;
		post_href_r <= 0;
		post_clken_r <= 0;
		end
	else
		begin
		post_vsync_r 	<= 	{post_vsync_r[1:0], 	per_vsync	};
		post_href_r 	<= 	{post_href_r[1:0], 		per_href	};
		post_clken_r 	<= 	{post_clken_r[1:0], 	per_clken	};
		end
end

assign	post_vsync 	= 	post_vsync_r[2];
assign	post_href 	= 	post_href_r[2];
assign	post_clken 	= 	post_clken_r[2];
assign	post_data 	= 	post_href ? data_dis : 0;
	
//step2
always@(posedge	sclk)
	if(rst_n==0)
		frame_data_sub	<=	'd0;
	else if(post_clken_r[0])
		frame_data_sub	<= frame_data1-frame_data2;
	else	
		frame_data_sub	<=	'd0;

//assign Dim=(frame_data_sub[7]==0)?frame_data_sub:(~frame_data_sub+1'b1);

assign Dim=(frame_data_sub[8]==0)?frame_data_sub:(~frame_data_sub+1'b1);

//always@(posedge	sclk)
//	if(rst_n==0)
//		frame_data_sub	<=	8'd0;
//	else if(frame_data_sub[7] == 0)
//		Dim	<= frame_data_sub;
//	else
//		Dim	<=	~frame_data_sub+1'b1;

	
//step3
always@(posedge	sclk) begin
	if(rst_n==0)
		data_dis	<=	'd0;
	else if(Dim >= Threshold && post_clken_r[1])
		data_dis	<= 8'd255;
	else
		data_dis	<=	0;
end		

//ila_0 u0_ila_0 (
//	.clk(sclk), // input wire clk
//
//	.probe0(per_vsync), // input wire [0:0]  probe0  
//	.probe1(per_href), // input wire [0:0]  probe1 
//	.probe2(per_clken), // input wire [0:0]  probe2 
//	.probe3(per_data), // input wire [7:0]  probe3 
//	.probe4(Threshold), // input wire [7:0]  probe4 
//	.probe5(addra), // input wire [18:0]  probe5 
//	.probe6(addrb), // input wire [18:0]  probe6 
//	.probe7(frame_data1), // input wire [7:0]  probe7 
//	.probe8(frame_data2), // input wire [7:0]  probe8 
//	.probe9(frame_data_sub), // input wire [7:0]  probe9 
//	.probe10(Dim), // input wire [7:0]  probe10 
//	.probe11(data_dis) // input wire [7:0]  probe11
//);

endmodule
