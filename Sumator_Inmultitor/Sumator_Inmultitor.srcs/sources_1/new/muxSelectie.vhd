
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxSelectie is
Port ( 
x : in STD_LOGIC_VECTOR (3 downto 0);
y : in STD_LOGIC_VECTOR (3 downto 0);
z : in STD_LOGIC_VECTOR (3 downto 0);
sel:  in STD_LOGIC;
coutS: out STD_LOGIC;
iesire: out STD_LOGIC_VECTOR (7 downto 0)
);
end muxSelectie;

architecture Behavioral of muxSelectie is

component wallaceTree is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           p : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component carrySaveAdder is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           z : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end component;

signal iesireMultiplicator: STD_LOGIC_VECTOR(7 downto 0);
signal sSumator: STD_LOGIC_VECTOR(3 downto 0);
signal coutSumator: STD_LOGIC;

begin

adunare: carrySaveAdder port map (x => x, y => y, z => z, sum => sSumator, cout => coutSumator);
inmultire: wallaceTree port map (x => x, y => y, p => iesireMultiplicator);
process(x, y, sel)
begin
    if(sel = '0') then
         iesire <= iesireMultiplicator;
    else
        iesire(3 downto 0) <= sSumator;
        coutS <= coutSumator;
    end if;
end process;
end Behavioral;
