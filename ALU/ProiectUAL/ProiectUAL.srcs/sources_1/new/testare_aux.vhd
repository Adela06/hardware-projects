

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testare_aux is
--  Port ( );
end testare_aux;

architecture Behavioral of testare_aux is

component shRight is
Port (
clk: in STD_LOGIC;
x: in STD_LOGIC_VECTOR(3 downto 0);
y: out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component shLeft is
Port (clk: in STD_LOGIC;
x: in STD_LOGIC_VECTOR(3 downto 0);
y: out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component countUp is
Port (clk, rst: in std_logic;
x: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0)
 );
end component;

component countDown is
Port (clk, rst: in std_logic;
x: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0)
 );
end component;

signal x, y: STD_LOGIC_VECTOR(3 downto 0);
signal clk: STD_LOGIC := '0';
signal rst: std_logic := '1';


begin
x <= "0110";--6
clk <= not clk after 10ns;
rst <= '0' after 10 ns;

--TEST1: shRight port map (clk => clk, x => x, y=>y);
test2: countDown port map (clk => clk,rst => rst, x => x, y=>y);

end Behavioral;
