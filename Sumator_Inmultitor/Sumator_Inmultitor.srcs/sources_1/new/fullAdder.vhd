
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fullAdder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is

begin
    sum <= x xor y xor cin;
    cout <= (x and y) or ((y or x) and cin);

end Behavioral;
