library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ID is
    Port (
        clk : in std_logic;
        instr : in std_logic_vector (15 downto 0);
        wa : in std_logic_vector (2 downto 0);
        wd : in std_logic_vector (15 downto 0);
        en : in std_logic;
        reg_write : in std_logic;
        reg_dst : in std_logic;
        ext_op : in std_logic;
        rd1 : out std_logic_vector (15 downto 0);
        rd2 : out std_logic_vector (15 downto 0);
        ext_imm : out std_logic_vector (15 downto 0);
        func : out std_logic_vector (2 downto 0);
        sa : out std_logic
       );
end ID;

architecture Behavioral of ID is

component Register_File is
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
end component;


--signal wa : std_logic_vector(2 downto 0) := (others => '0'); --alegere registru in care scriu

begin
 reg: Register_File port map (
        clk => clk,
        ra1 => instr(12 downto 10),
        ra2 => instr(9 downto 7),
        wa => wa,
        wd => wd,
        regwrite => reg_write,
        en => en,
        rd1 => rd1,
        rd2 => rd2);

--wa <= instr(6 downto 4) when reg_dst = '1' else instr(9 downto 7);
sa <= instr(3);
func <= instr(2 downto 0);
ext_imm <= "000000000" & instr(6 downto 0) when ext_op = '0' else 
instr(6) & instr(6) & instr(6) & instr(6) & instr(6) & instr(6) & instr(6) 
& instr(6) & instr(6) & instr(6 downto 0);

end Behavioral;
