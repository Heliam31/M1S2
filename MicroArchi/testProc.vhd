------------------------------------------------Etage FE-------------------------------------------------------
--lancer le code
-- ghdl -a proc.vhd mem.vhd reg_bank.vhd combi.vhd etages.vhd testProc.vhd
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
-- ghdl -a proc.vhd mem.vhd reg_bank.vhd combi.vhd etages.vhd testProc.vhd
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