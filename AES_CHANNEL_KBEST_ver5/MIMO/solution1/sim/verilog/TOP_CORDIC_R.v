// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module TOP_CORDIC_R (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x_in,
        y_in,
        z_in,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] x_in;
input  [15:0] y_in;
input  [15:0] z_in;
output  [63:0] ap_return_0;
output  [63:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[63:0] ap_return_0;
reg[63:0] ap_return_1;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] cordic_phase_V_address0;
reg    cordic_phase_V_ce0;
wire   [7:0] cordic_phase_V_q0;
reg   [3:0] k_4_reg_1132;
wire    ap_CS_fsm_state2;
reg   [15:0] r_V_18_load_1_reg_1140;
wire   [0:0] icmp_ln29_fu_268_p2;
reg   [15:0] r_V_19_load_1_reg_1147;
wire   [0:0] tmp_438_fu_301_p3;
reg   [0:0] tmp_438_reg_1169;
wire    ap_CS_fsm_state3;
wire    grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start;
wire    grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_done;
wire    grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_idle;
wire    grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_ready;
wire   [15:0] grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_y_V_4_out;
wire    grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_y_V_4_out_ap_vld;
wire   [15:0] grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_x_V_4_out;
wire    grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_x_V_4_out_ap_vld;
reg    grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start_reg;
wire   [63:0] zext_ln29_fu_280_p1;
reg  signed [15:0] r_V_18_fu_108;
wire   [15:0] x_V_10_fu_364_p3;
wire   [15:0] x_V_7_fu_236_p3;
wire    ap_CS_fsm_state4;
reg  signed [15:0] r_V_19_fu_112;
wire   [15:0] y_V_17_fu_371_p3;
wire   [15:0] y_V_14_fu_228_p3;
reg   [15:0] z_V_5_fu_116;
wire   [15:0] z_V_8_fu_325_p3;
wire   [15:0] z_V_fu_222_p2;
reg   [3:0] k_fu_120;
wire   [3:0] add_ln29_fu_274_p2;
wire   [0:0] tmp_429_fu_200_p3;
wire   [15:0] add_ln1548_fu_216_p2;
wire   [15:0] select_ln1548_fu_208_p3;
wire   [0:0] tmp_428_fu_180_p3;
wire   [15:0] y_V_fu_188_p2;
wire   [15:0] x_V_fu_194_p2;
wire   [15:0] cordic_phase_V_load_cast_fu_309_p1;
wire   [15:0] z_V_6_fu_313_p2;
wire   [15:0] z_V_7_fu_319_p2;
wire   [15:0] x_V_8_fu_344_p2;
wire   [15:0] x_V_9_fu_354_p2;
wire   [15:0] y_V_15_fu_349_p2;
wire   [15:0] y_V_16_fu_359_p2;
wire  signed [24:0] grp_fu_1074_p2;
wire    ap_CS_fsm_state7;
wire   [22:0] trunc_ln1168_fu_388_p1;
wire   [0:0] p_Result_267_fu_396_p3;
wire   [22:0] tmp_V_fu_403_p2;
wire   [22:0] tmp_V_13_fu_409_p3;
wire   [31:0] zext_ln940_fu_417_p1;
reg   [31:0] p_Result_268_fu_421_p4;
reg   [31:0] l_fu_431_p3;
wire   [31:0] sub_ln947_fu_439_p2;
wire   [31:0] lsb_index_fu_445_p2;
wire   [30:0] tmp_431_fu_451_p4;
wire   [5:0] trunc_ln950_fu_471_p1;
wire   [5:0] sub_ln950_fu_475_p2;
wire   [31:0] zext_ln950_fu_481_p1;
wire   [31:0] lshr_ln950_fu_485_p2;
wire   [31:0] shl_ln952_fu_497_p2;
wire   [22:0] trunc_ln952_fu_503_p1;
wire   [31:0] p_Result_s_fu_491_p2;
wire   [22:0] trunc_ln952_2_fu_513_p1;
wire   [22:0] and_ln952_fu_507_p2;
wire   [8:0] tmp_3_fu_523_p4;
wire   [22:0] or_ln952_4_fu_517_p2;
wire   [31:0] or_ln_fu_533_p3;
wire   [0:0] tmp_432_fu_547_p3;
wire   [0:0] p_Result_269_fu_561_p3;
wire   [0:0] xor_ln952_fu_555_p2;
wire   [31:0] sub_ln962_fu_581_p2;
wire   [63:0] zext_ln960_fu_467_p1;
wire   [63:0] zext_ln962_fu_587_p1;
wire   [0:0] icmp_ln949_fu_461_p2;
wire   [0:0] icmp_ln952_fu_541_p2;
wire   [31:0] add_ln961_fu_605_p2;
wire   [63:0] zext_ln961_fu_611_p1;
wire   [0:0] icmp_ln961_fu_569_p2;
wire   [0:0] select_ln949_fu_597_p3;
wire   [0:0] and_ln952_6_fu_575_p2;
wire   [63:0] lshr_ln961_fu_615_p2;
wire   [63:0] shl_ln962_fu_591_p2;
wire   [0:0] select_ln961_fu_621_p3;
wire   [63:0] m_24_fu_629_p3;
wire   [63:0] zext_ln964_fu_637_p1;
wire   [63:0] m_25_fu_641_p2;
wire   [62:0] m_31_fu_647_p4;
wire   [0:0] p_Result_259_fu_661_p3;
wire   [10:0] trunc_ln946_fu_677_p1;
wire   [10:0] sub_ln968_fu_681_p2;
wire   [10:0] select_ln946_fu_669_p3;
wire   [10:0] add_ln968_fu_687_p2;
wire   [63:0] zext_ln965_fu_657_p1;
wire   [11:0] tmp_fu_693_p3;
wire   [63:0] p_Result_270_fu_701_p5;
wire   [0:0] icmp_ln938_fu_391_p2;
wire   [63:0] bitcast_ln746_fu_713_p1;
wire  signed [24:0] grp_fu_1083_p2;
wire   [22:0] trunc_ln1168_1_fu_725_p1;
wire   [0:0] p_Result_271_fu_733_p3;
wire   [22:0] tmp_V_11_fu_740_p2;
wire   [22:0] tmp_V_14_fu_746_p3;
wire   [31:0] zext_ln940_1_fu_754_p1;
reg   [31:0] p_Result_272_fu_758_p4;
reg   [31:0] l_3_fu_768_p3;
wire   [31:0] sub_ln947_3_fu_776_p2;
wire   [31:0] lsb_index_3_fu_782_p2;
wire   [30:0] tmp_435_fu_788_p4;
wire   [5:0] trunc_ln950_3_fu_808_p1;
wire   [5:0] sub_ln950_3_fu_812_p2;
wire   [31:0] zext_ln950_3_fu_818_p1;
wire   [31:0] lshr_ln950_3_fu_822_p2;
wire   [31:0] shl_ln952_2_fu_834_p2;
wire   [22:0] trunc_ln952_3_fu_840_p1;
wire   [31:0] p_Result_263_fu_828_p2;
wire   [22:0] trunc_ln952_4_fu_850_p1;
wire   [22:0] and_ln952_2_fu_844_p2;
wire   [8:0] tmp_4_fu_860_p4;
wire   [22:0] or_ln952_fu_854_p2;
wire   [31:0] or_ln952_3_fu_870_p3;
wire   [0:0] tmp_436_fu_884_p3;
wire   [0:0] p_Result_273_fu_898_p3;
wire   [0:0] xor_ln952_3_fu_892_p2;
wire   [31:0] sub_ln962_3_fu_918_p2;
wire   [63:0] zext_ln960_3_fu_804_p1;
wire   [63:0] zext_ln962_3_fu_924_p1;
wire   [0:0] icmp_ln949_3_fu_798_p2;
wire   [0:0] icmp_ln952_2_fu_878_p2;
wire   [31:0] add_ln961_3_fu_942_p2;
wire   [63:0] zext_ln961_3_fu_948_p1;
wire   [0:0] icmp_ln961_3_fu_906_p2;
wire   [0:0] select_ln949_2_fu_934_p3;
wire   [0:0] and_ln952_7_fu_912_p2;
wire   [63:0] lshr_ln961_3_fu_952_p2;
wire   [63:0] shl_ln962_3_fu_928_p2;
wire   [0:0] select_ln961_6_fu_958_p3;
wire   [63:0] m_fu_966_p3;
wire   [63:0] zext_ln964_3_fu_974_p1;
wire   [63:0] m_29_fu_978_p2;
wire   [62:0] m_32_fu_984_p4;
wire   [0:0] p_Result_265_fu_998_p3;
wire   [10:0] trunc_ln946_3_fu_1014_p1;
wire   [10:0] sub_ln968_2_fu_1018_p2;
wire   [10:0] select_ln946_2_fu_1006_p3;
wire   [10:0] add_ln968_3_fu_1024_p2;
wire   [63:0] zext_ln965_3_fu_994_p1;
wire   [11:0] tmp_s_fu_1030_p3;
wire   [63:0] p_Result_274_fu_1038_p5;
wire   [0:0] icmp_ln938_3_fu_728_p2;
wire   [63:0] bitcast_ln746_3_fu_1050_p1;
wire   [63:0] output_o1_fu_717_p3;
wire   [63:0] output_o2_fu_1054_p3;
wire   [7:0] grp_fu_1074_p1;
wire   [7:0] grp_fu_1083_p1;
reg   [63:0] ap_return_0_preg;
reg   [63:0] ap_return_1_preg;
reg   [6:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
#0 grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start_reg = 1'b0;
#0 ap_return_0_preg = 64'd0;
#0 ap_return_1_preg = 64'd0;
end

TOP_CORDIC_V_cordic_phase_V30_ROM_AUTO_1R #(
    .DataWidth( 8 ),
    .AddressRange( 11 ),
    .AddressWidth( 4 ))
cordic_phase_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(cordic_phase_V_address0),
    .ce0(cordic_phase_V_ce0),
    .q0(cordic_phase_V_q0)
);

TOP_CORDIC_R_Pipeline_VITIS_LOOP_32_2 grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start),
    .ap_done(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_done),
    .ap_idle(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_idle),
    .ap_ready(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_ready),
    .temp_y_V_3(r_V_19_load_1_reg_1147),
    .temp_x_V_3(r_V_18_load_1_reg_1140),
    .k(k_4_reg_1132),
    .temp_y_V_4_out(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_y_V_4_out),
    .temp_y_V_4_out_ap_vld(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_y_V_4_out_ap_vld),
    .temp_x_V_4_out(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_x_V_4_out),
    .temp_x_V_4_out_ap_vld(grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_x_V_4_out_ap_vld)
);

TOP_mul_mul_16s_8ns_25_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 25 ))
mul_mul_16s_8ns_25_4_1_U185(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(r_V_18_fu_108),
    .din1(grp_fu_1074_p1),
    .ce(1'b1),
    .dout(grp_fu_1074_p2)
);

TOP_mul_mul_16s_8ns_25_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 25 ))
mul_mul_16s_8ns_25_4_1_U186(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(r_V_19_fu_112),
    .din1(grp_fu_1083_p1),
    .ce(1'b1),
    .dout(grp_fu_1083_p2)
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
        ap_return_0_preg <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_return_0_preg <= output_o1_fu_717_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_1_preg <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_return_1_preg <= output_o2_fu_1054_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start_reg <= 1'b0;
    end else begin
        if (((icmp_ln29_fu_268_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start_reg <= 1'b1;
        end else if ((grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_ready == 1'b1)) begin
            grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        k_fu_120 <= 4'd0;
    end else if (((icmp_ln29_fu_268_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        k_fu_120 <= add_ln29_fu_274_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        r_V_18_fu_108 <= x_V_7_fu_236_p3;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        r_V_18_fu_108 <= x_V_10_fu_364_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        r_V_19_fu_112 <= y_V_14_fu_228_p3;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        r_V_19_fu_112 <= y_V_17_fu_371_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        z_V_5_fu_116 <= z_V_fu_222_p2;
    end else if (((grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        z_V_5_fu_116 <= z_V_8_fu_325_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        k_4_reg_1132 <= k_fu_120;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln29_fu_268_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        r_V_18_load_1_reg_1140 <= r_V_18_fu_108;
        r_V_19_load_1_reg_1147 <= r_V_19_fu_112;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        tmp_438_reg_1169 <= z_V_5_fu_116[32'd15];
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
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
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_return_0 = output_o1_fu_717_p3;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_return_1 = output_o2_fu_1054_p3;
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        cordic_phase_V_ce0 = 1'b1;
    end else begin
        cordic_phase_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln29_fu_268_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln1548_fu_216_p2 = ($signed(z_in) + $signed(16'd65134));

assign add_ln29_fu_274_p2 = (k_fu_120 + 4'd1);

assign add_ln961_3_fu_942_p2 = ($signed(sub_ln947_3_fu_776_p2) + $signed(32'd4294967242));

assign add_ln961_fu_605_p2 = ($signed(sub_ln947_fu_439_p2) + $signed(32'd4294967242));

assign add_ln968_3_fu_1024_p2 = (sub_ln968_2_fu_1018_p2 + select_ln946_2_fu_1006_p3);

assign add_ln968_fu_687_p2 = (sub_ln968_fu_681_p2 + select_ln946_fu_669_p3);

assign and_ln952_2_fu_844_p2 = (trunc_ln952_3_fu_840_p1 & tmp_V_14_fu_746_p3);

assign and_ln952_6_fu_575_p2 = (xor_ln952_fu_555_p2 & p_Result_269_fu_561_p3);

assign and_ln952_7_fu_912_p2 = (xor_ln952_3_fu_892_p2 & p_Result_273_fu_898_p3);

assign and_ln952_fu_507_p2 = (trunc_ln952_fu_503_p1 & tmp_V_13_fu_409_p3);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign bitcast_ln746_3_fu_1050_p1 = p_Result_274_fu_1038_p5;

assign bitcast_ln746_fu_713_p1 = p_Result_270_fu_701_p5;

assign cordic_phase_V_address0 = zext_ln29_fu_280_p1;

assign cordic_phase_V_load_cast_fu_309_p1 = cordic_phase_V_q0;

assign grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start = grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_ap_start_reg;

assign grp_fu_1074_p1 = 25'd155;

assign grp_fu_1083_p1 = 25'd155;

assign icmp_ln29_fu_268_p2 = ((k_fu_120 == 4'd10) ? 1'b1 : 1'b0);

assign icmp_ln938_3_fu_728_p2 = ((grp_fu_1083_p2 == 25'd0) ? 1'b1 : 1'b0);

assign icmp_ln938_fu_391_p2 = ((grp_fu_1074_p2 == 25'd0) ? 1'b1 : 1'b0);

assign icmp_ln949_3_fu_798_p2 = (($signed(tmp_435_fu_788_p4) > $signed(31'd0)) ? 1'b1 : 1'b0);

assign icmp_ln949_fu_461_p2 = (($signed(tmp_431_fu_451_p4) > $signed(31'd0)) ? 1'b1 : 1'b0);

assign icmp_ln952_2_fu_878_p2 = ((or_ln952_3_fu_870_p3 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln952_fu_541_p2 = ((or_ln_fu_533_p3 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln961_3_fu_906_p2 = (($signed(lsb_index_3_fu_782_p2) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign icmp_ln961_fu_569_p2 = (($signed(lsb_index_fu_445_p2) > $signed(32'd0)) ? 1'b1 : 1'b0);


always @ (p_Result_272_fu_758_p4) begin
    if (p_Result_272_fu_758_p4[0] == 1'b1) begin
        l_3_fu_768_p3 = 32'd0;
    end else if (p_Result_272_fu_758_p4[1] == 1'b1) begin
        l_3_fu_768_p3 = 32'd1;
    end else if (p_Result_272_fu_758_p4[2] == 1'b1) begin
        l_3_fu_768_p3 = 32'd2;
    end else if (p_Result_272_fu_758_p4[3] == 1'b1) begin
        l_3_fu_768_p3 = 32'd3;
    end else if (p_Result_272_fu_758_p4[4] == 1'b1) begin
        l_3_fu_768_p3 = 32'd4;
    end else if (p_Result_272_fu_758_p4[5] == 1'b1) begin
        l_3_fu_768_p3 = 32'd5;
    end else if (p_Result_272_fu_758_p4[6] == 1'b1) begin
        l_3_fu_768_p3 = 32'd6;
    end else if (p_Result_272_fu_758_p4[7] == 1'b1) begin
        l_3_fu_768_p3 = 32'd7;
    end else if (p_Result_272_fu_758_p4[8] == 1'b1) begin
        l_3_fu_768_p3 = 32'd8;
    end else if (p_Result_272_fu_758_p4[9] == 1'b1) begin
        l_3_fu_768_p3 = 32'd9;
    end else if (p_Result_272_fu_758_p4[10] == 1'b1) begin
        l_3_fu_768_p3 = 32'd10;
    end else if (p_Result_272_fu_758_p4[11] == 1'b1) begin
        l_3_fu_768_p3 = 32'd11;
    end else if (p_Result_272_fu_758_p4[12] == 1'b1) begin
        l_3_fu_768_p3 = 32'd12;
    end else if (p_Result_272_fu_758_p4[13] == 1'b1) begin
        l_3_fu_768_p3 = 32'd13;
    end else if (p_Result_272_fu_758_p4[14] == 1'b1) begin
        l_3_fu_768_p3 = 32'd14;
    end else if (p_Result_272_fu_758_p4[15] == 1'b1) begin
        l_3_fu_768_p3 = 32'd15;
    end else if (p_Result_272_fu_758_p4[16] == 1'b1) begin
        l_3_fu_768_p3 = 32'd16;
    end else if (p_Result_272_fu_758_p4[17] == 1'b1) begin
        l_3_fu_768_p3 = 32'd17;
    end else if (p_Result_272_fu_758_p4[18] == 1'b1) begin
        l_3_fu_768_p3 = 32'd18;
    end else if (p_Result_272_fu_758_p4[19] == 1'b1) begin
        l_3_fu_768_p3 = 32'd19;
    end else if (p_Result_272_fu_758_p4[20] == 1'b1) begin
        l_3_fu_768_p3 = 32'd20;
    end else if (p_Result_272_fu_758_p4[21] == 1'b1) begin
        l_3_fu_768_p3 = 32'd21;
    end else if (p_Result_272_fu_758_p4[22] == 1'b1) begin
        l_3_fu_768_p3 = 32'd22;
    end else if (p_Result_272_fu_758_p4[23] == 1'b1) begin
        l_3_fu_768_p3 = 32'd23;
    end else if (p_Result_272_fu_758_p4[24] == 1'b1) begin
        l_3_fu_768_p3 = 32'd24;
    end else if (p_Result_272_fu_758_p4[25] == 1'b1) begin
        l_3_fu_768_p3 = 32'd25;
    end else if (p_Result_272_fu_758_p4[26] == 1'b1) begin
        l_3_fu_768_p3 = 32'd26;
    end else if (p_Result_272_fu_758_p4[27] == 1'b1) begin
        l_3_fu_768_p3 = 32'd27;
    end else if (p_Result_272_fu_758_p4[28] == 1'b1) begin
        l_3_fu_768_p3 = 32'd28;
    end else if (p_Result_272_fu_758_p4[29] == 1'b1) begin
        l_3_fu_768_p3 = 32'd29;
    end else if (p_Result_272_fu_758_p4[30] == 1'b1) begin
        l_3_fu_768_p3 = 32'd30;
    end else if (p_Result_272_fu_758_p4[31] == 1'b1) begin
        l_3_fu_768_p3 = 32'd31;
    end else begin
        l_3_fu_768_p3 = 32'd32;
    end
end


always @ (p_Result_268_fu_421_p4) begin
    if (p_Result_268_fu_421_p4[0] == 1'b1) begin
        l_fu_431_p3 = 32'd0;
    end else if (p_Result_268_fu_421_p4[1] == 1'b1) begin
        l_fu_431_p3 = 32'd1;
    end else if (p_Result_268_fu_421_p4[2] == 1'b1) begin
        l_fu_431_p3 = 32'd2;
    end else if (p_Result_268_fu_421_p4[3] == 1'b1) begin
        l_fu_431_p3 = 32'd3;
    end else if (p_Result_268_fu_421_p4[4] == 1'b1) begin
        l_fu_431_p3 = 32'd4;
    end else if (p_Result_268_fu_421_p4[5] == 1'b1) begin
        l_fu_431_p3 = 32'd5;
    end else if (p_Result_268_fu_421_p4[6] == 1'b1) begin
        l_fu_431_p3 = 32'd6;
    end else if (p_Result_268_fu_421_p4[7] == 1'b1) begin
        l_fu_431_p3 = 32'd7;
    end else if (p_Result_268_fu_421_p4[8] == 1'b1) begin
        l_fu_431_p3 = 32'd8;
    end else if (p_Result_268_fu_421_p4[9] == 1'b1) begin
        l_fu_431_p3 = 32'd9;
    end else if (p_Result_268_fu_421_p4[10] == 1'b1) begin
        l_fu_431_p3 = 32'd10;
    end else if (p_Result_268_fu_421_p4[11] == 1'b1) begin
        l_fu_431_p3 = 32'd11;
    end else if (p_Result_268_fu_421_p4[12] == 1'b1) begin
        l_fu_431_p3 = 32'd12;
    end else if (p_Result_268_fu_421_p4[13] == 1'b1) begin
        l_fu_431_p3 = 32'd13;
    end else if (p_Result_268_fu_421_p4[14] == 1'b1) begin
        l_fu_431_p3 = 32'd14;
    end else if (p_Result_268_fu_421_p4[15] == 1'b1) begin
        l_fu_431_p3 = 32'd15;
    end else if (p_Result_268_fu_421_p4[16] == 1'b1) begin
        l_fu_431_p3 = 32'd16;
    end else if (p_Result_268_fu_421_p4[17] == 1'b1) begin
        l_fu_431_p3 = 32'd17;
    end else if (p_Result_268_fu_421_p4[18] == 1'b1) begin
        l_fu_431_p3 = 32'd18;
    end else if (p_Result_268_fu_421_p4[19] == 1'b1) begin
        l_fu_431_p3 = 32'd19;
    end else if (p_Result_268_fu_421_p4[20] == 1'b1) begin
        l_fu_431_p3 = 32'd20;
    end else if (p_Result_268_fu_421_p4[21] == 1'b1) begin
        l_fu_431_p3 = 32'd21;
    end else if (p_Result_268_fu_421_p4[22] == 1'b1) begin
        l_fu_431_p3 = 32'd22;
    end else if (p_Result_268_fu_421_p4[23] == 1'b1) begin
        l_fu_431_p3 = 32'd23;
    end else if (p_Result_268_fu_421_p4[24] == 1'b1) begin
        l_fu_431_p3 = 32'd24;
    end else if (p_Result_268_fu_421_p4[25] == 1'b1) begin
        l_fu_431_p3 = 32'd25;
    end else if (p_Result_268_fu_421_p4[26] == 1'b1) begin
        l_fu_431_p3 = 32'd26;
    end else if (p_Result_268_fu_421_p4[27] == 1'b1) begin
        l_fu_431_p3 = 32'd27;
    end else if (p_Result_268_fu_421_p4[28] == 1'b1) begin
        l_fu_431_p3 = 32'd28;
    end else if (p_Result_268_fu_421_p4[29] == 1'b1) begin
        l_fu_431_p3 = 32'd29;
    end else if (p_Result_268_fu_421_p4[30] == 1'b1) begin
        l_fu_431_p3 = 32'd30;
    end else if (p_Result_268_fu_421_p4[31] == 1'b1) begin
        l_fu_431_p3 = 32'd31;
    end else begin
        l_fu_431_p3 = 32'd32;
    end
end

assign lsb_index_3_fu_782_p2 = ($signed(sub_ln947_3_fu_776_p2) + $signed(32'd4294967243));

assign lsb_index_fu_445_p2 = ($signed(sub_ln947_fu_439_p2) + $signed(32'd4294967243));

assign lshr_ln950_3_fu_822_p2 = 32'd4294967295 >> zext_ln950_3_fu_818_p1;

assign lshr_ln950_fu_485_p2 = 32'd4294967295 >> zext_ln950_fu_481_p1;

assign lshr_ln961_3_fu_952_p2 = zext_ln960_3_fu_804_p1 >> zext_ln961_3_fu_948_p1;

assign lshr_ln961_fu_615_p2 = zext_ln960_fu_467_p1 >> zext_ln961_fu_611_p1;

assign m_24_fu_629_p3 = ((icmp_ln961_fu_569_p2[0:0] == 1'b1) ? lshr_ln961_fu_615_p2 : shl_ln962_fu_591_p2);

assign m_25_fu_641_p2 = (m_24_fu_629_p3 + zext_ln964_fu_637_p1);

assign m_29_fu_978_p2 = (m_fu_966_p3 + zext_ln964_3_fu_974_p1);

assign m_31_fu_647_p4 = {{m_25_fu_641_p2[63:1]}};

assign m_32_fu_984_p4 = {{m_29_fu_978_p2[63:1]}};

assign m_fu_966_p3 = ((icmp_ln961_3_fu_906_p2[0:0] == 1'b1) ? lshr_ln961_3_fu_952_p2 : shl_ln962_3_fu_928_p2);

assign or_ln952_3_fu_870_p3 = {{tmp_4_fu_860_p4}, {or_ln952_fu_854_p2}};

assign or_ln952_4_fu_517_p2 = (trunc_ln952_2_fu_513_p1 | and_ln952_fu_507_p2);

assign or_ln952_fu_854_p2 = (trunc_ln952_4_fu_850_p1 | and_ln952_2_fu_844_p2);

assign or_ln_fu_533_p3 = {{tmp_3_fu_523_p4}, {or_ln952_4_fu_517_p2}};

assign output_o1_fu_717_p3 = ((icmp_ln938_fu_391_p2[0:0] == 1'b1) ? 64'd0 : bitcast_ln746_fu_713_p1);

assign output_o2_fu_1054_p3 = ((icmp_ln938_3_fu_728_p2[0:0] == 1'b1) ? 64'd0 : bitcast_ln746_3_fu_1050_p1);

assign p_Result_259_fu_661_p3 = m_25_fu_641_p2[32'd54];

assign p_Result_263_fu_828_p2 = (zext_ln940_1_fu_754_p1 & lshr_ln950_3_fu_822_p2);

assign p_Result_265_fu_998_p3 = m_29_fu_978_p2[32'd54];

assign p_Result_267_fu_396_p3 = grp_fu_1074_p2[32'd24];

integer ap_tvar_int_0;

always @ (zext_ln940_fu_417_p1) begin
    for (ap_tvar_int_0 = 32 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 31 - 0) begin
            p_Result_268_fu_421_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            p_Result_268_fu_421_p4[ap_tvar_int_0] = zext_ln940_fu_417_p1[31 - ap_tvar_int_0];
        end
    end
end

assign p_Result_269_fu_561_p3 = zext_ln940_fu_417_p1[lsb_index_fu_445_p2];

assign p_Result_270_fu_701_p5 = {{tmp_fu_693_p3}, {zext_ln965_fu_657_p1[51:0]}};

assign p_Result_271_fu_733_p3 = grp_fu_1083_p2[32'd24];

integer ap_tvar_int_1;

always @ (zext_ln940_1_fu_754_p1) begin
    for (ap_tvar_int_1 = 32 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
        if (ap_tvar_int_1 > 31 - 0) begin
            p_Result_272_fu_758_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            p_Result_272_fu_758_p4[ap_tvar_int_1] = zext_ln940_1_fu_754_p1[31 - ap_tvar_int_1];
        end
    end
end

assign p_Result_273_fu_898_p3 = zext_ln940_1_fu_754_p1[lsb_index_3_fu_782_p2];

assign p_Result_274_fu_1038_p5 = {{tmp_s_fu_1030_p3}, {zext_ln965_3_fu_994_p1[51:0]}};

assign p_Result_s_fu_491_p2 = (zext_ln940_fu_417_p1 & lshr_ln950_fu_485_p2);

assign select_ln1548_fu_208_p3 = ((tmp_429_fu_200_p3[0:0] == 1'b1) ? 16'd804 : 16'd0);

assign select_ln946_2_fu_1006_p3 = ((p_Result_265_fu_998_p3[0:0] == 1'b1) ? 11'd1023 : 11'd1022);

assign select_ln946_fu_669_p3 = ((p_Result_259_fu_661_p3[0:0] == 1'b1) ? 11'd1023 : 11'd1022);

assign select_ln949_2_fu_934_p3 = ((icmp_ln949_3_fu_798_p2[0:0] == 1'b1) ? icmp_ln952_2_fu_878_p2 : p_Result_273_fu_898_p3);

assign select_ln949_fu_597_p3 = ((icmp_ln949_fu_461_p2[0:0] == 1'b1) ? icmp_ln952_fu_541_p2 : p_Result_269_fu_561_p3);

assign select_ln961_6_fu_958_p3 = ((icmp_ln961_3_fu_906_p2[0:0] == 1'b1) ? select_ln949_2_fu_934_p3 : and_ln952_7_fu_912_p2);

assign select_ln961_fu_621_p3 = ((icmp_ln961_fu_569_p2[0:0] == 1'b1) ? select_ln949_fu_597_p3 : and_ln952_6_fu_575_p2);

assign shl_ln952_2_fu_834_p2 = 32'd1 << lsb_index_3_fu_782_p2;

assign shl_ln952_fu_497_p2 = 32'd1 << lsb_index_fu_445_p2;

assign shl_ln962_3_fu_928_p2 = zext_ln960_3_fu_804_p1 << zext_ln962_3_fu_924_p1;

assign shl_ln962_fu_591_p2 = zext_ln960_fu_467_p1 << zext_ln962_fu_587_p1;

assign sub_ln947_3_fu_776_p2 = (32'd32 - l_3_fu_768_p3);

assign sub_ln947_fu_439_p2 = (32'd32 - l_fu_431_p3);

assign sub_ln950_3_fu_812_p2 = (6'd22 - trunc_ln950_3_fu_808_p1);

assign sub_ln950_fu_475_p2 = (6'd22 - trunc_ln950_fu_471_p1);

assign sub_ln962_3_fu_918_p2 = (32'd54 - sub_ln947_3_fu_776_p2);

assign sub_ln962_fu_581_p2 = (32'd54 - sub_ln947_fu_439_p2);

assign sub_ln968_2_fu_1018_p2 = (11'd16 - trunc_ln946_3_fu_1014_p1);

assign sub_ln968_fu_681_p2 = (11'd16 - trunc_ln946_fu_677_p1);

assign tmp_3_fu_523_p4 = {{p_Result_s_fu_491_p2[31:23]}};

assign tmp_428_fu_180_p3 = z_in[32'd15];

assign tmp_429_fu_200_p3 = z_in[32'd15];

assign tmp_431_fu_451_p4 = {{lsb_index_fu_445_p2[31:1]}};

assign tmp_432_fu_547_p3 = lsb_index_fu_445_p2[32'd31];

assign tmp_435_fu_788_p4 = {{lsb_index_3_fu_782_p2[31:1]}};

assign tmp_436_fu_884_p3 = lsb_index_3_fu_782_p2[32'd31];

assign tmp_438_fu_301_p3 = z_V_5_fu_116[32'd15];

assign tmp_4_fu_860_p4 = {{p_Result_263_fu_828_p2[31:23]}};

assign tmp_V_11_fu_740_p2 = (23'd0 - trunc_ln1168_1_fu_725_p1);

assign tmp_V_13_fu_409_p3 = ((p_Result_267_fu_396_p3[0:0] == 1'b1) ? tmp_V_fu_403_p2 : trunc_ln1168_fu_388_p1);

assign tmp_V_14_fu_746_p3 = ((p_Result_271_fu_733_p3[0:0] == 1'b1) ? tmp_V_11_fu_740_p2 : trunc_ln1168_1_fu_725_p1);

assign tmp_V_fu_403_p2 = (23'd0 - trunc_ln1168_fu_388_p1);

assign tmp_fu_693_p3 = {{p_Result_267_fu_396_p3}, {add_ln968_fu_687_p2}};

assign tmp_s_fu_1030_p3 = {{p_Result_271_fu_733_p3}, {add_ln968_3_fu_1024_p2}};

assign trunc_ln1168_1_fu_725_p1 = grp_fu_1083_p2[22:0];

assign trunc_ln1168_fu_388_p1 = grp_fu_1074_p2[22:0];

assign trunc_ln946_3_fu_1014_p1 = l_3_fu_768_p3[10:0];

assign trunc_ln946_fu_677_p1 = l_fu_431_p3[10:0];

assign trunc_ln950_3_fu_808_p1 = sub_ln947_3_fu_776_p2[5:0];

assign trunc_ln950_fu_471_p1 = sub_ln947_fu_439_p2[5:0];

assign trunc_ln952_2_fu_513_p1 = p_Result_s_fu_491_p2[22:0];

assign trunc_ln952_3_fu_840_p1 = shl_ln952_2_fu_834_p2[22:0];

assign trunc_ln952_4_fu_850_p1 = p_Result_263_fu_828_p2[22:0];

assign trunc_ln952_fu_503_p1 = shl_ln952_fu_497_p2[22:0];

assign x_V_10_fu_364_p3 = ((tmp_438_reg_1169[0:0] == 1'b1) ? x_V_8_fu_344_p2 : x_V_9_fu_354_p2);

assign x_V_7_fu_236_p3 = ((tmp_428_fu_180_p3[0:0] == 1'b1) ? y_in : x_V_fu_194_p2);

assign x_V_8_fu_344_p2 = (grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_y_V_4_out + r_V_18_load_1_reg_1140);

assign x_V_9_fu_354_p2 = (r_V_18_load_1_reg_1140 - grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_y_V_4_out);

assign x_V_fu_194_p2 = (16'd0 - y_in);

assign xor_ln952_3_fu_892_p2 = (tmp_436_fu_884_p3 ^ 1'd1);

assign xor_ln952_fu_555_p2 = (tmp_432_fu_547_p3 ^ 1'd1);

assign y_V_14_fu_228_p3 = ((tmp_428_fu_180_p3[0:0] == 1'b1) ? y_V_fu_188_p2 : x_in);

assign y_V_15_fu_349_p2 = (r_V_19_load_1_reg_1147 - grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_x_V_4_out);

assign y_V_16_fu_359_p2 = (grp_CORDIC_R_Pipeline_VITIS_LOOP_32_2_fu_163_temp_x_V_4_out + r_V_19_load_1_reg_1147);

assign y_V_17_fu_371_p3 = ((tmp_438_reg_1169[0:0] == 1'b1) ? y_V_15_fu_349_p2 : y_V_16_fu_359_p2);

assign y_V_fu_188_p2 = (16'd0 - x_in);

assign z_V_6_fu_313_p2 = (z_V_5_fu_116 + cordic_phase_V_load_cast_fu_309_p1);

assign z_V_7_fu_319_p2 = (z_V_5_fu_116 - cordic_phase_V_load_cast_fu_309_p1);

assign z_V_8_fu_325_p3 = ((tmp_438_fu_301_p3[0:0] == 1'b1) ? z_V_6_fu_313_p2 : z_V_7_fu_319_p2);

assign z_V_fu_222_p2 = (add_ln1548_fu_216_p2 + select_ln1548_fu_208_p3);

assign zext_ln29_fu_280_p1 = k_fu_120;

assign zext_ln940_1_fu_754_p1 = tmp_V_14_fu_746_p3;

assign zext_ln940_fu_417_p1 = tmp_V_13_fu_409_p3;

assign zext_ln950_3_fu_818_p1 = sub_ln950_3_fu_812_p2;

assign zext_ln950_fu_481_p1 = sub_ln950_fu_475_p2;

assign zext_ln960_3_fu_804_p1 = tmp_V_14_fu_746_p3;

assign zext_ln960_fu_467_p1 = tmp_V_13_fu_409_p3;

assign zext_ln961_3_fu_948_p1 = add_ln961_3_fu_942_p2;

assign zext_ln961_fu_611_p1 = add_ln961_fu_605_p2;

assign zext_ln962_3_fu_924_p1 = sub_ln962_3_fu_918_p2;

assign zext_ln962_fu_587_p1 = sub_ln962_fu_581_p2;

assign zext_ln964_3_fu_974_p1 = select_ln961_6_fu_958_p3;

assign zext_ln964_fu_637_p1 = select_ln961_fu_621_p3;

assign zext_ln965_3_fu_994_p1 = m_32_fu_984_p4;

assign zext_ln965_fu_657_p1 = m_31_fu_647_p4;

endmodule //TOP_CORDIC_R
