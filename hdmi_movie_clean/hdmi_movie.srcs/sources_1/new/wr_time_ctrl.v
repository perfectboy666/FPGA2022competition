module	wr_time_ctrl(
input		wire											mclk,
input		wire											mreset_n,
input		wire											aclk,
input		wire											areset_n,
input		wire											start,
input		wire											ram_wen,
input		wire	[4:0]								ram_waddr,
input		wire	[127:0]							cmd_in,
input		wire											axi_ready,
input		wire	[5:0]								cmd_num_in,
input		wire											bstate_out,
output	reg												axi_wren,
output	reg	[31:0]								axi_laddr,
output	reg	[31:0]								axi_length,
output	reg												send_done_mflag
);

reg														started;
reg		[5:0]										cmd_num;
reg														ram_ren_reg;
reg		[4:0]										ram_raddr_reg;
reg														ram_ren_1;
reg														cmd_busy;
reg		[31:0]									step_cnt;
reg		[5:0]										tras_data_cnt;
reg														axi_ready_1;
reg														axi_wren_1;
reg  	[31:0]   								step_length;
reg   [31:0]          				step;
reg														send_done_delay1;
reg														bstate_out_1;
reg														bstate_out_2;
reg														tras_done_flag;
reg														bstate_neg;
reg														send_done_flag;
reg														send_done_posed;
reg		[1:0]										delay_cnt_1;
reg		[1:0]										delay_cnt_2;
reg														start_reg;
wire													axi_ready_pos;
wire													axi_wren_pos;
wire													ram_ren;
wire	[4:0]										ram_raddr;
wire	[127:0]									ram_odata;

//start_reg

always	@(posedge	mclk	or	negedge	mreset_n)
		begin
			if(mreset_n==1'b0)
				start_reg<=1'b0;
			else	if(delay_cnt_2==2'h2)
				start_reg<=1'b0;
			else	if(start==1'b1)
				start_reg<=1'b1;
			else
				start_reg<=start_reg;
		end

//delay_cnt_2

always	@(posedge	mclk	or	negedge	mreset_n)
		begin
			if(mreset_n==1'b0)
				delay_cnt_2<=2'b0;
			else	if(start_reg==1'b0)
				delay_cnt_2<=2'b0;
			else	if(start_reg==1'b1)
				delay_cnt_2<=delay_cnt_2+2'b1;
			else
				delay_cnt_2<=delay_cnt_2;
		end

//started

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				started<=1'b0;
			//else	if(send_done_flag==1'b1)
			else	if(axi_wren==1'b1	&&	tras_data_cnt==cmd_num	&&	step_cnt==step)
				started<=1'b0;
			else	if(start_reg==1'b1)
				started<=1'b1;
			else
				started<=started;
		end
		
//cmd_num

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				cmd_num<=6'b0;
			else	if(send_done_flag==1'b1)
				cmd_num<=6'b0;
			else	if(start==1'b1)
				cmd_num<=cmd_num_in;
			else
				cmd_num<=cmd_num;
		end		
		
//ram_ren

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				ram_ren_reg<=1'b0;
			else	if(ram_ren_reg==1'b1)
				ram_ren_reg<=1'b0;
			else	if(started==1'b1	&&	axi_ready==1'b1	&&	cmd_busy==1'b0)
				ram_ren_reg<=1'b1;
			else
				ram_ren_reg<=1'b0;
		end
		
assign	ram_ren	=	ram_ren_reg;

//ram_ren_1

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				begin
					ram_ren_1<=1'b0;
				end
			else
				begin
					ram_ren_1<=ram_ren;
				end
		end
		
//ram_raddr

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				ram_raddr_reg<=5'b0;
			else	if(send_done_flag==1'b1)
				ram_raddr_reg<=5'b0;
			else	if(ram_ren==1'b1)
				ram_raddr_reg<=ram_raddr_reg+5'b1;
			else
				ram_raddr_reg<=ram_raddr_reg;
		end
		
assign	ram_raddr	=	ram_raddr_reg;

//axi_laddr

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				axi_laddr<='b0;
			else	if(step_cnt==step	&&	axi_wren_pos==1'b1)
				axi_laddr<='b0;
			else	if(ram_ren_1==1'b1)
				axi_laddr<=ram_odata[127:96];//axi_laddr<=ram_odata[95:64];
			else	if(cmd_busy==1'b1	&&	axi_ready_pos==1'b1)//else	if(cmd_busy==1'b1	&&	axi_ready==1'b1)
				axi_laddr<=axi_laddr+axi_length+step_length+1'b1;
			else
				axi_laddr<=axi_laddr;
		end
		
//axi_length

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				axi_length<='b0;
			else	if(step_cnt==step	&&	axi_wren_pos==1'b1)
				axi_length<='b0;
			else	if(ram_ren_1==1'b1)
				axi_length<=ram_odata[95:64];//axi_length<=ram_odata[63:32];
			else
				axi_length<=axi_length;
		end
		
//step_length

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				step_length<='b0;
			else	if(step_cnt==step	&&	axi_wren_pos==1'b1)
				step_length<='b0;
			else	if(ram_ren_1==1'b1)
				step_length<=ram_odata[63:32];//step_length<=ram_odata[31:16];
			else
				step_length<=step_length;
		end
		
//step

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				step<='b0;
			else	if(step_cnt==step	&&	axi_wren_pos==1'b1)
				step<='b0;
			else	if(ram_ren_1==1'b1)
				step<=ram_odata[31:0];//step<=ram_odata[15:0];
			else
				step<=step;
		end
		
//axi_ready_1

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				axi_ready_1<=1'b0;
			else
				axi_ready_1<=axi_ready;
		end
		
//axi_wren_1

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				axi_wren_1<=1'b0;
			else
				axi_wren_1<=axi_wren;
		end
		
//axi_ready_pos

assign	axi_ready_pos	=	(axi_ready==1'b1	&&	axi_ready_1==1'b0)	?	1'b1	:	1'b0;

//axi_wren_pos

assign	axi_wren_pos	=	(axi_wren==1'b1	&&	axi_wren_1==1'b0)	?	1'b1	:	1'b0;
		
//step_cnt

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				step_cnt<='b0;
			else	if(step_cnt==step	&&	ram_ren_1==1'b0)
				step_cnt<='b0;
			else	if(cmd_busy==1'b1	&&	axi_ready_pos==1'b1)
				step_cnt<=step_cnt+32'b1;
			//else	if(ram_ren_1==1'b1)
				//step_cnt<=step_cnt+32'b1;
			else
				step_cnt<=step_cnt;
		end
		
//cmd_busy

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				cmd_busy<=1'b0;
			else	if(ram_ren==1'b1)
				cmd_busy<=1'b1;
			else	if(step_cnt==step	&&	axi_wren_pos==1'b1)
				cmd_busy<=1'b0;
			else
				cmd_busy<=cmd_busy;
		end
		
//axi_wren

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				axi_wren<=1'b0;
			else	if((cmd_busy==1'b1	&&	axi_ready_pos==1'b1)	||	ram_ren_1==1'b1)
				axi_wren<=1'b1;
			else
				axi_wren<=1'b0;
		end
		
//tras_data_cnt

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				tras_data_cnt<=6'b0;
			else	if(send_done_flag==1'b1)
				tras_data_cnt<=6'b0;
			else	if(ram_ren_1==1'b1)
				tras_data_cnt<=tras_data_cnt+6'b1;
			else
				tras_data_cnt<=tras_data_cnt;
		end		
		
//tras_done_flag

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				tras_done_flag<=1'b0;
			else	if(send_done_flag==1'b1)
				tras_done_flag<=1'b0;
			else	if(axi_wren==1'b1	&&	tras_data_cnt==cmd_num	&&	step_cnt==step)
				tras_done_flag<=1'b1;
			else
				tras_done_flag<=tras_done_flag;
		end

		
//send_done_flag

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				send_done_flag<=1'b0;
			else	if(tras_done_flag==1'b1	&&	bstate_neg==1'b1)
				send_done_flag<=1'b1;
			else	if(delay_cnt_1==2'h2)
				send_done_flag<=1'b0;
			else
				send_done_flag<=send_done_flag;
		end

//send_done_posed

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				send_done_posed<=1'b0;
			else	if(delay_cnt_1==2'h2)
				send_done_posed<=1'b0;
			else	if(send_done_flag==1'b1)
				send_done_posed<=1'b1;
			else
				send_done_posed<=1'b0;
		end

//delay_cnt_1
always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				delay_cnt_1<=2'b0;
			else	if(send_done_posed==1'b1)
				delay_cnt_1<=delay_cnt_1+2'b1;
			else
				delay_cnt_1<=2'b0;
		end

//send_done_flag syn

always	@(posedge	mclk	or	negedge	mreset_n)
		begin
			if(mreset_n==1'b0)
				begin
					send_done_delay1<=1'b0;
					send_done_mflag<=1'b0;
				end
			else
				begin
					send_done_delay1<=send_done_flag;
					send_done_mflag<=send_done_delay1;
				end
		end

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
				begin
					bstate_out_1<=1'b0;
					bstate_out_2<=1'b0;
				end
			else
				begin
					bstate_out_1<=bstate_out;
					bstate_out_2<=bstate_out_1;
				end
		end

//bstate_neg

always	@(posedge	aclk	or	negedge	areset_n)
		begin
			if(areset_n==1'b0)
					bstate_neg<=1'b0;
			else	if(bstate_out_1==1'b0	&&	bstate_out_2==1'b1)
					bstate_neg<=1'b1;
			else
					bstate_neg<=1'b0;
		end

xdma_cmd_ram xdma_cmd_ram_inst (
  .clka(mclk),    // input wire clka
  .wea(ram_wen),      // input wire [0 : 0] wea
  .addra(ram_waddr),  // input wire [4 : 0] addra
  .dina(cmd_in),    // input wire [127 : 0] dina
  .clkb(aclk),    // input wire clkb
  .enb(ram_ren),      // input wire enb
  .addrb(ram_raddr),  // input wire [4 : 0] addrb
  .doutb(ram_odata)  // output wire [127 : 0] doutb
);
		
endmodule
