
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testare_impartire is
--  Port ( );
end testare_impartire;

architecture Behavioral of testare_impartire is

component Divider is
     Port (clk, reset : in STD_LOGIC;
 	 start : in STD_LOGIC;
 	 m : in  STD_LOGIC_VECTOR (15 downto 0);     -- Input for dividend
     n : in  STD_LOGIC_VECTOR (7 downto 0);    -- Input for divisor 
     quotient : out  STD_LOGIC_VECTOR (7 downto 0);    -- Output for quotient
     remainder : out  STD_LOGIC_VECTOR (7 downto 0);    -- Output for remainder
ready, ovfl : out STD_LOGIC);    -- Indicates end of algorithm and overflow condition
end component;


signal m: STD_LOGIC_VECTOR(15 downto 0);
signal n, quotient,remainder: STD_LOGIC_VECTOR(7 downto 0);
signal start: std_logic:='1';
signal ready, ovfl: std_logic;
signal clk, reset: STD_LOGIC := '0';
begin

m <= "0000000010101010";    --170

n <= "01000010", "00001000" after 350 ns; --66, 8

reset <= '1' after 5 ns, '0' after 10 ns;
clk <= not clk after 10ns;

test: Divider port map(
clk=>clk, reset=>reset, start=>start, m=>m, n=>n, quotient=>quotient,
remainder=>remainder, ready=>ready, ovfl=>ovfl
);
end Behavioral;

