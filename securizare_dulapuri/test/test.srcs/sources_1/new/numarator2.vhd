library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;


entity numarator2 is
    Port (clk : in STD_LOGIC;
         btn_up: in std_logic;
         btn_down: in std_logic;
         reset: in std_logic;--apasare buton reset
         ad_cif: in  std_logic;--cand apas adauga_cifre 
         q2 : out STD_LOGIC_VECTOR (3 downto 0)--iesirea care intra in registru
         );
end numarator2;


architecture arh_numarator2 of numarator2 is 
    signal en_up, en_down,en_adauga_cifru, en_reset: std_logic;
    
    component  debouncer_afis is
    Port ( button : in STD_LOGIC;
         clk : in STD_LOGIC;
         en : out STD_LOGIC);
end component ;

begin
    buton1: debouncer_afis  port map(button => btn_up, clk => clk ,en => en_up);
    buton2 : debouncer_afis  port map(button => btn_down, clk => clk ,en => en_down);
    button3: debouncer_afis port map(button => ad_cif, clk => clk, en => en_adauga_cifru);
	button4: debouncer_afis port map(button => reset, clk => clk, en => en_reset);

    process(clk)
        variable count: std_logic_vector(3 downto 0) := "0000";
    begin
        if en_reset = '1' then count := "0000";
        else
            if falling_edge (clk)  then
                if en_up = '1' then
                    count := count+1;
                end if;
                if en_down = '1' then
                    count := count-1;
                end if;
            end if;
        end if;
        q2 <= count;
    end process;

end arh_numarator2;