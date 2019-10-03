# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Malav/Documents/EE316Lab/LabWork/Lab_3/Lab_3.cache/wt [current_project]
set_property parent.project_path C:/Users/Malav/Documents/EE316Lab/LabWork/Lab_3/Lab_3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/Malav/Documents/EE316Lab/LabWork/Lab_3/Lab_3.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/Malav/Documents/EE316Lab/LabWork/Lab_3/Lab_3.srcs/sources_1/new/segment_display.v
  C:/Users/Malav/Documents/EE316Lab/LabWork/Lab_3/Lab_3.srcs/sources_1/new/myAND.v
  C:/Users/Malav/Documents/EE316Lab/LabWork/Lab_3/Lab_3.srcs/sources_1/new/sprinkler.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Malav/Documents/EE316Lab/LabWork/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/Malav/Documents/EE316Lab/LabWork/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top segment_display -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef segment_display.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file segment_display_utilization_synth.rpt -pb segment_display_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
