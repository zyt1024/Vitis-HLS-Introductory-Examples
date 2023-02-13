set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME example_entry_proc}
  {SRCNAME getinstream MODELNAME getinstream RTLNAME example_getinstream
    SUBMODULES {
      {MODELNAME example_regslice_both RTLNAME example_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME example_regslice_both_U}
      {MODELNAME example_flow_control_loop_pipe RTLNAME example_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME example_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2 MODELNAME streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2 RTLNAME example_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2
    SUBMODULES {
      {MODELNAME example_flow_control_loop_pipe_sequential_init RTLNAME example_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME example_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME streamtoparallelwithburst MODELNAME streamtoparallelwithburst RTLNAME example_streamtoparallelwithburst}
  {SRCNAME example MODELNAME example RTLNAME example IS_TOP 1
    SUBMODULES {
      {MODELNAME example_fifo_w64_d2_S RTLNAME example_fifo_w64_d2_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME example_fifo_w128_d4096_A RTLNAME example_fifo_w128_d4096_A BINDTYPE storage TYPE fifo IMPL memory LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME example_fifo_w32_d64_A RTLNAME example_fifo_w32_d64_A BINDTYPE storage TYPE fifo IMPL memory LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME example_control_s_axi RTLNAME example_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME example_gmem0_m_axi RTLNAME example_gmem0_m_axi BINDTYPE interface TYPE interface_m_axi}
    }
  }
}
