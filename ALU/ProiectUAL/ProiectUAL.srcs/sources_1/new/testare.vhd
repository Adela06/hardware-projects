library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testare is
--  Port ( );
end testare;

architecture Behavioral of testare is

component muxSelectie is
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
iesire: out STD_LOGIC_VECTOR (7 downto 0);
out_rotatii: out STD_LOGIC_VECTOR (3 downto 0)
);
end component;

signal x, y: STD_LOGIC_VECTOR(3 downto 0);
signal product: STD_LOGIC_VECTOR(7 downto 0);
signal clk: STD_LOGIC := '0';
signal coutS, sel_si, sel_sau, sel_not, sel_increm, sel_decrem, sel_adunare, sel_scadere, sel_rstanga, sel_rdreapta: STD_LOGIC := '0';
signal iesire1: STD_LOGIC_VECTOR(7 downto 0);
signal out_rotatii: STD_LOGIC_VECTOR(3 downto 0);
signal carry_in : STD_LOGIC:='0';
signal rst: std_logic := '1';
begin

x <= "0110";    --6
y <= "0011";    --3
clk <= not clk after 5ns;
rst <= '0' after 45 ns, '1' after 70 ns, '0'after 75 ns;

sel_si <= '1' after 10ns, '0' after 20 ns;
sel_sau <= '1' after 20 ns, '0' after 30 ns;
sel_not <= '1' after 30 ns, '0' after 40 ns;
sel_increm <= '1' after 40 ns, '0' after 50 ns, '1' after 55 ns, '0' after 70 ns;
sel_decrem <= '1' after 70 ns, '0' after 80 ns, '1' after 85 ns, '0' after 100ns; 
sel_adunare <= '1' after 100 ns, '0' after 120 ns, '1' after 125 ns, '0' after 140 ns;
sel_scadere <= '1' after 140ns, '0' after 150 ns;
sel_rdreapta <= '1' after 150ns, '0' after 200 ns;
sel_rstanga <= '1' after 205ns, '0' after 245 ns, '1' after 255ns, '0' after 265 ns;

test: muxSelectie port map(x => x, y => y, clk => clk, rst => rst, carry_in => carry_in, 
sel_si => sel_si, sel_sau => sel_sau, sel_not => sel_not,sel_adunare => sel_adunare, 
sel_scadere => sel_scadere, sel_increm => sel_increm, sel_decrem => sel_decrem, 
sel_rstanga => sel_rstanga,sel_rdreapta=> sel_rdreapta, coutS=> coutS, 
iesire=>iesire1, out_rotatii=>out_rotatii);


end Behavioral;
