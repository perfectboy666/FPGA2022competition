module	uart_data_gen(
		input		wire					sclk,
		input		wire					rst_n,
		input		wire					uart_flag,
		input		wire	[15:0]	uart_data,
		output	wire					photo_dvalid,
		output	wire	[63:0]	photo_data
);

reg		[1:0]		byte_cnt;
reg						rgb_valid_reg;
reg		[63:0]	rgb_data;

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				byte_cnt<=2'b0;
			else	if(uart_flag==1'b1	&&	byte_cnt==2'h3)
				byte_cnt<=2'b0;
			else	if(uart_flag==1'b1)
				byte_cnt<=byte_cnt+2'b1;
			else
				byte_cnt<=byte_cnt;
		end
		
//rgb_valid

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rgb_valid_reg<=1'b0;
			else	if(uart_flag==1'b1	&&	byte_cnt==2'h3)
				rgb_valid_reg<=1'b1;
			else
				rgb_valid_reg<=1'b0;
		end

//rgb_data

always	@(posedge	sclk	or	negedge	rst_n)
		begin
			if(rst_n==1'b0)
				rgb_data<=64'b0;
			else	if(uart_flag==1'b1)
				rgb_data<={rgb_data[47:0],uart_data};
			else
				rgb_data<=rgb_data;
		end

assign	photo_dvalid	=	rgb_valid_reg;
assign	photo_data		=	rgb_data;

endmodule