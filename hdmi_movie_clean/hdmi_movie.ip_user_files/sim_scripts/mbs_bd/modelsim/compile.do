vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mbs_bd/ip/mbs_bd_microblaze_0_0/sim/mbs_bd_microblaze_0_0.vhd" \
"../../../bd/mbs_bd/ip/mbs_bd_rst_Clk_100M_0/sim/mbs_bd_rst_Clk_100M_0.vhd" \
"../../../bd/mbs_bd/ip/mbs_bd_axi_uartlite_0_0/sim/mbs_bd_axi_uartlite_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../bd/mbs_bd/ipshared/88ad/hdl/axi_reg_v1_0_S00_AXI.v" \
"../../../bd/mbs_bd/ipshared/88ad/hdl/axi_reg_v1_0.v" \
"../../../bd/mbs_bd/ip/mbs_bd_axi_reg_0_0/sim/mbs_bd_axi_reg_0_0.v" \
"../../../bd/mbs_bd/ip/mbs_bd_xbar_0/sim/mbs_bd_xbar_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mbs_bd/ip/mbs_bd_dlmb_v10_1/sim/mbs_bd_dlmb_v10_1.vhd" \
"../../../bd/mbs_bd/ip/mbs_bd_ilmb_v10_1/sim/mbs_bd_ilmb_v10_1.vhd" \
"../../../bd/mbs_bd/ip/mbs_bd_dlmb_bram_if_cntlr_1/sim/mbs_bd_dlmb_bram_if_cntlr_1.vhd" \
"../../../bd/mbs_bd/ip/mbs_bd_ilmb_bram_if_cntlr_1/sim/mbs_bd_ilmb_bram_if_cntlr_1.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../bd/mbs_bd/ip/mbs_bd_lmb_bram_1/sim/mbs_bd_lmb_bram_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/mbs_bd/ip/mbs_bd_mdm_1_1/sim/mbs_bd_mdm_1_1.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../bd/mbs_bd/sim/mbs_bd.v" \

vlog -work xil_defaultlib \
"glbl.v"

