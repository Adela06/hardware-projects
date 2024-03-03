library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity mem is
Port ( 
    MemWrite: in std_logic;
    ALURes_in: in std_logic_vector(15 downto 0);
    RD2: in std_logic_vector(15 downto 0);
    MemData: out std_logic_vector(15 downto 0);
    ALURes_out: out std_logic_vector(15 downto 0);
    en: in std_logic;
    clk: in std_logic);
end mem;

architecture Behavioral of mem is

type tip_ram is array(0 to 15) of std_logic_vector(15 downto 0);

--valorile din vectorul meu
signal RAM: tip_ram := (x"0001", x"0002", x"0008", x"0006", x"0009",x"0003",others => x"0000");

begin

memorie: process(clk)
begin
    if rising_edge(clk) then
        if en = '1' and MemWrite = '1' then
            RAM(conv_integer(ALURes_in(3 downto 0))) <= RD2;
        end if;
     end if;
end process;

ALURes_out <= ALURes_in;
MemData <= RAM(conv_integer(ALURes_in(4 downto 0)));

end Behavioral;
