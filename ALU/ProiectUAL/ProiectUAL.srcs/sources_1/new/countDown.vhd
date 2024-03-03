library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity countDown is
Port (clk, rst: in std_logic;
x: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0)
 );
end countDown;

architecture Behavioral of countDown is
signal aux: std_logic_vector(3 downto 0);
begin
process(clk, x)
begin
if rst = '1' then aux <= x;
elsif rising_edge(clk) then
    aux <= aux - 1;
end if;
end process;
y <= aux;

end Behavioral;
