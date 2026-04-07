read_libs /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib
read_hdl pipelined4b4.v
elaborate
read_sdc pipelined4b4.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
report_timing > pipelined4b4_timing.rep
report_area > pipelined4b4_area.rep
report_power > pipelined4b4_pwr.rep
write_hdl > pipelined4b4_net.v
write_sdc > pipelined4b4_sdc.sdc
gui_show 
