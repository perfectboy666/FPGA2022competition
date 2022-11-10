set_property SRC_FILE_INFO {cfile:e:/vivado_prj/wx/hdmi_movie/hdmi_movie.srcs/sources_1/ip/clock_manage/clock_manage.xdc rfile:../../../hdmi_movie.srcs/sources_1/ip/clock_manage/clock_manage.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.2
