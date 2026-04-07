read_libs /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read_hdl parallel2b2.v
elaborate
read_sdc parallel2b2.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
report_timing > parallel2b2_timing.rep
report_area > parallel2b2_area.rep
report_power > parallel2b2_pwr.rep
write_hdl > parallel2b2_net.v
write_sdc > parallel2b2_sdc.sdc
gui_show 
