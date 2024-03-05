
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bistD_en is
    Port ( en, d, clk : in STD_LOGIC;
         y : out STD_LOGIC);
end bistD_en;

architecture arh_bistD_en of bistD_en is

begin
    process(clk, en)
    begin
        if(en = '1') then
            if(rising_edge (clk)) then
                y <= d;
            end if;
        end if;
    end process;
end arh_bistD_en;
