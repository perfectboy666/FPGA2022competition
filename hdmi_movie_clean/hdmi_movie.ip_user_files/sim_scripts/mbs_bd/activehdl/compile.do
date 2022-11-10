vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/microblaze_v11_0_2
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_uartlite_v2_0_24
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_20
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_data_fifo_v2_1_19
vlib activehdl/axi_crossbar_v2_1_21
vlib activehdl/lmb_v10_v3_0_10
vlib activehdl/lmb_bram_if_cntlr_v4_0_17
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/mdm_v3_2_17

vmap xpm activehdl/xpm
vmap microblaze_v11_0_2 activehdl/microblaze_v11_0_2
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_24 activehdl/axi_uartlite_v2_0_24
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_20 activehdl/axi_register_slice_v2_1_20
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 activehdl/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 activehdl/axi_crossbar_v2_1_21
vmap lmb_v10_v3_0_10 activehdl/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 activehdl/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap mdm_v3_2_17 activehdl/mdm_v3_2_17

vlog -work xpm  -sv2k12 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"C:/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/vivado2019.2/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_2 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mbs_bd/ip/mbs_bd_microblaze_0_0/sim/mbs_bd_microblaze_0_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mbs_bd/ip/mbs_bd_rst_Clk_100M_0/sim/mbs_bd_rst_Clk_100M_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mbs_bd/ip/mbs_bd_axi_uartlite_0_0/sim/mbs_bd_axi_uartlite_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../bd/mbs_bd/ipshared/88ad/hdl/axi_reg_v1_0_S00_AXI.v" \
"../../../bd/mbs_bd/ipshared/88ad/hdl/axi_reg_v1_0.v" \
"../../../bd/mbs_bd/ip/mbs_bd_axi_reg_0_0/sim/mbs_bd_axi_reg_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../bd/mbs_bd/ip/mbs_bd_xbar_0/sim/mbs_bd_xbar_0.v" \

vcom -work lmb_v10_v3_0_10 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mbs_bd/ip/mbs_bd_dlmb_v10_1/sim/mbs_bd_dlmb_v10_1.vhd" \
"../../../bd/mbs_bd/ip/mbs_bd_ilmb_v10_1/sim/mbs_bd_ilmb_v10_1.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mbs_bd/ip/mbs_bd_dlmb_bram_if_cntlr_1/sim/mbs_bd_dlmb_bram_if_cntlr_1.vhd" \
"../../../bd/mbs_bd/ip/mbs_bd_ilmb_bram_if_cntlr_1/sim/mbs_bd_ilmb_bram_if_cntlr_1.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../bd/mbs_bd/ip/mbs_bd_lmb_bram_1/sim/mbs_bd_lmb_bram_1.v" \

vcom -work mdm_v3_2_17 -93 \
"../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mbs_bd/ip/mbs_bd_mdm_1_1/sim/mbs_bd_mdm_1_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hdmi_movie.srcs/sources_1/bd/mbs_bd/ipshared/ec67/hdl" \
"../../../bd/mbs_bd/sim/mbs_bd.v" \

vlog -work xil_defaultlib \
"glbl.v"

