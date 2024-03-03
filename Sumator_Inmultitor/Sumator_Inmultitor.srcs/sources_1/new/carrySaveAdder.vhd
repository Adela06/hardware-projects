library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carrySaveAdder is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           z : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end carrySaveAdder;

architecture Behavioral of carrySaveAdder is

component fullAdder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end component;

signal partial_s1, partial_s2, partial_s3, partial_s4, inter_c1, inter_c2, inter_c3, carry_sum: STD_LOGIC;
signal prov_sum, prov_carry: STD_LOGIC_VECTOR(3 downto 0);

begin
    -- se aduna cele 3 numere bit cu bit, fara a tine cont de semnalele intermediare
    -- sunt, de fapt, alte 4 full addere
    prov_sum(0) <= x(0) xor y(0) xor z(0);
    prov_sum(1) <= x(1) xor y(1) xor z(1);
    prov_sum(2) <= x(2) xor y(2) xor z(2);
    prov_sum(3) <= x(3) xor y(3) xor z(3);
    
    prov_carry(0) <= '0';
    prov_carry(1) <= (x(0) and y(0)) or ((x(0) or y(0)) and z(0)); 
    prov_carry(2) <= (x(1) and y(1)) or ((x(1) or y(1)) and z(1)); 
    prov_carry(3) <= (x(2) and y(2)) or ((x(2) or y(2)) and z(2)); 

    -- colectie de 4 sumatoare independente
     F1: fullAdder port map(x => prov_sum(0), y => prov_carry(0), cin => '0', cout => inter_c1, sum => sum(0));
     F2: fullAdder port map(x => prov_sum(1), y => prov_carry(1), cin => inter_c1, cout => inter_c2, sum => sum(1));
     F3: fullAdder port map(x => prov_sum(2), y => prov_carry(2), cin => inter_c2, cout => inter_c3, sum => sum(2));
     F4: fullAdder port map(x => prov_sum(3), y => prov_carry(3), cin => inter_c3, cout => carry_sum, sum => sum(3));
     
     
     cout <= ((x(3) and y(3)) or ((x(3) or y(3)) and z(3))) or carry_sum;

end Behavioral;
