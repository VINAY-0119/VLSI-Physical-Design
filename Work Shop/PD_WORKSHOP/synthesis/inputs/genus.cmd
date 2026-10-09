# Cadence Genus(TM) Synthesis Solution, Version 20.11-s111_1, built Apr 26 2021 14:57:38

# Date: Mon Sep 21 14:57:15 2026
# Host: cad5 (x86_64 w/Linux 3.10.0-1160.el7.x86_64) (4cores*8cpus*1physical cpu*Intel(R) Core(TM) i3-10100F CPU @ 3.60GHz 6144KB)
# OS:   Red Hat Enterprise Linux Server release 7.9 (Maipo)

set_units -time ns -capacitance fF
create_clock -name "mclk" -period 5.4 [get_ports clk_i]
set_input_delay 1 $po -clock vclk
set output delay
set_output_delay 1 [all_outputs] -clock vclk
set_db init_lib_search_path ./inputs
gvim memory.v
