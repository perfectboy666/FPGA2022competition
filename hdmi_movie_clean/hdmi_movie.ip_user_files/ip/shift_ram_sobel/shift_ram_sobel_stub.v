// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Oct 21 21:21:35 2022
// Host        : MT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/wx/hdmi_movie/hdmi_movie.runs/shift_ram_sobel_synth_1/shift_ram_sobel_stub.v
// Design      : shift_ram_sobel
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *)
module shift_ram_sobel(D, CLK, Q)
/* synthesis syn_black_box black_box_pad_pin="D[2:0],CLK,Q[2:0]" */;
  input [2:0]D;
  input CLK;
  output [2:0]Q;
endmodule
