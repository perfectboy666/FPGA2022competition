module sig_pdg(
		input		wire			sclk,
		input		wire			rst_n,
		input		wire			sig_in,
		output	wire			sig_pos
);

reg		sig_in_d0;
reg		sig_in_d1;

always	@(posedge	sclk	or	negedge	rst_n)
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

assign	sig_pos	=	(sig_in_d1==1'b0	&&	sig_in_d0==1'b1)	?	1'b1	:	1'b0;

endmodule
