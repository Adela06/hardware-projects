library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity afis_ssd is

    Port (nr_anod: in std_logic_vector (1 downto 0);
         clk: in std_logic;
         catozi : out STD_LOGIC_VECTOR (6 downto 0);
         anozi : out STD_LOGIC_VECTOR (3 downto 0) := "0001";
         iesire_ssd1: inout std_logic_vector (11 downto 8):= "0000";--primul anod de la stanga
         iesire_ssd2: inout std_logic_vector (7 downto 4):= "0000";
         iesire_ssd3: inout std_logic_vector (3 downto 0):= "0000"
        );
end afis_ssd;

architecture arh_afis_ssd of afis_ssd is
    signal anod_curent: std_logic_vector (3 downto 0);
    signal q: std_logic_vector (15 downto 0);

    component counter16b is
        Port ( clk : in STD_LOGIC;
             q : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

begin

    p1: counter16b port map (clk, q);
    process(q, clk)
    begin
    if(rising_edge (clk)) then
        case q(15 downto 14) is
            when "00" => anozi <= "0111"; anod_curent <= iesire_ssd1;
            when "01" => anozi <= "1011"; anod_curent <= iesire_ssd2;
            when "10" => anozi <= "1101"; anod_curent <= iesire_ssd3;
            when others => anozi <= "1111";
        end case;
        end if;
    end process;

    process(anod_curent)
    begin
        case anod_curent is
            when X"0" => catozi  <= "0000001"; --0
            when X"1" => catozi  <= "1001111"; --1
            when X"2" => catozi  <= "0010010"; --2
            when X"3" => catozi  <= "0000110"; --3
            when X"4" => catozi  <= "1001100"; --4
            when X"5" => catozi  <= "0100100"; --5
            when X"6" => catozi  <= "0100000"; --6
            when X"7" => catozi  <= "0001111"; --7
            when X"8" => catozi  <= "0000000"; --8
            when X"9" => catozi  <= "0000100"; --9
            when X"A" => catozi  <= "0000010"; --A
            when X"B" => catozi  <= "1100000"; --b
            when X"C" => catozi  <= "0110001"; --C
            when X"D" => catozi  <= "1000010"; --d
            when X"E" => catozi  <= "0110000"; --E
            when X"F" => catozi  <= "0111000"; --F
            when others => catozi  <= "0000001"; -- gol
        end case;
    end process;

end arh_afis_ssd;