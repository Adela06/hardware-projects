
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity counter16b is
    Port ( clk : in STD_LOGIC;
--    ad_cif: in std_logic;--cand apas adauga_cifre
         q : out STD_LOGIC_VECTOR (15 downto 0));
end counter16b;

architecture arh_counter of counter16b is

    --signal en_adauga_cifru, en_reset: std_logic;
    
--    component  debouncer_afis is
--    Port ( button : in STD_LOGIC;
--         clk : in STD_LOGIC;
--         en : out STD_LOGIC);
--end component ;


    signal c: std_logic_vector (15 downto 0);
begin

    process (clk)
    begin
        if(rising_edge (clk)) then
            c <= c + 1;
        end if;
    end process;
    q <= c;

end arh_counter;
