module	cmd_ctrl(
		input			wire					sclk,
		input			wire					rst_n,
		
		input			wire					rd_trig,
		input			wire					send_done_mflag,
		input			wire					rd_ddr_packet_done,
		
		output		wire					wr_ram_wen,
		output		wire	[4:0]		wr_ram_waddr,
		output		wire	[127:0]	wr_ram_din,
		output		wire					wr_start,
		
		output		wire					rd_ram_wen,
		output		wire	[4:0]		rd_ram_waddr,
		output		wire	[127:0]	rd_ram_din,
		output		wire					rd_start,
		output		wire					vga_enable,
		output		wire					rd_ack,
		output		wire					rd_fifo_rst,
		input			wire					camera_req,
		output		wire					wr_ack,
		output		wire					wr_fifo_rst,
		input			wire					wfifo_full
);

//parameter	DDR_LAST_ADDR	=	32'd1024-32'd512;
parameter	BANK_MAX		=	4'd2;
//parameter	DDR_LAST_ADDR	=	{2'b0,1'b1,29'b0}+32'd512;

(*KEEP="TRUE"*)reg	[3:0]	r_state;
reg	[3:0]	r_state_d;
(*KEEP="TRUE"*)reg	[3:0]	wr_bank;
(*KEEP="TRUE"*)reg	[3:0]	rd_bank;

(*KEEP="TRUE"*)reg	[3:0]	r_ddr_state;

(*KEEP="TRUE"*)reg				wr_ram_wen_reg;
reg				wr_start_reg;
(*KEEP="TRUE"*)reg				rd_ddr_enable;

(*KEEP="TRUE"*)reg				rd_ram_wen_reg;
reg				rd_ram_wen_reg_d;
reg	[4:0]	rd_ram_waddr_reg;
reg				rd_start_reg;
reg				send_done_mflag_d;
reg				ddr_wr_done_d;
reg				rd_ddr_packet_done_d;
reg				rd_ack_d1;
reg				rd_ack_d2;
reg				rd_ack_d3;
reg				wr_ack_d1;
reg				wr_ack_d2;
reg				wr_ack_d3;
(*KEEP="TRUE"*)wire			ddr_wr_done;
(*KEEP="TRUE"*)wire			rd_ddr_packet_done_pos;

wire			wr_ddr_state_pos;

(*KEEP="TRUE"*)reg	[31:0]	wr_addr_start;
(*KEEP="TRUE"*)reg	[31:0]	rd_addr_start;

(*KEEP="TRUE"*)reg	[63:0]	wr_ddr_time;
(*KEEP="TRUE"*)reg	[63:0]	rd_ddr_time;

reg					rd_trig_sys0;
reg					rd_trig_sys1;
(*KEEP="TRUE"*)reg					rd_trig_sys2;
reg					rd_trig_sys3;
wire				rd_trig_pos;

reg			wfifo_full_sys0;
reg			wfifo_full_sys1;
(*KEEP="TRUE"*)reg			wfifo_full_sys2;

wire		cmd_fifo_din;
wire		cmd_fifo_rden;
wire		cmd_fifo_odata;
(*KEEP="TRUE"*)wire		cmd_fifo_full;
(*KEEP="TRUE"*)wire		cmd_fifo_empty;

(*KEEP="TRUE"*)reg	[31:0]	wr_cycle_cnt;
(*KEEP="TRUE"*)reg	[31:0]	rd_cycle_cnt;

reg		rd_fifo_rst_reg;
reg		wr_fifo_rst_reg;
wire	rd_ack_flag;
wire	wr_ack_flag;

reg	[31:0]	wr_addr_lock;

//parameter	S_IDLE			=	3'b001;
//parameter	S_WR_DDR		=	3'b010;
//parameter	S_WAIT_RD		=	3'b100;

parameter	S_IDLE			=	4'b0001;
parameter	S_WAIT			=	4'b0010;
parameter	S_WACK			=	4'b0100;
parameter	S_WR_DDR		=	4'b1000;

parameter	S_DDR_IDLE	=	4'b0001;
parameter	S_WAIT_TRIG	=	4'b0010;
parameter	S_RD_DDR		=	4'b0100;
parameter	S_RD_ACK		=	4'b1000;

assign	cmd_fifo_din	=	1'b1;

assign	rd_ack_flag	=	(r_ddr_state==S_RD_ACK)	?	1'b1	:	1'b0;
assign	wr_ack_flag	=	(r_state==S_WACK)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					rd_ack_d1<=1'b0;
					rd_ack_d2<=1'b0;
					rd_ack_d3<=1'b0;
				end
			else
				begin
					rd_ack_d1<=rd_ack_flag;
					rd_ack_d2<=rd_ack_d1;
					rd_ack_d3<=rd_ack_d2;
				end
		end
		
assign	rd_ack	=	rd_ack_flag	|	rd_ack_d1	|	rd_ack_d2	|	rd_ack_d3;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					wr_ack_d1<=1'b0;
					wr_ack_d2<=1'b0;
					wr_ack_d3<=1'b0;
				end
			else
				begin
					wr_ack_d1<=wr_ack_flag;
					wr_ack_d2<=wr_ack_d1;
					wr_ack_d3<=wr_ack_d2;
				end
		end
		
assign	wr_ack	=	wr_ack_flag	|	wr_ack_d1	|	wr_ack_d2	|	wr_ack_d3;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_cycle_cnt<=32'b0;
			else	if(r_state==S_WR_DDR	&&	ddr_wr_done==1'b1	&&	wr_bank==BANK_MAX-1)
				wr_cycle_cnt<=wr_cycle_cnt+32'b1;
			else
				wr_cycle_cnt<=wr_cycle_cnt;
		end
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_cycle_cnt<=32'b0;
			else	if(r_ddr_state==S_RD_DDR	&&	rd_ram_wen==1'b1	&&	rd_bank==BANK_MAX-1)
				rd_cycle_cnt<=rd_cycle_cnt+32'b1;
			else
				rd_cycle_cnt<=rd_cycle_cnt;
		end

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					wfifo_full_sys0<=1'b0;
					wfifo_full_sys1<=1'b0;
					wfifo_full_sys2<=1'b0;
				end
			else
				begin
					wfifo_full_sys0<=wfifo_full;
					wfifo_full_sys1<=wfifo_full_sys0;
					wfifo_full_sys2<=wfifo_full_sys1;
				end
		end

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					rd_trig_sys0<=1'b0;
					rd_trig_sys1<=1'b0;
					rd_trig_sys2<=1'b0;
					rd_trig_sys3<=1'b0;
				end
			else
				begin
					rd_trig_sys0<=rd_trig;
					rd_trig_sys1<=rd_trig_sys0;
					rd_trig_sys2<=rd_trig_sys1;
					rd_trig_sys3<=rd_trig_sys2;
				end
		end
		
assign	rd_trig_pos	=	(rd_trig_sys2==1'b1	&&	rd_trig_sys3==1'b0)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_fifo_rst_reg<=1'b0;
			else	if(r_ddr_state==S_RD_ACK	&&	rd_trig_sys3==1'b0)
				rd_fifo_rst_reg<=1'b0;
			else	if(r_ddr_state==S_RD_ACK)
				rd_fifo_rst_reg<=1'b1;	
			else
				rd_fifo_rst_reg<=1'b0;
		end

assign	rd_fifo_rst	=	rd_fifo_rst_reg;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_fifo_rst_reg<=1'b0;
			else	if(r_state==S_WACK	&&	camera_req==1'b0)
				wr_fifo_rst_reg<=1'b0;
			else	if(r_state==S_WACK)
				wr_fifo_rst_reg<=1'b1;	
			else
				wr_fifo_rst_reg<=1'b0;
		end

assign	wr_fifo_rst	=	wr_fifo_rst_reg;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				r_state<=S_IDLE;
			else
				begin
					case(r_state)
						S_IDLE:
								r_state<=S_WAIT;
						S_WAIT:
								begin
									if(camera_req==1'b1)
										r_state<=S_WACK;
									else
										r_state<=S_WAIT;
								end
						S_WACK:
								begin
									if(camera_req==1'b0)
										r_state<=S_WR_DDR;
									else
										r_state<=S_WACK;
								end
						S_WR_DDR:
								begin
									if(ddr_wr_done==1'b1)
										r_state<=S_WAIT;
									else
										r_state<=S_WR_DDR;
								end
						default:
								r_state<=S_IDLE;
					endcase
				end
		end
		
		
//always	@(posedge	sclk	or	negedge	rst_n)
//		begin
//			if(rst_n==1'b0)
//				r_state<=S_IDLE;
//			else
//				begin
//					case(r_state)
//						S_IDLE:
//								r_state<=S_WR_DDR;
//						S_WR_DDR:
//								begin
//									if(ddr_wr_done==1'b1	&&	wr_bank==BANK_MAX-1)
//										r_state<=S_WAIT_RD;
//									else
//										r_state<=S_WR_DDR;
//								end
//						S_WAIT_RD:
//								begin
//									if(rd_ram_wen==1'b1	&&	rd_bank==BANK_MAX-1)
//										r_state<=S_WR_DDR;
//									else
//										r_state<=S_WAIT_RD;
//								end
//						default:
//								r_state<=S_IDLE;
//					endcase
//				end
//		end

always	@(posedge	sclk	or negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_addr_lock<=32'b0;
			else	if(wr_ram_wen==1'b1)
				wr_addr_lock<=wr_addr_start;
			else
				wr_addr_lock<=wr_addr_lock;
		end
		
always	@(posedge	sclk	or negedge	rst_n)
		begin
			if(rst_n==1'b0)
				r_state_d<=S_IDLE;
			else
				r_state_d<=r_state;
		end

//assign	wr_ddr_state_pos	=	(r_state[1]==1'b1	&&	r_state_d[1]==1'b0)	?	1'b1	:	1'b0;
assign	wr_ddr_state_pos	=	(r_state==S_WR_DDR	&&	r_state_d==S_WACK)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or negedge	rst_n)
		begin
			if(rst_n==1'b0)
				send_done_mflag_d<=1'b0;
			else
				send_done_mflag_d<=send_done_mflag;
		end
		
assign	ddr_wr_done	=	(send_done_mflag_d==1'b0	&&	send_done_mflag==1'b1)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_ram_wen_reg<=1'b0;
			else	if(wr_ddr_state_pos==1'b1)//else	if(wr_ddr_state_pos==1'b1	||	(ddr_wr_done==1'b1	&&	wr_bank!=BANK_MAX-1	&&	r_state==S_WR_DDR))
				wr_ram_wen_reg<=1'b1;
			else
				wr_ram_wen_reg<=1'b0;
		end
		
assign	wr_ram_wen	=	wr_ram_wen_reg;
		
assign	wr_ram_waddr	=	5'b0;
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_start_reg<=1'b0;
			else
				wr_start_reg<=wr_ram_wen;
		end
		
assign	wr_start	=	wr_start_reg;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_bank<=4'b0;
			else	if(r_state==S_WR_DDR	&&	ddr_wr_done==1'b1	&&	wr_bank==BANK_MAX-1)
				wr_bank<=4'b0;
			else	if(r_state==S_WR_DDR	&&	ddr_wr_done==1'b1)
				wr_bank<=wr_bank+4'b1;
			else
				wr_bank<=wr_bank;
		end
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_bank<=4'b0;
			else	if(r_ddr_state==S_RD_DDR	&&	rd_ram_wen==1'b1	&&	rd_bank==BANK_MAX-1)
				rd_bank<=4'b0;
			else	if(r_ddr_state==S_RD_DDR	&&	rd_ram_wen==1'b1)
				rd_bank<=rd_bank+4'b1;
			else
				rd_bank<=rd_bank;
		end

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ddr_enable<=1'b0;
			else	if(r_state==S_WR_DDR	&&	ddr_wr_done==1'b1	&&	wr_bank==4'd0)
				rd_ddr_enable<=1'b1;
			else
				rd_ddr_enable<=rd_ddr_enable;
		end

assign	vga_enable	=	rd_ddr_enable;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ram_wen_reg<=1'b0;
			//else	if(rd_ddr_enable==1'b1	&&	cmd_fifo_empty==1'b0	&&	r_ddr_state==S_WAIT_TRIG)
			else	if(rd_ddr_enable==1'b1	&&	rd_trig_sys3==1'b0	&&	r_ddr_state==S_RD_ACK)
				rd_ram_wen_reg<=1'b1;
			else
				rd_ram_wen_reg<=1'b0;
		end

assign	rd_ram_wen	=	rd_ram_wen_reg;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ram_wen_reg_d<=1'b0;
			else
				rd_ram_wen_reg_d<=rd_ram_wen_reg;
		end
		

		
assign	rd_ram_waddr	=	5'b0;
		
assign	rd_start	=	rd_ram_wen_reg_d;

assign	cmd_fifo_rden	=	(r_ddr_state==S_WAIT_TRIG	&&	rd_ddr_enable==1'b1	&&	cmd_fifo_empty==1'b0)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				r_ddr_state<=S_DDR_IDLE;
			else
				begin
					case(r_ddr_state)
						S_DDR_IDLE:
							r_ddr_state<=S_WAIT_TRIG;
						S_WAIT_TRIG:
							begin
								if(rd_ddr_enable==1'b1	&&	rd_trig_sys3==1'b1)
									r_ddr_state<=S_RD_ACK;
								else
									r_ddr_state<=S_WAIT_TRIG;
							end
						S_RD_ACK:
							begin
								if(rd_trig_sys3==1'b0)
									r_ddr_state<=S_RD_DDR;
								else
									r_ddr_state<=S_RD_ACK;
							end
						S_RD_DDR:
							begin
								if(rd_ddr_packet_done_pos==1'b1)
									r_ddr_state<=S_WAIT_TRIG;
								else
									r_ddr_state<=S_RD_DDR;
							end
						default:
							r_ddr_state<=S_DDR_IDLE;
					endcase
				end
		end

//always	@(posedge	sclk	or	negedge	rst_n)
//		begin
//			if(rst_n==1'b0)
//				rd_addr_start<=32'b0;
//			else	if(rd_ram_wen==1'b1	&&	rd_bank!=BANK_MAX-1)
//				rd_addr_start<=rd_addr_start+{4'b0,1'b1,27'b0};		
//			else	if(rd_ram_wen==1'b1	&&	rd_bank==BANK_MAX-1)
//				rd_addr_start<=32'b0;
//			else
//				rd_addr_start<=rd_addr_start;
//		end

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_addr_start<=32'b0;
			else	if(rd_ddr_enable==1'b1	&&	rd_trig_sys3==1'b0	&&	r_ddr_state==S_RD_ACK)
				rd_addr_start<=wr_addr_lock;		
			else
				rd_addr_start<=rd_addr_start;
		end
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ddr_packet_done_d<=1'b0;
			else
				rd_ddr_packet_done_d<=rd_ddr_packet_done;
		end

assign	rd_ddr_packet_done_pos	=	(rd_ddr_packet_done_d==1'b0	&&	rd_ddr_packet_done==1'b1)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_addr_start<=32'b0;
			else	if(r_state==S_WR_DDR	&&	wr_bank==BANK_MAX-1)
				wr_addr_start<=32'b0;
			else	if(r_state==S_WR_DDR	&&	wr_ram_wen==1'b1)
				wr_addr_start<=wr_addr_start+{4'b0,1'b1,27'b0};		
			else
				wr_addr_start<=wr_addr_start;
		end
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_ddr_time<=64'b0;
			else	if(ddr_wr_done==1'b1	&&	r_state==S_WR_DDR)
				wr_ddr_time<=64'b0;
			else
				wr_ddr_time<=wr_ddr_time+64'b1;
		end
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ddr_time<=64'b0;
			else	if(rd_ddr_packet_done_pos==1'b1	&&	rd_ddr_enable==1'b1)
				rd_ddr_time<=64'b0;
			else	if(rd_ddr_enable==1'b1)
				rd_ddr_time<=rd_ddr_time+64'b1;
			else
				rd_ddr_time<=rd_ddr_time;
		end

//assign	wr_ram_din	=	{wr_addr_start,32'd8192,32'd0,32'd0};

//assign	rd_ram_din	=	{rd_addr_start,32'd8192,32'd0,32'd0};

assign	wr_ram_din	=	{wr_addr_start,32'd261120,32'd0,32'd0};	//255KB	480x272x2B

assign	rd_ram_din	=	{rd_addr_start,32'd261120,32'd0,32'd0};	//255KB	480x272x2B

//assign	wr_ram_din	=	{wr_addr_start,32'h180000,32'd0,32'd0};	//1536KB	1024x768x2B

//assign	rd_ram_din	=	{rd_addr_start,32'h180000,32'd0,32'd0};	//1536KB	1024x768x2B

//assign	wr_ram_din	=	{wr_addr_start,32'h168000,32'd0,32'd0};	//1440KB	1024x720x2B
//assign	wr_ram_din	=	{wr_addr_start,32'h96000,32'd0,32'd0};	//1440KB	640x480x2B

//assign	rd_ram_din	=	{rd_addr_start,32'h168000,32'd0,32'd0};	//1440KB	1024x720x2B
//assign	rd_ram_din	=	{rd_addr_start,32'h96000,32'd0,32'd0};	//1440KB	640x480x2B

//cmd_fifo1x128 cmd_fifo1x128_inst (
//  .clk(sclk),      // input wire clk
//  //.rst(~rst_n),      // input wire rst
//  .din(cmd_fifo_din),      // input wire [0 : 0] din
//  .wr_en(rd_trig_pos),  // input wire wr_en
//  .rd_en(cmd_fifo_rden),  // input wire rd_en
//  .dout(cmd_fifo_odata),    // output wire [0 : 0] dout
//  .full(cmd_fifo_full),    // output wire full
//  .empty(cmd_fifo_empty)  // output wire empty
//);

//ila_2 ila_0_inst (
//	.clk(sclk), // input wire clk
//
//
//	.probe0(r_state), // input wire [3:0]  probe0  
//	.probe1(ddr_wr_done), // input wire [0:0]  probe1 
//	.probe2(wr_addr_start), // input wire [31:0]  probe2 
//	.probe3(camera_req), // input wire [0:0]  probe3 
//	.probe4(wr_ack), // input wire [0:0]  probe4 
//	.probe5(rd_ddr_enable), // input wire [0:0]  probe5 
//	.probe6(rd_addr_start), // input wire [31:0]  probe5 
//	.probe7(wr_addr_lock), // input wire [31:0]  probe5 
//	.probe8(r_ddr_state), // input wire [3:0]  probe0 
//	.probe9(wr_ram_wen), // input wire [0:0]  probe4 
//	.probe10(rd_ram_wen) // input wire [0:0]  probe4 
//);	

//ila_0 ila_0_inst (
//	.clk(sclk), // input wire clk
//
//
//	.probe0(r_state), // input wire [2:0]  probe0  
//	.probe1(ddr_wr_done), // input wire [0:0]  probe1 
//	.probe2(wr_bank), // input wire [3:0]  probe2 
//	.probe3(rd_bank), // input wire [3:0]  probe3 
//	.probe4(wr_addr_start), // input wire [31:0]  probe4 
//	.probe5(rd_addr_start), // input wire [31:0]  probe5 
//	.probe6(r_ddr_state), // input wire [2:0]  probe6 
//	.probe7(rd_ddr_enable), // input wire [0:0]  probe7 
//	.probe8(rd_trig_sys2), // input wire [0:0]  probe8 
//	.probe9(rd_ddr_packet_done_pos), // input wire [0:0]  probe9 
//	.probe10(rd_ram_wen), // input wire [0:0]  probe10 
//	.probe11(wr_ram_wen), // input wire [0:0]  probe11,
//	.probe12(wr_ddr_time), // input wire [63:0]  probe12 
//	.probe13(rd_ddr_time), // input wire [63:0]  probe13
//	.probe14(cmd_fifo_empty), // input wire [0:0]  probe14 
//	.probe15(wfifo_full_sys2) // input wire [0:0]  probe14 
//);

endmodule