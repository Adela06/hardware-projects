library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity muxSelectie is
Port ( 
x : in STD_LOGIC_VECTOR (3 downto 0);
y : in STD_LOGIC_VECTOR (3 downto 0);
clk, rst: in STD_LOGIC;
carry_in : in STD_LOGIC;
sel_si:  in STD_LOGIC; 
sel_sau: in STD_LOGIC;  
sel_not: in STD_LOGIC;  
sel_adunare: in STD_LOGIC; 
sel_scadere: in STD_LOGIC;  
sel_increm: in STD_LOGIC;
sel_decrem:in STD_LOGIC;
sel_rstanga: in STD_LOGIC;
sel_rdreapta: in STD_LOGIC;
coutS: out STD_LOGIC;
iesire: out STD_LOGIC_VECTOR (7 downto 0):="00000000";
out_rotatii: out STD_LOGIC_VECTOR (3 downto 0) := "0000"
);
end muxSelectie;

architecture Behavioral of muxSelectie is

component Adder is
  port (
    i_add1  : in std_logic_vector(3 downto 0);
    i_add2  : in std_logic_vector(3 downto 0);
    o_result   : out std_logic_vector(4 downto 0)
    );
end component;

component countUp is
Port (clk, rst: in std_logic;
x: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0)
 );
end component;

component countDown is
Port (clk, rst: in std_logic;
x: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0)
 );
end component;

component scadere is
Port ( 
x : in STD_LOGIC_VECTOR (3 downto 0);
y : in STD_LOGIC_VECTOR (3 downto 0);
res: out STD_LOGIC_VECTOR (4 downto 0)
);
end component;

component shRight is
Port (
clk: in STD_LOGIC;
x: in STD_LOGIC_VECTOR(3 downto 0);
y: out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component shLeft is
Port (clk: in STD_LOGIC;
x: in STD_LOGIC_VECTOR(3 downto 0);
y: out  STD_LOGIC_VECTOR(3 downto 0));
end component;

signal sSumator, outScadere: STD_LOGIC_VECTOR(3 downto 0);
signal coutSumator, coutScadere: STD_LOGIC;
signal iesireSi, iesireSau, iesireNot: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal iesireIncrem, iesireDecrem: STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal iesireShiftL, iesireShiftR: std_logic_vector(3 downto 0);
begin


add: Adder port map(i_add1 => x, i_add2 => y, o_result(3 downto 0) => sSumator, o_result(4) => coutSumator);
sub: scadere port map(x=>x, y=>y, res(3 downto 0)=>outScadere, res(4)=>coutScadere);

counterUP: countUp port map(clk=>clk,rst=>rst,x=>x,y=>iesireIncrem);
counterDown: countDown port map(clk=>clk,rst=>rst,x=>x,y=>iesireDecrem);

shiftRight: shRight port map(clk=>clk, x=>x, y=>iesireShiftR);
shiftLeft: shLeft port map(clk=>clk, x=>x, y=>iesireShiftL);

process(x, y, sel_si, sel_sau, sel_not, sel_increm, sel_decrem, 
sel_adunare, sel_scadere, sel_rstanga, sel_rdreapta, clk)
begin
      iesireSi <= x and y;
      iesireSau <= x or y;
      iesireNot <= not x;
  if rising_edge(clk) then   --si logic     
    if sel_si = '1' then
      iesire(3 downto 0) <= iesireSi;
    elsif sel_sau = '1' then    --sau logic
      iesire(3 downto 0) <= iesireSau;
    elsif sel_not = '1' then    --nu logic
      iesire(3 downto 0) <= iesireNot;
    elsif sel_increm = '1' then --incrementare
      iesire(3 downto 0) <= iesireIncrem;
    elsif sel_decrem = '1' then --decremenetare
      iesire(3 downto 0) <= iesireDecrem;
   elsif sel_adunare = '1' then --adunare
              iesire(3 downto 0) <= sSumator;
              coutS <= coutSumator;
   elsif sel_scadere = '1' then --scadere in c2
                iesire(3 downto 0) <= outScadere;
                coutS <= coutScadere;
   elsif sel_rstanga = '1' then     --rotatie stanga
                out_rotatii <=   iesireShiftL;
   elsif sel_rdreapta = '1' then     --rotatie dreapta
                out_rotatii <=   iesireShiftR;                        
    else
      iesire(3 downto 0) <= (others => 'X');  
   end if;
  end if;
end process;

end Behavioral;
