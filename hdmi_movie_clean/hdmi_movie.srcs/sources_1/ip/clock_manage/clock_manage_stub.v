// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Oct 23 21:11:28 2022
// Host        : LAPTOP-DU97D6U5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/vivado_prj/wx/hdmi_movie/hdmi_movie.srcs/sources_1/ip/clock_manage/clock_manage_stub.v
// Design      : clock_manage
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clock_manage(clk_out1, clk_out2, clk_out3, clk_out4, locked, 
  clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_out3,clk_out4,locked,clk_in1" */;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  output locked;
  input clk_in1;
endmodule
