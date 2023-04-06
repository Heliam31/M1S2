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
  signal Res_RE, npc_fwd_br, npc_fw_br, pc_plus_4, i_FE, i_DE, Op1_DE, Op2_DE, Op1_EX, Op2_EX, extImm_DE, extImm_EX, Res_EX, Res_ME, WD_EX, WD_ME, Res_Mem_ME, Res_Mem_RE, Res_ALU_ME, Res_ALU_RE, Res_fwd_ME, Res_fwd_ER : std_logic_vector(31 downto 0);
  signal Op3_DE, Op3_EX, a1_DE, a1_EX, a2_DE, a2_EX, Op3_EX_out, Op3_ME, Op3_ME_out, Op3_RE, Op3_RE_out : std_logic_vector(3 downto 0);
begin

  npc_fwd_br <= npc_fw_br;
  -- FE
  FE : entity work.etageFE
        port map(Res_RE, npc_fwd_br, PCSrc_ER, Bpris_EX, GEL_LI, clk, pc_plus_4, i_FE);

  --Registre entre FE et DE
  Reg1 : entity work.Reg32sync
        port map(i_FE, i_DE, Gel_DI, RAZ_DI, clk);

  instr_DE <= i_DE;
      

  -- DE
  DE : entity work.etageDE
        port map(i_DE, Res_RE, pc_plus_4, Op3_RE_out, RegSrc, immSrc, RegWR, clk, a1_DE, a2_DE, Op3_DE, Op1_DE, Op2_DE);

  --Registre entre pour Op1
  RegOP1 : entity work.Reg32sync
        port map(Op1_DE, Op1_EX, Gel_DI, Clr_EX, clk);  

  --Registre pour Op2
  RegOp2 : entity work.Reg32sync
        port map(Op2_DE, Op2_EX, '1', Clr_EX, clk); 
        
  --Registre pour Op3
  RegOp3 : entity work.Reg4
        port map(Op3_DE, Op3_EX, '1', Clr_EX, clk);

  --Registre pour extImm
  Regext : entity work.Reg32sync
        port map(extImm_DE, extImm_EX, '1', Clr_EX, clk);

  --Registre pour a1
  Rega1 : entity work.Reg4
        port map(a1_DE, a1, '1', Clr_EX, clk);

  --Registre pour a2
  Rega2 : entity work.Reg4
        port map(a2_DE, a2, '1', Clr_EX, clk);

  Res_fwd_ER <= Res_RE;
  
  -- EX
  EX : entity work.etageEX
        port map(Op1_EX, Op2_EX, ExtImm_EX, Res_fwd_ME, Res_fwd_ER, Op3_EX, EA_EX, EB_EX, ALUCtrl_EX, ALUSrc_EX, CC, Op3_EX_out, Res_EX, WD_EX, npc_fw_br);

  --Registre pour Res_EX
  RegresEx : entity work.Reg32sync
        port map(Res_EX, Res_ME, '1', '1', clk);

  --Registre pour WD_EX
  Regwdex : entity work.Reg32sync
        port map(WD_EX, WD_ME, '1', '1', clk);

  --Registre pour Op3_EX_out
  Regop3exout : entity work.Reg4
        port map(Op3_EX_out, Op3_ME, '1', '1', clk);

  -- ME
  ME : entity work.etageME
        port map(Res_ME, WD_ME, OP3_ME, clk, MemWR_Mem, Res_Mem_ME, Res_ALU_ME, Res_fwd_ME, Op3_ME_out );

  --Registre pour Res_Mem_ME
  RegResMemME : entity work.Reg32sync
        port map(Res_Mem_ME, Res_Mem_RE, '1', '1', clk);

  --Registre pour Res_ALU_ME
  RegResALUME : entity work.Reg32sync
        port map(Res_ALU_ME, Res_ALU_RE, '1', '1', clk);

  -- RE
  RE : entity work.etageRE
    port map(Res_Mem_RE, Res_ALU_RE, Op3_RE, MemToReg_RE,  Res_RE, Op3_RE_out);

end architecture;
