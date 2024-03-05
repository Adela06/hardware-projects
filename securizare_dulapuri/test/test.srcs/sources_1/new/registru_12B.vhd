library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity registru_12B is
    port (clk: in std_logic;
         reset: in std_logic;
         nradcif: inout  std_logic_vector(1 downto 0) ;--numara de cate ori a fost apasat butonul adauga cifru
         d: inout std_logic_vector(3 downto 0);--intrare care vine din iesirea numaratorului
         qout: inout std_logic_vector(11 downto 0)--iesirea de la registru care intra la afisare
        );
end registru_12B;

architecture arch_registru_12B  of registru_12B is
    component  debouncer_afis is
        Port ( button : in STD_LOGIC;
             clk : in STD_LOGIC;
             en : out STD_LOGIC);
    end component ;
    signal en_reset: std_logic;
begin
    resetare: debouncer_afis port map(button => reset, clk => clk, en => en_reset);
    process (clk, nradcif)
        --variable ok : std_logic_vector(1 downto 0) := "00";
    begin
        if(rising_edge(clk)) then
            case nradcif is
                when "00" => --ok := ok + 1;
                when "01" => qout(11 downto 8) <= d(3 downto 0);
                when "10" => qout(7 downto 4) <= d(3 downto 0);
                when "11" => qout(3 downto 0) <= d(3 downto 0);
            end case;
        end if;

        if en_reset = '1'  then qout <= "000000000000";
        end if;

    end process;

end arch_registru_12B ;