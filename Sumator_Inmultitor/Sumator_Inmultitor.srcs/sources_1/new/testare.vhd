library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testare is
--  Port ( );
end testare;

architecture Behavioral of testare is

component wallaceTree is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           p : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal x, y: STD_LOGIC_VECTOR(3 downto 0);
signal product: STD_LOGIC_VECTOR(7 downto 0);
signal clk: STD_LOGIC := '0';

begin
    x <= "0100";
    y <= "0101";
    
    clk <= not clk after 10ns;

    TEST: wallaceTree port map (x => x, y => y, p => product);

end Behavioral;
