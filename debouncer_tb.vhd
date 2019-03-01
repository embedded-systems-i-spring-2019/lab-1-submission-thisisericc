library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debouncer_tb is
end debouncer_tb;

architecture deb_tb of debouncer_tb is

component debounce
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end component;

    signal tb_clk : std_logic := '0';
    signal tb_btn : std_logic := '0';
    signal tb_dbnc : std_logic := '0';
    
begin
    dut: debounce port map (clk => tb_clk, btn => tb_btn, dbnc => tb_dbnc);

process begin
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
        tb_clk <= '0';
end process;

process begin    
    tb_btn <= '0';
    wait for 5 ms;
    tb_btn <= '1'; 
    wait for 10 ms;
    tb_btn <= '0';
    wait for 5 ms;
    tb_btn <= '1';
    wait for 40 ms;
    tb_btn <= '0';
    wait for 25 ms;
       
end process;
end deb_tb;
