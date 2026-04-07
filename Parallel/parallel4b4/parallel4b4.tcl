read_libs /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read_hdl parallel4b4.v
elaborate
read_sdc parallel4b4.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
report_timing > parallel4b4_timing.rep
report_area > parallel4b4_area.rep
report_power > parallel4b4_pwr.rep
write_hdl > parallel4b4_net.v
write_sdc > parallel4b4_sdc.sdc
gui_show 
