


module sig_delay
#(
parameter  DWIDTH      = 1   ,
parameter  DLEN        = 1   
)(
input   wire               w_clk_i   ,
input   wire               reset_i   ,
input   wire  [DWIDTH-1:0] d_i       ,
output  wire  [DWIDTH-1:0] d_o
);


reg [DWIDTH-1:0] r_d[DLEN-1:0];


integer i ;

always @(posedge w_clk_i)
begin 
    if (reset_i == 1'b0)
	begin 
        for (i=0;i<DLEN;i=i+1)
		begin 
		    r_d[i] <= 0 ; 
		end 
	end 
	else 
	begin 
	    r_d[0] <= d_i ;
        for (i=1;i<DLEN;i=i+1)
		begin 
		    r_d[i] <= r_d[i-1] ; 
		end 		
	end 
end 

assign d_o = r_d[DLEN-1];



endmodule 