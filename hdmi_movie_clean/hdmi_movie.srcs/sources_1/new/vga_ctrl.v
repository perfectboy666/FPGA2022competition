module	vga_ctrl(
		input			wire					sclk,
		input			wire					rst_n,
		input			wire	[15:0]	img_data,
		output		wire					vga_hsync,
		output		wire					vga_vsync,
		output		wire	[15:0]	vga_dout,
		output		wire					lcd_dvalid,
		output		wire					h_active,
		output		wire					v_active,
		output		wire					data_req,
		output		wire					vga_frame_start,
		input			wire					rd_ack
);

(*KEEP="TRUE"*)reg		[15:0]	h_cnt;
(*KEEP="TRUE"*)reg		[15:0]	v_cnt;
//reg						vga_en;
reg						lcd_dvalid_reg;
reg						vga_frame_start_reg;
reg						vga_frame_start_d;
reg						rd_ack_sys0;
reg						rd_ack_sys1;
reg						rd_ack_sys2;
wire					h_req;
wire					v_req;
wire					h_valid;
wire					v_valid;
wire					rd_ack_pos;

reg						vga_vsync_d;
(*KEEP="TRUE"*)reg		[63:0]	vga_frame_cnt;
(*KEEP="TRUE"*)reg		[15:0]	vga_sum;
(*KEEP="TRUE"*)wire					vga_vsync_pos;

//ila_0 ila_0_inst (
//	.clk(sclk), // input wire clk
//
//
//	.probe0(h_cnt), // input wire [15:0]  probe0  
//	.probe1(v_cnt), // input wire [15:0]  probe1 
//	.probe2(lcd_dvalid), // input wire [0:0]  probe2 
//	.probe3(vga_hsync), // input wire [0:0]  probe3 
//	.probe4(vga_vsync) // input wire [0:0]  probe4
//);

//640x480 60HZ

//parameter		h_total_time	=	16'd800;
//parameter		h_sync_time		=	16'd96;
//parameter		h_back_porch	=	16'd40;
//parameter		h_addr_time		=	16'd640;
//parameter		v_total_time	=	16'd525;
//parameter		v_addr_time		=	16'd480;
//parameter		v_sync_time		=	16'd2;
//parameter		v_back_porch	=	16'd25;

//480x272 60HZ

parameter		h_total_time	=	16'd525;
parameter		h_sync_time		=	16'd41;
parameter		h_back_porch	=	16'd2;
parameter		h_addr_time		=	16'd480;
parameter		v_total_time	=	16'd286;
parameter		v_addr_time		=	16'd272;
parameter		v_sync_time		=	16'd10;
parameter		v_back_porch	=	16'd2;

//parameter		h_move				=	11'd150;
//parameter		v_move				=	10'd50;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					rd_ack_sys0<=1'b0;
					rd_ack_sys1<=1'b0;
					rd_ack_sys2<=1'b0;
				end
			else
				begin
					rd_ack_sys0<=rd_ack;
					rd_ack_sys1<=rd_ack_sys0;
					rd_ack_sys2<=rd_ack_sys1;
				end
		end
		
assign	rd_ack_pos	=	(rd_ack_sys2==1'b0	&&	rd_ack_sys1==1'b1)	?	1'b1	:	1'b0;

//h_cnt

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				h_cnt<=16'b0;
			else	if(h_cnt>=h_total_time)
				h_cnt<=16'b0;
			else
				h_cnt<=h_cnt+16'b1;
		end
		
//v_cnt

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				v_cnt<=16'b0;
			else	if(h_cnt>=h_total_time	&&	v_cnt>=v_total_time)
				v_cnt<=16'b0;
			else	if(h_cnt>=h_total_time)
				v_cnt<=v_cnt+16'b1;
			else
				v_cnt<=v_cnt;
		end

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				vga_frame_start_reg<=1'b0;
			else	if(h_cnt==16'b1	&&	v_cnt==16'b0)
				vga_frame_start_reg<=1'b1;
			else	if(rd_ack_pos==1'b1)
				vga_frame_start_reg<=1'b0;
			else
				vga_frame_start_reg<=vga_frame_start_reg;
		end

assign	vga_frame_start	=	vga_frame_start_reg;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				vga_vsync_d<=1'b0;
			else
				vga_vsync_d<=vga_vsync;
		end

assign	vga_vsync_pos	=	(vga_vsync==1'b1	&&	vga_vsync_d==1'b0)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				vga_frame_cnt<=64'b0;
			else	if(vga_vsync_pos==1'b1)
				vga_frame_cnt<=vga_frame_cnt+64'b1;
			else
				vga_frame_cnt<=vga_frame_cnt;
		end
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				vga_sum<=16'b0;
			else	if(vga_vsync_pos==1'b1)
				vga_sum<=16'b0;
			else	if(data_req==1'b1)
				vga_sum<=vga_sum+img_data;
			else
				vga_sum<=vga_sum;
		end

//vga_en

//always	@(posedge	sclk	or	negedge	rst_n)
//		begin
//			if(rst_n==1'b0)
//				vga_en<=1'b0;
//			else	if(data_req==1'b1)
//				vga_en<=1'b1;
//			else
//				vga_en<=1'b0;
//		end
		
//vga_hsync

assign	vga_hsync	=	(h_cnt>=h_sync_time)	?	1'b1	:	1'b0;	//640x480
//assign	vga_hsync	=	(h_cnt>=h_sync_time)	?	1'b0	:	1'b1;	

//vga_vsync

assign	vga_vsync	=	(v_cnt>=v_sync_time)	?	1'b1	:	1'b0;	//640x480
//assign	vga_vsync	=	(v_cnt>=v_sync_time)	?	1'b0	:	1'b1;	

//h_req

assign	h_valid	=	((h_cnt>=(h_sync_time+h_back_porch))	&&	(h_cnt<(h_sync_time+h_back_porch+h_addr_time)))	?	1'b1	:	1'b0;
//assign	h_req		=	((h_cnt>(h_sync_time+h_back_porch+h_move))	&&	(h_cnt<=(h_sync_time+h_back_porch+h_move+10'd200)))	?	1'b1	:	1'b0;
//assign	h_req		=	((h_cnt>11'd43)	&&	(h_cnt<=11'd523))	?	1'b1	:	1'b0;
assign	h_req		=	((h_cnt>11'd41)	&&	(h_cnt<=11'd521))	?	1'b1	:	1'b0;
//assign	h_req		=	((h_cnt>16'd136)	&&	(h_cnt<=16'd1160))	?	1'b1	:	1'b0;
//assign	h_req		=	((h_cnt>16'd96)	&&	(h_cnt<=16'd736))	?	1'b1	:	1'b0;	yuan
//assign	h_req		=	((h_cnt>16'd136)	&&	(h_cnt<=16'd776))	?	1'b1	:	1'b0;	

//v_req	

assign	v_valid	=	((v_cnt>=(v_sync_time+v_back_porch))	&&	(v_cnt<(v_sync_time+v_back_porch+v_addr_time)))	?	1'b1	:	1'b0;
//assign	v_req		=	((v_cnt>=(v_sync_time+v_back_porch+v_move))	&&	(v_cnt<(v_sync_time+v_back_porch+v_move+10'd200)))	?	1'b1	:	1'b0;
//assign	v_req		=	((v_cnt>10'd12)	&&	(v_cnt<=10'd284))	?	1'b1	:	1'b0;
assign	v_req		=	((v_cnt>16'd11)	&&	(v_cnt<=16'd283))	?	1'b1	:	1'b0;
//assign	v_req		=	((v_cnt>16'd34)	&&	(v_cnt<=16'd802))	?	1'b1	:	1'b0;
//assign	v_req		=	((v_cnt>16'd58)	&&	(v_cnt<=16'd778))	?	1'b1	:	1'b0;
//assign	v_req		=	((v_cnt>16'd27)	&&	(v_cnt<=16'd453))	?	1'b1	:	1'b0;

//assign	v_req		=	((v_cnt>16'd27)	&&	(v_cnt<=16'd507))	?	1'b1	:	1'b0;

//data_req

assign	data_req	=	(h_req==1'b1	&&	v_req==1'b1)	?	1'b1	:	1'b0;	

//vga_dout

//assign	vga_dout	=	(data_req==1'b1)	?	img_data	:	16'b0;
assign	vga_dout	=	(data_req==1'b1)	?	img_data	:	16'h0;
		
assign	lcd_dvalid	=	(h_valid&&v_valid==1'b1)	?	1'b1	:	1'b0;

assign	h_active	=	h_valid;
assign	v_active	=	v_valid;

endmodule