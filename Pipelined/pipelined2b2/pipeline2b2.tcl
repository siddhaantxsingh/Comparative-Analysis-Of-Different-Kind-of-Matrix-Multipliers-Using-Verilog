read_libs /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read_hdl pipeline2b2.v
elaborate
read_sdc pipeline2b2.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
report_timing > pipeline2b2_timing.rep
report_area > pipeline2b2_area.rep
report_power > pipeline2b2_pwr.rep
write_hdl > pipeline2b2_net.v
write_sdc > pipeline2b2_sdc.sdc
gui_show 
