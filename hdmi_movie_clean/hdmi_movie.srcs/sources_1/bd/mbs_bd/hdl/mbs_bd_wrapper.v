//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Oct 31 17:46:37 2022
//Host        : DESKTOP-MUNN8T1 running 64-bit major release  (build 9200)
//Command     : generate_target mbs_bd_wrapper.bd
//Design      : mbs_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mbs_bd_wrapper
   (clk100,
    pic_mode,
    pic_mode_valid,
    rst_n,
    speed_valid,
    speed_value,
    uart_rx,
    uart_tx);
  input clk100;
  output [31:0]pic_mode;
  output pic_mode_valid;
  input rst_n;
  input speed_valid;
  input [31:0]speed_value;
  input uart_rx;
  output uart_tx;

  wire clk100;
  wire [31:0]pic_mode;
  wire pic_mode_valid;
  wire rst_n;
  wire speed_valid;
  wire [31:0]speed_value;
  wire uart_rx;
  wire uart_tx;

  mbs_bd mbs_bd_i
       (.clk100(clk100),
        .pic_mode(pic_mode),
        .pic_mode_valid(pic_mode_valid),
        .rst_n(rst_n),
        .speed_valid(speed_valid),
        .speed_value(speed_value),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx));
endmodule
