`timescale 1 ns / 1 ps

module AESL_deadlock_kernel_monitor_top ( 
    input wire kernel_monitor_clock,
    input wire kernel_monitor_reset
);
wire [0:0] axis_block_sigs;
wire [4:0] inst_idle_sigs;
wire [2:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~AESL_inst_example.getinstream_U0.inStreamTop_TDATA_blk_n;

assign inst_idle_sigs[0] = AESL_inst_example.entry_proc_U0.ap_idle;
assign inst_block_sigs[0] = (AESL_inst_example.entry_proc_U0.ap_done & ~AESL_inst_example.entry_proc_U0.ap_continue);
assign inst_idle_sigs[1] = AESL_inst_example.getinstream_U0.ap_idle;
assign inst_block_sigs[1] = (AESL_inst_example.getinstream_U0.ap_done & ~AESL_inst_example.getinstream_U0.ap_continue) | ~AESL_inst_example.getinstream_U0.buf_r_blk_n | ~AESL_inst_example.getinstream_U0.count7_blk_n;
assign inst_idle_sigs[2] = AESL_inst_example.streamtoparallelwithburst_U0.ap_idle;
assign inst_block_sigs[2] = (AESL_inst_example.streamtoparallelwithburst_U0.ap_done & ~AESL_inst_example.streamtoparallelwithburst_U0.ap_continue) | ~AESL_inst_example.streamtoparallelwithburst_U0.grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91.buf_r_blk_n | ~AESL_inst_example.streamtoparallelwithburst_U0.count7_blk_n;

assign inst_idle_sigs[3] = 1'b0;
assign inst_idle_sigs[4] = AESL_inst_example.getinstream_U0.ap_idle;

AESL_deadlock_idx0_monitor AESL_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

initial begin
reg block_delay = 0;
    while(1) begin
        @(posedge kernel_monitor_clock);
    if (kernel_block == 1'b1 && block_delay == 1'b0)
    $display("find kernel block.");
    block_delay = kernel_block;
    end
end

endmodule
