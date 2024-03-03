library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity c2 is
 port 
(
A : in std_logic_vector (3 downto 0);
Y : out std_logic_vector (3 downto 0)
);
end c2;

architecture twoCompl of c2 is
signal temp : std_logic_vector(3 downto 0);
begin
  temp <= not A;
  Y    <= temp + 1;
 end twoCompl;