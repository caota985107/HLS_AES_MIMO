-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TOP_deAes_return_Pipeline_addRoundKey_label09 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    cArray_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    cArray_ce0 : OUT STD_LOGIC;
    cArray_we0 : OUT STD_LOGIC;
    cArray_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    cArray_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    cArray_address1 : OUT STD_LOGIC_VECTOR (3 downto 0);
    cArray_ce1 : OUT STD_LOGIC;
    cArray_we1 : OUT STD_LOGIC;
    cArray_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    cArray_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
    w_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    w_ce0 : OUT STD_LOGIC;
    w_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of TOP_deAes_return_Pipeline_addRoundKey_label09 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv61_1 : STD_LOGIC_VECTOR (60 downto 0) := "0000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln178_fu_114_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_block_state4_pp0_stage3_iter0 : BOOLEAN;
    signal i_2_reg_243 : STD_LOGIC_VECTOR (2 downto 0);
    signal cArray_addr_reg_251 : STD_LOGIC_VECTOR (3 downto 0);
    signal xor_ln183_fu_132_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal xor_ln183_reg_256 : STD_LOGIC_VECTOR (2 downto 0);
    signal cArray_addr_16_reg_261 : STD_LOGIC_VECTOR (3 downto 0);
    signal cArray_addr_17_reg_271 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal cArray_addr_18_reg_276 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln94_fu_164_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln94_reg_281 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln101_5_reg_286 : STD_LOGIC_VECTOR (7 downto 0);
    signal xor_ln183_1_fu_206_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln183_1_reg_291 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln183_2_fu_212_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln183_2_reg_296 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln183_3_fu_224_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln183_3_reg_301 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_block_state3_pp0_stage2_iter0 : BOOLEAN;
    signal xor_ln183_4_fu_230_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal xor_ln183_4_reg_306 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_5_cast_fu_126_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln183_fu_138_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_s_fu_148_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln183_2_fu_159_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_fu_48 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln178_fu_120_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_i_2 : STD_LOGIC_VECTOR (2 downto 0);
    signal sext_ln183_fu_156_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal lshr_ln96_5_fu_168_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln99_5_fu_182_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln96_fu_178_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln100_fu_192_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln102_fu_218_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln183_1_fu_221_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component TOP_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component TOP_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    i_fu_48_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((icmp_ln178_fu_114_p2 = ap_const_lv1_0)) then 
                    i_fu_48 <= add_ln178_fu_120_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_48 <= ap_const_lv3_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln178_fu_114_p2 = ap_const_lv1_0) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    cArray_addr_16_reg_261(2 downto 0) <= zext_ln183_fu_138_p1(4 - 1 downto 0)(2 downto 0);
                    cArray_addr_reg_251(2 downto 0) <= i_5_cast_fu_126_p1(4 - 1 downto 0)(2 downto 0);
                xor_ln183_reg_256 <= xor_ln183_fu_132_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                    cArray_addr_17_reg_271(2 downto 0) <= tmp_s_fu_148_p3(4 - 1 downto 0)(2 downto 0);
                cArray_addr_18_reg_276 <= zext_ln183_2_fu_159_p1(4 - 1 downto 0);
                trunc_ln101_5_reg_286 <= w_q0(15 downto 8);
                trunc_ln94_reg_281 <= trunc_ln94_fu_164_p1;
                xor_ln183_1_reg_291 <= xor_ln183_1_fu_206_p2;
                xor_ln183_2_reg_296 <= xor_ln183_2_fu_212_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                i_2_reg_243 <= ap_sig_allocacmp_i_2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                xor_ln183_3_reg_301 <= xor_ln183_3_fu_224_p2;
                xor_ln183_4_reg_306 <= xor_ln183_4_fu_230_p2;
            end if;
        end if;
    end process;
    cArray_addr_reg_251(3) <= '0';
    cArray_addr_16_reg_261(3) <= '0';
    cArray_addr_17_reg_271(3) <= '1';

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, icmp_ln178_fu_114_p2, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((icmp_ln178_fu_114_p2 = ap_const_lv1_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln178_fu_120_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_2) + unsigned(ap_const_lv3_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start_int)
    begin
        if ((ap_start_int = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start_int = ap_const_logic_0);
    end process;

        ap_block_state2_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage2_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage3_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_state1, icmp_ln178_fu_114_p2, ap_start_int)
    begin
        if (((icmp_ln178_fu_114_p2 = ap_const_lv1_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_state1, ap_loop_exit_ready, ap_done_reg, ap_start_int)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_2_assign_proc : process(ap_CS_fsm_state1, i_fu_48, ap_loop_init)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_2 <= ap_const_lv3_0;
        else 
            ap_sig_allocacmp_i_2 <= i_fu_48;
        end if; 
    end process;


    cArray_address0_assign_proc : process(ap_CS_fsm_state1, icmp_ln178_fu_114_p2, ap_CS_fsm_state4, cArray_addr_16_reg_261, ap_CS_fsm_state2, cArray_addr_18_reg_276, ap_CS_fsm_state3, zext_ln183_fu_138_p1, zext_ln183_2_fu_159_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            cArray_address0 <= cArray_addr_18_reg_276;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            cArray_address0 <= cArray_addr_16_reg_261;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            cArray_address0 <= zext_ln183_2_fu_159_p1(4 - 1 downto 0);
        elsif (((icmp_ln178_fu_114_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cArray_address0 <= zext_ln183_fu_138_p1(4 - 1 downto 0);
        else 
            cArray_address0 <= "XXXX";
        end if; 
    end process;


    cArray_address1_assign_proc : process(ap_CS_fsm_state1, icmp_ln178_fu_114_p2, ap_CS_fsm_state4, cArray_addr_reg_251, cArray_addr_17_reg_271, ap_CS_fsm_state2, ap_CS_fsm_state3, i_5_cast_fu_126_p1, tmp_s_fu_148_p3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            cArray_address1 <= cArray_addr_17_reg_271;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            cArray_address1 <= cArray_addr_reg_251;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            cArray_address1 <= tmp_s_fu_148_p3(4 - 1 downto 0);
        elsif (((icmp_ln178_fu_114_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cArray_address1 <= i_5_cast_fu_126_p1(4 - 1 downto 0);
        else 
            cArray_address1 <= "XXXX";
        end if; 
    end process;


    cArray_ce0_assign_proc : process(ap_CS_fsm_state1, icmp_ln178_fu_114_p2, ap_CS_fsm_state4, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4) or ((icmp_ln178_fu_114_p2 = ap_const_lv1_0) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            cArray_ce0 <= ap_const_logic_1;
        else 
            cArray_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    cArray_ce1_assign_proc : process(ap_CS_fsm_state1, icmp_ln178_fu_114_p2, ap_CS_fsm_state4, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_start_int)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4) or ((icmp_ln178_fu_114_p2 = ap_const_lv1_0) and (ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            cArray_ce1 <= ap_const_logic_1;
        else 
            cArray_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    cArray_d0_assign_proc : process(ap_CS_fsm_state4, xor_ln183_2_reg_296, ap_CS_fsm_state3, xor_ln183_4_reg_306)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            cArray_d0 <= xor_ln183_4_reg_306;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            cArray_d0 <= xor_ln183_2_reg_296;
        else 
            cArray_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    cArray_d1_assign_proc : process(ap_CS_fsm_state4, xor_ln183_1_reg_291, xor_ln183_3_reg_301, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            cArray_d1 <= xor_ln183_3_reg_301;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            cArray_d1 <= xor_ln183_1_reg_291;
        else 
            cArray_d1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    cArray_we0_assign_proc : process(ap_CS_fsm_state4, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            cArray_we0 <= ap_const_logic_1;
        else 
            cArray_we0 <= ap_const_logic_0;
        end if; 
    end process;


    cArray_we1_assign_proc : process(ap_CS_fsm_state4, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            cArray_we1 <= ap_const_logic_1;
        else 
            cArray_we1 <= ap_const_logic_0;
        end if; 
    end process;

    i_5_cast_fu_126_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_i_2),64));
    icmp_ln178_fu_114_p2 <= "1" when (ap_sig_allocacmp_i_2 = ap_const_lv3_4) else "0";
    lshr_ln96_5_fu_168_p4 <= w_q0(31 downto 24);
        sext_ln183_fu_156_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(xor_ln183_reg_256),4));

    tmp_s_fu_148_p3 <= (ap_const_lv61_1 & i_2_reg_243);
    trunc_ln94_fu_164_p1 <= w_q0(8 - 1 downto 0);
    trunc_ln99_5_fu_182_p4 <= w_q0(23 downto 16);
    w_address0 <= i_5_cast_fu_126_p1(6 - 1 downto 0);

    w_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            w_ce0 <= ap_const_logic_1;
        else 
            w_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    xor_ln183_1_fu_206_p2 <= (zext_ln96_fu_178_p1 xor cArray_q1);
    xor_ln183_2_fu_212_p2 <= (zext_ln100_fu_192_p1 xor cArray_q0);
    xor_ln183_3_fu_224_p2 <= (zext_ln102_fu_218_p1 xor cArray_q1);
    xor_ln183_4_fu_230_p2 <= (zext_ln183_1_fu_221_p1 xor cArray_q0);
    xor_ln183_fu_132_p2 <= (ap_sig_allocacmp_i_2 xor ap_const_lv3_4);
    zext_ln100_fu_192_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln99_5_fu_182_p4),32));
    zext_ln102_fu_218_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln101_5_reg_286),32));
    zext_ln183_1_fu_221_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln94_reg_281),32));
    zext_ln183_2_fu_159_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln183_fu_156_p1),64));
    zext_ln183_fu_138_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xor_ln183_fu_132_p2),64));
    zext_ln96_fu_178_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lshr_ln96_5_fu_168_p4),32));
end behav;
