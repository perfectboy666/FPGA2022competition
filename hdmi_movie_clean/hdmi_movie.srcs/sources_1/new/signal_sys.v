module signal_sys(
		input			wire			aclk,
		input			wire			sys_clk,
		input			wire			rst_n,
		input			wire			sig_in,
		output		wire			sys_sig_o
);

reg		sig_in_d0;
reg		sig_in_d1;
reg		sys_sig_0;
reg		sys_sig_1;

wire	sig_in_w;

always	@(posedge	aclk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			begin
				sig_in_d0<=1'b0;
				sig_in_d1<=1'b0;
			end
		else
			begin
				sig_in_d0<=sig_in;
				sig_in_d1<=sig_in_d0;
			end
	end

assign	sig_in_w	=	sig_in	|	sig_in_d0	|	sig_in_d1;

always	@(posedge	sys_clk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			begin
				sys_sig_0<=1'b0;
				sys_sig_1<=1'b0;
			end
		else
			begin
				sys_sig_0<=sig_in_w;
				sys_sig_1<=sys_sig_0;
			end
	end

assign	sys_sig_o	=	sys_sig_1;

endmodule
