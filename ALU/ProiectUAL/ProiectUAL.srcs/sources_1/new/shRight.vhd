
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shRight is
Port (
clk: in STD_LOGIC;
x: in STD_LOGIC_VECTOR(3 downto 0);
y: out  STD_LOGIC_VECTOR(3 downto 0));
end shRight;

architecture Behavioral of shRight is
signal aux1: STD_LOGIC_VECTOR(3 downto 0):= "0110";
signal aux2: STD_LOGIC_VECTOR(3 downto 0);
begin
process(clk)
begin
if rising_edge(clk) then
    aux2(3) <= aux1(0);
    aux2(2) <= aux1(3);
    aux2(1) <= aux1(2);
    aux2(0) <= aux1(1); 
    aux1 <= aux2;
    else y <= aux2;
end if;

end process;


end Behavioral;
