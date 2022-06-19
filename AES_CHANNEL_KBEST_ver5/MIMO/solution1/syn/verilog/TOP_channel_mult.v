// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module TOP_channel_mult (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        H_real_spl0_dout,
        H_real_spl0_empty_n,
        H_real_spl0_read,
        H_imag_spl0_dout,
        H_imag_spl0_empty_n,
        H_imag_spl0_read,
        xr_dout,
        xr_empty_n,
        xr_read,
        xi_dout,
        xi_empty_n,
        xi_read,
        channel_out_din,
        channel_out_full_n,
        channel_out_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] H_real_spl0_dout;
input   H_real_spl0_empty_n;
output   H_real_spl0_read;
input  [15:0] H_imag_spl0_dout;
input   H_imag_spl0_empty_n;
output   H_imag_spl0_read;
input  [15:0] xr_dout;
input   xr_empty_n;
output   xr_read;
input  [15:0] xi_dout;
input   xi_empty_n;
output   xi_read;
output  [15:0] channel_out_din;
input   channel_out_full_n;
output   channel_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg H_real_spl0_read;
reg H_imag_spl0_read;
reg xr_read;
reg xi_read;
reg channel_out_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_done;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_idle;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_ready;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_H_real_spl0_read;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_H_imag_spl0_read;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080344_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080344_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080341_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080341_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080338_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080338_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080335_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080335_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080330_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080330_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080327_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080327_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080324_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080324_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080321_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080321_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080320_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080320_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080317_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080317_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080314_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080314_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080311_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080311_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080308_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080308_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080305_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080305_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080302_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080302_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080299_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080299_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_1_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_1_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_2_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_2_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_conv_i_i_i35287_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_conv_i_i_i35287_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_3_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_3_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_4_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_4_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_5_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_5_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_6_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_6_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_7_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_7_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_8_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_8_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_9_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_9_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_10_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_10_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_11_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_11_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_12_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_12_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_13_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_13_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_14_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_14_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_15_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_15_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_16_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_16_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_17_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_17_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079239_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079239_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_18_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_18_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_19_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_19_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_20_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_20_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_21_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_21_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_22_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_22_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_23_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_23_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_24_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_24_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_25_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_25_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_26_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_26_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_27_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_27_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_28_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_28_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_29_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_29_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_30_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_30_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_31_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_31_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_32_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_32_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079191_i_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079191_i_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_33_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_33_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_34_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_34_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_35_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_35_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_36_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_36_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_37_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_37_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_38_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_38_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_39_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_39_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_40_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_40_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_41_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_41_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_42_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_42_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_43_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_43_out_ap_vld;
wire   [15:0] grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_44_out;
wire    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_44_out_ap_vld;
wire    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start;
wire    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_done;
wire    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_idle;
wire    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_ready;
wire   [15:0] grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_channel_out_din;
wire    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_channel_out_write;
wire    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_xr_read;
wire    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_xi_read;
reg    grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start_reg;
reg    ap_block_state1_ignore_call85;
wire    ap_CS_fsm_state2;
reg    grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start_reg;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg   [4:0] ap_NS_fsm;
reg    ap_block_state1;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start_reg = 1'b0;
#0 grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start_reg = 1'b0;
end

TOP_channel_mult_Pipeline_CHANNEL2REAL grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start),
    .ap_done(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_done),
    .ap_idle(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_idle),
    .ap_ready(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_ready),
    .H_real_spl0_dout(H_real_spl0_dout),
    .H_real_spl0_empty_n(H_real_spl0_empty_n),
    .H_real_spl0_read(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_H_real_spl0_read),
    .H_imag_spl0_dout(H_imag_spl0_dout),
    .H_imag_spl0_empty_n(H_imag_spl0_empty_n),
    .H_imag_spl0_read(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_H_imag_spl0_read),
    .p_0_0_080344_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080344_i_out),
    .p_0_0_080344_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080344_i_out_ap_vld),
    .p_0_0_080341_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080341_i_out),
    .p_0_0_080341_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080341_i_out_ap_vld),
    .p_0_0_080338_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080338_i_out),
    .p_0_0_080338_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080338_i_out_ap_vld),
    .p_0_0_080335_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080335_i_out),
    .p_0_0_080335_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080335_i_out_ap_vld),
    .p_0_0_080330_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080330_i_out),
    .p_0_0_080330_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080330_i_out_ap_vld),
    .p_0_0_080327_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080327_i_out),
    .p_0_0_080327_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080327_i_out_ap_vld),
    .p_0_0_080324_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080324_i_out),
    .p_0_0_080324_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080324_i_out_ap_vld),
    .p_0_0_080321_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080321_i_out),
    .p_0_0_080321_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080321_i_out_ap_vld),
    .p_0_0_080320_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080320_i_out),
    .p_0_0_080320_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080320_i_out_ap_vld),
    .p_0_0_080317_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080317_i_out),
    .p_0_0_080317_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080317_i_out_ap_vld),
    .p_0_0_080314_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080314_i_out),
    .p_0_0_080314_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080314_i_out_ap_vld),
    .p_0_0_080311_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080311_i_out),
    .p_0_0_080311_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080311_i_out_ap_vld),
    .p_0_0_080308_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080308_i_out),
    .p_0_0_080308_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080308_i_out_ap_vld),
    .p_0_0_080305_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080305_i_out),
    .p_0_0_080305_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080305_i_out_ap_vld),
    .p_0_0_080302_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080302_i_out),
    .p_0_0_080302_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080302_i_out_ap_vld),
    .p_0_0_080299_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080299_i_out),
    .p_0_0_080299_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080299_i_out_ap_vld),
    .CHANNEL_V_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_out),
    .CHANNEL_V_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_out_ap_vld),
    .CHANNEL_V_1_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_1_out),
    .CHANNEL_V_1_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_1_out_ap_vld),
    .CHANNEL_V_2_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_2_out),
    .CHANNEL_V_2_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_2_out_ap_vld),
    .conv_i_i_i35287_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_conv_i_i_i35287_i_out),
    .conv_i_i_i35287_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_conv_i_i_i35287_i_out_ap_vld),
    .CHANNEL_V_3_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_3_out),
    .CHANNEL_V_3_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_3_out_ap_vld),
    .CHANNEL_V_4_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_4_out),
    .CHANNEL_V_4_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_4_out_ap_vld),
    .CHANNEL_V_5_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_5_out),
    .CHANNEL_V_5_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_5_out_ap_vld),
    .CHANNEL_V_6_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_6_out),
    .CHANNEL_V_6_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_6_out_ap_vld),
    .CHANNEL_V_7_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_7_out),
    .CHANNEL_V_7_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_7_out_ap_vld),
    .CHANNEL_V_8_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_8_out),
    .CHANNEL_V_8_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_8_out_ap_vld),
    .CHANNEL_V_9_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_9_out),
    .CHANNEL_V_9_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_9_out_ap_vld),
    .CHANNEL_V_10_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_10_out),
    .CHANNEL_V_10_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_10_out_ap_vld),
    .CHANNEL_V_11_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_11_out),
    .CHANNEL_V_11_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_11_out_ap_vld),
    .CHANNEL_V_12_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_12_out),
    .CHANNEL_V_12_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_12_out_ap_vld),
    .CHANNEL_V_13_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_13_out),
    .CHANNEL_V_13_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_13_out_ap_vld),
    .CHANNEL_V_14_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_14_out),
    .CHANNEL_V_14_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_14_out_ap_vld),
    .CHANNEL_V_15_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_15_out),
    .CHANNEL_V_15_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_15_out_ap_vld),
    .CHANNEL_V_16_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_16_out),
    .CHANNEL_V_16_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_16_out_ap_vld),
    .CHANNEL_V_17_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_17_out),
    .CHANNEL_V_17_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_17_out_ap_vld),
    .p_0_0_079239_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079239_i_out),
    .p_0_0_079239_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079239_i_out_ap_vld),
    .CHANNEL_V_18_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_18_out),
    .CHANNEL_V_18_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_18_out_ap_vld),
    .CHANNEL_V_19_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_19_out),
    .CHANNEL_V_19_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_19_out_ap_vld),
    .CHANNEL_V_20_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_20_out),
    .CHANNEL_V_20_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_20_out_ap_vld),
    .CHANNEL_V_21_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_21_out),
    .CHANNEL_V_21_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_21_out_ap_vld),
    .CHANNEL_V_22_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_22_out),
    .CHANNEL_V_22_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_22_out_ap_vld),
    .CHANNEL_V_23_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_23_out),
    .CHANNEL_V_23_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_23_out_ap_vld),
    .CHANNEL_V_24_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_24_out),
    .CHANNEL_V_24_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_24_out_ap_vld),
    .CHANNEL_V_25_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_25_out),
    .CHANNEL_V_25_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_25_out_ap_vld),
    .CHANNEL_V_26_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_26_out),
    .CHANNEL_V_26_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_26_out_ap_vld),
    .CHANNEL_V_27_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_27_out),
    .CHANNEL_V_27_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_27_out_ap_vld),
    .CHANNEL_V_28_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_28_out),
    .CHANNEL_V_28_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_28_out_ap_vld),
    .CHANNEL_V_29_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_29_out),
    .CHANNEL_V_29_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_29_out_ap_vld),
    .CHANNEL_V_30_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_30_out),
    .CHANNEL_V_30_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_30_out_ap_vld),
    .CHANNEL_V_31_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_31_out),
    .CHANNEL_V_31_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_31_out_ap_vld),
    .CHANNEL_V_32_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_32_out),
    .CHANNEL_V_32_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_32_out_ap_vld),
    .p_0_0_079191_i_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079191_i_out),
    .p_0_0_079191_i_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079191_i_out_ap_vld),
    .CHANNEL_V_33_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_33_out),
    .CHANNEL_V_33_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_33_out_ap_vld),
    .CHANNEL_V_34_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_34_out),
    .CHANNEL_V_34_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_34_out_ap_vld),
    .CHANNEL_V_35_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_35_out),
    .CHANNEL_V_35_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_35_out_ap_vld),
    .CHANNEL_V_36_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_36_out),
    .CHANNEL_V_36_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_36_out_ap_vld),
    .CHANNEL_V_37_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_37_out),
    .CHANNEL_V_37_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_37_out_ap_vld),
    .CHANNEL_V_38_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_38_out),
    .CHANNEL_V_38_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_38_out_ap_vld),
    .CHANNEL_V_39_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_39_out),
    .CHANNEL_V_39_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_39_out_ap_vld),
    .CHANNEL_V_40_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_40_out),
    .CHANNEL_V_40_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_40_out_ap_vld),
    .CHANNEL_V_41_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_41_out),
    .CHANNEL_V_41_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_41_out_ap_vld),
    .CHANNEL_V_42_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_42_out),
    .CHANNEL_V_42_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_42_out_ap_vld),
    .CHANNEL_V_43_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_43_out),
    .CHANNEL_V_43_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_43_out_ap_vld),
    .CHANNEL_V_44_out(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_44_out),
    .CHANNEL_V_44_out_ap_vld(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_44_out_ap_vld)
);

TOP_channel_mult_Pipeline_VITIS_LOOP_63_1 grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start),
    .ap_done(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_done),
    .ap_idle(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_idle),
    .ap_ready(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_ready),
    .channel_out_din(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_channel_out_din),
    .channel_out_full_n(channel_out_full_n),
    .channel_out_write(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_channel_out_write),
    .sext_ln1171(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_34_out),
    .sext_ln1171_72(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_4_out),
    .sext_ln1171_73(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_35_out),
    .sext_ln1171_74(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_5_out),
    .sext_ln1171_75(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_36_out),
    .sext_ln1171_76(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_6_out),
    .sext_ln1171_77(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_33_out),
    .sext_ln1171_78(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_3_out),
    .sext_ln1171_79(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080327_i_out),
    .sext_ln1171_80(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_19_out),
    .sext_ln1171_81(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080324_i_out),
    .sext_ln1171_82(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_20_out),
    .sext_ln1171_83(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080321_i_out),
    .sext_ln1171_84(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_21_out),
    .sext_ln1171_85(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080330_i_out),
    .sext_ln1171_86(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_18_out),
    .sext_ln1171_87(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_38_out),
    .sext_ln1171_88(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_8_out),
    .sext_ln1171_89(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_39_out),
    .sext_ln1171_90(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_9_out),
    .sext_ln1171_91(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_40_out),
    .sext_ln1171_92(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_10_out),
    .sext_ln1171_93(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_37_out),
    .sext_ln1171_94(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_7_out),
    .sext_ln1171_95(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080317_i_out),
    .sext_ln1171_96(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_23_out),
    .sext_ln1171_97(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080314_i_out),
    .sext_ln1171_98(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_24_out),
    .sext_ln1171_99(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080311_i_out),
    .sext_ln1171_100(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_25_out),
    .sext_ln1171_101(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080320_i_out),
    .sext_ln1171_102(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_22_out),
    .sext_ln1171_103(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_42_out),
    .sext_ln1171_104(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_12_out),
    .sext_ln1171_105(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_43_out),
    .sext_ln1171_106(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_13_out),
    .sext_ln1171_107(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_44_out),
    .sext_ln1171_108(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_14_out),
    .sext_ln1171_109(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_41_out),
    .sext_ln1171_110(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_11_out),
    .sext_ln1171_111(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080305_i_out),
    .sext_ln1171_112(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_27_out),
    .sext_ln1171_113(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080302_i_out),
    .sext_ln1171_114(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_28_out),
    .sext_ln1171_115(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080299_i_out),
    .sext_ln1171_116(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_29_out),
    .sext_ln1171_117(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080308_i_out),
    .sext_ln1171_118(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_26_out),
    .sext_ln1171_119(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_31_out),
    .sext_ln1171_120(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_1_out),
    .sext_ln1171_121(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_32_out),
    .sext_ln1171_122(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_2_out),
    .sext_ln1171_123(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079191_i_out),
    .sext_ln1171_124(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_conv_i_i_i35287_i_out),
    .sext_ln1171_125(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_30_out),
    .sext_ln1171_126(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_out),
    .sext_ln1171_127(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080341_i_out),
    .sext_ln1171_128(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_16_out),
    .sext_ln1171_129(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080338_i_out),
    .sext_ln1171_130(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_17_out),
    .sext_ln1171_131(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080335_i_out),
    .sext_ln1171_132(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_079239_i_out),
    .sext_ln1171_133(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_p_0_0_080344_i_out),
    .sext_ln1171_134(grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_CHANNEL_V_15_out),
    .xr_dout(xr_dout),
    .xr_empty_n(xr_empty_n),
    .xr_read(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_xr_read),
    .xi_dout(xi_dout),
    .xi_empty_n(xi_empty_n),
    .xi_read(grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_xi_read)
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
        end else if (((1'b1 == ap_CS_fsm_state5) & (grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_done == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start_reg <= 1'b0;
    end else begin
        if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start_reg <= 1'b1;
        end else if ((grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_ready == 1'b1)) begin
            grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start_reg <= 1'b1;
        end else if ((grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_ready == 1'b1)) begin
            grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        H_imag_spl0_read = grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_H_imag_spl0_read;
    end else begin
        H_imag_spl0_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        H_real_spl0_read = grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_H_real_spl0_read;
    end else begin
        H_real_spl0_read = 1'b0;
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
    if ((grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_done == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_done == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_done == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_done == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        channel_out_write = grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_channel_out_write;
    end else begin
        channel_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        xi_read = grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_xi_read;
    end else begin
        xi_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        xr_read = grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_xr_read;
    end else begin
        xr_read = 1'b0;
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
            if (((grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state1_ignore_call85 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign channel_out_din = grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_channel_out_din;

assign grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start = grp_channel_mult_Pipeline_CHANNEL2REAL_fu_282_ap_start_reg;

assign grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start = grp_channel_mult_Pipeline_VITIS_LOOP_63_1_fu_354_ap_start_reg;

endmodule //TOP_channel_mult