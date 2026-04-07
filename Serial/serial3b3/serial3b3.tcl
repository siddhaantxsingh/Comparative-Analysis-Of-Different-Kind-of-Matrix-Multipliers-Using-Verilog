read_libs /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read_hdl serial3b3.v
elaborate
read_sdc serial3b3.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
report_timing > serial3b3_timing.rep
report_area > serial3b3_area.rep
report_power > serial3b3_pwr.rep
write_hdl > serial3b3_net.v
write_sdc > serial3b3_sdc.sdc
gui_show 
