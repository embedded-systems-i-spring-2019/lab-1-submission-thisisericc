library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity clock_div is
    Port ( clk : in STD_LOGIC;
           div : out STD_LOGIC);
end clock_div;

architecture arch_clock_div of clock_div is
    signal counter: std_logic_vector(25 downto 0) := (others => '0');

begin
  
  process(clk) begin
    if rising_edge(clk) then
      counter <= std_logic_vector(unsigned(counter) + 1 );
        if counter = std_logic_vector(to_unsigned(62500000,26)) then
             div <= '1';
             counter <= std_logic_vector(to_unsigned(0,26));
        else 
             div <= '0';
        end if;   
    end if;
  end process;
 
  
end arch_clock_div;




