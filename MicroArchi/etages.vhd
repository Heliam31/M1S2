-------------------------------------------------

-- Etage FE

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity etageFE is
  port(
    npc, npc_fw_br : in std_logic_vector(31 downto 0);
    PCSrc_ER, Bpris_EX, GEL_LI, clk : in std_logic;
    pc_plus_4, i_FE : out std_logic_vector(31 downto 0)
);
end entity;


architecture etageFE_arch of etageFE is
  signal pc_inter, pc_reg_in, pc_reg_out, sig_pc_plus_4, sig_4: std_logic_vector(31 downto 0);
begin

  sig_4 <= (2=>'1', others => '0');

  mem : entity work.inst_mem
    port map (pc_reg_out , i_FE );

  reg : entity work.Reg32
    port map (pc_reg_in, pc_reg_out, GEL_LI, '1', clk);
  
  add : entity work.addComplex
    port map (pc_reg_out, sig_4, '0', sig_pc_plus_4);

  pc_inter <= npc when PCSrc_ER='1' else
              sig_pc_plus_4 when PCSrc_ER='0' else
              (others =>'X')
              ;

  pc_reg_in <= pc_inter when Bpris_EX='0' else
               npc_fw_br when Bpris_EX='1' else
               (others => 'X')
               ;

  pc_plus_4 <= sig_pc_plus_4;

end architecture;

-- -------------------------------------------------

-- -- Etage DE

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
 
entity etageDE is
  port(
      i_DE , WD_ER, pc_plus_4: in std_logic_vector(31 downto 0);
      Op3_ER : in std_logic_vector(3 downto 0);
      RegSrc, immSrc : in std_logic_vector(1 downto 0);
      RegWr, clk : in std_logic;
      Reg1, Reg2, Op3_DE : out std_logic_vector (3 downto 0);
      Op1, Op2, extImm: out std_logic_vector (31 downto 0)
  );
end entity;

architecture etageDE_arch of etageDE is
  signal sigOp1, sigOp2, sig_15: std_logic_vector(3 downto 0);
begin
  sig_15 <= (others =>'1');

  sigOp1 <= i_DE(19 downto 16) when RegSrc(0)='0' else
            sig_15 when RegSrc(0)='1' else
            (others =>'X')
            ;

  sigOp2 <= i_DE(3 downto 0) when RegSrc(1)='0' else
            i_DE(15 downto 12) when RegSrc(1)='1' else
            (others =>'X')
            ;

  regBank : entity work.RegisterBank
    port map (sigOp1, Op1 , sigOp2, Op2, Op3_ER, WD_ER, pc_plus_4, RegWr, clk);

  ext : entity work.extension
    port map (i_DE(23 downto 0), immSrc, extImm);

  Reg1 <= sigOp1;
  Reg2 <= sigOp2;
  Op3_DE <= i_DE(15 downto 12);

end architecture;
-- -------------------------------------------------

-- -- Etage EX

 LIBRARY IEEE;
 USE IEEE.STD_LOGIC_1164.ALL;
 USE IEEE.NUMERIC_STD.ALL;

 entity etageEX is
  port(
    Op1_EX, Op2_EX, ExtImm_EX, Res_fwd_ME, Res_fwd_ER : in std_logic_vector(31 downto 0);
    Op3_EX : in std_logic_vector(3 downto 0);
    EA_EX, EB_EX, ALUCtrl_EX : in std_logic_vector(1 downto 0);
    ALUSrc_EX : in std_logic;
    CC, Op3_EX_out : out std_logic_vector(3 downto 0);
    Res_EX, WD_EX, npc_fw_br : out std_logic_vector(31 downto 0)
  );
 end entity;


architecture etageEX_arch of etageEX is
  signal ALUOp1, Oper2, ALUOp2, Res: std_logic_vector(31 downto 0);
begin

  ALUOp1 <= Op1_EX when EA_EX = "00" else
            Res_fwd_ER when EA_EX = "01" else
            Res_fwd_ME when EA_EX = "10" else
            (others => 'X')
            ; 

  Oper2 <= Op2_EX when EB_EX = "00" else
           Res_fwd_ER when EB_EX = "01" else
           Res_fwd_ME when EB_EX = "10" else
           (others => 'X')
           ;
  
  ALUOp2 <= Oper2 when ALUSrc_EX = '0' else
            ExtImm_EX when ALUSrc_EX = '1' else
            (others => 'X')
            ;

  ALU : entity work.ALU
    port map (ALUOp1, ALUOp2, ALUCtrl_EX, Res , CC );
            
            
  Res_EX <= Res;
  npc_fw_br <= Res;
  WD_EX <= Op2_EX;
  Op3_EX_out <= Op3_EX;

end architecture;
-- -------------------------------------------------

-- -- Etage ME

 LIBRARY IEEE;
 USE IEEE.STD_LOGIC_1164.ALL;
 USE IEEE.NUMERIC_STD.ALL;

 entity etageME is
  port(
        Res_ME, WD_ME : in std_logic_vector (31 downto 0);
        OP3_ME : in std_logic_vector (3 downto 0);
        clk, MemWR_Mem : in std_logic;
        Res_Mem_ME, Res_ALU_ME, Res_fwd_ME : out std_logic_vector (31 downto 0);
        Op3_ME_out : out std_logic_vector(3 downto 0)
  );
 end entity;
 
 architecture etageME_arch of etageME is

 begin
  Op3_ME_out <= OP3_ME;
  Res_ALU_ME <= Res_ME;
  Res_fwd_ME <= Res_ME;

  Mem : entity work.data_mem
    port map (Res_ME, WD_ME, clk, MemWR_Mem, Res_Mem_ME);
  
 end architecture;
-- -------------------------------------------------

-- -- Etage RE

 LIBRARY IEEE;
 USE IEEE.STD_LOGIC_1164.ALL;
 USE IEEE.NUMERIC_STD.ALL;

 entity etageRE is
  port(
      Res_Mem_RE, Res_ALU_RE : in std_logic_vector (31 downto 0);
      Op3_RE :  in std_logic_vector (3 downto 0);
      MemToReg_RE : in std_logic;
      Res_RE : out std_logic_vector(31 downto 0);
      Op3_RE_out : out std_logic_vector (3 downto 0)
  );
 end entity;

 architecture etageRE_arch of etageRE is
 begin 

  Res_RE <= Res_Mem_RE when MemToReg_RE = '1' else
            Res_ALU_RE when MemToReg_RE = '0' else
            (others => 'X');

  Op3_RE_out <= Op3_RE;
 end architecture; 