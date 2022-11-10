vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -sv "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_move/hdl/verilog" "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_move/hdl" \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_move/hdl/verilog" "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_move/hdl" \
"../../../../hdmi_movie.srcs/sources_1/ip/vio_move/sim/vio_move.v" \

vlog -work xil_defaultlib \
"glbl.v"

