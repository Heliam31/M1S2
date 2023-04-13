------------------------------------------------Etage FE-------------------------------------------------------
--lancer le code
-- ghdl -a mem.vhd reg_bank.vhd combi.vhd etages.vhd proc.vhd testProc.vhd
-- ghdl -e testFE
-- ghdl -r testFE --wave=output.ghw
-- gtkwave output.ghw

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testFE is
end entity;

architecture arch_test of testFE is
    signal npc_t, npc_fw_br_t, pc_plus_4_t, i_FE_t : std_logic_vector (31 downto 0);
    signal PCSrc_ER_t, Bpris_EX_t, GEL_LI_t, clk_t : std_logic;

begin
    FE : entity work.etageFE
        port map(npc_t, npc_fw_br_t, PCSrc_ER_t, Bpris_EX_t, GEL_LI_t, clk_t, pc_plus_4_t, i_FE_t);

    process 
    begin 
        npc_t <= (others => '0');
        npc_fw_br_t <= (others => '0');
        PCSrc_ER_t <= '1';
        Bpris_EX_t <= '0';
        GEL_LI_t <= '1';
        clk_t <= '0';

        wait for 5 ns;
        clk_t <= '1';
        wait for 5 ns;
        clk_t <= '0';

        npc_fw_br_t <= (1 => '1', others => '0');
        PCSrc_ER_t <= '0';
        Bpris_EX_t <= '0';

        wait for 5 ns;
        clk_t <= '1';
        wait for 5 ns;
        clk_t <= '0';

        PCSrc_ER_t <= '0';

        wait for 5 ns;
        clk_t <= '1';
        wait for 5 ns;
        clk_t <= '0';

        Bpris_EX_t <= '1';

        wait for 5 ns;
        clk_t <= '1';
        wait for 5 ns;
        clk_t <= '0';   

        wait;
    end process;

end arch_test;

------------------------------------------------Etage DE-------------------------------------------------------
--lancer le code
-- ghdl -a mem.vhd reg_bank.vhd combi.vhd etages.vhd proc.vhd testProc.vhd
-- ghdl -e testDE
-- ghdl -r testDE --wave=output.ghw
-- gtkwave output.ghw

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testDE is
end entity;

architecture arch_test of testDE is
    signal i_DE_t , WD_ER_t, pc_plus_4_t, Op1_t, Op2_t, extImm_t:  std_logic_vector(31 downto 0);
    signal Op3_ER_t, Reg1_t, Reg2_t, Op3_DE_t :  std_logic_vector(3 downto 0);
    signal RegSrc_t, immSrc_t : std_logic_vector(1 downto 0);
    signal RegWr_t, clk_t : std_logic;

begin
    DE : entity work.etageDE
        port map(i_DE_t, WD_ER_t, pc_plus_4_t, Op3_ER_t, RegSrc_t, immSrc_t, RegWr_t, clk_t, Reg1_t, Reg2_t, Op3_DE_t, Op1_t, Op2_t);

    process 
    begin 
        clk_t <= '0';
        i_DE_t <= (19 => '1', 15 => '1', 2 => '1',others => '0');
        WD_ER_t <= (others => '0');
        pc_plus_4_t <= (others => '0');
        Op3_ER_t <= (others => '0');
        RegSrc_t <= "01";
        immSrc_t <= (others => '0');
        RegWr_t <= '0';

        wait for 5 ns;
        clk_t <= '1';
        wait for 5 ns;
        clk_t <= '0';

        i_DE_t <= (19 => '1', 15 => '1', 3 => '1',others => '0');
        RegSrc_t <= "10";

        wait for 5 ns;
        clk_t <= '1';
        wait for 5 ns;
        clk_t <= '0';

        wait;
    end process;

end arch_test;

------------------------------------------------Etage EX-------------------------------------------------------
--lancer le code
-- ghdl -a mem.vhd reg_bank.vhd combi.vhd etages.vhd proc.vhd testProc.vhd
-- ghdl -e testEX
-- ghdl -r testEX --wave=output.ghw
-- gtkwave output.ghw

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testEX is
end entity;

architecture arch_test of testEX is
    signal Op1_EX_t, Op2_EX_t, ExtImm_EX_t, Res_fwd_ME_t, Res_fwd_ER_t, Res_EX_t, WD_EX_t, npc_fw_br_t : std_logic_vector(31 downto 0);
    signal CC_t, Op3_EX_out_t, Op3_EX_t : std_logic_vector(3 downto 0);
    signal EA_EX_t, EB_EX_t, ALUCtrl_EX_t : std_logic_vector(1 downto 0);
    signal ALUSrc_EX_t : std_logic;

begin
    EX : entity work.etageEX
        port map(Op1_EX_t, Op2_EX_t, ExtImm_EX_t, Res_fwd_ME_t, Res_fwd_ER_t, Op3_EX_t, EA_EX_t, EB_EX_t, ALUCtrl_EX_t, ALUSrc_EX_t, CC_t, Op3_EX_out_t, Res_EX_t, WD_EX_t, npc_fw_br_t);

process 
begin     
    
    EA_EX_t <= "00";
    EB_EX_t <= "00";
    ALUSrc_EX_t <= '0';
    ALUCtrl_EX_t <= "00";

    Op1_EX_t <= (1 => '1', 15 => '1', others => '0');
    Op2_EX_t <= (0 => '1', 10 => '1', others => '0');
    ExtImm_EX_t <= (11 => '1',  others => '0');
    Res_fwd_ER_t <= (14 => '1',  others => '0');
    Res_fwd_ME_t <= (20 => '1',  others => '0');
    Op3_EX_t <= (2 => '1', others => '0');

    wait for 10 ns;

    EA_EX_t <= "10";
    EB_EX_t <= "01";
    ALUSrc_EX_t <= '1';
    ALUCtrl_EX_t <= "00";

    wait;
end process;

end arch_test;    


------------------------------------------------Etage ME-------------------------------------------------------
--lancer le code
-- ghdl -a mem.vhd reg_bank.vhd combi.vhd etages.vhd proc.vhd testProc.vhd
-- ghdl -e testME
-- ghdl -r testME --wave=output.ghw
-- gtkwave output.ghw

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testME is
end entity;

architecture arch_test of testME is
    signal Res_ME_t, WD_ME_t, Res_Mem_ME_t, Res_ALU_ME_t, Res_fwd_ME_t : std_logic_vector (31 downto 0);
    signal OP3_ME_t, Op3_ME_out_t : std_logic_vector (3 downto 0);
    signal clk_t, MemWR_Mem_t : std_logic;

begin
    ME : entity work.etageME
        port map(Res_ME_t, WD_ME_t, OP3_ME_t, clk_t, MemWR_Mem_t, Res_Mem_ME_t, Res_ALU_ME_t, Res_fwd_ME_t, Op3_ME_out_t );

process 
begin  
    clk_t <= '0';  
    Res_ME_t <= (3 => '1', others => '0');
    WD_ME_t <=  (4 => '1', others => '0');
    OP3_ME_t <= (2 => '1', others => '0');
    MemWR_Mem_t <= '0';
    
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';

    Res_ME_t <= (2 => '1', others => '0');

    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';

    Res_ME_t <= (1 => '1', others => '0');

    wait;
end process;

end arch_test;  


------------------------------------------------Etage RE-------------------------------------------------------
--lancer le code
-- ghdl -a mem.vhd reg_bank.vhd combi.vhd etages.vhd proc.vhd testProc.vhd
-- ghdl -e testRE
-- ghdl -r testRE --wave=output.ghw
-- gtkwave output.ghw

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testRE is
end entity;

architecture arch_test of testRE is
    signal Res_Mem_RE_t, Res_ALU_RE_t, Res_RE_t :  std_logic_vector (31 downto 0);
    signal Op3_RE_t, Op3_RE_out_t :  std_logic_vector (3 downto 0);
    signal MemToReg_RE_t : std_logic;

begin
    RE : entity work.etageRE
        port map(Res_Mem_RE_t, Res_ALU_RE_t, Op3_RE_t, MemToReg_RE_t,  Res_RE_t, Op3_RE_out_t);

process
begin
    Res_Mem_RE_t <= (others => '0');
    Res_ALU_RE_t <= (others => '0');
    Op3_RE_t <= (others => '1');
    MemToReg_RE_t <= '1';

    wait for 10 ns;

    Res_Mem_RE_t <= (1 => '1', others => '0');
    Res_ALU_RE_t <= (2 => '1', others => '0');

    wait for 10 ns;

    MemToReg_RE_t <= '0';

    wait for 10 ns;
    wait;
end process;

end arch_test;  


------------------------------------------------Processeur-------------------------------------------------------
--lancer le code
-- ghdl -a mem.vhd reg_bank.vhd combi.vhd etages.vhd proc.vhd testProc.vhd
-- ghdl -e testProc
-- ghdl -r testProc --wave=output.ghw
-- gtkwave output.ghw

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testProc is
end entity;

architecture arch_test of testProc is
    signal clk_t,  ALUSrc_EX_t, MemWr_Mem_t, MemWr_RE_t, PCSrc_ER_t, Bpris_EX_t, Gel_LI_t, Gel_DI_t, RAZ_DI_t, RegWR_t, Clr_EX_t, MemToReg_RE_t :  std_logic;
    signal RegSrc_t, EA_EX_t, EB_EX_t, immSrc_t, ALUCtrl_EX_t : std_logic_vector(1 downto 0);
    signal instr_DE_t :  std_logic_vector(31 downto 0);
    signal a1_t, a2_t, CC_t:  std_logic_vector(3 downto 0);

begin
    data : entity work.dataPath
        port map(clk_t,  ALUSrc_EX_t, MemWr_Mem_t, MemWr_RE_t, PCSrc_ER_t, Bpris_EX_t, Gel_LI_t, Gel_DI_t, RAZ_DI_t, RegWR_t, Clr_EX_t, MemToReg_RE_t, RegSrc_t, EA_EX_t, EB_EX_t, immSrc_t, ALUCtrl_EX_t, instr_DE_t, a1_t, a2_t, CC_t);

process
begin

    ALUSrc_EX_t <= '1';
    MemWr_Mem_t <= '1';
    MemWr_RE_t <= '1';
    PCSrc_ER_t <= '0';
    Bpris_EX_t <= '0';
    Gel_LI_t <= '1';
    Gel_DI_t <= '1';
    RAZ_DI_t <= '1';
    RegWR_t <= '1';
    Clr_EX_t <= '1';
    MemToReg_RE_t <= '1';
    
    RegSrc_t <= (others => '0');
    EA_EX_t <= (others => '0');
    EB_EX_t <= (others => '0');
    immSrc_t <= (others => '0');
    ALUCtrl_EX_t <= (others => '0');

    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    wait;
end process;
end arch_test;
------------------------------------------------Fin-------------------------------------------------------
--lancer le code
-- ghdl -a mem.vhd reg_bank.vhd combi.vhd etages.vhd proc.vhd testProc.vhd
-- ghdl -e testEnd
-- ghdl -r testEnd --wave=output.ghw
-- gtkwave output.ghw

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testEnd is
end entity;

architecture arch_test of testEnd is
    signal clk_t : std_logic;
begin
    CPU : entity work.CPU
        port map(clk_t);
process
begin

    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    clk_t <= '0';
    wait for 5 ns;
    clk_t <= '1';
    wait for 5 ns;
    
    wait;
end process;
end arch_test;