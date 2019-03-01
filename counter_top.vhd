library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_top is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end counter_top;

architecture arch_counter_top of counter_top is

component clock_div is
    Port ( clk : in STD_LOGIC;
           div : out STD_LOGIC);
end component;

component debounce is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end component;

component fancy_counter is
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


signal           iclk :  STD_LOGIC;
signal           iclk_en :  STD_LOGIC;
signal          ien :  STD_LOGIC;
signal           irst :  STD_LOGIC;
signal           icnt :  STD_LOGIC_VECTOR (3 downto 0);
signal          idir :  STD_LOGIC;
signal         iupdn :  STD_LOGIC;
signal           ild :  STD_LOGIC;
signal           ival : STD_LOGIC_VECTOR (3 downto 0);



begin
clkdiv: clock_div port map ( clk => clk,
                             div => iclk_en);
                             
deb0: debounce port map (clk => clk,
                         btn => btn(0),
                         dbnc => irst);

deb1: debounce port map (clk => clk,
                         btn => btn(1),
                         dbnc => ien);
                         
deb2: debounce port map (clk => clk,
                         btn => btn(2),
                         dbnc => iupdn);
                         
deb3: debounce port map (clk => clk,
                         btn => btn(3),
                         dbnc => ild);

fancycounter: fancy_counter port map (clk => clk,
                                      clk_en => iclk_en,
                                      dir => sw(0),
                                      en => ien,
                                      ld => ild,
                                      rst => irst,
                                      updn => iupdn,
                                      val => sw,
                                      cnt => led);

end arch_counter_top;
