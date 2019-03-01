library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           cnt : out STD_LOGIC_VECTOR (3 downto 0);
           dir : in STD_LOGIC;
           updn : in STD_LOGIC;
           ld : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture arch_fancy_counter of fancy_counter is
    signal cntr: std_logic_vector (3 downto 0) := (others => '0');
    signal direction: std_logic;
    signal value: std_logic_vector (3 downto 0):= (others => '0');
    
begin

process (clk) begin
    if rising_edge(clk) then
        if en = '1' then
            if clk_en = '1' then
                if updn = '1' then              -- direction
                    direction <= dir;
                end if;
            end if;
        end if;
    end if;
end process;


process (clk) begin
    if rising_edge(clk) then
        if en = '1' then
            if clk_en = '1' then
                if ld = '1' then              -- ld/value
                    value <= val;
                end if;
            end if;
        end if;
    end if;
end process;

 

process (clk) begin                           -- count
    if rising_edge(clk) then
        if en = '1' then
            
            if rst = '1' then
                cntr <= "0000";
                cnt <= cntr;
            
  
            elsif clk_en = '1' then
            
                cnt <= cntr;
                
                if direction = '1' then
                    if cntr < value then
                        cntr <= std_logic_vector(unsigned(cntr)+1);
                        
                    else 
                        cntr <= std_logic_vector(to_unsigned(0,4));
                       
                    end if;
                    --cnt <= cntr;
                    
                elsif direction = '0' then
                    if cntr = "0000" then
                        cntr <= value;
                    else
                        cntr <= std_logic_vector(unsigned(cntr)-1);
                        
                    end if;
                    --cnt <= cntr;
                    
                end if;
               
                
            end if;
        end if;
    end if;                
end process;


end arch_fancy_counter;
