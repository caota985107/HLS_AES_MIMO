// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __TOP_mul_mul_16s_8ns_25_4_1__HH__
#define __TOP_mul_mul_16s_8ns_25_4_1__HH__
#include "TOP_mul_mul_16s_8ns_25_4_1_DSP48_1.h"
#include <systemc>

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(TOP_mul_mul_16s_8ns_25_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    TOP_mul_mul_16s_8ns_25_4_1_DSP48_1 TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U;

    SC_CTOR(TOP_mul_mul_16s_8ns_25_4_1):  TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U ("TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U") {
        TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U.clk(clk);
        TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U.rst(reset);
        TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U.ce(ce);
        TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U.a(din0);
        TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U.b(din1);
        TOP_mul_mul_16s_8ns_25_4_1_DSP48_1_U.p(dout);

    }

};

#endif //
