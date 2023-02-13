// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module example_streamtoparallelwithburst (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        buf_r_dout,
        buf_r_empty_n,
        buf_r_read,
        count7_dout,
        count7_empty_n,
        count7_read,
        m_axi_gmem0_AWVALID,
        m_axi_gmem0_AWREADY,
        m_axi_gmem0_AWADDR,
        m_axi_gmem0_AWID,
        m_axi_gmem0_AWLEN,
        m_axi_gmem0_AWSIZE,
        m_axi_gmem0_AWBURST,
        m_axi_gmem0_AWLOCK,
        m_axi_gmem0_AWCACHE,
        m_axi_gmem0_AWPROT,
        m_axi_gmem0_AWQOS,
        m_axi_gmem0_AWREGION,
        m_axi_gmem0_AWUSER,
        m_axi_gmem0_WVALID,
        m_axi_gmem0_WREADY,
        m_axi_gmem0_WDATA,
        m_axi_gmem0_WSTRB,
        m_axi_gmem0_WLAST,
        m_axi_gmem0_WID,
        m_axi_gmem0_WUSER,
        m_axi_gmem0_ARVALID,
        m_axi_gmem0_ARREADY,
        m_axi_gmem0_ARADDR,
        m_axi_gmem0_ARID,
        m_axi_gmem0_ARLEN,
        m_axi_gmem0_ARSIZE,
        m_axi_gmem0_ARBURST,
        m_axi_gmem0_ARLOCK,
        m_axi_gmem0_ARCACHE,
        m_axi_gmem0_ARPROT,
        m_axi_gmem0_ARQOS,
        m_axi_gmem0_ARREGION,
        m_axi_gmem0_ARUSER,
        m_axi_gmem0_RVALID,
        m_axi_gmem0_RREADY,
        m_axi_gmem0_RDATA,
        m_axi_gmem0_RLAST,
        m_axi_gmem0_RID,
        m_axi_gmem0_RUSER,
        m_axi_gmem0_RRESP,
        m_axi_gmem0_BVALID,
        m_axi_gmem0_BREADY,
        m_axi_gmem0_BRESP,
        m_axi_gmem0_BID,
        m_axi_gmem0_BUSER,
        p_read
);

parameter    ap_ST_fsm_state1 = 19'd1;
parameter    ap_ST_fsm_state2 = 19'd2;
parameter    ap_ST_fsm_state3 = 19'd4;
parameter    ap_ST_fsm_state4 = 19'd8;
parameter    ap_ST_fsm_state5 = 19'd16;
parameter    ap_ST_fsm_state6 = 19'd32;
parameter    ap_ST_fsm_state7 = 19'd64;
parameter    ap_ST_fsm_state8 = 19'd128;
parameter    ap_ST_fsm_state9 = 19'd256;
parameter    ap_ST_fsm_state10 = 19'd512;
parameter    ap_ST_fsm_state11 = 19'd1024;
parameter    ap_ST_fsm_state12 = 19'd2048;
parameter    ap_ST_fsm_state13 = 19'd4096;
parameter    ap_ST_fsm_state14 = 19'd8192;
parameter    ap_ST_fsm_state15 = 19'd16384;
parameter    ap_ST_fsm_state16 = 19'd32768;
parameter    ap_ST_fsm_state17 = 19'd65536;
parameter    ap_ST_fsm_state18 = 19'd131072;
parameter    ap_ST_fsm_state19 = 19'd262144;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [127:0] buf_r_dout;
input   buf_r_empty_n;
output   buf_r_read;
input  [31:0] count7_dout;
input   count7_empty_n;
output   count7_read;
output   m_axi_gmem0_AWVALID;
input   m_axi_gmem0_AWREADY;
output  [63:0] m_axi_gmem0_AWADDR;
output  [0:0] m_axi_gmem0_AWID;
output  [31:0] m_axi_gmem0_AWLEN;
output  [2:0] m_axi_gmem0_AWSIZE;
output  [1:0] m_axi_gmem0_AWBURST;
output  [1:0] m_axi_gmem0_AWLOCK;
output  [3:0] m_axi_gmem0_AWCACHE;
output  [2:0] m_axi_gmem0_AWPROT;
output  [3:0] m_axi_gmem0_AWQOS;
output  [3:0] m_axi_gmem0_AWREGION;
output  [0:0] m_axi_gmem0_AWUSER;
output   m_axi_gmem0_WVALID;
input   m_axi_gmem0_WREADY;
output  [63:0] m_axi_gmem0_WDATA;
output  [7:0] m_axi_gmem0_WSTRB;
output   m_axi_gmem0_WLAST;
output  [0:0] m_axi_gmem0_WID;
output  [0:0] m_axi_gmem0_WUSER;
output   m_axi_gmem0_ARVALID;
input   m_axi_gmem0_ARREADY;
output  [63:0] m_axi_gmem0_ARADDR;
output  [0:0] m_axi_gmem0_ARID;
output  [31:0] m_axi_gmem0_ARLEN;
output  [2:0] m_axi_gmem0_ARSIZE;
output  [1:0] m_axi_gmem0_ARBURST;
output  [1:0] m_axi_gmem0_ARLOCK;
output  [3:0] m_axi_gmem0_ARCACHE;
output  [2:0] m_axi_gmem0_ARPROT;
output  [3:0] m_axi_gmem0_ARQOS;
output  [3:0] m_axi_gmem0_ARREGION;
output  [0:0] m_axi_gmem0_ARUSER;
input   m_axi_gmem0_RVALID;
output   m_axi_gmem0_RREADY;
input  [63:0] m_axi_gmem0_RDATA;
input   m_axi_gmem0_RLAST;
input  [0:0] m_axi_gmem0_RID;
input  [0:0] m_axi_gmem0_RUSER;
input  [1:0] m_axi_gmem0_RRESP;
input   m_axi_gmem0_BVALID;
output   m_axi_gmem0_BREADY;
input  [1:0] m_axi_gmem0_BRESP;
input  [0:0] m_axi_gmem0_BID;
input  [0:0] m_axi_gmem0_BUSER;
input  [63:0] p_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg buf_r_read;
reg count7_read;
reg m_axi_gmem0_AWVALID;
reg[63:0] m_axi_gmem0_AWADDR;
reg[0:0] m_axi_gmem0_AWID;
reg[31:0] m_axi_gmem0_AWLEN;
reg[2:0] m_axi_gmem0_AWSIZE;
reg[1:0] m_axi_gmem0_AWBURST;
reg[1:0] m_axi_gmem0_AWLOCK;
reg[3:0] m_axi_gmem0_AWCACHE;
reg[2:0] m_axi_gmem0_AWPROT;
reg[3:0] m_axi_gmem0_AWQOS;
reg[3:0] m_axi_gmem0_AWREGION;
reg[0:0] m_axi_gmem0_AWUSER;
reg m_axi_gmem0_WVALID;
reg m_axi_gmem0_BREADY;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [18:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    count7_blk_n;
wire    ap_CS_fsm_state2;
reg    gmem0_blk_n_AW;
wire    ap_CS_fsm_state3;
reg    gmem0_blk_n_B;
wire    ap_CS_fsm_state19;
reg   [0:0] icmp_ln24_reg_207;
reg  signed [31:0] tmp_reg_200;
wire   [0:0] icmp_ln24_fu_110_p2;
reg   [60:0] trunc_ln_reg_211;
wire   [30:0] trunc_ln24_fu_147_p1;
reg   [30:0] trunc_ln24_reg_222;
wire    ap_CS_fsm_state4;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_done;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_idle;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_ready;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_buf_r_read;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWVALID;
wire   [63:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWADDR;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWID;
wire   [31:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWLEN;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWSIZE;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWBURST;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWLOCK;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWCACHE;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWPROT;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWQOS;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWREGION;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWUSER;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WVALID;
wire   [63:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WDATA;
wire   [7:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WSTRB;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WLAST;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WID;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WUSER;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARVALID;
wire   [63:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARADDR;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARID;
wire   [31:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARLEN;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARSIZE;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARBURST;
wire   [1:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARLOCK;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARCACHE;
wire   [2:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARPROT;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARQOS;
wire   [3:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARREGION;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARUSER;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_RREADY;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_BREADY;
wire   [0:0] grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_phi_ln26_out;
wire    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_phi_ln26_out_ap_vld;
reg    grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start_reg;
wire    ap_CS_fsm_state5;
wire  signed [63:0] sext_ln24_fu_137_p1;
reg    ap_block_state19;
reg   [63:0] idx_fu_60;
wire   [63:0] add_ln29_fu_165_p2;
wire   [0:0] in_val_last_V_load_load_fu_159_p1;
reg    ap_block_state1;
reg   [0:0] in_val_last_V_fu_64;
wire    ap_CS_fsm_state6;
wire  signed [31:0] icmp_ln24_fu_110_p0;
wire   [63:0] shl_ln24_fu_116_p2;
wire   [63:0] add_ln24_fu_122_p2;
wire  signed [63:0] sext_ln29_fu_162_p1;
reg   [18:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ST_fsm_state11_blk;
wire    ap_ST_fsm_state12_blk;
wire    ap_ST_fsm_state13_blk;
wire    ap_ST_fsm_state14_blk;
wire    ap_ST_fsm_state15_blk;
wire    ap_ST_fsm_state16_blk;
wire    ap_ST_fsm_state17_blk;
wire    ap_ST_fsm_state18_blk;
reg    ap_ST_fsm_state19_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 19'd1;
#0 grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start_reg = 1'b0;
end

example_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2 grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start),
    .ap_done(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_done),
    .ap_idle(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_idle),
    .ap_ready(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_ready),
    .buf_r_dout(buf_r_dout),
    .buf_r_empty_n(buf_r_empty_n),
    .buf_r_read(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_buf_r_read),
    .m_axi_gmem0_AWVALID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWVALID),
    .m_axi_gmem0_AWREADY(m_axi_gmem0_AWREADY),
    .m_axi_gmem0_AWADDR(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWADDR),
    .m_axi_gmem0_AWID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWID),
    .m_axi_gmem0_AWLEN(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWLEN),
    .m_axi_gmem0_AWSIZE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWSIZE),
    .m_axi_gmem0_AWBURST(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWBURST),
    .m_axi_gmem0_AWLOCK(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWLOCK),
    .m_axi_gmem0_AWCACHE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWCACHE),
    .m_axi_gmem0_AWPROT(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWPROT),
    .m_axi_gmem0_AWQOS(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWQOS),
    .m_axi_gmem0_AWREGION(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWREGION),
    .m_axi_gmem0_AWUSER(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWUSER),
    .m_axi_gmem0_WVALID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WVALID),
    .m_axi_gmem0_WREADY(m_axi_gmem0_WREADY),
    .m_axi_gmem0_WDATA(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WDATA),
    .m_axi_gmem0_WSTRB(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WSTRB),
    .m_axi_gmem0_WLAST(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WLAST),
    .m_axi_gmem0_WID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WID),
    .m_axi_gmem0_WUSER(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WUSER),
    .m_axi_gmem0_ARVALID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARVALID),
    .m_axi_gmem0_ARREADY(1'b0),
    .m_axi_gmem0_ARADDR(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARADDR),
    .m_axi_gmem0_ARID(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARID),
    .m_axi_gmem0_ARLEN(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARLEN),
    .m_axi_gmem0_ARSIZE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARSIZE),
    .m_axi_gmem0_ARBURST(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARBURST),
    .m_axi_gmem0_ARLOCK(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARLOCK),
    .m_axi_gmem0_ARCACHE(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARCACHE),
    .m_axi_gmem0_ARPROT(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARPROT),
    .m_axi_gmem0_ARQOS(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARQOS),
    .m_axi_gmem0_ARREGION(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARREGION),
    .m_axi_gmem0_ARUSER(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_ARUSER),
    .m_axi_gmem0_RVALID(1'b0),
    .m_axi_gmem0_RREADY(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_RREADY),
    .m_axi_gmem0_RDATA(64'd0),
    .m_axi_gmem0_RLAST(1'b0),
    .m_axi_gmem0_RID(1'd0),
    .m_axi_gmem0_RUSER(1'd0),
    .m_axi_gmem0_RRESP(2'd0),
    .m_axi_gmem0_BVALID(m_axi_gmem0_BVALID),
    .m_axi_gmem0_BREADY(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_BREADY),
    .m_axi_gmem0_BRESP(m_axi_gmem0_BRESP),
    .m_axi_gmem0_BID(m_axi_gmem0_BID),
    .m_axi_gmem0_BUSER(m_axi_gmem0_BUSER),
    .sext_ln24(trunc_ln_reg_211),
    .trunc_ln24_1(trunc_ln24_reg_222),
    .phi_ln26_out(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_phi_ln26_out),
    .phi_ln26_out_ap_vld(grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_phi_ln26_out_ap_vld)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1)) & (in_val_last_V_load_load_fu_159_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start_reg <= 1'b1;
        end else if ((grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_ready == 1'b1)) begin
            grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        idx_fu_60 <= 64'd0;
    end else if ((~((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1)) & (in_val_last_V_load_load_fu_159_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state19))) begin
        idx_fu_60 <= add_ln29_fu_165_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        icmp_ln24_reg_207 <= icmp_ln24_fu_110_p2;
        tmp_reg_200 <= count7_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        in_val_last_V_fu_64 <= grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_phi_ln26_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        trunc_ln24_reg_222 <= trunc_ln24_fu_147_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln24_fu_110_p2 == 1'd1))) begin
        trunc_ln_reg_211 <= {{add_ln24_fu_122_p2[63:3]}};
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

assign ap_ST_fsm_state17_blk = 1'b0;

assign ap_ST_fsm_state18_blk = 1'b0;

always @ (*) begin
    if (((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1))) begin
        ap_ST_fsm_state19_blk = 1'b1;
    end else begin
        ap_ST_fsm_state19_blk = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((count7_empty_n == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((m_axi_gmem0_AWREADY == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((~((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1)) & (in_val_last_V_load_load_fu_159_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1)) & (in_val_last_V_load_load_fu_159_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        buf_r_read = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_buf_r_read;
    end else begin
        buf_r_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        count7_blk_n = count7_empty_n;
    end else begin
        count7_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((count7_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        count7_read = 1'b1;
    end else begin
        count7_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        gmem0_blk_n_AW = m_axi_gmem0_AWREADY;
    end else begin
        gmem0_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) & (icmp_ln24_reg_207 == 1'd1))) begin
        gmem0_blk_n_B = m_axi_gmem0_BVALID;
    end else begin
        gmem0_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem0_AWADDR = sext_ln24_fu_137_p1;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWADDR = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWADDR;
    end else begin
        m_axi_gmem0_AWADDR = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWBURST = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWBURST;
    end else begin
        m_axi_gmem0_AWBURST = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWCACHE = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWCACHE;
    end else begin
        m_axi_gmem0_AWCACHE = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWID;
    end else begin
        m_axi_gmem0_AWID = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem0_AWLEN = tmp_reg_200;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWLEN = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWLEN;
    end else begin
        m_axi_gmem0_AWLEN = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWLOCK = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWLOCK;
    end else begin
        m_axi_gmem0_AWLOCK = 2'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWPROT = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWPROT;
    end else begin
        m_axi_gmem0_AWPROT = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWQOS = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWQOS;
    end else begin
        m_axi_gmem0_AWQOS = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWREGION = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWREGION;
    end else begin
        m_axi_gmem0_AWREGION = 4'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWSIZE = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWSIZE;
    end else begin
        m_axi_gmem0_AWSIZE = 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWUSER = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWUSER;
    end else begin
        m_axi_gmem0_AWUSER = 1'd0;
    end
end

always @ (*) begin
    if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_gmem0_AWVALID = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_AWVALID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_AWVALID;
    end else begin
        m_axi_gmem0_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1)) & (1'b1 == ap_CS_fsm_state19) & (icmp_ln24_reg_207 == 1'd1))) begin
        m_axi_gmem0_BREADY = 1'b1;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_BREADY = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_BREADY;
    end else begin
        m_axi_gmem0_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axi_gmem0_WVALID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WVALID;
    end else begin
        m_axi_gmem0_WVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((count7_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln24_fu_110_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end else if (((count7_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln24_fu_110_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((m_axi_gmem0_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            if ((~((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1)) & (in_val_last_V_load_load_fu_159_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state19))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1)) & (in_val_last_V_load_load_fu_159_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state19))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln24_fu_122_p2 = (shl_ln24_fu_116_p2 + p_read);

assign add_ln29_fu_165_p2 = ($signed(sext_ln29_fu_162_p1) + $signed(idx_fu_60));

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state19 = ((m_axi_gmem0_BVALID == 1'b0) & (icmp_ln24_reg_207 == 1'd1));
end

assign grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_ap_start_reg;

assign icmp_ln24_fu_110_p0 = count7_dout;

assign icmp_ln24_fu_110_p2 = (($signed(icmp_ln24_fu_110_p0) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign in_val_last_V_load_load_fu_159_p1 = in_val_last_V_fu_64;

assign m_axi_gmem0_ARADDR = 64'd0;

assign m_axi_gmem0_ARBURST = 2'd0;

assign m_axi_gmem0_ARCACHE = 4'd0;

assign m_axi_gmem0_ARID = 1'd0;

assign m_axi_gmem0_ARLEN = 32'd0;

assign m_axi_gmem0_ARLOCK = 2'd0;

assign m_axi_gmem0_ARPROT = 3'd0;

assign m_axi_gmem0_ARQOS = 4'd0;

assign m_axi_gmem0_ARREGION = 4'd0;

assign m_axi_gmem0_ARSIZE = 3'd0;

assign m_axi_gmem0_ARUSER = 1'd0;

assign m_axi_gmem0_ARVALID = 1'b0;

assign m_axi_gmem0_RREADY = 1'b0;

assign m_axi_gmem0_WDATA = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WDATA;

assign m_axi_gmem0_WID = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WID;

assign m_axi_gmem0_WLAST = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WLAST;

assign m_axi_gmem0_WSTRB = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WSTRB;

assign m_axi_gmem0_WUSER = grp_streamtoparallelwithburst_Pipeline_VITIS_LOOP_24_2_fu_91_m_axi_gmem0_WUSER;

assign sext_ln24_fu_137_p1 = $signed(trunc_ln_reg_211);

assign sext_ln29_fu_162_p1 = tmp_reg_200;

assign shl_ln24_fu_116_p2 = idx_fu_60 << 64'd3;

assign trunc_ln24_fu_147_p1 = tmp_reg_200[30:0];

endmodule //example_streamtoparallelwithburst