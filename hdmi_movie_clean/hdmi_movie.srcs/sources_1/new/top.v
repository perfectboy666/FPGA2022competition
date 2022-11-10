module	top(
		input		wire					clk_in,
		input		wire					rst_n,
    output	wire	[13:0]	ddr3_addr,                      
    output	wire	[2:0]		ddr3_ba,                       
    output	wire					ddr3_cas_n,                     
    output	wire					ddr3_ck_n,                      
    output	wire					ddr3_ck_p,                    
    output	wire					ddr3_cke,                     
    output	wire					ddr3_ras_n,                   
    output	wire					ddr3_reset_n,                 
    output	wire					ddr3_we_n,                    
    inout		wire	[15:0]	ddr3_dq,                      
    inout		wire	[1:0]		ddr3_dqs_n,                   
    inout		wire	[1:0]		ddr3_dqs_p,                   
		output	wire					ddr3_cs_n,                    
    output	wire	[1:0]		ddr3_dm,                      
    output	wire					ddr3_odt,
    
    input		wire					uart_rx,
    output	wire					uart_tx,
    		
		output  wire          cmos1_scl,         //cmos i2c clock
    inout   wire          cmos1_sda,         //cmos i2c data
    input   wire          cmos1_vsync,       //cmos vsync
    input   wire          cmos1_href,        //cmos hsync refrence
    input   wire          cmos1_pclk,        //cmos pxiel clock
    input  	wire	[7:0]   cmos1_d,           //cmos data
    output  wire          cmos1_reset,       //cmos reset
    
    output	wire					hdmi_clk,
		output	wire					hdmi_dvalid,
		output	wire					hdmi_hsync,
		output	wire					hdmi_vsync,
		output	wire	[7:0]		hdmi_r,
		output	wire	[7:0]		hdmi_g,
		output	wire	[7:0]		hdmi_b,
    
              
		output	wire					led0,
		output	wire					led1,
		output	wire					led2,
		output	wire					led3
);

wire	[3:0]		xdma_awlen;
wire	[3:0]		xdma_arlen;

wire					photo_dvalid;
wire	[63:0]	photo_data;

wire	[63:0]	ddr_odata;
wire					ddr_dvalid;
wire					data_fifo_ready;		

wire					clk9;
wire					clk50;
wire					clk100;
wire					clk125;
wire					clk200;
wire					vga_clk;
wire					pll_locked;

wire	[27:0]	m_axi_awaddr;
wire	[7:0]		m_axi_awlen;		//burst	len	;the number of data in one transfer
wire	[2:0]		m_axi_awsize;		//bytes number in transfer 000 1 001 2 010 4
wire	[1:0]		m_axi_awburst;  //burst type;INCR 01
wire					m_axi_awvalid;
wire					m_axi_awready;

wire	[63:0]	m_axi_wdata;
wire	[7:0]		m_axi_wstrb;
wire					m_axi_wlast;
wire					m_axi_wvalid;
wire					m_axi_wready;

wire	[3:0]		m_axi_bid;
wire	[1:0]		m_axi_bresp;  //write respones 00:ok 
wire					m_axi_bvalid;
wire					m_axi_bready;

wire	[27:0]	m_axi_araddr;
wire	[7:0]		m_axi_arlen;
wire	[2:0]		m_axi_arsize;
wire	[1:0]		m_axi_arburst;
wire					m_axi_arvalid;
wire					m_axi_arready;

wire	[3:0]		m_axi_rid;
wire	[63:0]	m_axi_rdata;
wire					m_axi_rlast;
wire	[1:0]		m_axi_rresp;
wire					m_axi_rvalid;
wire					m_axi_rready;

wire					m0_tready;
wire					m0_tvalid;
wire	[63:0]	m0_tdata;

wire					ddr_user_clk;
wire					ddr_user_rst;
wire					ddr_init_done;

wire	[15:0]	img_data;
wire					vga_req;
wire	[15:0]	vga_dout;

wire					cmos1_pack_ovalid;
wire	[15:0]	cmos1_pack_odata;

wire					initial_en;
wire					cmos1_config_done;

wire			div_clk;
wire			vga_enable;

wire	vio_odata; //default	is	0

assign	vio_odata	=	1'b1;

reg	[8:0]	div_cnt;

reg				vga_enable_sys0;
reg				vga_enable_sys1;

wire					rd_trig;
wire					ov5640_vsync_pos;

wire					wfifo_full;

wire					rd_ack;
wire					rd_fifo_rst;
wire					wr_ack;
wire					wr_fifo_rst;
wire					camera_req;

wire					lcd_dvalid;
wire					vga_hsync;
wire					vga_vsync;
wire					h_active;
wire					v_active;

wire					gray_lcd_dvalid;
wire					gray_hsync;
wire					gray_vsync;
wire	[7:0]		gray_data;
wire					gray_dvalid;

wire					mean_filter_data_valid;
wire	[7:0]		mean_filter_data;
wire					mean_filter_hsync;
wire					mean_filter_vsync;

wire	[7:0]		row1_din;
wire	[7:0]		row2_din;
wire	[7:0]		row3_din;
wire					sobel_din_valid;
wire					matrix_lcd_dvalid;
wire					matrix_hsync;
wire					matrix_vsync;

wire	[7:0]		sobel_odata;
wire					sobel_lcd_dvalid;
wire					sobel_hsync;
wire					sobel_vsync;

wire	[23:0]	move_odata;
wire					move_lcd_dvalid;
wire					move_hsync;
wire					move_vsync;

wire	[7:0]		move_thresh;

wire					speed_valid;
wire	[31:0]	speed_value;
wire					pic_mode_valid;
wire	[31:0]	pic_mode;
reg		[31:0]	pic_mode_sys0;
reg		[31:0]	pic_mode_sys1;
reg		[31:0]	pic_mode_sys2;

reg						hdmi_dvalid_r;
reg						hdmi_hsync_r;
reg						hdmi_vsync_r;

reg	[7:0]			hdmi_r_reg;
reg	[7:0]			hdmi_g_reg;
reg	[7:0]			hdmi_b_reg;

assign	m_axi_awlen	=	{4'b0,xdma_awlen};
assign	m_axi_arlen	=	{4'b0,xdma_arlen};

assign	led0	=	(ddr_init_done==1'b1)	?	1'b0	:	1'b1;
assign	led1	=	(pll_locked==1'b1)	?	1'b0	:	1'b1;
assign	led2	=	(cmos1_config_done==1'b1)	?	1'b0	:	1'b1;
assign	led3	=	(vga_enable_sys1==1'b1)	?	1'b0	:	1'b1;

assign	div_clk	=	div_cnt[8];

//vga_dout	=	{b[4:0],g[5:0],r[4:0]};

assign	vga_clk	=	clk9;

assign	hdmi_clk	=	clk9;

vio_move vio_move_inst (
  .clk(vga_clk),                // input wire clk
  .probe_out0(move_thresh)  // output wire [7 : 0] probe_out0
);

//ila_uart ila_uart_inst (
//	.clk(clk100), // input wire clk
//
//
//	.probe0(pic_mode_valid), // input wire [0:0]  probe0  
//	.probe1(pic_mode) // input wire [31:0]  probe1
//);

//ila_1 ila_1_inst (
//	.clk(vga_clk), // input wire clk
//
//
//	.probe0(sobel_lcd_dvalid), // input wire [0:0]  probe0  
//	.probe1(sobel_hsync), // input wire [0:0]  probe1 
//	.probe2(sobel_vsync), // input wire [0:0]  probe2 
//	.probe3(sobel_odata), // input wire [7:0]  probe3
//	.probe4(matrix_lcd_dvalid), // input wire [0:0]  probe0  
//	.probe5(matrix_hsync), // input wire [0:0]  probe1 
//	.probe6(matrix_vsync), // input wire [0:0]  probe2 
//	.probe7(gray_data) // input wire [7:0]  probe3
//);


always  @(posedge clk50 or negedge pll_locked) begin
        if(pll_locked == 1'b0)
        		div_cnt<=9'b0;
        else
        		div_cnt<=div_cnt+9'b1;
end

always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				begin
					vga_enable_sys0<=1'b0;
					vga_enable_sys1<=1'b0;
				end
			else
				begin
					vga_enable_sys0<=vga_enable;
					vga_enable_sys1<=vga_enable_sys0;
				end
		end

always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				begin
					pic_mode_sys0<=32'b0;
					pic_mode_sys1<=32'b0;
					pic_mode_sys2<=32'b0;
				end
			else
				begin
					pic_mode_sys0<=pic_mode;
					pic_mode_sys1<=pic_mode_sys0;
					pic_mode_sys2<=pic_mode_sys1;
				end
		end
		
always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				hdmi_dvalid_r<=1'b0;
			else	if(pic_mode_sys2==32'd0)
				hdmi_dvalid_r<=lcd_dvalid;
			else	if(pic_mode_sys2==32'd1)
				hdmi_dvalid_r<=gray_lcd_dvalid;
			else	if(pic_mode_sys2==32'd2)
				hdmi_dvalid_r<=sobel_lcd_dvalid;
			else	if(pic_mode_sys2==32'd3)
				hdmi_dvalid_r<=move_lcd_dvalid;
			else	if(pic_mode_sys2==32'd4)
				hdmi_dvalid_r<=mean_filter_data_valid;
			else
				hdmi_dvalid_r<=lcd_dvalid;
		end
		
assign	hdmi_dvalid	=	hdmi_dvalid_r;

always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				hdmi_hsync_r<=1'b0;
			else	if(pic_mode_sys2==32'd0)
				hdmi_hsync_r<=vga_hsync;
			else	if(pic_mode_sys2==32'd1)
				hdmi_hsync_r<=gray_hsync;
			else	if(pic_mode_sys2==32'd2)
				hdmi_hsync_r<=sobel_hsync;
			else	if(pic_mode_sys2==32'd3)
				hdmi_hsync_r<=move_hsync;
			else	if(pic_mode_sys2==32'd4)
				hdmi_hsync_r<=mean_filter_hsync;
			else
				hdmi_hsync_r<=vga_hsync;
		end
		
assign	hdmi_hsync	=	hdmi_hsync_r;

always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				hdmi_vsync_r<=1'b0;
			else	if(pic_mode_sys2==32'd0)
				hdmi_vsync_r<=vga_vsync;
			else	if(pic_mode_sys2==32'd1)
				hdmi_vsync_r<=gray_vsync;
			else	if(pic_mode_sys2==32'd2)
				hdmi_vsync_r<=sobel_vsync;
			else	if(pic_mode_sys2==32'd3)
				hdmi_vsync_r<=move_vsync;
			else	if(pic_mode_sys2==32'd4)
				hdmi_vsync_r<=mean_filter_vsync;
			else
				hdmi_vsync_r<=vga_vsync;
		end
		
assign	hdmi_vsync	=	hdmi_vsync_r;

always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				hdmi_r_reg<=8'b0;
			else	if(pic_mode_sys2==32'd0)
				hdmi_r_reg<={vga_dout[15:11],vga_dout[13:11]};
			else	if(pic_mode_sys2==32'd1)
				hdmi_r_reg<=gray_data;
			else	if(pic_mode_sys2==32'd2)
				hdmi_r_reg<=sobel_odata;
			else	if(pic_mode_sys2==32'd3)
				hdmi_r_reg<=move_odata[23:16];
			else	if(pic_mode_sys2==32'd4)
				hdmi_r_reg<=mean_filter_data;
			else
				hdmi_r_reg<={vga_dout[15:11],vga_dout[13:11]};
		end
		
assign	hdmi_r	=	hdmi_r_reg;

always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				hdmi_g_reg<=8'b0;
			else	if(pic_mode_sys2==32'd0)
				hdmi_g_reg<={vga_dout[10:5],vga_dout[6:5]};
			else	if(pic_mode_sys2==32'd1)
				hdmi_g_reg<=gray_data;
			else	if(pic_mode_sys2==32'd2)
				hdmi_g_reg<=sobel_odata;
			else	if(pic_mode_sys2==32'd3)
				hdmi_g_reg<=move_odata[15:8];
			else	if(pic_mode_sys2==32'd4)
				hdmi_g_reg<=mean_filter_data;
			else
				hdmi_g_reg<={vga_dout[10:5],vga_dout[6:5]};
		end
		
assign	hdmi_g	=	hdmi_g_reg;

always	@(posedge	vga_clk	or	negedge	pll_locked)
		begin
			if(pll_locked==1'b0)
				hdmi_b_reg<=8'b0;
			else	if(pic_mode_sys2==32'd0)
				hdmi_b_reg<={vga_dout[4:0],vga_dout[2:0]};
			else	if(pic_mode_sys2==32'd1)
				hdmi_b_reg<=gray_data;
			else	if(pic_mode_sys2==32'd2)
				hdmi_b_reg<=sobel_odata;
			else	if(pic_mode_sys2==32'd3)
				hdmi_b_reg<=move_odata[7:0];
			else	if(pic_mode_sys2==32'd4)
				hdmi_b_reg<=mean_filter_data;
			else
				hdmi_b_reg<={vga_dout[4:0],vga_dout[2:0]};
		end
		
assign	hdmi_b	=	hdmi_b_reg;


clock_manage clock_manage_inst
   (
    // Clock out ports
    .clk_out1(clk200),     // output clk_out1
    .clk_out2(clk100),     // output clk_out2
    .clk_out3(clk50),     // output clk_out3
    .clk_out4(clk9),     // output clk_out4
    // Status and control signals
    .locked(pll_locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in));      // input clk_in1
    
power_on_delay	power_on_delay_inst(
	.clk_50M                 (clk50),
	.reset_n                 (pll_locked),	
	.camera1_rstn            (cmos1_reset),
	.camera2_rstn            (),	
	.camera_pwnd             (),
	.initial_en              (initial_en)		
);

ov5640_cfg	ov5640_cfg_inst(
        // system signals
        .sclk                   (div_clk                ),
        .s_rst_n                (pll_locked & initial_en ),
        // IIC Interfaces
        .iic_scl                (cmos1_scl         ),
        .iic_sda                (cmos1_sda         ),
        .cfg_done								(cmos1_config_done)
);

//reg_config	reg_config_inst1(
//	.clk_25M                 (clk24),
//	.camera_rstn             (cmos1_reset),
//	.initial_en              (initial_en),		
//	.i2c_sclk                (cmos1_scl),
//	.i2c_sdat                (cmos1_sda),
//	.reg_conf_done           (cmos1_config_done),
//	.reg_index               (),
//	.clock_20k               ()
//
//);
    
ov5640_data	ov5640_data_inst(
   	.s_rst_n     	(ddr_init_done	&	cmos1_config_done	&	vio_odata),       
   	.ov5640_pclk 	(cmos1_pclk),       
   	.ov5640_href 	(cmos1_href),       
   	.ov5640_vsync	(cmos1_vsync),       
   	.ov5640_data 	(cmos1_d),       
   	.camera_pack_odata  (cmos1_pack_odata),
   	.camera_pack_ovalid (cmos1_pack_ovalid),
   	.ov5640_vsync_pos(ov5640_vsync_pos),
   	.wr_ack				(wr_ack)             
);
    
uart_data_gen	uart_data_gen_inst(
		.sclk					(cmos1_pclk),
		.rst_n				(ddr_init_done	&	vio_odata),
		.uart_flag		(cmos1_pack_ovalid),
		.uart_data		(cmos1_pack_odata),
		.photo_dvalid	(photo_dvalid),
		.photo_data   (photo_data)
);
    
data_ctrl	data_ctrl_inst(
		.sclk					(cmos1_pclk),
		.rst_n				(ddr_init_done	&	vio_odata),
		.ddr_clk			(ddr_user_clk),
		.vga_clk			(vga_clk),
		.photo_dvalid	(photo_dvalid),
		.photo_data		(photo_data),
		.m_tready			(m0_tready),
		.m_tvalid			(m0_tvalid),
		.m_tdata			(m0_tdata),
		.ddr_odata			(ddr_odata),
		.ddr_dvalid			(ddr_dvalid),
		.data_fifo_ready(data_fifo_ready),
		.rd_trig				(rd_trig),
		.ov5640_vsync_pos(ov5640_vsync_pos),
		.vga_req				(vga_req),
		.vga_data				(img_data),
		.rd_fifo_rst	(rd_fifo_rst),
		.wr_fifo_rst	(wr_fifo_rst),
		.ov5640_vsync_pos_sys_pos(camera_req) 			
);
    
xdma_v1	xdma_v1_inst(
     .mclk       (ddr_user_clk),   
     .mreset_n   (ddr_init_done	&	vio_odata),
     .aclk       (ddr_user_clk),   
     .areset_n   (ddr_init_done	&	vio_odata),
     .arid       (),
     .araddr     (m_axi_araddr),
     .arlen      (xdma_arlen),
     .arsize     (m_axi_arsize),
     .arburst    (m_axi_arburst),
     .arvalid    (m_axi_arvalid),
     .arready    (m_axi_arready),
     .rid        (m_axi_rid),
     .rresp      (m_axi_rresp),
     .rdata      (m_axi_rdata),
     .rlast      (m_axi_rlast),
     .rvalid     (m_axi_rvalid),
     .rready     (m_axi_rready),
     .awid       (),
     .awaddr     (m_axi_awaddr),
     .awlen      (xdma_awlen),
     .awsize     (m_axi_awsize),
     .awburst    (m_axi_awburst),
     .awvalid    (m_axi_awvalid),
     .awready    (m_axi_awready),
     .wid        (),
     .wdata      (m_axi_wdata),
     .wstrb      (m_axi_wstrb),
     .wlast      (m_axi_wlast),
     .wvalid     (m_axi_wvalid),
     .wready     (m_axi_wready),
     .bid        (m_axi_bid),
     .bresp      (m_axi_bresp), 
     .bvalid     (m_axi_bvalid),
     .bready     (m_axi_bready),
     .s0_tvalid  (m0_tvalid),
     .s0_tdata   (m0_tdata),
     .s0_tlast   (),
     .s0_tready  (m0_tready),                                //------axis bus master port--------
     .m0_tvalid  (ddr_dvalid),
     .m0_tdata   (ddr_odata),
     .m0_tlast   (),
     .m0_tready  (data_fifo_ready),
     .rd_trig		 (rd_trig),
     .vga_enable	(vga_enable),
     .wfifo_full	(wfifo_full),
     .rd_ack			(rd_ack),
		 .rd_fifo_rst	(rd_fifo_rst),
		 .wr_ack			(wr_ack),
		 .wr_fifo_rst	(wr_fifo_rst),
		 .camera_req	(camera_req)                     
);

ddr3_top	ddr3_top_inst(
		.ddr_clk			(clk200),
		.rst_n				(rst_n),
    .ddr3_addr		(ddr3_addr),                      
    .ddr3_ba			(ddr3_ba),                       
    .ddr3_cas_n		(ddr3_cas_n),                     
    .ddr3_ck_n		(ddr3_ck_n),                      
    .ddr3_ck_p		(ddr3_ck_p),                    
    .ddr3_cke			(ddr3_cke),                     
    .ddr3_ras_n		(ddr3_ras_n),                   
    .ddr3_reset_n	(ddr3_reset_n),                 
    .ddr3_we_n		(ddr3_we_n),                    
    .ddr3_dq			(ddr3_dq),                      
    .ddr3_dqs_n		(ddr3_dqs_n),                   
    .ddr3_dqs_p		(ddr3_dqs_p),                   
		.ddr3_cs_n		(ddr3_cs_n),                    
    .ddr3_dm			(ddr3_dm),                      
    .ddr3_odt     (ddr3_odt),
    .s_axi_awaddr	(m_axi_awaddr),
		.s_axi_awlen	(m_axi_awlen),		//burst	len	,the number of data in one transfer
		.s_axi_awsize	(m_axi_awsize),		//bytes number in transfer 000 1 001 2 010 4
		.s_axi_awburst(m_axi_awburst),  //burst type,INCR 01
		.s_axi_awlock	(1'b0),		//1'b0
		.s_axi_awcache(4'b0011),  //memory type fix 0011
		.s_axi_awprot	(3'b0),   //protection type fix 000
		.s_axi_awqos	(4'b0),    //quality of service fix 4'b0000
		.s_axi_awvalid(m_axi_awvalid),
		.s_axi_awready(m_axi_awready),
		.s_axi_wdata	(m_axi_wdata),
		.s_axi_wstrb	(m_axi_wstrb),
		.s_axi_wlast	(m_axi_wlast),
		.s_axi_wvalid	(m_axi_wvalid),
		.s_axi_wready	(m_axi_wready),
		.s_axi_bid		(m_axi_bid),
		.s_axi_bresp	(m_axi_bresp),  //write respones 00:ok 
		.s_axi_bvalid	(m_axi_bvalid),
		.s_axi_bready	(m_axi_bready),
		.s_axi_araddr	(m_axi_araddr),
		.s_axi_arlen	(m_axi_arlen),
		.s_axi_arsize	(m_axi_arsize),
		.s_axi_arburst(m_axi_arburst),
		.s_axi_arlock	(1'b0),
		.s_axi_arcache(4'b0011),
		.s_axi_arprot	(3'b0),
		.s_axi_arqos	(4'b0),
		.s_axi_arvalid(m_axi_arvalid),
		.s_axi_arready(m_axi_arready),	
		.s_axi_rid		(m_axi_rid),
		.s_axi_rdata	(m_axi_rdata),
		.s_axi_rlast	(m_axi_rlast),
		.s_axi_rresp	(m_axi_rresp),
		.s_axi_rvalid	(m_axi_rvalid),
		.s_axi_rready	(m_axi_rready),	
		.user_clk			(ddr_user_clk),
		.user_rst			(ddr_user_rst),
		.ddr_init_done(ddr_init_done)                 
);

vga_ctrl	vga_ctrl_inst(
		.sclk				(vga_clk),
		.rst_n			(ddr_init_done	&	vga_enable_sys1),
		.img_data		(img_data),
		.vga_hsync	(vga_hsync),
		.vga_vsync	(vga_vsync),
		.vga_dout		(vga_dout),
		.lcd_dvalid	(lcd_dvalid),
		.h_active		(h_active),
		.v_active		(v_active),
		.data_req   (vga_req),
		.vga_frame_start(rd_trig),
		.rd_ack			(rd_ack)
);

rgbtogray	rgbtogray_inst(
		.sclk						(vga_clk),
		.rst_n					(ddr_init_done	&	vga_enable_sys1),
		.rgb_dvalid			(vga_req),
		.rgb_data				(vga_dout),
		.rgb_lcd_dvalid	(lcd_dvalid),
		.rgb_hsync			(vga_hsync),
		.rgb_vsync			(vga_vsync),
		.gray_lcd_dvalid(gray_lcd_dvalid),
		.gray_hsync			(gray_hsync),
		.gray_vsync			(gray_vsync),
		.gray_data			(gray_data),
		.gray_dvalid    (gray_dvalid)
);

mean_filter
#(
.DATA_WIDTH ( 8 )
)mean_filter_inst
(
    .clk            (vga_clk                ),//input     pixel clk
    .reset_p        (ddr_init_done	&	vga_enable_sys1                   ),//input
    .data_in        (gray_data           ),//input     [DATA_WIDTH-1:0]
    .data_in_valid  (gray_dvalid     ),//input
    .data_in_hs     (gray_hsync        ),//input
    .data_in_vs     (gray_vsync        ),//input

    .data_out       (mean_filter_data          ),//output    [DATA_WIDTH-1:0]
    .data_out_valid (mean_filter_data_valid    ),//output reg
    .data_out_hs    (mean_filter_hsync                          ),//output reg
    .data_out_vs    (mean_filter_vsync                        ) //output reg
);

matrix_add	matrix_add_inst(
		.sclk							(vga_clk),
		.rst_n						(ddr_init_done	&	vga_enable_sys1),
		.uart_flag				(gray_dvalid),
		.uart_data				(gray_data),
		.gray_lcd_dvalid	(gray_lcd_dvalid),
		.gray_hsync				(gray_hsync),
		.gray_vsync				(gray_vsync),
		.fifo0_odata			(row2_din),
		.fifo1_odata			(row1_din),
		.row3_odata				(row3_din),
		.fifo1_ren        (sobel_din_valid),
		.matrix_lcd_dvalid(matrix_lcd_dvalid),
		.matrix_hsync			(matrix_hsync),
		.matrix_vsync			(matrix_vsync)
);

sobel_ctrl	sobel_ctrl_inst(
		.sclk							(vga_clk),
		.rst_n						(ddr_init_done	&	vga_enable_sys1),
		.matrix_lcd_dvalid(matrix_lcd_dvalid),
		.matrix_hsync			(matrix_hsync),
		.matrix_vsync			(matrix_vsync),
		.matrix_dvalid		(sobel_din_valid),
		.row0_din					(row1_din),
		.row1_din					(row2_din),
		.row2_din					(row3_din),
		.sobel_odata			(sobel_odata),
		.sobel_lcd_dvalid	(sobel_lcd_dvalid),
		.sobel_hsync			(sobel_hsync),
		.sobel_vsync      (sobel_vsync)
);

move_detect	move_detect_inst(
	//global clock
.clk							(vga_clk),  				//cmos video pixel clock
.rst_n						(ddr_init_done	&	vga_enable_sys1),				//global rst_n
	//Image data prepred to be processd
	
.v_active					(v_active),	
.h_active					(h_active),   
.Threshold				(move_thresh),    
	
.per_frame_vsync	(vga_vsync),	//Prepared Image data vsync valid signal
.per_frame_href		(vga_hsync),		//Prepared Image data href vaild  signal
.per_frame_clken	(lcd_dvalid),	//Prepared Image data output/capture enable clock
.per_img_red			({vga_dout[15:11],vga_dout[13:11]}),		//Prepared Image red data to be processed
.per_img_green		({vga_dout[10:5],vga_dout[6:5]}),		//Prepared Image green data to be processed
.per_img_blue			({vga_dout[4:0],vga_dout[2:0]}),		//Prepared Image blue data to be processed
	//Image data has been processd
.post_frame_vsync	(move_vsync),	//Processed Image data vsync valid signal
.post_frame_href	(move_hsync),	//Processed Image data href vaild  signal
.post_frame_clken	(move_lcd_dvalid),	//Processed Image data output/capture enable clock
.post_img					(move_odata)
);

frame_speed	frame_speed_inst(
.sclk							(clk100),
.camera_clk				(cmos1_pclk),
.rst_n						(pll_locked),
.camera_vsync_pos	(ov5640_vsync_pos),
.speed_valid			(speed_valid),
.speed_value			(speed_value)
);

mbs_bd	mbs_bd_inst(
.clk100	(clk100),
.rst_n	(pll_locked),
.uart_rx(uart_rx),
.uart_tx(uart_tx),
.speed_valid(speed_valid),
.speed_value(speed_value),
.pic_mode_valid	(pic_mode_valid),
.pic_mode				(pic_mode)
);

endmodule