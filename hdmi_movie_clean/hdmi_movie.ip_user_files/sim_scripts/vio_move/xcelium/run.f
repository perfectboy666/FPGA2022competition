-makelib xcelium_lib/xpm -sv \
  "F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "F:/vivado_2019/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../hdmi_movie.srcs/sources_1/ip/vio_move/sim/vio_move.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

