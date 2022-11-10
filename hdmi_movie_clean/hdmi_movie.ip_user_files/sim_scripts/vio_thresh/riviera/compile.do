vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_thresh/hdl/verilog" "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_thresh/hdl" \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_thresh/hdl/verilog" "+incdir+../../../../hdmi_movie.srcs/sources_1/ip/vio_thresh/hdl" \
"../../../../hdmi_movie.srcs/sources_1/ip/vio_thresh/sim/vio_thresh.v" \

vlog -work xil_defaultlib \
"glbl.v"

