// *********************************************************************************
// Project Name : OSXXXX
// Author       : dengkanwen
// Email        : dengkanwen@163.com
// Website      : http://www.opensoc.cn/
// Create Time  : 2017/5/21 17:52:33
// File Name    : .v
// Module Name  : 
// Called By    :
// Abstract     :
//
// CopyRight(c) 2016, OpenSoc Studio.. 
// All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 2017/5/21    Kevin           1.0                     Original
//  
// *********************************************************************************
`timescale      1ns/1ns

module  ov5640_data(
        // system signals
        input                   s_rst_n                 ,       
        // OV5640
        input                   ov5640_pclk             ,       
(*KEEP="TRUE"*)        input                   ov5640_href             ,       
(*KEEP="TRUE"*)        input                   ov5640_vsync            ,       
        input           [ 7:0]  ov5640_data             ,       
        // User Interfaces
        output  wire     [15:0]  camera_pack_odata       ,
        output  wire             camera_pack_ovalid      ,
(*KEEP="TRUE"*)        output	wire             ov5640_vsync_pos,
				input		wire				wr_ack                           
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
reg                             ov5640_vsync_r1                 ;

reg                             byte_flag                       ;       // 0: first byte, 1: second byte
reg     [ 3:0]                  frame_cnt                       ;
wire                            frame_vaild                     ;

reg	[15:0]	m_data;
reg					m_wr_en;

reg						wr_ack_sys0;
reg						wr_ack_sys1;
reg						wr_ack_sys2;

(*KEEP="TRUE"*)reg	[31:0]	frame_length_cnt;
(*KEEP="TRUE"*)reg	[31:0]	vync_length_cnt;
(*KEEP="TRUE"*)wire        ov5640_vsync_neg;

(*KEEP="TRUE"*)reg			[15:0]									camera_sum;
reg		ov5640_vsync_pos_reg;

wire	frame_flag;

always	@(posedge	ov5640_pclk	or	negedge	s_rst_n)
		begin
			if(s_rst_n==1'b0)
				begin
					wr_ack_sys0<=1'b0;
					wr_ack_sys1<=1'b0;
					wr_ack_sys2<=1'b0;
				end
			else
				begin
					wr_ack_sys0<=wr_ack;
					wr_ack_sys1<=wr_ack_sys0;
					wr_ack_sys2<=wr_ack_sys1;
				end
		end
		
assign	wr_ack_pos	=	(wr_ack_sys2==1'b0	&&	wr_ack_sys1==1'b1)	?	1'b1	:	1'b0;

always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                camera_sum  <= 16'h0;
        else if(ov5640_vsync_pos == 1'b1)
                camera_sum  <=  16'b0;
        else	if(m_wr_en==1'b1)
                camera_sum<=camera_sum+m_data;
        else
        				camera_sum<=camera_sum;
end

always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                frame_length_cnt  <= 32'h0;
        else if(ov5640_vsync_pos == 1'b1)
                frame_length_cnt  <=  32'b0;
        else
                frame_length_cnt<=frame_length_cnt+32'b1;
end

always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                vync_length_cnt  <= 32'h0;
        else if(ov5640_vsync_pos == 1'b1)
                vync_length_cnt  <=  32'b0;
        else if(ov5640_vsync_neg == 1'b1)
                vync_length_cnt  <=  32'b0;
        else
                vync_length_cnt<=vync_length_cnt+32'b1;
end

//=============================================================================
//**************    Main Code   **************
//=============================================================================
always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_data  <=      'h0;
        else if(byte_flag == 1'b1)
                m_data  <=      {m_data[15:8], ov5640_data};
        else
                m_data  <=      {ov5640_data, m_data[7:0]};
end

always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                byte_flag       <=      1'b0;
        else if(ov5640_href == 1'b1)
                byte_flag       <=      ~byte_flag;
        else
                byte_flag       <=      1'b0;
end

always  @(posedge ov5640_pclk) begin
        ov5640_vsync_r1 <=      ov5640_vsync;
end

always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                frame_cnt       <=      'd0;
        else if(frame_vaild == 1'b0 && frame_flag == 1'b1)
                frame_cnt       <=      frame_cnt + 1'b1;
end

always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_wr_en <=      1'b0;
        else if(frame_vaild == 1'b1 && byte_flag == 1'b1)
                m_wr_en <=      1'b1;
        else
                m_wr_en <=      1'b0;
end

always  @(posedge ov5640_pclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
           ov5640_vsync_pos_reg<=1'b0;
        else if(ov5640_vsync == 1'b1 && ov5640_vsync_r1 == 1'b0)
           ov5640_vsync_pos_reg <= 1'b1;
        else	if(wr_ack_pos==1'b1)
        	 ov5640_vsync_pos_reg<=1'b0;
        else
           ov5640_vsync_pos_reg <= ov5640_vsync_pos_reg;
end

assign  frame_vaild             =       (frame_cnt >= 'd10) ? 1'b1 : 1'b0;
assign  frame_flag        =       ov5640_vsync & ~ov5640_vsync_r1;
assign  ov5640_vsync_pos        =  ov5640_vsync_pos_reg;
assign  ov5640_vsync_neg        =  (ov5640_vsync==1'b0	&&	ov5640_vsync_r1==1'b1)	?	1'b1	:	1'b0;

assign	camera_pack_odata		=	m_data;
assign	camera_pack_ovalid	=	m_wr_en;

//ila_1 ila_1_inst (
//	.clk(ov5640_pclk), // input wire clk
//
//
//	.probe0(ov5640_vsync), // input wire [0:0]  probe0  
//	.probe1(camera_sum), // input wire [15:0]  probe1
//	.probe2(ov5640_vsync_pos_reg), // input wire [0:0]  probe1
//	.probe3(ov5640_vsync_r1), // input wire [0:0]  probe1
//	.probe4(wr_ack_pos), // input wire [0:0]  probe1
//	.probe5(frame_vaild), // input wire [0:0]  probe1
//	.probe6(frame_flag) // input wire [0:0]  probe1
//);

endmodule
