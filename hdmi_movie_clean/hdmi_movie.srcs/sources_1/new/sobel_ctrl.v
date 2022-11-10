module	sobel_ctrl(
		input			wire					sclk,
		input			wire					rst_n,
		input			wire					matrix_lcd_dvalid,
		input			wire					matrix_hsync,
		input			wire					matrix_vsync,
		input			wire					matrix_dvalid,
		input			wire	[7:0]		row0_din,
		input			wire	[7:0]		row1_din,
		input			wire	[7:0]		row2_din,
		output		wire	[7:0]		sobel_odata,
		output		wire					sobel_lcd_dvalid,
		output		wire					sobel_hsync,
		output		wire					sobel_vsync
);

(*KEEP="TRUE"*)reg		[10:0]		sobel_col_cnt;
reg		[7:0]		a11;
reg		[7:0]		a12;
reg		[7:0]		a13;
reg		[7:0]		a21;
reg		[7:0]		a22;
reg		[7:0]		a23;
reg		[7:0]		a31;
reg		[7:0]		a32;
reg		[7:0]		a33;
reg						add_valid;
reg		[10:0]	gx;
reg		[10:0]	gy;
reg						gx_valid;
reg		[10:0]	gx_abs;
reg		[10:0]	gy_abs;
reg						gx_abs_valid;
reg						gxy_valid;
reg		[11:0]	gxy;
wire					sobel_ram_wen;
wire	[2:0]		sobel_shift_din;
wire	[2:0]		sobel_shift_dout;
wire	[7:0]		sobel_num;

//debug

//parameter	sobel_num	=	vio_num;	//8'd10 //picture sobel final sobel_num is 100
parameter	col_max		=	11'd480;

vio_thresh vio_thresh_inst (
  .clk(sclk),                // input wire clk
  .probe_out0(sobel_num)  // output wire [7 : 0] probe_out0
);

shift_ram_sobel shift_ram_sobel_inst (
  .D(sobel_shift_din), // input [2 : 0] d
  .CLK(sclk), // input clk
  //.CE(matrix_dvalid), // input ce
  .Q(sobel_shift_dout) // output [2 : 0] q
);

assign	sobel_shift_din	=	{matrix_lcd_dvalid,matrix_hsync,matrix_vsync};
assign	sobel_lcd_dvalid	=	sobel_shift_dout[2];
assign	sobel_hsync	=	sobel_shift_dout[1];
assign	sobel_vsync	=	sobel_shift_dout[0];

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				sobel_col_cnt<=11'b0;
			else	if(matrix_dvalid==1'b1	&&	sobel_col_cnt==col_max-11'b1)
				sobel_col_cnt<=11'b0;
			else	if(matrix_dvalid==1'b1)
				sobel_col_cnt<=sobel_col_cnt+11'b1;
			else
				sobel_col_cnt<=sobel_col_cnt;
		end
		
//add_valid

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				add_valid<=1'b0;
			else	if(matrix_dvalid==1'b1	&&	sobel_col_cnt>=11'h2)
				add_valid<=1'b1;
			else
				add_valid<=1'b0;
		end
		
//gx

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gx<=11'b0;
			else	if(add_valid==1'b1)
				gx<=a33+a23+a23+a13-a11-a21-a21-a31;
			else
				gx<=gx;
		end
		
//gy

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gy<=11'b0;
			else	if(add_valid==1'b1)
				gy<=a11+a12+a12+a13-a31-a32-a32-a33;
			else
				gy<=gy;
		end
		
//gx_valid

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gx_valid<=1'b0;
			else
				gx_valid<=add_valid;
		end
		
//gx_abs

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gx_abs<=11'b0;
			else	if(gx[10]==1'b1)
				gx_abs<=~gx+1'b1;
			else
				gx_abs<=gx;
		end
		
//gy_abs

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gy_abs<=11'b0;
			else	if(gy[10]==1'b1)
				gy_abs<=~gy+1'b1;
			else
				gy_abs<=gy;
		end
		
//gx_abs_valid

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gx_abs_valid<=1'b0;
			else
				gx_abs_valid<=gx_valid;
		end
		
//gxy_valid

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gxy_valid<=1'b0;
			else
				gxy_valid<=gx_abs_valid;
		end
		
//gxy

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				gxy<=12'b0;
			else
				gxy<=gx_abs+gy_abs;
		end
		
//sobel_result

assign	sobel_odata	=	(gxy>=sobel_num)	?	8'h0	:	8'hFF;

assign	sobel_ram_wen	=	gxy_valid;


always	@(posedge	sclk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			begin
				a12<=8'b0;
				a22<=8'b0;
				a32<=8'b0;
			end
		else	if(matrix_dvalid==1'b1)
			begin
				a12<=a11;
				a22<=a21;
				a32<=a31;
			end
		else
			begin
				a12<=a12;
				a22<=a22;
				a32<=a32;
			end
	end
	
always	@(posedge	sclk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			begin
				a13<=8'b0;
				a23<=8'b0;
				a33<=8'b0;
			end
		else	if(matrix_dvalid==1'b1)
			begin
				a13<=a12;
				a23<=a22;
				a33<=a32;
			end
		else
			begin
				a13<=a13;
				a23<=a23;
				a33<=a33;
			end
	end

always	@(*)
	begin
		if(rst_n==1'b0)
			begin
				a11=8'b0;
				a21=8'b0;
				a31=8'b0;
			end
		else	if(matrix_dvalid==1'b1)
			begin
				a11=row0_din;
				a21=row1_din;
				a31=row2_din;
			end
		else
			begin
				a11=a11;
				a21=a21;
				a31=a31;
			end
	end

endmodule