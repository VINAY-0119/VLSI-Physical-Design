set_units -time ns -capacitance fF
create_clock -name "mclk" -period 5.4 [get_ports clk_i]

create_clock -period 5.4 -name vclk 

#Define input_transition driving/ driving cell 
 set_driving_cell -lib_cell BUFX12 [all_inputs]

#Define Load
set_load 8 [all_outputs] 

# set input delay
 set_input_delay 1 $po -clock vclk 

#set output delay 
 set_output_delay 1 [all_outputs] -clock vclk

# Define clock uncertainity
set_clock_uncertainty 0.1 [get_clock *]
 
