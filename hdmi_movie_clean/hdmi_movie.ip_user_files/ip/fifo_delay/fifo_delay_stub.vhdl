-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Sun Oct 23 22:10:16 2022
-- Host        : LAPTOP-DU97D6U5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               E:/vivado_prj/wx/hdmi_movie/hdmi_movie.runs/fifo_delay_synth_1/fifo_delay_stub.vhdl
-- Design      : fifo_delay
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo_delay is
  Port ( 
    clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 23 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 23 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );

end fifo_delay;

architecture stub of fifo_delay is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,din[23:0],wr_en,rd_en,dout[23:0],full,empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_2_5,Vivado 2019.2";
begin
end;
