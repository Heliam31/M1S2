-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Wed Mar 15 13:22:39 2023
-- Host        : pc-u3-305-10 running 64-bit Debian GNU/Linux 11 (bullseye)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/ptm3368a/M1S2/SyntMat/TP7/TP7/TP7.sim/sim_1/synth/func/xsim/test_fifo_func_synth.vhd
-- Design      : fifo
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo is
  port (
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    REN : in STD_LOGIC;
    WEN : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    EMPTY : out STD_LOGIC;
    MID : out STD_LOGIC;
    FULL : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fifo : entity is true;
  attribute ABUS_WIDTH : integer;
  attribute ABUS_WIDTH of fifo : entity is 2;
  attribute DBUS_WIDTH : integer;
  attribute DBUS_WIDTH of fifo : entity is 4;
end fifo;

architecture STRUCTURE of fifo is
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal DI_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal DO_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \DO_TRI[0]\ : STD_LOGIC;
  signal DO_reg0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \DO_tristate_oe[3]__0_i_1_n_0\ : STD_LOGIC;
  signal \DO_tristate_oe[3]__0_i_2_n_0\ : STD_LOGIC;
  signal EMPTY010_out : STD_LOGIC;
  signal EMPTY_OBUF : STD_LOGIC;
  signal EMPTY_i_1_n_0 : STD_LOGIC;
  signal FULL0 : STD_LOGIC;
  signal FULL_OBUF : STD_LOGIC;
  signal FULL_i_1_n_0 : STD_LOGIC;
  signal MID1 : STD_LOGIC_VECTOR ( 31 to 31 );
  signal MID_OBUF : STD_LOGIC;
  signal MID_i_10_n_0 : STD_LOGIC;
  signal MID_i_11_n_0 : STD_LOGIC;
  signal MID_i_12_n_0 : STD_LOGIC;
  signal MID_i_13_n_0 : STD_LOGIC;
  signal MID_i_15_n_0 : STD_LOGIC;
  signal MID_i_16_n_0 : STD_LOGIC;
  signal MID_i_17_n_0 : STD_LOGIC;
  signal MID_i_18_n_0 : STD_LOGIC;
  signal MID_i_19_n_0 : STD_LOGIC;
  signal MID_i_1_n_0 : STD_LOGIC;
  signal MID_i_21_n_0 : STD_LOGIC;
  signal MID_i_22_n_0 : STD_LOGIC;
  signal MID_i_23_n_0 : STD_LOGIC;
  signal MID_i_24_n_0 : STD_LOGIC;
  signal MID_i_26_n_0 : STD_LOGIC;
  signal MID_i_27_n_0 : STD_LOGIC;
  signal MID_i_28_n_0 : STD_LOGIC;
  signal MID_i_29_n_0 : STD_LOGIC;
  signal MID_i_2_n_0 : STD_LOGIC;
  signal MID_i_31_n_0 : STD_LOGIC;
  signal MID_i_32_n_0 : STD_LOGIC;
  signal MID_i_33_n_0 : STD_LOGIC;
  signal MID_i_34_n_0 : STD_LOGIC;
  signal MID_i_36_n_0 : STD_LOGIC;
  signal MID_i_37_n_0 : STD_LOGIC;
  signal MID_i_38_n_0 : STD_LOGIC;
  signal MID_i_39_n_0 : STD_LOGIC;
  signal MID_i_3_n_0 : STD_LOGIC;
  signal MID_i_40_n_0 : STD_LOGIC;
  signal MID_i_41_n_0 : STD_LOGIC;
  signal MID_i_42_n_0 : STD_LOGIC;
  signal MID_i_43_n_0 : STD_LOGIC;
  signal MID_i_44_n_0 : STD_LOGIC;
  signal MID_i_45_n_0 : STD_LOGIC;
  signal MID_i_46_n_0 : STD_LOGIC;
  signal MID_i_47_n_0 : STD_LOGIC;
  signal MID_i_48_n_0 : STD_LOGIC;
  signal MID_i_49_n_0 : STD_LOGIC;
  signal MID_i_4_n_0 : STD_LOGIC;
  signal MID_i_50_n_0 : STD_LOGIC;
  signal MID_i_5_n_0 : STD_LOGIC;
  signal MID_reg_i_14_n_0 : STD_LOGIC;
  signal MID_reg_i_14_n_1 : STD_LOGIC;
  signal MID_reg_i_14_n_2 : STD_LOGIC;
  signal MID_reg_i_14_n_3 : STD_LOGIC;
  signal MID_reg_i_20_n_0 : STD_LOGIC;
  signal MID_reg_i_20_n_1 : STD_LOGIC;
  signal MID_reg_i_20_n_2 : STD_LOGIC;
  signal MID_reg_i_20_n_3 : STD_LOGIC;
  signal MID_reg_i_25_n_0 : STD_LOGIC;
  signal MID_reg_i_25_n_1 : STD_LOGIC;
  signal MID_reg_i_25_n_2 : STD_LOGIC;
  signal MID_reg_i_25_n_3 : STD_LOGIC;
  signal MID_reg_i_30_n_0 : STD_LOGIC;
  signal MID_reg_i_30_n_1 : STD_LOGIC;
  signal MID_reg_i_30_n_2 : STD_LOGIC;
  signal MID_reg_i_30_n_3 : STD_LOGIC;
  signal MID_reg_i_35_n_0 : STD_LOGIC;
  signal MID_reg_i_35_n_1 : STD_LOGIC;
  signal MID_reg_i_35_n_2 : STD_LOGIC;
  signal MID_reg_i_35_n_3 : STD_LOGIC;
  signal MID_reg_i_6_n_0 : STD_LOGIC;
  signal MID_reg_i_6_n_1 : STD_LOGIC;
  signal MID_reg_i_6_n_2 : STD_LOGIC;
  signal MID_reg_i_6_n_3 : STD_LOGIC;
  signal MID_reg_i_7_n_0 : STD_LOGIC;
  signal MID_reg_i_7_n_1 : STD_LOGIC;
  signal MID_reg_i_7_n_2 : STD_LOGIC;
  signal MID_reg_i_7_n_3 : STD_LOGIC;
  signal MID_reg_i_8_n_0 : STD_LOGIC;
  signal MID_reg_i_8_n_1 : STD_LOGIC;
  signal MID_reg_i_8_n_2 : STD_LOGIC;
  signal MID_reg_i_8_n_3 : STD_LOGIC;
  signal REGS_reg_0_3_0_3_i_1_n_0 : STD_LOGIC;
  signal REN_IBUF : STD_LOGIC;
  signal RST_IBUF : STD_LOGIC;
  signal R_ADR : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \R_ADR[0]_i_1_n_0\ : STD_LOGIC;
  signal \R_ADR[1]_i_1_n_0\ : STD_LOGIC;
  signal WEN_IBUF : STD_LOGIC;
  signal W_ADR : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \W_ADR[0]_i_1_n_0\ : STD_LOGIC;
  signal \W_ADR[1]_i_1_n_0\ : STD_LOGIC;
  signal \W_ADR[1]_i_2_n_0\ : STD_LOGIC;
  signal n_0_10 : STD_LOGIC;
  signal NLW_MID_reg_i_14_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_MID_reg_i_20_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_MID_reg_i_25_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_MID_reg_i_30_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_MID_reg_i_35_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_MID_reg_i_6_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_MID_reg_i_7_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_MID_reg_i_8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_REGS_reg_0_3_0_3_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_REGS_reg_0_3_0_3_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_14 : label is 11;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_20 : label is 11;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_25 : label is 11;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_30 : label is 11;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_35 : label is 11;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_6 : label is 11;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_7 : label is 11;
  attribute COMPARATOR_THRESHOLD of MID_reg_i_8 : label is 11;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of REGS_reg_0_3_0_3 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of REGS_reg_0_3_0_3 : label is 16;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of REGS_reg_0_3_0_3 : label is "REGS_reg_0_3_0_3";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of REGS_reg_0_3_0_3 : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of REGS_reg_0_3_0_3 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of REGS_reg_0_3_0_3 : label is 3;
  attribute ram_offset : integer;
  attribute ram_offset of REGS_reg_0_3_0_3 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of REGS_reg_0_3_0_3 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of REGS_reg_0_3_0_3 : label is 3;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \W_ADR[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of i_10 : label is "soft_lutpair0";
begin
CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IBUF,
      O => CLK_IBUF_BUFG
    );
CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK,
      O => CLK_IBUF
    );
\DI_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DI(0),
      O => DI_IBUF(0)
    );
\DI_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DI(1),
      O => DI_IBUF(1)
    );
\DI_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DI(2),
      O => DI_IBUF(2)
    );
\DI_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => DI(3),
      O => DI_IBUF(3)
    );
\DO_OBUFT[0]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => DO_OBUF(0),
      O => DO(0),
      T => \DO_TRI[0]\
    );
\DO_OBUFT[1]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => DO_OBUF(1),
      O => DO(1),
      T => \DO_TRI[0]\
    );
\DO_OBUFT[2]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => DO_OBUF(2),
      O => DO(2),
      T => \DO_TRI[0]\
    );
\DO_OBUFT[3]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => DO_OBUF(3),
      O => DO(3),
      T => \DO_TRI[0]\
    );
\DO_OBUFT[3]_inst_i_1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \DO_tristate_oe[3]__0_i_2_n_0\,
      D => REN_IBUF,
      Q => \DO_TRI[0]\,
      R => \DO_tristate_oe[3]__0_i_1_n_0\
    );
\DO_tristate_oe[3]__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => EMPTY_OBUF,
      I2 => REN_IBUF,
      O => \DO_tristate_oe[3]__0_i_1_n_0\
    );
\DO_tristate_oe[3]__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BBFB"
    )
        port map (
      I0 => REN_IBUF,
      I1 => EMPTY_OBUF,
      I2 => FULL_OBUF,
      I3 => WEN_IBUF,
      O => \DO_tristate_oe[3]__0_i_2_n_0\
    );
\DO_tristate_oe_reg[0]__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \DO_tristate_oe[3]__0_i_2_n_0\,
      D => DO_reg0(0),
      Q => DO_OBUF(0),
      R => \DO_tristate_oe[3]__0_i_1_n_0\
    );
\DO_tristate_oe_reg[1]__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \DO_tristate_oe[3]__0_i_2_n_0\,
      D => DO_reg0(1),
      Q => DO_OBUF(1),
      R => \DO_tristate_oe[3]__0_i_1_n_0\
    );
\DO_tristate_oe_reg[2]__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \DO_tristate_oe[3]__0_i_2_n_0\,
      D => DO_reg0(2),
      Q => DO_OBUF(2),
      R => \DO_tristate_oe[3]__0_i_1_n_0\
    );
\DO_tristate_oe_reg[3]__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \DO_tristate_oe[3]__0_i_2_n_0\,
      D => DO_reg0(3),
      Q => DO_OBUF(3),
      R => \DO_tristate_oe[3]__0_i_1_n_0\
    );
EMPTY_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => EMPTY_OBUF,
      O => EMPTY
    );
EMPTY_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFD5"
    )
        port map (
      I0 => RST_IBUF,
      I1 => EMPTY_OBUF,
      I2 => WEN_IBUF,
      I3 => EMPTY010_out,
      O => EMPTY_i_1_n_0
    );
EMPTY_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000400404400000"
    )
        port map (
      I0 => REN_IBUF,
      I1 => WEN_IBUF,
      I2 => W_ADR(1),
      I3 => R_ADR(1),
      I4 => R_ADR(0),
      I5 => W_ADR(0),
      O => EMPTY010_out
    );
EMPTY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => EMPTY_i_1_n_0,
      Q => EMPTY_OBUF,
      R => '0'
    );
FULL_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => FULL_OBUF,
      O => FULL
    );
FULL_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEAE0000"
    )
        port map (
      I0 => FULL0,
      I1 => FULL_OBUF,
      I2 => WEN_IBUF,
      I3 => REN_IBUF,
      I4 => RST_IBUF,
      O => FULL_i_1_n_0
    );
FULL_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000096000000000"
    )
        port map (
      I0 => R_ADR(1),
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => R_ADR(0),
      I4 => WEN_IBUF,
      I5 => REN_IBUF,
      O => FULL0
    );
FULL_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => FULL_i_1_n_0,
      Q => FULL_OBUF,
      R => '0'
    );
MID_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => MID_OBUF,
      O => MID
    );
MID_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => EMPTY_OBUF,
      I1 => RST_IBUF,
      O => MID_i_1_n_0
    );
MID_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_10_n_0
    );
MID_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_11_n_0
    );
MID_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_12_n_0
    );
MID_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_13_n_0
    );
MID_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"088CCEEF00088CCE"
    )
        port map (
      I0 => R_ADR(0),
      I1 => R_ADR(1),
      I2 => REN_IBUF,
      I3 => W_ADR(0),
      I4 => W_ADR(1),
      I5 => WEN_IBUF,
      O => MID_i_15_n_0
    );
MID_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_16_n_0
    );
MID_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_17_n_0
    );
MID_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_18_n_0
    );
MID_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_19_n_0
    );
MID_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => MID_i_4_n_0,
      I1 => FULL_OBUF,
      O => MID_i_2_n_0
    );
MID_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_21_n_0
    );
MID_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_22_n_0
    );
MID_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_23_n_0
    );
MID_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_24_n_0
    );
MID_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_26_n_0
    );
MID_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_27_n_0
    );
MID_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_28_n_0
    );
MID_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_29_n_0
    );
MID_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE4"
    )
        port map (
      I0 => MID_i_5_n_0,
      I1 => MID_reg_i_6_n_0,
      I2 => MID_reg_i_7_n_0,
      I3 => FULL_OBUF,
      O => MID_i_3_n_0
    );
MID_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_31_n_0
    );
MID_i_32: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_32_n_0
    );
MID_i_33: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_33_n_0
    );
MID_i_34: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_34_n_0
    );
MID_i_36: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_36_n_0
    );
MID_i_37: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_37_n_0
    );
MID_i_38: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_38_n_0
    );
MID_i_39: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_39_n_0
    );
MID_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7BBFDEE7E77BFDDE"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_4_n_0
    );
MID_i_40: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9A65A65959A69A65"
    )
        port map (
      I0 => R_ADR(1),
      I1 => R_ADR(0),
      I2 => REN_IBUF,
      I3 => W_ADR(1),
      I4 => W_ADR(0),
      I5 => WEN_IBUF,
      O => MID_i_40_n_0
    );
MID_i_41: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_41_n_0
    );
MID_i_42: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_42_n_0
    );
MID_i_43: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4BFFD"
    )
        port map (
      I0 => REN_IBUF,
      I1 => R_ADR(1),
      I2 => R_ADR(0),
      I3 => WEN_IBUF,
      I4 => W_ADR(1),
      I5 => W_ADR(0),
      O => MID_i_43_n_0
    );
MID_i_44: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4182182424184182"
    )
        port map (
      I0 => R_ADR(1),
      I1 => R_ADR(0),
      I2 => REN_IBUF,
      I3 => W_ADR(1),
      I4 => W_ADR(0),
      I5 => WEN_IBUF,
      O => MID_i_44_n_0
    );
MID_i_45: unisim.vcomponents.LUT6
    generic map(
      INIT => X"088CCEEF10088CCE"
    )
        port map (
      I0 => R_ADR(0),
      I1 => R_ADR(1),
      I2 => REN_IBUF,
      I3 => W_ADR(0),
      I4 => W_ADR(1),
      I5 => WEN_IBUF,
      O => MID_i_45_n_0
    );
MID_i_46: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0960600690090960"
    )
        port map (
      I0 => W_ADR(1),
      I1 => R_ADR(1),
      I2 => REN_IBUF,
      I3 => R_ADR(0),
      I4 => WEN_IBUF,
      I5 => W_ADR(0),
      O => MID_i_46_n_0
    );
MID_i_47: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_47_n_0
    );
MID_i_48: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4FFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_48_n_0
    );
MID_i_49: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C440FDDCDCC4BFFD"
    )
        port map (
      I0 => WEN_IBUF,
      I1 => W_ADR(1),
      I2 => W_ADR(0),
      I3 => REN_IBUF,
      I4 => R_ADR(1),
      I5 => R_ADR(0),
      O => MID_i_49_n_0
    );
MID_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"73311000F7733110"
    )
        port map (
      I0 => R_ADR(0),
      I1 => R_ADR(1),
      I2 => REN_IBUF,
      I3 => W_ADR(0),
      I4 => W_ADR(1),
      I5 => WEN_IBUF,
      O => MID_i_5_n_0
    );
MID_i_50: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4182182424184182"
    )
        port map (
      I0 => W_ADR(1),
      I1 => W_ADR(0),
      I2 => WEN_IBUF,
      I3 => R_ADR(1),
      I4 => R_ADR(0),
      I5 => REN_IBUF,
      O => MID_i_50_n_0
    );
MID_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"088CCEEF00088CCE"
    )
        port map (
      I0 => W_ADR(0),
      I1 => W_ADR(1),
      I2 => WEN_IBUF,
      I3 => R_ADR(0),
      I4 => R_ADR(1),
      I5 => REN_IBUF,
      O => MID1(31)
    );
MID_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => MID_i_2_n_0,
      D => MID_i_3_n_0,
      Q => MID_OBUF,
      R => MID_i_1_n_0
    );
MID_reg_i_14: unisim.vcomponents.CARRY4
     port map (
      CI => MID_reg_i_25_n_0,
      CO(3) => MID_reg_i_14_n_0,
      CO(2) => MID_reg_i_14_n_1,
      CO(1) => MID_reg_i_14_n_2,
      CO(0) => MID_reg_i_14_n_3,
      CYINIT => '0',
      DI(3) => MID_i_15_n_0,
      DI(2) => MID_i_15_n_0,
      DI(1) => MID_i_15_n_0,
      DI(0) => MID_i_15_n_0,
      O(3 downto 0) => NLW_MID_reg_i_14_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_26_n_0,
      S(2) => MID_i_27_n_0,
      S(1) => MID_i_28_n_0,
      S(0) => MID_i_29_n_0
    );
MID_reg_i_20: unisim.vcomponents.CARRY4
     port map (
      CI => MID_reg_i_30_n_0,
      CO(3) => MID_reg_i_20_n_0,
      CO(2) => MID_reg_i_20_n_1,
      CO(1) => MID_reg_i_20_n_2,
      CO(0) => MID_reg_i_20_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_MID_reg_i_20_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_31_n_0,
      S(2) => MID_i_32_n_0,
      S(1) => MID_i_33_n_0,
      S(0) => MID_i_34_n_0
    );
MID_reg_i_25: unisim.vcomponents.CARRY4
     port map (
      CI => MID_reg_i_35_n_0,
      CO(3) => MID_reg_i_25_n_0,
      CO(2) => MID_reg_i_25_n_1,
      CO(1) => MID_reg_i_25_n_2,
      CO(0) => MID_reg_i_25_n_3,
      CYINIT => '0',
      DI(3) => MID_i_15_n_0,
      DI(2) => MID_i_15_n_0,
      DI(1) => MID_i_15_n_0,
      DI(0) => MID_i_15_n_0,
      O(3 downto 0) => NLW_MID_reg_i_25_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_36_n_0,
      S(2) => MID_i_37_n_0,
      S(1) => MID_i_38_n_0,
      S(0) => MID_i_39_n_0
    );
MID_reg_i_30: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => MID_reg_i_30_n_0,
      CO(2) => MID_reg_i_30_n_1,
      CO(1) => MID_reg_i_30_n_2,
      CO(0) => MID_reg_i_30_n_3,
      CYINIT => '1',
      DI(3 downto 1) => B"000",
      DI(0) => MID_i_40_n_0,
      O(3 downto 0) => NLW_MID_reg_i_30_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_41_n_0,
      S(2) => MID_i_42_n_0,
      S(1) => MID_i_43_n_0,
      S(0) => MID_i_44_n_0
    );
MID_reg_i_35: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => MID_reg_i_35_n_0,
      CO(2) => MID_reg_i_35_n_1,
      CO(1) => MID_reg_i_35_n_2,
      CO(0) => MID_reg_i_35_n_3,
      CYINIT => '1',
      DI(3) => MID_i_15_n_0,
      DI(2) => MID_i_15_n_0,
      DI(1) => MID_i_45_n_0,
      DI(0) => MID_i_46_n_0,
      O(3 downto 0) => NLW_MID_reg_i_35_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_47_n_0,
      S(2) => MID_i_48_n_0,
      S(1) => MID_i_49_n_0,
      S(0) => MID_i_50_n_0
    );
MID_reg_i_6: unisim.vcomponents.CARRY4
     port map (
      CI => MID_reg_i_8_n_0,
      CO(3) => MID_reg_i_6_n_0,
      CO(2) => MID_reg_i_6_n_1,
      CO(1) => MID_reg_i_6_n_2,
      CO(0) => MID_reg_i_6_n_3,
      CYINIT => '0',
      DI(3) => MID1(31),
      DI(2 downto 0) => B"000",
      O(3 downto 0) => NLW_MID_reg_i_6_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_10_n_0,
      S(2) => MID_i_11_n_0,
      S(1) => MID_i_12_n_0,
      S(0) => MID_i_13_n_0
    );
MID_reg_i_7: unisim.vcomponents.CARRY4
     port map (
      CI => MID_reg_i_14_n_0,
      CO(3) => MID_reg_i_7_n_0,
      CO(2) => MID_reg_i_7_n_1,
      CO(1) => MID_reg_i_7_n_2,
      CO(0) => MID_reg_i_7_n_3,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => MID_i_15_n_0,
      DI(1) => MID_i_15_n_0,
      DI(0) => MID_i_15_n_0,
      O(3 downto 0) => NLW_MID_reg_i_7_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_16_n_0,
      S(2) => MID_i_17_n_0,
      S(1) => MID_i_18_n_0,
      S(0) => MID_i_19_n_0
    );
MID_reg_i_8: unisim.vcomponents.CARRY4
     port map (
      CI => MID_reg_i_20_n_0,
      CO(3) => MID_reg_i_8_n_0,
      CO(2) => MID_reg_i_8_n_1,
      CO(1) => MID_reg_i_8_n_2,
      CO(0) => MID_reg_i_8_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_MID_reg_i_8_O_UNCONNECTED(3 downto 0),
      S(3) => MID_i_21_n_0,
      S(2) => MID_i_22_n_0,
      S(1) => MID_i_23_n_0,
      S(0) => MID_i_24_n_0
    );
REGS_reg_0_3_0_3: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 2) => B"000",
      ADDRA(1 downto 0) => R_ADR(1 downto 0),
      ADDRB(4 downto 2) => B"000",
      ADDRB(1 downto 0) => R_ADR(1 downto 0),
      ADDRC(4 downto 2) => B"000",
      ADDRC(1 downto 0) => R_ADR(1 downto 0),
      ADDRD(4 downto 2) => B"000",
      ADDRD(1 downto 0) => W_ADR(1 downto 0),
      DIA(1 downto 0) => DI_IBUF(1 downto 0),
      DIB(1 downto 0) => DI_IBUF(3 downto 2),
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DOA(1 downto 0) => DO_reg0(1 downto 0),
      DOB(1 downto 0) => DO_reg0(3 downto 2),
      DOC(1 downto 0) => NLW_REGS_reg_0_3_0_3_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_REGS_reg_0_3_0_3_DOD_UNCONNECTED(1 downto 0),
      WCLK => CLK_IBUF_BUFG,
      WE => REGS_reg_0_3_0_3_i_1_n_0
    );
REGS_reg_0_3_0_3_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => WEN_IBUF,
      O => REGS_reg_0_3_0_3_i_1_n_0
    );
REN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => REN,
      O => REN_IBUF
    );
RST_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RST,
      O => RST_IBUF
    );
\R_ADR[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CF8B3074"
    )
        port map (
      I0 => REN_IBUF,
      I1 => WEN_IBUF,
      I2 => FULL_OBUF,
      I3 => EMPTY_OBUF,
      I4 => R_ADR(0),
      O => \R_ADR[0]_i_1_n_0\
    );
\R_ADR[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF5FDD5F00A022A0"
    )
        port map (
      I0 => R_ADR(0),
      I1 => EMPTY_OBUF,
      I2 => FULL_OBUF,
      I3 => WEN_IBUF,
      I4 => REN_IBUF,
      I5 => R_ADR(1),
      O => \R_ADR[1]_i_1_n_0\
    );
\R_ADR_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \R_ADR[0]_i_1_n_0\,
      Q => R_ADR(0),
      R => \W_ADR[1]_i_1_n_0\
    );
\R_ADR_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \R_ADR[1]_i_1_n_0\,
      Q => R_ADR(1),
      R => \W_ADR[1]_i_1_n_0\
    );
WEN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => WEN,
      O => WEN_IBUF
    );
\W_ADR[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFA1005E"
    )
        port map (
      I0 => FULL_OBUF,
      I1 => EMPTY_OBUF,
      I2 => REN_IBUF,
      I3 => WEN_IBUF,
      I4 => W_ADR(0),
      O => \W_ADR[0]_i_1_n_0\
    );
\W_ADR[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RST_IBUF,
      O => \W_ADR[1]_i_1_n_0\
    );
\W_ADR[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFDDDDF02022220"
    )
        port map (
      I0 => W_ADR(0),
      I1 => WEN_IBUF,
      I2 => REN_IBUF,
      I3 => EMPTY_OBUF,
      I4 => FULL_OBUF,
      I5 => W_ADR(1),
      O => \W_ADR[1]_i_2_n_0\
    );
\W_ADR_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \W_ADR[0]_i_1_n_0\,
      Q => W_ADR(0),
      R => \W_ADR[1]_i_1_n_0\
    );
\W_ADR_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \W_ADR[1]_i_2_n_0\,
      Q => W_ADR(1),
      R => \W_ADR[1]_i_1_n_0\
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => REN_IBUF,
      O => n_0_10
    );
end STRUCTURE;
