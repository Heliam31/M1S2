// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Fri Mar 17 13:13:43 2023
// Host        : pc-u3-305-10 running 64-bit Debian GNU/Linux 11 (bullseye)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/ptm3368a/M1S2/SyntMat/TP7/TP7/TP7.sim/sim_1/synth/timing/xsim/test_fifo_time_synth.v
// Design      : fifo
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module RAM32M_UNIQ_BASE_
   (DOA,
    DOB,
    DOC,
    DOD,
    ADDRA,
    ADDRB,
    ADDRC,
    ADDRD,
    DIA,
    DIB,
    DIC,
    DID,
    WCLK,
    WE);
  output [1:0]DOA;
  output [1:0]DOB;
  output [1:0]DOC;
  output [1:0]DOD;
  input [4:0]ADDRA;
  input [4:0]ADDRB;
  input [4:0]ADDRC;
  input [4:0]ADDRD;
  input [1:0]DIA;
  input [1:0]DIB;
  input [1:0]DIC;
  input [1:0]DID;
  input WCLK;
  input WE;

  wire ADDRA0;
  wire ADDRA1;
  wire ADDRA2;
  wire ADDRA3;
  wire ADDRA4;
  wire ADDRB0;
  wire ADDRB1;
  wire ADDRB2;
  wire ADDRB3;
  wire ADDRB4;
  wire ADDRC0;
  wire ADDRC1;
  wire ADDRC2;
  wire ADDRC3;
  wire ADDRC4;
  wire ADDRD0;
  wire ADDRD1;
  wire ADDRD2;
  wire ADDRD3;
  wire ADDRD4;
  wire DIA0;
  wire DIA1;
  wire DIB0;
  wire DIB1;
  wire DIC0;
  wire DIC1;
  wire DID0;
  wire DID1;
  wire DOA0;
  wire DOA1;
  wire DOB0;
  wire DOB1;
  wire DOC0;
  wire DOC1;
  wire DOD0;
  wire DOD1;
  wire WCLK;
  wire WE;

  assign ADDRA0 = ADDRA[0];
  assign ADDRA1 = ADDRA[1];
  assign ADDRA2 = ADDRA[2];
  assign ADDRA3 = ADDRA[3];
  assign ADDRA4 = ADDRA[4];
  assign ADDRB0 = ADDRB[0];
  assign ADDRB1 = ADDRB[1];
  assign ADDRB2 = ADDRB[2];
  assign ADDRB3 = ADDRB[3];
  assign ADDRB4 = ADDRB[4];
  assign ADDRC0 = ADDRC[0];
  assign ADDRC1 = ADDRC[1];
  assign ADDRC2 = ADDRC[2];
  assign ADDRC3 = ADDRC[3];
  assign ADDRC4 = ADDRC[4];
  assign ADDRD0 = ADDRD[0];
  assign ADDRD1 = ADDRD[1];
  assign ADDRD2 = ADDRD[2];
  assign ADDRD3 = ADDRD[3];
  assign ADDRD4 = ADDRD[4];
  assign DIA0 = DIA[0];
  assign DIA1 = DIA[1];
  assign DIB0 = DIB[0];
  assign DIB1 = DIB[1];
  assign DIC0 = DIC[0];
  assign DIC1 = DIC[1];
  assign DID0 = DID[0];
  assign DID1 = DID[1];
  assign DOA[1] = DOA1;
  assign DOA[0] = DOA0;
  assign DOB[1] = DOB1;
  assign DOB[0] = DOB0;
  assign DOC[1] = DOC1;
  assign DOC[0] = DOC0;
  assign DOD[1] = DOD1;
  assign DOD[0] = DOD0;
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA
       (.CLK(WCLK),
        .I(DIA0),
        .O(DOA0),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMA_D1
       (.CLK(WCLK),
        .I(DIA1),
        .O(DOA1),
        .RADR0(ADDRA0),
        .RADR1(ADDRA1),
        .RADR2(ADDRA2),
        .RADR3(ADDRA3),
        .RADR4(ADDRA4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB
       (.CLK(WCLK),
        .I(DIB0),
        .O(DOB0),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMB_D1
       (.CLK(WCLK),
        .I(DIB1),
        .O(DOB1),
        .RADR0(ADDRB0),
        .RADR1(ADDRB1),
        .RADR2(ADDRB2),
        .RADR3(ADDRB3),
        .RADR4(ADDRB4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC
       (.CLK(WCLK),
        .I(DIC0),
        .O(DOC0),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMD32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMC_D1
       (.CLK(WCLK),
        .I(DIC1),
        .O(DOC1),
        .RADR0(ADDRC0),
        .RADR1(ADDRC1),
        .RADR2(ADDRC2),
        .RADR3(ADDRC3),
        .RADR4(ADDRC4),
        .WADR0(ADDRD0),
        .WADR1(ADDRD1),
        .WADR2(ADDRD2),
        .WADR3(ADDRD3),
        .WADR4(ADDRD4),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID0),
        .O(DOD0),
        .WE(WE));
  RAMS32 #(
    .INIT(32'h00000000),
    .IS_CLK_INVERTED(1'b0)) 
    RAMD_D1
       (.ADR0(ADDRD0),
        .ADR1(ADDRD1),
        .ADR2(ADDRD2),
        .ADR3(ADDRD3),
        .ADR4(ADDRD4),
        .CLK(WCLK),
        .I(DID1),
        .O(DOD1),
        .WE(WE));
endmodule

(* ABUS_WIDTH = "2" *) (* DBUS_WIDTH = "4" *) 
(* NotValidForBitStream *)
module fifo
   (CLK,
    RST,
    REN,
    WEN,
    DI,
    DO,
    EMPTY,
    MID,
    FULL);
  input CLK;
  input RST;
  input REN;
  input WEN;
  input [3:0]DI;
  output [3:0]DO;
  output EMPTY;
  output MID;
  output FULL;

  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire [3:0]DI;
  wire [3:0]DI_IBUF;
  wire [3:0]DO;
  wire [3:0]DO_OBUF;
  wire \DO_TRI[0] ;
  wire [3:0]DO_reg0;
  wire \DO_tristate_oe[3]__0_i_1_n_0 ;
  wire \DO_tristate_oe[3]__0_i_2_n_0 ;
  wire EMPTY;
  wire EMPTY010_out;
  wire EMPTY_OBUF;
  wire EMPTY_i_1_n_0;
  wire FULL;
  wire FULL0;
  wire FULL_OBUF;
  wire FULL_i_1_n_0;
  wire MID;
  wire REN;
  wire REN_IBUF;
  wire RST;
  wire RST_IBUF;
  wire [1:0]R_ADR;
  wire \R_ADR[0]_i_1_n_0 ;
  wire \R_ADR[1]_i_1_n_0 ;
  wire WEN;
  wire WEN_IBUF;
  wire [1:0]W_ADR;
  wire \W_ADR[0]_i_1_n_0 ;
  wire \W_ADR[1]_i_1_n_0 ;
  wire \W_ADR[1]_i_2_n_0 ;
  wire n_0_6;
  wire p_0_in;
  wire [1:0]NLW_REGS_reg_0_3_0_3_DOC_UNCONNECTED;
  wire [1:0]NLW_REGS_reg_0_3_0_3_DOD_UNCONNECTED;

initial begin
 $sdf_annotate("test_fifo_time_synth.sdf",,,,"tool_control");
end
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  IBUF \DI_IBUF[0]_inst 
       (.I(DI[0]),
        .O(DI_IBUF[0]));
  IBUF \DI_IBUF[1]_inst 
       (.I(DI[1]),
        .O(DI_IBUF[1]));
  IBUF \DI_IBUF[2]_inst 
       (.I(DI[2]),
        .O(DI_IBUF[2]));
  IBUF \DI_IBUF[3]_inst 
       (.I(DI[3]),
        .O(DI_IBUF[3]));
  OBUFT \DO_OBUFT[0]_inst 
       (.I(DO_OBUF[0]),
        .O(DO[0]),
        .T(\DO_TRI[0] ));
  OBUFT \DO_OBUFT[1]_inst 
       (.I(DO_OBUF[1]),
        .O(DO[1]),
        .T(\DO_TRI[0] ));
  OBUFT \DO_OBUFT[2]_inst 
       (.I(DO_OBUF[2]),
        .O(DO[2]),
        .T(\DO_TRI[0] ));
  OBUFT \DO_OBUFT[3]_inst 
       (.I(DO_OBUF[3]),
        .O(DO[3]),
        .T(\DO_TRI[0] ));
  FDRE #(
    .INIT(1'b0)) 
    \DO_OBUFT[3]_inst_i_1 
       (.C(CLK_IBUF_BUFG),
        .CE(\DO_tristate_oe[3]__0_i_2_n_0 ),
        .D(REN_IBUF),
        .Q(\DO_TRI[0] ),
        .R(\DO_tristate_oe[3]__0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \DO_tristate_oe[3]__0_i_1 
       (.I0(WEN_IBUF),
        .I1(EMPTY_OBUF),
        .I2(REN_IBUF),
        .O(\DO_tristate_oe[3]__0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hBBFB)) 
    \DO_tristate_oe[3]__0_i_2 
       (.I0(REN_IBUF),
        .I1(EMPTY_OBUF),
        .I2(FULL_OBUF),
        .I3(WEN_IBUF),
        .O(\DO_tristate_oe[3]__0_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DO_tristate_oe_reg[0]__0 
       (.C(CLK_IBUF_BUFG),
        .CE(\DO_tristate_oe[3]__0_i_2_n_0 ),
        .D(DO_reg0[0]),
        .Q(DO_OBUF[0]),
        .R(\DO_tristate_oe[3]__0_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DO_tristate_oe_reg[1]__0 
       (.C(CLK_IBUF_BUFG),
        .CE(\DO_tristate_oe[3]__0_i_2_n_0 ),
        .D(DO_reg0[1]),
        .Q(DO_OBUF[1]),
        .R(\DO_tristate_oe[3]__0_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DO_tristate_oe_reg[2]__0 
       (.C(CLK_IBUF_BUFG),
        .CE(\DO_tristate_oe[3]__0_i_2_n_0 ),
        .D(DO_reg0[2]),
        .Q(DO_OBUF[2]),
        .R(\DO_tristate_oe[3]__0_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DO_tristate_oe_reg[3]__0 
       (.C(CLK_IBUF_BUFG),
        .CE(\DO_tristate_oe[3]__0_i_2_n_0 ),
        .D(DO_reg0[3]),
        .Q(DO_OBUF[3]),
        .R(\DO_tristate_oe[3]__0_i_1_n_0 ));
  OBUF EMPTY_OBUF_inst
       (.I(EMPTY_OBUF),
        .O(EMPTY));
  LUT4 #(
    .INIT(16'hFFD5)) 
    EMPTY_i_1
       (.I0(RST_IBUF),
        .I1(EMPTY_OBUF),
        .I2(WEN_IBUF),
        .I3(EMPTY010_out),
        .O(EMPTY_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000400404400000)) 
    EMPTY_i_2
       (.I0(REN_IBUF),
        .I1(WEN_IBUF),
        .I2(W_ADR[1]),
        .I3(R_ADR[1]),
        .I4(R_ADR[0]),
        .I5(W_ADR[0]),
        .O(EMPTY010_out));
  FDRE #(
    .INIT(1'b0)) 
    EMPTY_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(EMPTY_i_1_n_0),
        .Q(EMPTY_OBUF),
        .R(1'b0));
  OBUF FULL_OBUF_inst
       (.I(FULL_OBUF),
        .O(FULL));
  LUT5 #(
    .INIT(32'hEEAE0000)) 
    FULL_i_1
       (.I0(FULL0),
        .I1(FULL_OBUF),
        .I2(WEN_IBUF),
        .I3(REN_IBUF),
        .I4(RST_IBUF),
        .O(FULL_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000096000000000)) 
    FULL_i_2
       (.I0(R_ADR[1]),
        .I1(W_ADR[1]),
        .I2(W_ADR[0]),
        .I3(R_ADR[0]),
        .I4(WEN_IBUF),
        .I5(REN_IBUF),
        .O(FULL0));
  FDRE #(
    .INIT(1'b0)) 
    FULL_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(FULL_i_1_n_0),
        .Q(FULL_OBUF),
        .R(1'b0));
  OBUF MID_OBUF_inst
       (.I(1'b0),
        .O(MID));
  (* INIT_A = "64'h0000000000000000" *) 
  (* INIT_B = "64'h0000000000000000" *) 
  (* INIT_C = "64'h0000000000000000" *) 
  (* INIT_D = "64'h0000000000000000" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "16" *) 
  (* RTL_RAM_NAME = "REGS_reg_0_3_0_3" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "3" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "3" *) 
  RAM32M_UNIQ_BASE_ REGS_reg_0_3_0_3
       (.ADDRA({1'b0,1'b0,1'b0,R_ADR}),
        .ADDRB({1'b0,1'b0,1'b0,R_ADR}),
        .ADDRC({1'b0,1'b0,1'b0,R_ADR}),
        .ADDRD({1'b0,1'b0,1'b0,W_ADR}),
        .DIA(DI_IBUF[1:0]),
        .DIB(DI_IBUF[3:2]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(DO_reg0[1:0]),
        .DOB(DO_reg0[3:2]),
        .DOC(NLW_REGS_reg_0_3_0_3_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_REGS_reg_0_3_0_3_DOD_UNCONNECTED[1:0]),
        .WCLK(CLK_IBUF_BUFG),
        .WE(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    REGS_reg_0_3_0_3_i_1
       (.I0(WEN_IBUF),
        .O(p_0_in));
  IBUF REN_IBUF_inst
       (.I(REN),
        .O(REN_IBUF));
  IBUF RST_IBUF_inst
       (.I(RST),
        .O(RST_IBUF));
  LUT5 #(
    .INIT(32'hCF8B3074)) 
    \R_ADR[0]_i_1 
       (.I0(REN_IBUF),
        .I1(WEN_IBUF),
        .I2(FULL_OBUF),
        .I3(EMPTY_OBUF),
        .I4(R_ADR[0]),
        .O(\R_ADR[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF5FDD5F00A022A0)) 
    \R_ADR[1]_i_1 
       (.I0(R_ADR[0]),
        .I1(EMPTY_OBUF),
        .I2(FULL_OBUF),
        .I3(WEN_IBUF),
        .I4(REN_IBUF),
        .I5(R_ADR[1]),
        .O(\R_ADR[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \R_ADR_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\R_ADR[0]_i_1_n_0 ),
        .Q(R_ADR[0]),
        .R(\W_ADR[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \R_ADR_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\R_ADR[1]_i_1_n_0 ),
        .Q(R_ADR[1]),
        .R(\W_ADR[1]_i_1_n_0 ));
  IBUF WEN_IBUF_inst
       (.I(WEN),
        .O(WEN_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFA1005E)) 
    \W_ADR[0]_i_1 
       (.I0(FULL_OBUF),
        .I1(EMPTY_OBUF),
        .I2(REN_IBUF),
        .I3(WEN_IBUF),
        .I4(W_ADR[0]),
        .O(\W_ADR[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \W_ADR[1]_i_1 
       (.I0(RST_IBUF),
        .O(\W_ADR[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFDFDDDDF02022220)) 
    \W_ADR[1]_i_2 
       (.I0(W_ADR[0]),
        .I1(WEN_IBUF),
        .I2(REN_IBUF),
        .I3(EMPTY_OBUF),
        .I4(FULL_OBUF),
        .I5(W_ADR[1]),
        .O(\W_ADR[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \W_ADR_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\W_ADR[0]_i_1_n_0 ),
        .Q(W_ADR[0]),
        .R(\W_ADR[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \W_ADR_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\W_ADR[1]_i_2_n_0 ),
        .Q(W_ADR[1]),
        .R(\W_ADR[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    i_6
       (.I0(REN_IBUF),
        .O(n_0_6));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
