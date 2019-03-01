library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity clock_div_tb is
end clock_div_tb;

architecture tb of clock_div_tb is

  component clock_div
  port (
    clk : in std_logic;
    div : out std_logic);
  end component;

  signal tb_clk : std_logic := '0';
  signal tb_div : std_logic;
  
begin
  dut: clock_div port map (clk => tb_clk, div => tb_div);

  process begin
    for iter in 1 to 125000000 loop
      tb_clk <= '0';
      wait for 1 ps;
      tb_clk <= '1';
      wait for 1 ps;
    end loop;
  end process;
  
  end tb;
  
  
  