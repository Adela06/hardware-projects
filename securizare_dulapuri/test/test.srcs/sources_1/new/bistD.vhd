
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bistD is
    Port ( d, clk  : in STD_LOGIC;
         y : out STD_LOGIC);
end bistD;

architecture arh_bistD of bistD is

begin
    process (clk)
    begin
        if(rising_edge (clk)) then
            y <= d;
        end if;
    end process;

end arh_bistD;
