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
        port map(Op1_DE, Op1_EX, '1', Clr_EX, clk);  

  --Registre pour Op2
  RegOp2 : entity work.Reg32sync
        port map(Op2_DE, Op2_EX, '1', Clr_EX, clk); 
        
  --Registre pour Opinstr(23) = '0' then
  --Registre pour extImm
  Regext : entity work.Reg32sync
        port map(extImm_DE, extImm_EX, '1', Clr_EX, clk);

  --Registre pour a1
  Rega1 : entity work.Reg4
        port map(a1_DE, a1, '1', Clr_EX, clk);

  --Registre pour a2
  Rega2 : entity work.Reg4
        port map(a2_DE, a2, '1', Clr_EX, clk);

    --Registre pour OP3
  RegOp3 : entity work.Reg4
        port map(Op3_DE, OP3_EX, '1', Clr_EX, clk);


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

--------------------------------------------------

-- Unite de controle

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity UniteCtrl is
  port(
      instr : in std_logic_vector(31 downto 0);
      PCSrc, RegWr, MemToReg, MemWr, Branch, CCWr, AluSrc : out std_logic;
      AluCtrl, ImmSrc, RegSrc : out std_logic_vector(1 downto 0);
      Cond : out std_logic_vector(3 downto 0)
);
end entity;  

architecture UniteCtrl_arch of UniteCtrl is
begin
      Cond <= instr(31 downto 28);

      AluCtrl <= "00" when ((instr(27 downto 26) = "10") or (instr(27 downto 26) = "00" and instr(24 downto 21) = "0100") or (instr(27 downto 26) = "01" and instr(23) = '0')) else
                 "01" when ((instr(27 downto 26) = "00" and  (instr(24 downto 21) = "0010" or instr(24 downto 21) = "1010")) or (instr(27 downto 26) = "01" and instr(23) = '1')) else
                 "10" when (instr(27 downto 26) = "00" and instr(24 downto 21) = "0000") else 
                 "11" when (instr(27 downto 26) = "00" and instr(24 downto 21) = "1100") ;
      
      Branch <= '1' when instr(27 downto 26) = "10" else
                '0' ;

      MemToReg <= '1' when (instr(27 downto 26) = "01" and instr(20) = '1') else
                  '0' when (instr(27 downto 26) = "00") or (instr(27 downto 26) = "10") ;
      
      MemWr <=  '1' when  instr(27 downto 26) = "01" and instr(20) = '0' else
                '0' when instr(27 downto 26) = "00" or instr(27 downto 26) = "10" or ( instr(27 downto 26) = "01" and instr(20) = '1' );

      AluSrc <= '0' when instr(27 downto 26) = "00" and instr(25) = '0' else
                '1';
      
      ImmSrc <= "01" when instr(27 downto 26) = "01" else
                "00" when instr(27 downto 26) = "00" and instr(25) = '1' else
                "10" when instr(27 downto 26) = "10";

      RegWr <= '0' when (instr(27 downto 26) = "00" and (instr(25) = '0' and instr(20) = '1')) or (instr(27 downto 26) = "01" and instr(20) = '0') or (instr(27 downto 26) = "10") else
               '1' when (instr(27 downto 26) = "00" and (instr(25) = '0' or instr(25) = '1')) or (instr(27 downto 26) = "01" and instr(20) = '1');

      RegSrc <= "00" when (instr(27 downto 26) = "00" and instr(25) = '0') else
                "10" when (instr(27 downto 26) = "01" and instr(20) = '0');

      RegSrc(0) <= '1' when instr(27 downto 26) = "10" else
                   '0' when (instr(27 downto 26) = "00" and instr(25) = '1') or (instr(27 downto 26) = "01" and instr(25) = '1');

      PCSrc <= '0' when ((instr(27 downto 26) = "00" and ((instr(25) = '0' and instr(20) = '1')or instr(25)='1')) and instr(15 downto 12) /= "1111") or (instr(27 downto 26) = "01" and instr(15 downto 12) /= "1111") else
               '1' when (instr (15 downto 12) = "1111");

      CCWr <= '0' when (instr(27 downto 26) = "01") or (instr(27 downto 26) = "10") or (instr(27 downto 26) = "00" and instr(20) = '0') else
              '1' when (instr(27 downto 26) = "00" and instr(20) = '1');
end architecture;

---------------------------------------------------------------------------------------------
--Unite gestion conditions
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity UniteCond is
      port(
            Cond, CC_EX, CC : in std_logic_vector(3 downto 0);
            CCWr_EX : in std_logic;
            CondEx : out std_logic;
            CCp : out std_logic_vector(3 downto 0)
    );
end entity;
 
architecture UniteCond_arch of UniteCond is
      signal oui : std_logic;
begin
      -- CC = N Z C V
      oui <= '1' when (Cond = "0000" and CC(2) = '1') or
                         (Cond = "0001" and CC(2) = '0') or
                         (Cond = "0010" and CC(1) = '1') or
                         (Cond = "0011" and CC(2) = '0') or
                         (Cond = "0100" and CC(3) = '1') or
                         (Cond = "0101" and CC(3) = '0') or
                         (Cond = "0110" and CC(0) = '1') or
                         (Cond = "0111" and CC(0) = '0') or
                         (Cond = "1000" and CC(1) = '1' and CC(2) = '0') or
                         (Cond = "1001" and (CC(1) = '0' and CC(2) = '1')) or
                         (Cond = "1010" and CC(3) = CC(0)) else
                '0';

      CCp <= CC when CCWr_EX = '1' and oui = '1' else
      CC_EX;

      CondEx <= oui;
end architecture;

---------------------------------------------------------------------------------------------
--Unite gestion alea
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity UniteAlea is
      port(
            a1, a2, a1_DE, a2_DE, Op3_ME_out, Op3_RE_out, Op3_EX_out : in std_logic_vector (3 downto 0);
            EA_EX, EB_EX : out std_logic_vector (1 downto 0);
            Gel_LI, En_DI, Clr_EX, Clr_DI : out std_logic;
            RegWr_RE, RegWr_Mem, MemToReg_EX, Bpris_EX, PCSrc_DE, PCSrc_EX, PCSrc_ME, PCSrc_ER : in std_logic
    );
end entity;
 
architecture UniteAlea_arch of UniteAlea is
      signal LDRStall : std_logic;
begin
     
      EA_EX <= "10" when a1 = Op3_ME_out and RegWr_Mem = '1' else
               "01" when a1 /= Op3_ME_out and  a1 = Op3_RE_out and RegWr_RE = '1' else
               "00";

      EB_EX <= "10" when a2 = Op3_ME_out and RegWr_Mem = '1' else
               "01" when a2 /= Op3_ME_out and  a2 = Op3_RE_out and RegWr_RE = '1' else
               "00";
      
      LDRStall <= '1' when (a1_DE = Op3_EX_out or a2_DE = Op3_EX_out) and MemToReg_EX = '1'else
                  '0';

      Gel_LI <= not(LDRStall + PCSrc_DE + PCSrc_EX + PCSrc_ME);
      Clr_DI <= not(PCSrc_DE + PCSrc_EX + PCSrc_ME + PCSrc_ER + Bpris_EX);
      Clr_EX <= not(LDRStall + Bpris_EX);
      En_DI <= not(LDRStall);

end architecture;
---------------------------------------------------------------------------------------------
--Proc entier

 LIBRARY IEEE;
 USE IEEE.STD_LOGIC_1164.ALL;
 USE IEEE.NUMERIC_STD.ALL;

 entity CPU is
      port(
        clk : in std_logic;
        instruPlot : out std_logic_vector(31 downto 0);
        CCPlot : out std_logic_vector (3 downto 0)
    );
end entity;

architecture CPU_arch of CPU is
      signal ALUSrc_EX, MemWr_Mem, MemWr_RE, PCSrc_ER, Bpris_EX, Gel_LI, Gel_DI, RAZ_DI, RegWR, Clr_EX, MemToReg_RE :  std_logic;
      signal RegSrc, EA_EX, EB_EX, immSrc, ALUCtrl_EX : std_logic_vector(1 downto 0);
      signal Res_RE, npc_fwd_br, npc_fw_br, pc_plus_4, i_FE, i_DE, Op1_DE, Op2_DE, Op1_EX, instr_DE, Op2_EX, extImm_DE, extImm_EX, Res_EX, Res_ME, WD_EX, WD_ME, Res_Mem_ME, Res_Mem_RE, Res_ALU_ME, Res_ALU_RE, Res_fwd_ME, Res_fwd_ER : std_logic_vector(31 downto 0);
      signal Op3_DE, Op3_EX, a1_DE, a1_EX, a2_DE, a2_EX, Op3_EX_out, a1, a2, CC, Op3_ME, Op3_ME_out, Op3_RE, Op3_RE_out : std_logic_vector(3 downto 0);
begin
Data : entity work.dataPath
      port map(clk, ALUSrc_EX, MemWr_Mem, MemWr_RE, PCSrc_ER, Bpris_EX, Gel_LI, Gel_DI, RAZ_DI, RegWR, Clr_EX, MemToReg_RE, RegSrc, EA_EX, EB_EX, immSrc, ALUCtrl_EX, instr_DE, a1, a2, CC);

Control : entity work.UniteCtrl
      port map(instr, PCSrc, RegWr, MemToReg, MemWr, Branch, CCWr, AluSrc, AluCtrl, ImmSrc, RegSrc, Cond);


Condi : entity work.UniteCond
      port map(Cond, CC_EX, CC, CCWr_EX, CondEx, CCp);

Alea : entity work.UniteAlea
      port map(a1, a2, a1_DE, a2_DE, Op3_ME_out, Op3_RE_out, Op3_EX_out, EA_EX, EB_EX, Gel_LI, En_DI, Clr_EX, Clr_DI, RegWr_RE, RegWr_Mem, MemToReg_EX, Bpris_EX, PCSrc_DE, PCSrc_EX, PCSrc_ME, PCSrc_ER);

end architecture;

