// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Oct 21 21:22:02 2022
// Host        : MT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/wx/hdmi_movie/hdmi_movie.runs/xdma_cmd_ram_synth_1/xdma_cmd_ram_stub.v
// Design      : xdma_cmd_ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module xdma_cmd_ram(clka, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[4:0],dina[127:0],clkb,enb,addrb[4:0],doutb[127:0]" */;
  input clka;
  input [0:0]wea;
  input [4:0]addra;
  input [127:0]dina;
  input clkb;
  input enb;
  input [4:0]addrb;
  output [127:0]doutb;
endmodule
