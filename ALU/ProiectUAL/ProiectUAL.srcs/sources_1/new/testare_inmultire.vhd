library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testare_inmultire is
--  Port ( );
end testare_inmultire;

architecture Behavioral of testare_inmultire is

component wallaceTree is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           p : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal x, y: STD_LOGIC_VECTOR(3 downto 0);
signal product: STD_LOGIC_VECTOR(7 downto 0);
signal clk: STD_LOGIC := '0';

begin
    x <= "0100", "0010" after 10 ns, "1100" after 20 ns, "0100" after 30 ns, "1111" after 40 ns;
    y <= "0101", "1001" after 10 ns, "1000" after 20 ns, "0001" after 30 ns, "1101" after 40 ns;
    
    clk <= not clk after 10ns;

    TEST: wallaceTree port map (x => x, y => y, p => product);

end Behavioral;
