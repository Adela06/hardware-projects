library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity carryPropagateAdder is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end CarryPropagateAdder;

architecture Behavioral of carryPropagateAdder is

component fullAdder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end component;

signal carry_propagate, partial_sum: STD_LOGIC_VECTOR(7 downto 0);
signal c1, c2, c3, c4, c5, c6, c7: STD_LOGIC;

begin

    -- add each bit and store the carry, then add the sum and carry registers
    A1: fullAdder port map (x => x(0), y => y(0), cin => '0', cout => carry_propagate(1), sum => partial_sum(0));
    A2: fullAdder port map (x => x(1), y => y(1), cin => '0', cout => carry_propagate(2), sum => partial_sum(1));
    A3: fullAdder port map (x => x(2), y => y(2), cin => '0', cout => carry_propagate(3), sum => partial_sum(2));
    A4: fullAdder port map (x => x(3), y => y(3), cin => '0', cout => carry_propagate(4), sum => partial_sum(3));
    A5: fullAdder port map (x => x(4), y => y(4), cin => '0', cout => carry_propagate(5), sum => partial_sum(4));
    A6: fullAdder port map (x => x(5), y => y(5), cin => '0', cout => carry_propagate(6), sum => partial_sum(5));
    A7: fullAdder port map (x => x(6), y => y(6), cin => '0', cout => carry_propagate(7), sum => partial_sum(6));
    A8: fullAdder port map (x => x(7), y => y(7), cin => '0', cout => open, sum => partial_sum(7));
    
    carry_propagate(0) <= '0';
    
    F1: fullAdder port map (x => partial_sum(0), y => carry_propagate(0), cin => '0', cout => c1, sum => s(0));
    F2: fullAdder port map (x => partial_sum(1), y => carry_propagate(1), cin => c1, cout => c2, sum => s(1));
    F3: fullAdder port map (x => partial_sum(2), y => carry_propagate(2), cin => c2, cout => c3, sum => s(2));
    F4: fullAdder port map (x => partial_sum(3), y => carry_propagate(3), cin => c3, cout => c4, sum => s(3));
    F5: fullAdder port map (x => partial_sum(4), y => carry_propagate(4), cin => c4, cout => c5, sum => s(4));
    F6: fullAdder port map (x => partial_sum(5), y => carry_propagate(5), cin => c5, cout => c6, sum => s(5));
    F7: fullAdder port map (x => partial_sum(6), y => carry_propagate(6), cin => c6, cout => c7, sum => s(6));
    F8: fullAdder port map (x => partial_sum(7), y => carry_propagate(7), cin => c7, cout => cout, sum => s(7));
    
end Behavioral;
