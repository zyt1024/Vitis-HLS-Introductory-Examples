set moduleName getinstream
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {getinstream}
set C_modelType { void 0 }
set C_modelArgList {
	{ inStreamTop_V_data_V int 64 regular {axi_s 0 volatile  { inStreamTop Data } }  }
	{ inStreamTop_V_keep_V int 8 regular {axi_s 0 volatile  { inStreamTop Keep } }  }
	{ inStreamTop_V_strb_V int 8 regular {axi_s 0 volatile  { inStreamTop Strb } }  }
	{ inStreamTop_V_last_V int 1 regular {axi_s 0 volatile  { inStreamTop Last } }  }
	{ buf_r int 128 regular {fifo 1 volatile }  }
	{ count7 int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inStreamTop_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "inStreamTop_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "buf_r", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "count7", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ inStreamTop_TVALID sc_in sc_logic 1 invld 3 } 
	{ buf_r_din sc_out sc_lv 128 signal 4 } 
	{ buf_r_full_n sc_in sc_logic 1 signal 4 } 
	{ buf_r_write sc_out sc_logic 1 signal 4 } 
	{ count7_din sc_out sc_lv 32 signal 5 } 
	{ count7_full_n sc_in sc_logic 1 signal 5 } 
	{ count7_write sc_out sc_logic 1 signal 5 } 
	{ inStreamTop_TDATA sc_in sc_lv 64 signal 0 } 
	{ inStreamTop_TREADY sc_out sc_logic 1 inacc 3 } 
	{ inStreamTop_TKEEP sc_in sc_lv 8 signal 1 } 
	{ inStreamTop_TSTRB sc_in sc_lv 8 signal 2 } 
	{ inStreamTop_TLAST sc_in sc_lv 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "inStreamTop_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "buf_r_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "buf_r", "role": "din" }} , 
 	{ "name": "buf_r_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_r", "role": "full_n" }} , 
 	{ "name": "buf_r_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buf_r", "role": "write" }} , 
 	{ "name": "count7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "count7", "role": "din" }} , 
 	{ "name": "count7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "count7", "role": "full_n" }} , 
 	{ "name": "count7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "count7", "role": "write" }} , 
 	{ "name": "inStreamTop_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "inStreamTop_V_data_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inStreamTop_V_keep_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inStreamTop_V_strb_V", "role": "default" }} , 
 	{ "name": "inStreamTop_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "inStreamTop_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "getinstream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "inStreamTop_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inStreamTop_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inStreamTop_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "inStreamTop_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "inStreamTop_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "buf_r", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "4096", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "buf_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "count7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "count7_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_38_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_inStreamTop_V_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_inStreamTop_V_keep_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_inStreamTop_V_strb_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_inStreamTop_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	getinstream {
		inStreamTop_V_data_V {Type I LastRead 0 FirstWrite -1}
		inStreamTop_V_keep_V {Type I LastRead 0 FirstWrite -1}
		inStreamTop_V_strb_V {Type I LastRead 0 FirstWrite -1}
		inStreamTop_V_last_V {Type I LastRead 0 FirstWrite -1}
		buf_r {Type O LastRead -1 FirstWrite 0}
		count7 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	inStreamTop_V_data_V { axis {  { inStreamTop_TDATA in_data 0 64 } } }
	inStreamTop_V_keep_V { axis {  { inStreamTop_TKEEP in_data 0 8 } } }
	inStreamTop_V_strb_V { axis {  { inStreamTop_TSTRB in_data 0 8 } } }
	inStreamTop_V_last_V { axis {  { inStreamTop_TVALID in_vld 0 1 }  { inStreamTop_TREADY in_acc 1 1 }  { inStreamTop_TLAST in_data 0 1 } } }
	buf_r { ap_fifo {  { buf_r_din fifo_data 1 128 }  { buf_r_full_n fifo_status 0 1 }  { buf_r_write fifo_update 1 1 } } }
	count7 { ap_fifo {  { count7_din fifo_data 1 32 }  { count7_full_n fifo_status 0 1 }  { count7_write fifo_update 1 1 } } }
}
