library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity carrySave8bit is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           z : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end carrySave8bit;

architecture Behavioral of carrySave8bit is
component fullAdder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end component;

signal partial_s1, partial_s2, partial_s3, partial_s4, inter_c1, inter_c2, inter_c3, inter_c4, inter_c5, inter_c6, inter_c7, carry_sum: STD_LOGIC;
signal prov_sum, prov_carry: STD_LOGIC_VECTOR(7 downto 0);

begin
    -- add the 3 numbers bit by bit, without accounting for intermediary carry out signals
    prov_sum(0) <= x(0) xor y(0) xor z(0);
    prov_sum(1) <= x(1) xor y(1) xor z(1);
    prov_sum(2) <= x(2) xor y(2) xor z(2);
    prov_sum(3) <= x(3) xor y(3) xor z(3);
    prov_sum(4) <= x(4) xor y(4) xor z(4);
    prov_sum(5) <= x(5) xor y(5) xor z(5);
    prov_sum(6) <= x(6) xor y(6) xor z(6);
    prov_sum(7) <= x(7) xor y(7) xor z(7);
    
    prov_carry(0) <= '0';
    prov_carry(1) <= (x(0) and y(0)) or ((x(0) or y(0)) and z(0)); 
    prov_carry(2) <= (x(1) and y(1)) or ((x(1) or y(1)) and z(1)); 
    prov_carry(3) <= (x(2) and y(2)) or ((x(2) or y(2)) and z(2)); 
    prov_carry(4) <= (x(3) and y(3)) or ((x(3) or y(3)) and z(3)); 
    prov_carry(5) <= (x(4) and y(4)) or ((x(4) or y(4)) and z(4)); 
    prov_carry(6) <= (x(5) and y(5)) or ((x(5) or y(5)) and z(5)); 
    prov_carry(7) <= (x(6) and y(6)) or ((x(6) or y(6)) and z(6)); 

    -- instantiate normal adder for prov_sum and prov_carry
     F1: fullAdder port map(x => prov_sum(0), y => prov_carry(0), cin => '0', cout => inter_c1, sum => sum(0));
     F2: fullAdder port map(x => prov_sum(1), y => prov_carry(1), cin => inter_c1, cout => inter_c2, sum => sum(1));
     F3: fullAdder port map(x => prov_sum(2), y => prov_carry(2), cin => inter_c2, cout => inter_c3, sum => sum(2));
     F4: fullAdder port map(x => prov_sum(3), y => prov_carry(3), cin => inter_c3, cout => inter_c4, sum => sum(3));
     F5: fullAdder port map(x => prov_sum(4), y => prov_carry(4), cin => inter_c4, cout => inter_c5, sum => sum(4));
     F6: fullAdder port map(x => prov_sum(5), y => prov_carry(5), cin => inter_c5, cout => inter_c6, sum => sum(5));
     F7: fullAdder port map(x => prov_sum(6), y => prov_carry(6), cin => inter_c6, cout => inter_c7, sum => sum(6));
     F8: fullAdder port map(x => prov_sum(7), y => prov_carry(7), cin => inter_c7, cout => carry_sum, sum => sum(7));
     
     
     cout <= ((x(7) and y(7)) or ((x(7) or y(7)) and z(7))) or carry_sum;

end Behavioral;
