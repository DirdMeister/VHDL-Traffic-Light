library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLight_TB is
end TrafficLight_TB;

architecture Behavioral of TrafficLight_TB is
    component TrafficLight
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               red : out STD_LOGIC;
               yellow : out STD_LOGIC;
               green : out STD_LOGIC;
               counter : out STD_LOGIC_VECTOR(6 downto 0));
end component;

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '1';
signal red : STD_LOGIC; 
signal yellow : STD_LOGIC;
signal green : STD_LOGIC;
signal counter : STD_LOGIC_VECTOR(6 downto 0);

begin
    uut: TrafficLight port map( clk => clk, rst => rst, red => red, yellow => yellow ,green => green, counter => counter);
      
    reset_proc : process
    begin
        wait for 10 ns;
        rst <= '0';
        wait;
    end process;
    
    clk_proc : process
    begin
       if clk <= '0' then
            clk <= '1';
        elsif clk <= '1' then
            clk <= '0';
        end if;
        wait for 1 ns;
    end process;
 
 end Behavioral;
