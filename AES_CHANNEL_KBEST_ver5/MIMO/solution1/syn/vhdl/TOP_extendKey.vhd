-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity TOP_extendKey is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    key_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    key_ce0 : OUT STD_LOGIC;
    key_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    key_address1 : OUT STD_LOGIC_VECTOR (3 downto 0);
    key_ce1 : OUT STD_LOGIC;
    key_q1 : IN STD_LOGIC_VECTOR (7 downto 0);
    w_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    w_ce0 : OUT STD_LOGIC;
    w_we0 : OUT STD_LOGIC;
    w_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    w_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    w_address1 : OUT STD_LOGIC_VECTOR (5 downto 0);
    w_ce1 : OUT STD_LOGIC;
    w_we1 : OUT STD_LOGIC;
    w_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    w_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of TOP_extendKey is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_done : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_idle : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_ready : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_key_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_key_ce0 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_key_address1 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_key_ce1 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_w_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_w_ce0 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_w_we0 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_w_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_idle : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_ready : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce0 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we0 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_address1 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce1 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we1 : STD_LOGIC;
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_w_d1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start_reg : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_NS_fsm_state3 : STD_LOGIC;
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component TOP_extendKey_Pipeline_extendKey_label5 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        key_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
        key_ce0 : OUT STD_LOGIC;
        key_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
        key_address1 : OUT STD_LOGIC_VECTOR (3 downto 0);
        key_ce1 : OUT STD_LOGIC;
        key_q1 : IN STD_LOGIC_VECTOR (7 downto 0);
        w_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
        w_ce0 : OUT STD_LOGIC;
        w_we0 : OUT STD_LOGIC;
        w_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component TOP_extendKey_Pipeline_extendKey_label0 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        w_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
        w_ce0 : OUT STD_LOGIC;
        w_we0 : OUT STD_LOGIC;
        w_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        w_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        w_address1 : OUT STD_LOGIC_VECTOR (5 downto 0);
        w_ce1 : OUT STD_LOGIC;
        w_we1 : OUT STD_LOGIC;
        w_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        w_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    grp_extendKey_Pipeline_extendKey_label5_fu_12 : component TOP_extendKey_Pipeline_extendKey_label5
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start,
        ap_done => grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_done,
        ap_idle => grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_idle,
        ap_ready => grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_ready,
        key_address0 => grp_extendKey_Pipeline_extendKey_label5_fu_12_key_address0,
        key_ce0 => grp_extendKey_Pipeline_extendKey_label5_fu_12_key_ce0,
        key_q0 => key_q0,
        key_address1 => grp_extendKey_Pipeline_extendKey_label5_fu_12_key_address1,
        key_ce1 => grp_extendKey_Pipeline_extendKey_label5_fu_12_key_ce1,
        key_q1 => key_q1,
        w_address0 => grp_extendKey_Pipeline_extendKey_label5_fu_12_w_address0,
        w_ce0 => grp_extendKey_Pipeline_extendKey_label5_fu_12_w_ce0,
        w_we0 => grp_extendKey_Pipeline_extendKey_label5_fu_12_w_we0,
        w_d0 => grp_extendKey_Pipeline_extendKey_label5_fu_12_w_d0);

    grp_extendKey_Pipeline_extendKey_label0_fu_20 : component TOP_extendKey_Pipeline_extendKey_label0
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start,
        ap_done => grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done,
        ap_idle => grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_idle,
        ap_ready => grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_ready,
        w_address0 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_address0,
        w_ce0 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce0,
        w_we0 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we0,
        w_d0 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_d0,
        w_q0 => w_q0,
        w_address1 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_address1,
        w_ce1 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce1,
        w_we1 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we1,
        w_d1 => grp_extendKey_Pipeline_extendKey_label0_fu_20_w_d1,
        w_q1 => w_q1);





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


    grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_NS_fsm_state3) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_ready = ap_const_logic_1)) then 
                    grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_ready = ap_const_logic_1)) then 
                    grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_done, grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_NS_fsm_state3 <= ap_NS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_done)
    begin
        if ((grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done)
    begin
        if ((grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done, ap_CS_fsm_state4)
    begin
        if ((((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done, ap_CS_fsm_state4)
    begin
        if (((grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start <= grp_extendKey_Pipeline_extendKey_label0_fu_20_ap_start_reg;
    grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start <= grp_extendKey_Pipeline_extendKey_label5_fu_12_ap_start_reg;
    key_address0 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_key_address0;
    key_address1 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_key_address1;
    key_ce0 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_key_ce0;
    key_ce1 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_key_ce1;

    w_address0_assign_proc : process(grp_extendKey_Pipeline_extendKey_label5_fu_12_w_address0, grp_extendKey_Pipeline_extendKey_label0_fu_20_w_address0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            w_address0 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_address0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            w_address0 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_w_address0;
        else 
            w_address0 <= "XXXXXX";
        end if; 
    end process;

    w_address1 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_address1;

    w_ce0_assign_proc : process(grp_extendKey_Pipeline_extendKey_label5_fu_12_w_ce0, grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            w_ce0 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            w_ce0 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_w_ce0;
        else 
            w_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    w_ce1_assign_proc : process(grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce1, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            w_ce1 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_ce1;
        else 
            w_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    w_d0_assign_proc : process(grp_extendKey_Pipeline_extendKey_label5_fu_12_w_d0, grp_extendKey_Pipeline_extendKey_label0_fu_20_w_d0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            w_d0 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_d0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            w_d0 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_w_d0;
        else 
            w_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    w_d1 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_d1;

    w_we0_assign_proc : process(grp_extendKey_Pipeline_extendKey_label5_fu_12_w_we0, grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we0, ap_CS_fsm_state2, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            w_we0 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            w_we0 <= grp_extendKey_Pipeline_extendKey_label5_fu_12_w_we0;
        else 
            w_we0 <= ap_const_logic_0;
        end if; 
    end process;


    w_we1_assign_proc : process(grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we1, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            w_we1 <= grp_extendKey_Pipeline_extendKey_label0_fu_20_w_we1;
        else 
            w_we1 <= ap_const_logic_0;
        end if; 
    end process;

end behav;
