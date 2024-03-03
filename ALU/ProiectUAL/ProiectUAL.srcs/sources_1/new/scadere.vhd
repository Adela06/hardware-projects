

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity scadere is
Port ( 
x : in STD_LOGIC_VECTOR (3 downto 0);
y : in STD_LOGIC_VECTOR (3 downto 0);
res: out STD_LOGIC_VECTOR (4 downto 0)
);
end scadere;

architecture Behavioral of scadere is

component Adder is
  port (
    i_add1  : in std_logic_vector(3 downto 0);
    i_add2  : in std_logic_vector(3 downto 0);
    o_result   : out std_logic_vector(4 downto 0)
    );
end component;

component c2 is
 port 
(
A : in std_logic_vector (3 downto 0);
Y : out std_logic_vector (3 downto 0)
);
end component;
signal y_aux: std_logic_vector(3 downto 0);
begin
--calculam complementul fata de 2 al lui y
complement2: c2 port map(A=>y, Y=>y_aux);

--se face adunarea lui x cu complem fata de 2 al lui y => scadere
subtract: Adder port map(i_add1 => x, i_add2 => y_aux, o_result=> res);
end Behavioral;
