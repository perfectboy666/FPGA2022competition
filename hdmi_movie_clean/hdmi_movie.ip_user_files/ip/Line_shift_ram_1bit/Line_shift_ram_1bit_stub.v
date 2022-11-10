// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Nov  1 21:33:10 2022
// Host        : LAPTOP-DU97D6U5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/vivado_prj/wx/hdmi_movie/hdmi_movie.runs/Line_shift_ram_1bit_synth_1/Line_shift_ram_1bit_stub.v
// Design      : Line_shift_ram_1bit
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *)
module Line_shift_ram_1bit(D, CLK, CE, Q)
/* synthesis syn_black_box black_box_pad_pin="D[0:0],CLK,CE,Q[0:0]" */;
  input [0:0]D;
  input CLK;
  input CE;
  output [0:0]Q;
endmodule
