-------------------------------------------------------


-- Chemin de données

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


entity dataPath is
  port(
    clk,  ALUSrc_EX, MemWr_Mem, MemWr_RE, PCSrc_ER, Bpris_EX, Gel_LI, Gel_DI, RAZ_DI, RegWR, Clr_EX, MemToReg_RE : in std_logic;
    RegSrc, EA_EX, EB_EX, immSrc, ALUCtrl_EX : in std_logic_vector(1 downto 0);
    instr_DE: out std_logic_vector(31 downto 0);
    a1, a2, CC: out std_logic_vector(3 downto 0)
);
end entity;

architecture dataPath_arch of dataPath is
  signal Res_RE, npc_fwd_br, pc_plus_4, i_FE, i_DE, Op1_DE, Op2_DE, Op1_EX, Op2_EX, extImm_DE, extImm_EX, Res_EX, Res_ME, WD_EX, WD_ME, Res_Mem_ME, Res_Mem_RE, Res_ALU_ME, Res_ALU_RE, Res_fwd_ME : std_logic_vector(31 downto 0);
  signal Op3_DE, Op3_EX, a1_DE, a1_EX, a2_DE, a2_EX, Op3_EX_out, Op3_ME, Op3_ME_out, Op3_RE, Op3_RE_out : std_logic_vector(3 downto 0);
begin

  -- FE
  FE : entity work.etageFE
        port map(npc, npc_fw_br, PCSrc_ER, Bpris_EX, GEL_LI, clk, pc_plus_4, i_FE);

  -- DE
  DE : entity work.etageDE
        port map(i_DE, WD_ER, pc_plus_4, Op3_ER, RegSrc, immSrc, RegWr, clk, Reg1, Reg2, Op3_DE, Op1, Op2);


  -- EX
  EX : entity work.etageEX
        port map(Op1_EX, Op2_EX, ExtImm_EX, Res_fwd_ME, Res_fwd_ER, Op3_EX, EA_EX, EB_EX, ALUCtrl_EX, ALUSrc_EX, CC, Op3_EX_out, Res_EX, WD_EX, npc_fw_br);

  -- ME
  ME : entity work.etageME
        port map(Res_ME, WD_ME, OP3_ME, clk, MemWR_Mem, Res_Mem_ME, Res_ALU_ME, Res_fwd_ME, Op3_ME_out );


  -- RE
  RE : entity work.etageRE
    port map(Res_Mem_RE, Res_ALU_RE, Op3_RE, MemToReg_RE,  Res_RE, Op3_RE_out);

end architecture;
