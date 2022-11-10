module	matrix_add(
		input			wire				sclk,
		input			wire				rst_n,
		input			wire				uart_flag,
		input			wire	[7:0]	uart_data,
		input			wire				gray_lcd_dvalid,
		input			wire				gray_hsync,
		input			wire				gray_vsync,
		output		wire	[7:0]	fifo0_odata,
		output		wire	[7:0]	fifo1_odata,
		output		wire	[7:0]	row3_odata,
		output		wire				fifo1_ren,
		output		wire				matrix_lcd_dvalid,
		output		wire				matrix_hsync,
		output		wire				matrix_vsync
);

reg		[10:0]	col_cnt;
reg		[10:0]	row_cnt;
reg						dout_valid_reg;
wire					fifo0_wen;
wire	[7:0]		fifo0_din;
wire					fifo0_ren;
wire					fifo1_wen;
wire	[7:0]		fifo1_din;

reg						matrix_done;
wire					fifo_rst;	
wire	[2:0]		shift_din;
wire	[2:0]		shift_dout;


parameter	col_max	=	11'd480;
parameter	row_max	=	11'd272;

assign	shift_din	=	{gray_lcd_dvalid,gray_hsync,gray_vsync};
assign	matrix_lcd_dvalid	=	shift_dout[2];
assign	matrix_hsync	=	shift_dout[1];
assign	matrix_vsync	=	shift_dout[0];

assign	row3_odata	=	uart_data;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				col_cnt<=11'b0;
			else	if(uart_flag==1'b1	&&	col_cnt==col_max-11'b1)
				col_cnt<=11'b0;
			else	if(uart_flag==1'b1)
				col_cnt<=col_cnt+11'b1;
			else
				col_cnt<=col_cnt;
		end
		
always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				row_cnt<=8'b0;
			else	if(row_cnt==row_max-11'b1	&&	col_cnt==col_max-11'b1)
				row_cnt<=11'b0;
			else	if(col_cnt==col_max-11'b1)
				row_cnt<=row_cnt+11'b1;
			else
				row_cnt<=row_cnt;
		end
		
assign	fifo0_wen	=	(row_cnt!=row_max-11'b1)	?	uart_flag	:	1'b0;

assign	fifo0_din	=	uart_data;

assign	fifo0_ren	=	(row_cnt!=11'b0)	?	uart_flag	:	1'b0;

assign	fifo1_wen	=	(row_cnt==11'b0	||	row_cnt==row_max-11'b1)	?	1'b0:	uart_flag;

assign	fifo1_din	=	fifo0_odata;

assign	fifo1_ren	=	(row_cnt==11'b0	||	row_cnt==11'b1)	?	1'b0:	uart_flag;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				matrix_done<=1'b0;
			else	if(col_cnt==col_max-11'b1	&&	row_cnt==row_max-11'b1	&&	uart_flag==1'b1)
				matrix_done<=1'b1;
			else
				matrix_done<=1'b0;
		end
		
assign	fifo_rst	=	matrix_done;

fifo_8xcol fifo_8xcol_0 (
  .clk(sclk), // input clk
  .rst(fifo_rst), // input rst
  .din(fifo0_din), // input [7 : 0] din
  .wr_en(fifo0_wen), // input wr_en
  .rd_en(fifo0_ren), // input rd_en
  .dout(fifo0_odata), // output [7 : 0] dout
  .full(), // output full
  .empty() // output empty
);

fifo_8xcol fifo_8xcol_1 (
  .clk(sclk), // input clk
  .rst(fifo_rst), // input rst
  .din(fifo1_din), // input [7 : 0] din
  .wr_en(fifo1_wen), // input wr_en
  .rd_en(fifo1_ren), // input rd_en
  .dout(fifo1_odata), // output [7 : 0] dout
  .full(), // output full
  .empty() // output empty
);

sig_delay 
#(
.DWIDTH      ( 3  ) ,
//.DLEN        ( 1280 )  
.DLEN        ( 1602 ) 
)sig_matrix_delay(
.w_clk_i   (sclk              ),
.reset_i   (rst_n              ),
.d_i       (shift_din    ),
.d_o       (shift_dout   )
);

//shift_ram_matrix shift_ram_matrix_inst (
//  .d(shift_din), // input [2 : 0] d
//  .clk(sclk), // input clk
//  .ce(uart_flag), // input ce
//  .q(shift_dout) // output [2 : 0] q
//);

endmodule