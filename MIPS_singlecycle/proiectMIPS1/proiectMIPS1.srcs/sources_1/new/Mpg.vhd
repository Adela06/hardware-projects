
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Mpg is
Port ( en : out STD_LOGIC;
input : in STD_LOGIC;
clk : in STD_LOGIC);
end Mpg;

architecture Behavioral of Mpg is

signal count_int: std_logic_vector(31 downto 0) :=x"00000000";
signal Q1: STD_LOGIC;
signal Q2: STD_LOGIC;
signal Q3: STD_LOGIC;

begin

en<=Q2 and (not Q3);

process(clk)
begin
if rising_edge(clk) then 
      count_int <= count_int + 1;
end if;
end process;

process(clk)
begin
 if rising_edge(clk) then 
    if count_int(15 downto 0)="1111111111111111" then
        Q1<=input;
    end if;
  end if;
end process;

process(clk)--detecteaza tranzitia din 0 in 1, istoricul semnalului, se activeaza doar pe secv 0 1
begin
    if rising_edge(clk) then 
        Q2<=Q1;
        Q3<=Q2;
    end if;
end process;

end Behavioral;
