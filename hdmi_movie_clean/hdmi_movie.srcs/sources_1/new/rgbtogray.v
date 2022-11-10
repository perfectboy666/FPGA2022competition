module	rgbtogray(
		input		wire					sclk,
		input		wire					rst_n,
		input		wire					rgb_dvalid,
		input		wire	[15:0]	rgb_data,
		input		wire					rgb_lcd_dvalid,
		input		wire					rgb_hsync,
		input		wire					rgb_vsync,
		output	wire					gray_lcd_dvalid,
		output	wire					gray_hsync,
		output	wire					gray_vsync,
		output	wire	[7:0]		gray_data,
		output	wire					gray_dvalid
);

reg		[15:0]	rgb_r_mul;
reg		[15:0]	rgb_g_mul;
reg		[15:0]	rgb_b_mul;
reg		[15:0]	img_y0;
reg		[7:0]		img_y1;
reg		[2:0]		rgb_lcd_dvalid_delay;
reg		[2:0]		rgb_hsync_delay;
reg		[2:0]		rgb_vsync_delay;
reg		[2:0]		rgb_dvalid_delay;
wire	[7:0]		rgb_r;
wire	[7:0]		rgb_g;
wire	[7:0]		rgb_b;

assign	rgb_r	=	{rgb_data[15:11],rgb_data[13:11]};
assign	rgb_g	=	{rgb_data[10:5],rgb_data[6:5]};
assign	rgb_b	=	{rgb_data[4:0],rgb_data[2:0]};

//rgb_mul

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				begin
					rgb_r_mul<=16'b0;
					rgb_g_mul<=16'b0;
					rgb_b_mul<=16'b0;
				end
			else
				begin
					rgb_r_mul<=rgb_r*8'd77;
					rgb_g_mul<=rgb_g*8'd150;
					rgb_b_mul<=rgb_b*8'd29;
				end
		end
		
//img_y0
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				img_y0<=16'b0;
			else
				img_y0<=rgb_r_mul+rgb_g_mul+rgb_b_mul;
		end
		
//img_y1
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				img_y1<=8'b0;
			else
				img_y1<=img_y0[15:8];
		end

assign	gray_data	=	img_y1;

//gray_lcd_dvalid

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rgb_lcd_dvalid_delay<=3'b0;
			else
				rgb_lcd_dvalid_delay<={rgb_lcd_dvalid_delay[1:0],rgb_lcd_dvalid};
		end
		
assign	gray_lcd_dvalid	=	rgb_lcd_dvalid_delay[2];

//gray_hsync

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rgb_hsync_delay<=3'b0;
			else
				rgb_hsync_delay<={rgb_hsync_delay[1:0],rgb_hsync};
		end
		
assign	gray_hsync	=	rgb_hsync_delay[2];

//gray_vsync

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rgb_vsync_delay<=3'b0;
			else
				rgb_vsync_delay<={rgb_vsync_delay[1:0],rgb_vsync};
		end
		
assign	gray_vsync	=	rgb_vsync_delay[2];

//gray_dvalid

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rgb_dvalid_delay<=3'b0;
			else
				rgb_dvalid_delay<={rgb_dvalid_delay[1:0],rgb_dvalid};
		end
		
assign	gray_dvalid	=	rgb_dvalid_delay[2];

endmodule