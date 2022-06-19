// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module TOP_deMixColumns (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        array_r_address0,
        array_r_ce0,
        array_r_we0,
        array_r_d0,
        array_r_q0,
        array_r_address1,
        array_r_ce1,
        array_r_we1,
        array_r_d1,
        array_r_q1
);

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] array_r_address0;
output   array_r_ce0;
output   array_r_we0;
output  [31:0] array_r_d0;
input  [31:0] array_r_q0;
output  [3:0] array_r_address1;
output   array_r_ce1;
output   array_r_we1;
output  [31:0] array_r_d1;
input  [31:0] array_r_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[3:0] array_r_address0;
reg array_r_ce0;
reg array_r_we0;
reg[31:0] array_r_d0;
reg[3:0] array_r_address1;
reg array_r_ce1;
reg array_r_we1;
reg[31:0] array_r_d1;

(* fsm_encoding = "none" *) reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] grp_GFMul_fu_213_ap_return;
reg   [31:0] reg_252;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state12;
wire   [31:0] grp_GFMul_fu_221_ap_return;
reg   [31:0] reg_256;
wire    ap_CS_fsm_state11;
wire   [31:0] grp_GFMul_fu_229_ap_return;
reg   [31:0] reg_260;
wire    ap_CS_fsm_state10;
wire   [3:0] array_addr_reg_525;
wire   [3:0] array_addr_1_reg_530;
wire   [3:0] array_addr_2_reg_535;
wire   [3:0] array_addr_3_reg_540;
reg   [31:0] array_load_reg_545;
reg   [31:0] array_load_1_reg_550;
wire   [31:0] grp_GFMul_fu_197_ap_return;
reg   [31:0] tmp_reg_556;
wire   [31:0] grp_GFMul_fu_205_ap_return;
reg   [31:0] tmp_0_1_reg_561;
wire   [3:0] array_addr_4_reg_566;
wire    ap_CS_fsm_state3;
wire   [3:0] array_addr_5_reg_571;
reg   [31:0] array_load_2_reg_576;
reg   [31:0] array_load_3_reg_582;
reg   [31:0] tmp_0_2_reg_588;
reg   [31:0] tmp_0_3_reg_593;
reg   [31:0] tmp_1_2_reg_598;
reg   [31:0] tmp_1_3_reg_603;
reg   [31:0] tmp_2_1_reg_608;
wire   [3:0] array_addr_6_reg_613;
wire    ap_CS_fsm_state4;
wire   [3:0] array_addr_7_reg_618;
reg   [31:0] array_load_4_reg_623;
reg   [31:0] array_load_5_reg_628;
reg   [31:0] tmp_7_reg_634;
reg   [31:0] tmp_7_0_1_reg_639;
reg   [31:0] tmp_7_1_reg_644;
reg   [31:0] tmp_7_1_1_reg_649;
reg   [31:0] tmp_7_2_reg_654;
wire   [3:0] array_addr_8_reg_659;
wire    ap_CS_fsm_state5;
wire   [3:0] array_addr_9_reg_664;
reg   [31:0] array_load_6_reg_669;
reg   [31:0] array_load_7_reg_675;
reg   [31:0] tmp_7_0_2_reg_681;
reg   [31:0] tmp_7_0_3_reg_686;
reg   [31:0] tmp_7_1_2_reg_691;
reg   [31:0] tmp_7_1_3_reg_696;
reg   [31:0] tmp_7_2_1_reg_701;
wire   [3:0] array_addr_10_reg_706;
wire    ap_CS_fsm_state6;
wire   [3:0] array_addr_11_reg_711;
reg   [31:0] array_load_8_reg_716;
reg   [31:0] array_load_9_reg_721;
reg   [31:0] tmp_8_reg_726;
reg   [31:0] tmp_8_0_1_reg_731;
reg   [31:0] tmp_8_1_reg_736;
reg   [31:0] tmp_8_1_1_reg_741;
reg   [31:0] tmp_8_2_reg_746;
wire   [3:0] array_addr_12_reg_751;
wire    ap_CS_fsm_state7;
wire   [3:0] array_addr_13_reg_756;
reg   [31:0] array_load_10_reg_761;
reg   [31:0] array_load_11_reg_767;
reg   [31:0] tmp_8_0_2_reg_773;
reg   [31:0] tmp_8_0_3_reg_778;
reg   [31:0] tmp_8_1_2_reg_783;
reg   [31:0] tmp_8_1_3_reg_788;
reg   [31:0] tmp_8_2_1_reg_793;
wire   [3:0] array_addr_14_reg_798;
wire    ap_CS_fsm_state8;
wire   [3:0] array_addr_15_reg_803;
reg   [31:0] array_load_12_reg_808;
reg   [31:0] array_load_13_reg_813;
wire   [31:0] xor_ln413_1_fu_273_p2;
reg   [31:0] xor_ln413_1_reg_819;
wire   [31:0] xor_ln413_3_fu_288_p2;
reg   [31:0] xor_ln413_3_reg_824;
wire   [31:0] xor_ln413_9_fu_304_p2;
reg   [31:0] xor_ln413_9_reg_829;
wire   [31:0] xor_ln413_11_fu_320_p2;
reg   [31:0] xor_ln413_11_reg_834;
wire   [31:0] xor_ln413_17_fu_336_p2;
reg   [31:0] xor_ln413_17_reg_839;
reg   [31:0] array_load_14_reg_844;
wire    ap_CS_fsm_state9;
reg   [31:0] array_load_15_reg_850;
wire   [31:0] xor_ln413_5_fu_351_p2;
reg   [31:0] xor_ln413_5_reg_856;
wire   [31:0] xor_ln413_7_fu_366_p2;
reg   [31:0] xor_ln413_7_reg_861;
wire   [31:0] xor_ln413_13_fu_381_p2;
reg   [31:0] xor_ln413_13_reg_866;
wire   [31:0] xor_ln413_15_fu_396_p2;
reg   [31:0] xor_ln413_15_reg_871;
wire   [31:0] xor_ln413_19_fu_411_p2;
reg   [31:0] xor_ln413_19_reg_876;
wire   [31:0] xor_ln413_21_fu_429_p2;
reg   [31:0] xor_ln413_21_reg_881;
wire   [31:0] xor_ln413_23_fu_447_p2;
reg   [31:0] xor_ln413_23_reg_886;
wire   [31:0] xor_ln413_25_fu_465_p2;
reg   [31:0] xor_ln413_25_reg_891;
wire   [31:0] xor_ln413_27_fu_483_p2;
reg   [31:0] xor_ln413_27_reg_896;
wire    ap_CS_fsm_state13;
wire   [31:0] xor_ln413_29_fu_501_p2;
reg   [31:0] xor_ln413_29_reg_901;
wire   [31:0] xor_ln413_31_fu_519_p2;
reg   [31:0] xor_ln413_31_reg_906;
wire    ap_CS_fsm_state14;
wire    grp_GFMul_fu_197_ap_ready;
reg   [3:0] grp_GFMul_fu_197_n;
reg   [31:0] grp_GFMul_fu_197_s;
wire    grp_GFMul_fu_205_ap_ready;
reg   [3:0] grp_GFMul_fu_205_n;
reg   [31:0] grp_GFMul_fu_205_s;
wire    grp_GFMul_fu_213_ap_ready;
reg   [3:0] grp_GFMul_fu_213_n;
reg   [31:0] grp_GFMul_fu_213_s;
wire    grp_GFMul_fu_221_ap_ready;
reg   [3:0] grp_GFMul_fu_221_n;
reg   [31:0] grp_GFMul_fu_221_s;
wire    grp_GFMul_fu_229_ap_ready;
reg   [3:0] grp_GFMul_fu_229_n;
reg   [31:0] grp_GFMul_fu_229_s;
wire    ap_CS_fsm_state15;
wire    ap_CS_fsm_state16;
wire   [31:0] xor_ln413_2_fu_268_p2;
wire   [31:0] xor_ln413_fu_264_p2;
wire   [31:0] xor_ln413_6_fu_283_p2;
wire   [31:0] xor_ln413_4_fu_279_p2;
wire   [31:0] xor_ln413_18_fu_299_p2;
wire   [31:0] xor_ln413_16_fu_294_p2;
wire   [31:0] xor_ln413_22_fu_315_p2;
wire   [31:0] xor_ln413_20_fu_310_p2;
wire   [31:0] xor_ln413_33_fu_331_p2;
wire   [31:0] xor_ln413_32_fu_326_p2;
wire   [31:0] xor_ln413_10_fu_346_p2;
wire   [31:0] xor_ln413_8_fu_342_p2;
wire   [31:0] xor_ln413_14_fu_361_p2;
wire   [31:0] xor_ln413_12_fu_357_p2;
wire   [31:0] xor_ln413_26_fu_376_p2;
wire   [31:0] xor_ln413_24_fu_372_p2;
wire   [31:0] xor_ln413_30_fu_391_p2;
wire   [31:0] xor_ln413_28_fu_387_p2;
wire   [31:0] xor_ln413_35_fu_406_p2;
wire   [31:0] xor_ln413_34_fu_402_p2;
wire   [31:0] xor_ln413_37_fu_423_p2;
wire   [31:0] xor_ln413_36_fu_417_p2;
wire   [31:0] xor_ln413_39_fu_441_p2;
wire   [31:0] xor_ln413_38_fu_435_p2;
wire   [31:0] xor_ln413_41_fu_459_p2;
wire   [31:0] xor_ln413_40_fu_453_p2;
wire   [31:0] xor_ln413_43_fu_477_p2;
wire   [31:0] xor_ln413_42_fu_471_p2;
wire   [31:0] xor_ln413_45_fu_495_p2;
wire   [31:0] xor_ln413_44_fu_489_p2;
wire   [31:0] xor_ln413_47_fu_513_p2;
wire   [31:0] xor_ln413_46_fu_507_p2;
reg   [15:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
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
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 16'd1;
end

TOP_GFMul grp_GFMul_fu_197(
    .ap_ready(grp_GFMul_fu_197_ap_ready),
    .n(grp_GFMul_fu_197_n),
    .s(grp_GFMul_fu_197_s),
    .ap_return(grp_GFMul_fu_197_ap_return)
);

TOP_GFMul grp_GFMul_fu_205(
    .ap_ready(grp_GFMul_fu_205_ap_ready),
    .n(grp_GFMul_fu_205_n),
    .s(grp_GFMul_fu_205_s),
    .ap_return(grp_GFMul_fu_205_ap_return)
);

TOP_GFMul grp_GFMul_fu_213(
    .ap_ready(grp_GFMul_fu_213_ap_ready),
    .n(grp_GFMul_fu_213_n),
    .s(grp_GFMul_fu_213_s),
    .ap_return(grp_GFMul_fu_213_ap_return)
);

TOP_GFMul grp_GFMul_fu_221(
    .ap_ready(grp_GFMul_fu_221_ap_ready),
    .n(grp_GFMul_fu_221_n),
    .s(grp_GFMul_fu_221_s),
    .ap_return(grp_GFMul_fu_221_ap_return)
);

TOP_GFMul grp_GFMul_fu_229(
    .ap_ready(grp_GFMul_fu_229_ap_ready),
    .n(grp_GFMul_fu_229_n),
    .s(grp_GFMul_fu_229_s),
    .ap_return(grp_GFMul_fu_229_ap_return)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        array_load_10_reg_761 <= array_r_q1;
        array_load_11_reg_767 <= array_r_q0;
        tmp_8_0_2_reg_773 <= grp_GFMul_fu_197_ap_return;
        tmp_8_0_3_reg_778 <= grp_GFMul_fu_205_ap_return;
        tmp_8_1_2_reg_783 <= grp_GFMul_fu_213_ap_return;
        tmp_8_1_3_reg_788 <= grp_GFMul_fu_221_ap_return;
        tmp_8_2_1_reg_793 <= grp_GFMul_fu_229_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        array_load_12_reg_808 <= array_r_q1;
        array_load_13_reg_813 <= array_r_q0;
        xor_ln413_11_reg_834 <= xor_ln413_11_fu_320_p2;
        xor_ln413_17_reg_839 <= xor_ln413_17_fu_336_p2;
        xor_ln413_1_reg_819 <= xor_ln413_1_fu_273_p2;
        xor_ln413_3_reg_824 <= xor_ln413_3_fu_288_p2;
        xor_ln413_9_reg_829 <= xor_ln413_9_fu_304_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        array_load_14_reg_844 <= array_r_q1;
        array_load_15_reg_850 <= array_r_q0;
        xor_ln413_13_reg_866 <= xor_ln413_13_fu_381_p2;
        xor_ln413_15_reg_871 <= xor_ln413_15_fu_396_p2;
        xor_ln413_19_reg_876 <= xor_ln413_19_fu_411_p2;
        xor_ln413_5_reg_856 <= xor_ln413_5_fu_351_p2;
        xor_ln413_7_reg_861 <= xor_ln413_7_fu_366_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        array_load_1_reg_550 <= array_r_q0;
        array_load_reg_545 <= array_r_q1;
        tmp_0_1_reg_561 <= grp_GFMul_fu_205_ap_return;
        tmp_reg_556 <= grp_GFMul_fu_197_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        array_load_2_reg_576 <= array_r_q1;
        array_load_3_reg_582 <= array_r_q0;
        tmp_0_2_reg_588 <= grp_GFMul_fu_197_ap_return;
        tmp_0_3_reg_593 <= grp_GFMul_fu_205_ap_return;
        tmp_1_2_reg_598 <= grp_GFMul_fu_213_ap_return;
        tmp_1_3_reg_603 <= grp_GFMul_fu_221_ap_return;
        tmp_2_1_reg_608 <= grp_GFMul_fu_229_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        array_load_4_reg_623 <= array_r_q1;
        array_load_5_reg_628 <= array_r_q0;
        tmp_7_0_1_reg_639 <= grp_GFMul_fu_205_ap_return;
        tmp_7_1_1_reg_649 <= grp_GFMul_fu_221_ap_return;
        tmp_7_1_reg_644 <= grp_GFMul_fu_213_ap_return;
        tmp_7_2_reg_654 <= grp_GFMul_fu_229_ap_return;
        tmp_7_reg_634 <= grp_GFMul_fu_197_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        array_load_6_reg_669 <= array_r_q1;
        array_load_7_reg_675 <= array_r_q0;
        tmp_7_0_2_reg_681 <= grp_GFMul_fu_197_ap_return;
        tmp_7_0_3_reg_686 <= grp_GFMul_fu_205_ap_return;
        tmp_7_1_2_reg_691 <= grp_GFMul_fu_213_ap_return;
        tmp_7_1_3_reg_696 <= grp_GFMul_fu_221_ap_return;
        tmp_7_2_1_reg_701 <= grp_GFMul_fu_229_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        array_load_8_reg_716 <= array_r_q1;
        array_load_9_reg_721 <= array_r_q0;
        tmp_8_0_1_reg_731 <= grp_GFMul_fu_205_ap_return;
        tmp_8_1_1_reg_741 <= grp_GFMul_fu_221_ap_return;
        tmp_8_1_reg_736 <= grp_GFMul_fu_213_ap_return;
        tmp_8_2_reg_746 <= grp_GFMul_fu_229_ap_return;
        tmp_8_reg_726 <= grp_GFMul_fu_197_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state2))) begin
        reg_252 <= grp_GFMul_fu_213_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state2))) begin
        reg_256 <= grp_GFMul_fu_221_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state2))) begin
        reg_260 <= grp_GFMul_fu_229_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        xor_ln413_21_reg_881 <= xor_ln413_21_fu_429_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        xor_ln413_23_reg_886 <= xor_ln413_23_fu_447_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        xor_ln413_25_reg_891 <= xor_ln413_25_fu_465_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        xor_ln413_27_reg_896 <= xor_ln413_27_fu_483_p2;
        xor_ln413_29_reg_901 <= xor_ln413_29_fu_501_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        xor_ln413_31_reg_906 <= xor_ln413_31_fu_519_p2;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

assign ap_ST_fsm_state11_blk = 1'b0;

assign ap_ST_fsm_state12_blk = 1'b0;

assign ap_ST_fsm_state13_blk = 1'b0;

assign ap_ST_fsm_state14_blk = 1'b0;

assign ap_ST_fsm_state15_blk = 1'b0;

assign ap_ST_fsm_state16_blk = 1'b0;

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state16) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
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
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        array_r_address0 = array_addr_15_reg_803;
    end else if ((1'b1 == ap_CS_fsm_state15)) begin
        array_r_address0 = array_addr_13_reg_756;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        array_r_address0 = array_addr_11_reg_711;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        array_r_address0 = array_addr_9_reg_664;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        array_r_address0 = array_addr_7_reg_618;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        array_r_address0 = array_addr_5_reg_571;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        array_r_address0 = array_addr_3_reg_540;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        array_r_address0 = array_addr_1_reg_530;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        array_r_address0 = 64'd15;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        array_r_address0 = 64'd13;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        array_r_address0 = 64'd11;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        array_r_address0 = 64'd9;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        array_r_address0 = 64'd7;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        array_r_address0 = 64'd5;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        array_r_address0 = 64'd3;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        array_r_address0 = 64'd1;
    end else begin
        array_r_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        array_r_address1 = array_addr_14_reg_798;
    end else if ((1'b1 == ap_CS_fsm_state15)) begin
        array_r_address1 = array_addr_12_reg_751;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        array_r_address1 = array_addr_10_reg_706;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        array_r_address1 = array_addr_8_reg_659;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        array_r_address1 = array_addr_6_reg_613;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        array_r_address1 = array_addr_4_reg_566;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        array_r_address1 = array_addr_2_reg_535;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        array_r_address1 = array_addr_reg_525;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        array_r_address1 = 64'd14;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        array_r_address1 = 64'd12;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        array_r_address1 = 64'd10;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        array_r_address1 = 64'd8;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        array_r_address1 = 64'd6;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        array_r_address1 = 64'd4;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        array_r_address1 = 64'd2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        array_r_address1 = 64'd0;
    end else begin
        array_r_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        array_r_ce0 = 1'b1;
    end else begin
        array_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        array_r_ce1 = 1'b1;
    end else begin
        array_r_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        array_r_d0 = xor_ln413_31_reg_906;
    end else if ((1'b1 == ap_CS_fsm_state15)) begin
        array_r_d0 = xor_ln413_27_reg_896;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        array_r_d0 = xor_ln413_23_reg_886;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        array_r_d0 = xor_ln413_19_reg_876;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        array_r_d0 = xor_ln413_15_reg_871;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        array_r_d0 = xor_ln413_11_reg_834;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        array_r_d0 = xor_ln413_7_reg_861;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        array_r_d0 = xor_ln413_3_reg_824;
    end else begin
        array_r_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        array_r_d1 = xor_ln413_29_reg_901;
    end else if ((1'b1 == ap_CS_fsm_state15)) begin
        array_r_d1 = xor_ln413_25_reg_891;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        array_r_d1 = xor_ln413_21_reg_881;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        array_r_d1 = xor_ln413_17_reg_839;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        array_r_d1 = xor_ln413_13_reg_866;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        array_r_d1 = xor_ln413_9_reg_829;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        array_r_d1 = xor_ln413_5_reg_856;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        array_r_d1 = xor_ln413_1_reg_819;
    end else begin
        array_r_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state9))) begin
        array_r_we0 = 1'b1;
    end else begin
        array_r_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state9))) begin
        array_r_we1 = 1'b1;
    end else begin
        array_r_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8))) begin
        grp_GFMul_fu_197_n = 4'd9;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        grp_GFMul_fu_197_n = 4'd13;
    end else if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        grp_GFMul_fu_197_n = 4'd11;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_197_n = 4'd14;
    end else begin
        grp_GFMul_fu_197_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_GFMul_fu_197_s = array_load_3_reg_582;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_GFMul_fu_197_s = array_load_13_reg_813;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        grp_GFMul_fu_197_s = array_load_8_reg_716;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_GFMul_fu_197_s = array_load_7_reg_675;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_GFMul_fu_197_s = array_load_2_reg_576;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_197_s = array_r_q1;
    end else begin
        grp_GFMul_fu_197_s = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8))) begin
        grp_GFMul_fu_205_n = 4'd9;
    end else if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        grp_GFMul_fu_205_n = 4'd13;
    end else if (((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        grp_GFMul_fu_205_n = 4'd11;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_205_n = 4'd14;
    end else begin
        grp_GFMul_fu_205_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_GFMul_fu_205_s = array_load_7_reg_675;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_GFMul_fu_205_s = array_load_2_reg_576;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        grp_GFMul_fu_205_s = array_load_12_reg_808;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_GFMul_fu_205_s = array_load_11_reg_767;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_GFMul_fu_205_s = array_load_6_reg_669;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_205_s = array_r_q0;
    end else begin
        grp_GFMul_fu_205_s = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8))) begin
        grp_GFMul_fu_213_n = 4'd13;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        grp_GFMul_fu_213_n = 4'd11;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        grp_GFMul_fu_213_n = 4'd14;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_213_n = 4'd9;
    end else begin
        grp_GFMul_fu_213_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_GFMul_fu_213_s = array_load_11_reg_767;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_GFMul_fu_213_s = array_load_6_reg_669;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        grp_GFMul_fu_213_s = array_load_1_reg_550;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_GFMul_fu_213_s = array_load_15_reg_850;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_GFMul_fu_213_s = array_load_10_reg_761;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_213_s = array_r_q1;
    end else begin
        grp_GFMul_fu_213_s = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8))) begin
        grp_GFMul_fu_221_n = 4'd13;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        grp_GFMul_fu_221_n = 4'd11;
    end else if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        grp_GFMul_fu_221_n = 4'd14;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_221_n = 4'd9;
    end else begin
        grp_GFMul_fu_221_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_GFMul_fu_221_s = array_load_15_reg_850;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_GFMul_fu_221_s = array_load_10_reg_761;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        grp_GFMul_fu_221_s = array_load_5_reg_628;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_GFMul_fu_221_s = array_load_reg_545;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_GFMul_fu_221_s = array_load_14_reg_844;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_221_s = array_r_q0;
    end else begin
        grp_GFMul_fu_221_s = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8))) begin
        grp_GFMul_fu_229_n = 4'd11;
    end else if (((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6))) begin
        grp_GFMul_fu_229_n = 4'd14;
    end else if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
        grp_GFMul_fu_229_n = 4'd9;
    end else if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_GFMul_fu_229_n = 4'd13;
    end else begin
        grp_GFMul_fu_229_n = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        grp_GFMul_fu_229_s = array_load_14_reg_844;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_GFMul_fu_229_s = array_load_4_reg_623;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_GFMul_fu_229_s = array_load_3_reg_582;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        grp_GFMul_fu_229_s = array_load_13_reg_813;
    end else if (((1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state7))) begin
        grp_GFMul_fu_229_s = array_load_9_reg_721;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_GFMul_fu_229_s = array_load_5_reg_628;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_GFMul_fu_229_s = array_load_1_reg_550;
    end else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state4))) begin
        grp_GFMul_fu_229_s = array_r_q1;
    end else begin
        grp_GFMul_fu_229_s = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign array_addr_10_reg_706 = 64'd10;

assign array_addr_11_reg_711 = 64'd11;

assign array_addr_12_reg_751 = 64'd12;

assign array_addr_13_reg_756 = 64'd13;

assign array_addr_14_reg_798 = 64'd14;

assign array_addr_15_reg_803 = 64'd15;

assign array_addr_1_reg_530 = 64'd1;

assign array_addr_2_reg_535 = 64'd2;

assign array_addr_3_reg_540 = 64'd3;

assign array_addr_4_reg_566 = 64'd4;

assign array_addr_5_reg_571 = 64'd5;

assign array_addr_6_reg_613 = 64'd6;

assign array_addr_7_reg_618 = 64'd7;

assign array_addr_8_reg_659 = 64'd8;

assign array_addr_9_reg_664 = 64'd9;

assign array_addr_reg_525 = 64'd0;

assign xor_ln413_10_fu_346_p2 = (tmp_8_0_2_reg_773 ^ grp_GFMul_fu_197_ap_return);

assign xor_ln413_11_fu_320_p2 = (xor_ln413_22_fu_315_p2 ^ xor_ln413_20_fu_310_p2);

assign xor_ln413_12_fu_357_p2 = (tmp_7_0_3_reg_686 ^ tmp_0_3_reg_593);

assign xor_ln413_13_fu_381_p2 = (xor_ln413_26_fu_376_p2 ^ xor_ln413_24_fu_372_p2);

assign xor_ln413_14_fu_361_p2 = (tmp_8_0_3_reg_778 ^ grp_GFMul_fu_205_ap_return);

assign xor_ln413_15_fu_396_p2 = (xor_ln413_30_fu_391_p2 ^ xor_ln413_28_fu_387_p2);

assign xor_ln413_16_fu_294_p2 = (tmp_7_1_reg_644 ^ reg_252);

assign xor_ln413_17_fu_336_p2 = (xor_ln413_33_fu_331_p2 ^ xor_ln413_32_fu_326_p2);

assign xor_ln413_18_fu_299_p2 = (tmp_8_1_reg_736 ^ grp_GFMul_fu_213_ap_return);

assign xor_ln413_19_fu_411_p2 = (xor_ln413_35_fu_406_p2 ^ xor_ln413_34_fu_402_p2);

assign xor_ln413_1_fu_273_p2 = (xor_ln413_fu_264_p2 ^ xor_ln413_2_fu_268_p2);

assign xor_ln413_20_fu_310_p2 = (tmp_7_1_1_reg_649 ^ reg_256);

assign xor_ln413_21_fu_429_p2 = (xor_ln413_37_fu_423_p2 ^ xor_ln413_36_fu_417_p2);

assign xor_ln413_22_fu_315_p2 = (tmp_8_1_1_reg_741 ^ grp_GFMul_fu_221_ap_return);

assign xor_ln413_23_fu_447_p2 = (xor_ln413_39_fu_441_p2 ^ xor_ln413_38_fu_435_p2);

assign xor_ln413_24_fu_372_p2 = (tmp_7_1_2_reg_691 ^ tmp_1_2_reg_598);

assign xor_ln413_25_fu_465_p2 = (xor_ln413_41_fu_459_p2 ^ xor_ln413_40_fu_453_p2);

assign xor_ln413_26_fu_376_p2 = (tmp_8_1_2_reg_783 ^ grp_GFMul_fu_213_ap_return);

assign xor_ln413_27_fu_483_p2 = (xor_ln413_43_fu_477_p2 ^ xor_ln413_42_fu_471_p2);

assign xor_ln413_28_fu_387_p2 = (tmp_7_1_3_reg_696 ^ tmp_1_3_reg_603);

assign xor_ln413_29_fu_501_p2 = (xor_ln413_45_fu_495_p2 ^ xor_ln413_44_fu_489_p2);

assign xor_ln413_2_fu_268_p2 = (tmp_8_reg_726 ^ grp_GFMul_fu_197_ap_return);

assign xor_ln413_30_fu_391_p2 = (tmp_8_1_3_reg_788 ^ grp_GFMul_fu_221_ap_return);

assign xor_ln413_31_fu_519_p2 = (xor_ln413_47_fu_513_p2 ^ xor_ln413_46_fu_507_p2);

assign xor_ln413_32_fu_326_p2 = (tmp_7_2_reg_654 ^ reg_260);

assign xor_ln413_33_fu_331_p2 = (tmp_8_2_reg_746 ^ grp_GFMul_fu_229_ap_return);

assign xor_ln413_34_fu_402_p2 = (tmp_7_2_1_reg_701 ^ tmp_2_1_reg_608);

assign xor_ln413_35_fu_406_p2 = (tmp_8_2_1_reg_793 ^ grp_GFMul_fu_229_ap_return);

assign xor_ln413_36_fu_417_p2 = (grp_GFMul_fu_205_ap_return ^ grp_GFMul_fu_197_ap_return);

assign xor_ln413_37_fu_423_p2 = (grp_GFMul_fu_221_ap_return ^ grp_GFMul_fu_213_ap_return);

assign xor_ln413_38_fu_435_p2 = (reg_260 ^ grp_GFMul_fu_197_ap_return);

assign xor_ln413_39_fu_441_p2 = (grp_GFMul_fu_213_ap_return ^ grp_GFMul_fu_205_ap_return);

assign xor_ln413_3_fu_288_p2 = (xor_ln413_6_fu_283_p2 ^ xor_ln413_4_fu_279_p2);

assign xor_ln413_40_fu_453_p2 = (reg_260 ^ reg_256);

assign xor_ln413_41_fu_459_p2 = (grp_GFMul_fu_205_ap_return ^ grp_GFMul_fu_197_ap_return);

assign xor_ln413_42_fu_471_p2 = (reg_256 ^ reg_252);

assign xor_ln413_43_fu_477_p2 = (reg_260 ^ grp_GFMul_fu_197_ap_return);

assign xor_ln413_44_fu_489_p2 = (grp_GFMul_fu_213_ap_return ^ grp_GFMul_fu_205_ap_return);

assign xor_ln413_45_fu_495_p2 = (grp_GFMul_fu_229_ap_return ^ grp_GFMul_fu_221_ap_return);

assign xor_ln413_46_fu_507_p2 = (grp_GFMul_fu_205_ap_return ^ grp_GFMul_fu_197_ap_return);

assign xor_ln413_47_fu_513_p2 = (grp_GFMul_fu_221_ap_return ^ grp_GFMul_fu_213_ap_return);

assign xor_ln413_4_fu_279_p2 = (tmp_7_0_1_reg_639 ^ tmp_0_1_reg_561);

assign xor_ln413_5_fu_351_p2 = (xor_ln413_8_fu_342_p2 ^ xor_ln413_10_fu_346_p2);

assign xor_ln413_6_fu_283_p2 = (tmp_8_0_1_reg_731 ^ grp_GFMul_fu_205_ap_return);

assign xor_ln413_7_fu_366_p2 = (xor_ln413_14_fu_361_p2 ^ xor_ln413_12_fu_357_p2);

assign xor_ln413_8_fu_342_p2 = (tmp_7_0_2_reg_681 ^ tmp_0_2_reg_588);

assign xor_ln413_9_fu_304_p2 = (xor_ln413_18_fu_299_p2 ^ xor_ln413_16_fu_294_p2);

assign xor_ln413_fu_264_p2 = (tmp_reg_556 ^ tmp_7_reg_634);

endmodule //TOP_deMixColumns