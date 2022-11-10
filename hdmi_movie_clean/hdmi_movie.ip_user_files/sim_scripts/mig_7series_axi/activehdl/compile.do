vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_addr_decode.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_read.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg_bank.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_top.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_write.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_ar_channel.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_aw_channel.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_b_channel.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_arbiter.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_fsm.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_translator.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_fifo.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_incr_cmd.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_r_channel.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_simple_fifo.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wrap_cmd.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wr_cmd_fsm.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_axi_mc_w_channel.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_axic_register_slice.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_register_slice.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_upsizer.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_a_upsizer.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_and.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_and.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_or.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_or.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_command_fifo.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel_static.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_r_upsizer.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/axi/mig_7series_v4_2_ddr_w_upsizer.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_axi.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/mig_7series_axi_mig_sim.v" \
"../../../../hdmi_movie.srcs/sources_1/ip/mig_7series_axi/mig_7series_axi/user_design/rtl/mig_7series_axi.v" \

vlog -work xil_defaultlib \
"glbl.v"

