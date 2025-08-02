 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TrafficLight is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           red : out STD_LOGIC;
           yellow : out STD_LOGIC;
           green : out STD_LOGIC;
           counter : out STD_LOGIC_VECTOR(6 downto 0));
end TrafficLight;

architecture Behavioral of TrafficLight is
    TYPE state is (S0, S1, S2);
    SIGNAL Mstate : state;
    SIGNAL cnt : INTEGER range 0 to 99 := 0;
    
begin

    U_Mealy : process(clk, rst)
    begin
        if rst = '1' then
            Mstate <= S0;
            cnt <= 0;
            red <= '1';
            yellow <= '0';
            green <= '0';
        elsif rising_edge(clk) then
            case Mstate is
                when S0 =>
                    if cnt >= 60 then 
                        Mstate <= S1;
                        cnt <= 0;
                        red <= '0';
                        yellow <= '0';
                        green <= '1';
                    else
                        cnt <= cnt + 1;
                    end if;
                when S1 =>
                    if cnt < 40 then
                        cnt <= cnt + 1;
                    else
                        Mstate <= S2;
                        cnt <= 0;
                        red <= '0';
                        yellow <= '1';
                        green <= '0';
                    end if;
                when S2 =>
                    if cnt < 20 then 
                        cnt <= cnt + 1;
                    else 
                        Mstate <= S0;
                        cnt <= 0;
                        red <= '1';
                        yellow <= '0';
                        green <= '0';
                    end if;
             end case;
         end if;
    end process;
    
    counter <= std_logic_vector(to_unsigned(cnt, counter'length));
                        
end Behavioral;
