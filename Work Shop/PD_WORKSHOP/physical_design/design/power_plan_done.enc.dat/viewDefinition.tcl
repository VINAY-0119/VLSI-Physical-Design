if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells_hvt.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v2_basicCells_lvt.lib]
create_library_set -name slow\
   -timing\
    [list ${::IMEX::libVar}/lib/typ/slow_vdd1v0_basicCells.lib\
    ${::IMEX::libVar}/lib/typ/slow_vdd1v0_basicCells_hvt.lib\
    ${::IMEX::libVar}/lib/typ/slow_vdd1v0_basicCells_lvt.lib]
create_rc_corner -name typical\
   -cap_table ${::IMEX::libVar}/mmmc/cln28hpl_1p10m+alrdl_5x2yu2yz_typical.capTbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/typical/gpdk045.tch
create_delay_corner -name ss_cnom\
   -library_set slow\
   -rc_corner typical
create_delay_corner -name fast_cnom\
   -library_set fast\
   -rc_corner typical
create_constraint_mode -name func\
   -sdc_files\
    [list /dev/null]
create_analysis_view -name func_ff -constraint_mode func -delay_corner fast_cnom
create_analysis_view -name func_ss -constraint_mode func -delay_corner ss_cnom
set_analysis_view -setup [list func_ss] -hold [list func_ff]
