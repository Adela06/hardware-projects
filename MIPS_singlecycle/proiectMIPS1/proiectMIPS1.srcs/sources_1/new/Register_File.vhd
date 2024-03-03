library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_File is
port (
    clk : in std_logic;
    ra1 : in std_logic_vector (2 downto 0);
    ra2 : in std_logic_vector (2 downto 0);
    wa : in std_logic_vector (2 downto 0);
    wd : in std_logic_vector (15 downto 0);
    regwrite : in std_logic;
    en : in std_logic;
    rd1 : out std_logic_vector (15 downto 0);
    rd2 : out std_logic_vector (15 downto 0)
);
end Register_File;

architecture Behavioral of Register_File is

type reg_array is array (0 to 7) of std_logic_vector(15 downto 0);
signal registers : reg_array := (others => x"0000");

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' and regwrite = '1' then
                registers(conv_integer(wa)) <= wd;
            end if;
        end if;
    end process;
    rd1 <= registers(conv_integer(ra1));
    rd2 <= registers(conv_integer(ra2));
end Behavioral;