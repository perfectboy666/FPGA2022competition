module	data_ctrl(
		input			wire					sclk,
		input			wire					rst_n,
		input			wire					ddr_clk,
		input			wire					vga_clk,
		input			wire					photo_dvalid,
		input			wire	[63:0]	photo_data,
		input			wire					m_tready,
		output		wire					m_tvalid,
		output		wire	[63:0]	m_tdata,
		
		input			wire	[63:0]	ddr_odata,
		input			wire					ddr_dvalid,
		output		wire					data_fifo_ready,
		input			wire					rd_trig,
		input			wire					ov5640_vsync_pos,
		input			wire					vga_req,
		output		wire	[15:0]	vga_data,
(*KEEP="TRUE"*)		output		wire					wfifo_full,
		input			wire					rd_fifo_rst,
		input			wire					wr_fifo_rst,
		output		wire					ov5640_vsync_pos_sys_pos		
);

wire				data_sof;
wire				data_eof;

wire				ddr_sof;
wire				ddr_eof;

reg	[7:0]		packet_cnt;

reg	[15:0]	data_out_cnt;

wire				wfifo_dvalid;

wire				wfifo_empty;

wire	[63:0]	vga_fifo_din;
wire					vga_fifo_wren;
(*KEEP="TRUE"*)wire					vga_fifo_full;
(*KEEP="TRUE"*)wire					vga_fifo_empty;
wire					vga_fifo_rden;
wire	[8:0]		vga_w_data_cnt;
wire	[10:0]	vga_r_data_cnt;

wire					fifo_rst;

//debug

reg		rd_trig_sys0;
reg		rd_trig_sys1;
reg		rd_trig_sys2;
reg	[63:0]	rd_frame_cnt;
wire	rd_trig_pos;
reg	[63:0]	rd_ddr_sum;

reg		ov5640_vsync_pos_d;
reg		ov5640_vsync_pos_d1;
wire	ov5640_vsync_pos_w;
reg		ov5640_vsync_pos_sys0;
reg		ov5640_vsync_pos_sys1;
reg		ov5640_vsync_pos_sys2;

reg	[63:0]	wr_frame_cnt;
reg	[63:0]	wr_ddr_sum;
reg	[31:0]	wr_ddr_dcnt;
reg	[31:0]	rd_ddr_dcnt;

reg	[4:0]	rd_ddr_len;
//reg	[31:0]	rd_ddr_burst;
reg				vga_fifo_wren_d;
wire			vga_fifo_wren_neg;
wire			ov5640_data_trig;

assign	fifo_rst	=	~rst_n;

assign	m_tvalid	=	wfifo_dvalid	&	m_tready;

always @(posedge	ddr_clk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			data_out_cnt<=16'b0;
		else	if(m_tvalid==1'b1)
			data_out_cnt<=data_out_cnt+16'b1;
		else
			data_out_cnt<=data_out_cnt;
	end

assign	data_fifo_ready	=	~vga_fifo_full;
assign	vga_fifo_din	=	ddr_odata;
assign	vga_fifo_wren	=	ddr_dvalid	&	data_fifo_ready;


assign	vga_fifo_rden	=	vga_req	&	(~vga_fifo_empty);

//assign	data_sof	=	(vga_fifo_rden==1'b1	&&	vga_data==24'h000102)	?	1'b1	:	1'b0;
//assign	data_eof	=	(vga_fifo_rden==1'b1	&&	vga_data==24'hfdfeff)	?	1'b1	:	1'b0;

assign	ddr_sof		=	(ddr_dvalid==1'b1	&&	ddr_odata==64'h0000000102030405)	?	1'b1	:	1'b0;
assign	ddr_eof		=	(ddr_dvalid==1'b1	&&	ddr_odata==64'h0000fafbfcfdfeff)	?	1'b1	:	1'b0;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				packet_cnt<=8'b0;
			else	if(data_eof==1'b1)
				packet_cnt<=packet_cnt+8'b1;
			else
				packet_cnt<=packet_cnt;
		end
		
//debug

always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					rd_trig_sys0<=1'b0;
					rd_trig_sys1<=1'b0;
					rd_trig_sys2<=1'b0;
				end
			else
				begin
					rd_trig_sys0<=rd_trig;
					rd_trig_sys1<=rd_trig_sys0;
					rd_trig_sys2<=rd_trig_sys1;
				end
		end
		
assign	rd_trig_pos	=	(rd_trig_sys2==1'b0	&&	rd_trig_sys1==1'b1)	?	1'b1	:	1'b0;

always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ddr_sum<=63'b0;
			else	if(rd_trig_pos==1'b1)
				rd_ddr_sum<=63'b0;
			else	if(vga_fifo_wren==1'b1)
				rd_ddr_sum<=rd_ddr_sum+vga_fifo_din;
			else
				rd_ddr_sum<=rd_ddr_sum;
		end
		
always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_frame_cnt<=63'b0;
			else	if(rd_trig_pos==1'b1)
				rd_frame_cnt<=rd_frame_cnt+63'b1;
			else
				rd_frame_cnt<=rd_frame_cnt;
		end

//wr
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					ov5640_vsync_pos_d<=1'b0;
					ov5640_vsync_pos_d1<=1'b0;
				end
			else
				begin
					ov5640_vsync_pos_d<=ov5640_vsync_pos;
					ov5640_vsync_pos_d1<=ov5640_vsync_pos_d;
				end
		end
		
assign	ov5640_vsync_pos_w	=	ov5640_vsync_pos	|	ov5640_vsync_pos_d	|	ov5640_vsync_pos_d1;

always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					ov5640_vsync_pos_sys0<=1'b0;
					ov5640_vsync_pos_sys1<=1'b0;
					ov5640_vsync_pos_sys2<=1'b0;
				end
			else
				begin
					ov5640_vsync_pos_sys0<=ov5640_vsync_pos_w;
					ov5640_vsync_pos_sys1<=ov5640_vsync_pos_sys0;
					ov5640_vsync_pos_sys2<=ov5640_vsync_pos_sys1;
				end
		end
		
//assign	ov5640_vsync_pos_sys_pos	=	(ov5640_vsync_pos_sys2==1'b0	&&	ov5640_vsync_pos_sys1==1'b1)	?	1'b1	:	1'b0;

assign	ov5640_data_trig	=	(ov5640_vsync_pos_sys2==1'b0	&&	ov5640_vsync_pos_sys1==1'b1)	?	1'b1	:	1'b0;

assign	ov5640_vsync_pos_sys_pos	=	ov5640_vsync_pos_sys2;

always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_ddr_sum<=63'b0;
			else	if(ov5640_data_trig==1'b1)
				wr_ddr_sum<=63'b0;
			else	if(m_tvalid==1'b1)
				wr_ddr_sum<=wr_ddr_sum+m_tdata;
			else
				wr_ddr_sum<=wr_ddr_sum;
		end
		
always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_ddr_dcnt<=32'b0;
			else	if(ov5640_data_trig==1'b1)
				wr_ddr_dcnt<=32'b0;
			else	if(m_tvalid==1'b1)
				wr_ddr_dcnt<=wr_ddr_dcnt+32'b1;
			else
				wr_ddr_dcnt<=wr_ddr_dcnt;
		end
		
always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				wr_frame_cnt<=63'b0;
			else	if(ov5640_data_trig==1'b1)
				wr_frame_cnt<=wr_frame_cnt+63'b1;
			else
				wr_frame_cnt<=wr_frame_cnt;
		end
		
always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				vga_fifo_wren_d<=1'b0;
			else
				vga_fifo_wren_d<=vga_fifo_wren;
		end
		
assign	vga_fifo_wren_neg	=	(vga_fifo_wren_d==1'b1	&&	vga_fifo_wren==1'b0)	?	1'b1	:	1'b0;

always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ddr_len<=5'b0;
			else	if(vga_fifo_wren_neg==1'b1)
				rd_ddr_len<=5'b0;
			else	if(vga_fifo_wren==1'b1)
				rd_ddr_len<=rd_ddr_len+5'b1;
			else
				rd_ddr_len<=rd_ddr_len;
		end
		
always	@(posedge	ddr_clk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rd_ddr_dcnt<=32'b0;
			else	if(rd_trig_pos==1'b1)
				rd_ddr_dcnt<=32'b0;
			else	if(vga_fifo_wren==1'b1)
				rd_ddr_dcnt<=rd_ddr_dcnt+32'b1;
			else
				rd_ddr_dcnt<=rd_ddr_dcnt;
		end


//fifo_64x1024 fifo_64x1024_wr_inst (
//  .rst(~rst_n),        // input wire rst
//  .wr_clk(sclk),  // input wire wr_clk
//  .rd_clk(ddr_clk),  // input wire rd_clk
//  .din(photo_data),        // input wire [63 : 0] din
//  .wr_en(photo_dvalid),    // input wire wr_en
//  .rd_en(m_tvalid),    // input wire rd_en
//  .dout(m_tdata),      // output wire [63 : 0] dout
//  .full(wfifo_full),      // output wire full
//  .empty(wfifo_empty),    // output wire empty
//  .valid(wfifo_dvalid)    // output wire valid
//);

camrea_data_fifo camrea_data_fifo_inst (
	.rst(fifo_rst|	wr_fifo_rst),        // input wire rst
  .wr_clk(sclk),  // input wire wr_clk
  .rd_clk(ddr_clk),  // input wire rd_clk
  .din(photo_data),        // input wire [63 : 0] din
  .wr_en(photo_dvalid),    // input wire wr_en
  .rd_en(m_tvalid),    // input wire rd_en
  .dout(m_tdata),      // output wire [63 : 0] dout
  .full(wfifo_full),      // output wire full
  .empty(wfifo_empty),    // output wire empty
  .valid(wfifo_dvalid)    // output wire valid
);

fifo_64x1024_cnt fifo_64x1024_cnt_inst (
  .rst(fifo_rst	|	rd_fifo_rst),                      // input wire rst
  .wr_clk(ddr_clk),                // input wire wr_clk
  .rd_clk(vga_clk),                // input wire rd_clk
  .din(vga_fifo_din),                      // input wire [63 : 0] din
  .wr_en(vga_fifo_wren),                  // input wire wr_en
  .rd_en(vga_fifo_rden),                  // input wire rd_en
  .dout(vga_data),                    // output wire [15 : 0] dout
  .full(vga_fifo_full),                    // output wire full
  .empty(vga_fifo_empty),                  // output wire empty
  .rd_data_count(vga_r_data_cnt),  // output wire [10 : 0] rd_data_count
  .wr_data_count(vga_w_data_cnt)  // output wire [8 : 0] wr_data_count
);

//ila_0 ddr_sum_test (
//	.clk(ddr_clk), // input wire clk
//
//
//	.probe0(ov5640_vsync_pos_sys_pos), // input wire [0:0]  probe0  
//	.probe1(wfifo_empty), // input wire [0:0]  probe1 
//	.probe2(wr_ddr_sum), // input wire [63:0]  probe2 
//	.probe3(wr_frame_cnt), // input wire [63:0]  probe3
//	.probe4(m_tvalid), // input wire [0:0]  probe4
//	.probe5(rd_trig_pos), // input wire [0:0]  probe0  
//	.probe6(vga_fifo_full), // input wire [0:0]  probe1 
//	.probe7(rd_ddr_sum), // input wire [63:0]  probe2 
//	.probe8(rd_frame_cnt), // input wire [63:0]  probe3
//	.probe9(vga_fifo_wren), // input wire [0:0]  probe4
//	.probe10(rd_ddr_len), // input wire [4:0]  probe4
//	.probe11(wr_ddr_dcnt), // input wire [4:0]  probe4
//	.probe12(rd_ddr_dcnt) // input wire [4:0]  probe4
//);


//ila_1 ila_1_inst (
//	.clk(sclk), // input wire clk
//
//
//	.probe0(photo_dvalid), // input wire [0:0]  probe0  
//	.probe1(photo_data), // input wire [63:0]  probe1 
//	.probe2(fifo_rst), // input wire [0:0]  probe2 
//	.probe3(wfifo_full)// input wire [0:0]  probe3 
//);

//ila_1 ila_debug_rd (
//	.clk(ddr_clk), // input wire clk
//
//
//	.probe0(m_tvalid), // input wire [0:0]  probe0  
//	.probe1(m_tdata), // input wire [63:0]  probe1 
//	.probe2(wfifo_empty), // input wire [0:0]  probe2 
//	.probe3(wfifo_dvalid)// input wire [0:0]  probe3 
//);

endmodule