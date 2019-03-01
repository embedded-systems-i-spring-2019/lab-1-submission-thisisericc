library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider_top is
  Port (clk: in std_logic;
        led0: out std_logic);
end divider_top;

architecture arch_divider_top of divider_top is

component clock_div is
    Port ( clk : in STD_LOGIC;
           div : out STD_LOGIC);
end component;

signal CE, led0_temp, inv_out: std_logic;

begin

clkdiv: clock_div port map ( clk => clk,
                             div => CE);
                             
process (clk)
begin
    if rising_edge(clk) then
        if CE = '1' then
            led0_temp <= inv_out;
        end if;
    end if;
end process;

inv_out <= not led0_temp;

led0 <= led0_temp;

end arch_divider_top;
