module frame_speed(
		input		wire					sclk,
		input		wire					camera_clk,
		input		wire					rst_n,
		input		wire					camera_vsync_pos,
		output	wire					speed_valid,
		output	wire	[31:0]	speed_value
);

reg		[31:0]	cycle_cnt;
reg						add_flag;					
reg						speed_valid_r;
reg		[31:0]	speed_value_r;

wire	camera_vsync_sys;
wire	camera_vsync_sys_pos;

//ila_speed ila_speed_inst (
//	.clk(sclk), // input wire clk
//
//
//	.probe0(add_flag), // input wire [0:0]  probe0  
//	.probe1(cycle_cnt), // input wire [31:0]  probe1 
//	.probe2(speed_value), // input wire [31:0]  probe2 
//	.probe3(speed_valid), // input wire [0:0]  probe3 
//	.probe4(camera_vsync_sys_pos) // input wire [0:0]  probe4
//);

always	@(posedge	sclk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			cycle_cnt<=32'b0;
		else	if(cycle_cnt==32'hBEBC200)
			cycle_cnt<=32'b0;
		else
			cycle_cnt<=cycle_cnt+32'b1;
	end
	
always	@(posedge	sclk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			add_flag<=1'b0;
		else	if(cycle_cnt==32'hBEBC200)
			add_flag<=1'b0;
		else	if(cycle_cnt==32'h5F5E100)
			add_flag<=1'b1;
		else
			add_flag<=add_flag;
	end
	
always	@(posedge	sclk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			speed_value_r<=32'b0;
		else	if(cycle_cnt==32'h0)
			speed_value_r<=32'b0;
		else	if(add_flag==1'b1	&&	camera_vsync_sys_pos==1'b1)
			speed_value_r<=speed_value_r+32'b1;
		else
			speed_value_r<=speed_value_r;
	end
	
assign	speed_value	=	speed_value_r;

always	@(posedge	sclk	or	negedge	rst_n)
	begin
		if(rst_n==1'b0)
			speed_valid_r<=1'b0;
		else	if(add_flag==1'b1	&&	cycle_cnt==32'hBEBC200)
			speed_valid_r<=1'b1;
		else
			speed_valid_r<=1'b0;
	end
	
assign	speed_valid	=	speed_valid_r;

signal_sys	signal_sys_inst(
.aclk			(camera_clk),
.sys_clk	(sclk),
.rst_n		(rst_n),
.sig_in		(camera_vsync_pos),
.sys_sig_o(camera_vsync_sys)
);

sig_pdg	sig_pdg_inst(
.sclk		(sclk),
.rst_n	(rst_n),
.sig_in	(camera_vsync_sys),
.sig_pos(camera_vsync_sys_pos)
);

endmodule
