
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer_afis is
    Port ( button : in STD_LOGIC;
         clk : in STD_LOGIC;
         en : out STD_LOGIC);
end debouncer_afis;

architecture arhit_deb of debouncer_afis is
    --numarator pe 16 biti
    component counter16b
        port(clk : in std_logic ;
             q: out std_logic_vector (15 downto 0));
    end component ;

    --bistabil D
    component bistD
        port(d, clk : in std_logic ;
             y: out std_logic);
    end component ;

    --bistabil D cu enable
    component bistD_en
        port(en, d, clk : in STD_LOGIC;
             y: out std_logic);
    end component ;

    signal q: std_logic_vector (15 downto 0);
    signal y1, y2, y3, s: std_logic ;

begin
    p1: counter16b port map (clk, q);
    s <= q(15) and q(14) and q(13) and q(12) and q(11) and q(10) and q(9) and q(8) and q(7) and q(6) and q(5) and q(4) and q(3) and q(2) and q(1) and q(0);
    p2: bistD_en port map (s, button, clk, y1);
    p3: bistD port map (y1, clk, y2);
    p4: bistD port map (y2, clk, y3);
    en <= y2 and not(y3);
end arhit_deb;
