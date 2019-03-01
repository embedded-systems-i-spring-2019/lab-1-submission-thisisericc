library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fancy_counter_tb is
end fancy_counter_tb;

architecture tb of fancy_counter_tb is

component fancy_counter
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           cnt : out STD_LOGIC_VECTOR (3 downto 0);
           dir : in STD_LOGIC;
           updn : in STD_LOGIC;
           ld : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0));
end component;

           signal tb_clk :  STD_LOGIC := '0';
           signal tb_clk_en :  STD_LOGIC := '1';
           signal tb_en :  STD_LOGIC := '1';
           signal tb_rst :  STD_LOGIC := '0';
           signal tb_cnt :  STD_LOGIC_VECTOR (3 downto 0);
           signal tb_dir :  STD_LOGIC := '0';
           signal tb_updn : STD_LOGIC := '1';
           signal tb_ld :  STD_LOGIC := '1' ;
           signal tb_val :  STD_LOGIC_VECTOR (3 downto 0) := "0100";



begin
        dut: fancy_counter port map (clk => tb_clk, clk_en => tb_clk_en, 
                                    en => tb_en, rst => tb_rst, cnt => tb_cnt,
                                    dir => tb_dir, updn => tb_updn, ld => tb_ld, val => tb_val);

process begin
   
        tb_clk <= '1';
        wait for 0.5 us;
        tb_clk <= '0';
        wait for 0.5 us ;
        
end process;

    
 process begin   
   tb_ld <= '1';
   wait for 0.5 us;
   tb_ld <= '0';
   wait for 15 us;
end process; 

end tb;




