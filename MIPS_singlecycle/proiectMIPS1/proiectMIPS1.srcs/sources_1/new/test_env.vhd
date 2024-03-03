
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_env;

architecture Behavioral of test_env is

component Mpg is
Port ( en : out STD_LOGIC;
input : in STD_LOGIC;
clk : in STD_LOGIC);
end component;

component ssd is
  Port ( digit : in STD_LOGIC_VECTOR (15 downto 0);
         clk : in STD_LOGIC;
         cat : out STD_LOGIC_VECTOR (6 downto 0);
         an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component InF is
 Port  (clk : in std_logic; --semnal de ceas pt PC
        rst : in std_logic;
        en : in std_logic;
        jump : in std_logic;    --semnal de control jump
        pcsrc : in std_logic;   --semnal de control (pt branch)
        jaddr : in std_logic_vector(15 downto 0);   --adresa de jump
        baddr : in std_logic_vector(15 downto 0);   --adresa de branch 
        pcout : out std_logic_vector(15 downto 0);  --adresa urnatoarei instr, mod secvential
        instr : out std_logic_vector(15 downto 0)   --instr de executat in ciclul de ceas curent 
        );
end component;

component ID is
    Port (
        clk : in std_logic;
        instr : in std_logic_vector (15 downto 0);
        wd : in std_logic_vector (15 downto 0);
        en : in std_logic;
        reg_write : in std_logic;
        reg_dst : in std_logic;
        ext_op : in std_logic;
        rd1 : out std_logic_vector (15 downto 0);
        rd2 : out std_logic_vector (15 downto 0);
        ext_imm : out std_logic_vector (15 downto 0);
        func : out std_logic_vector (2 downto 0);
        sa : out std_logic);
end component;

component UC is
Port ( 
    Instr : in std_logic_vector(15 downto 13);
    RegDst : out std_logic;    
    ExtOp : out std_logic;    
    ALUSrc : out std_logic;    
    Branch : out std_logic;    
    Jump : out std_logic;    
    ALUOp : out std_logic_vector(1 downto 0);    
    MemWrite : out std_logic;    
    MemToReg : out std_logic;    
    RegWrite : out std_logic;    
    BranchNE : out std_logic  
    );
end component;

component EX is
Port (
        RD1 : in std_logic_vector (15 downto 0);
        ALUSrc : in std_logic;
        RD2 : in std_logic_vector (15 downto 0);
        ext_imm : in std_logic_vector (15 downto 0);
        sa : in std_logic;
        func : in std_logic_vector(2 downto 0);
        ALUOp: in std_logic_vector(1 downto 0);
        PCp1: in std_logic_vector(15 downto 0);
        Zero: out std_logic;
        ALURes: out std_logic_vector(15 downto 0);
        BranchAddress: out std_logic_vector(15 downto 0));
end component;

component mem is
Port ( 
    MemWrite: in std_logic;
    ALURes_in: in std_logic_vector(15 downto 0);
    RD2: in std_logic_vector(15 downto 0);
    MemData: out std_logic_vector(15 downto 0);
    ALURes_out: out std_logic_vector(15 downto 0);
    en: in std_logic;
    clk: in std_logic);
end component;


signal counter: STD_LOGIC_VECTOR(15 downto 0);
signal en : std_logic;
signal rst : std_logic;
signal digits : std_logic_vector(15 downto 0);
signal pcout : std_logic_vector(15 downto 0);
signal instr : std_logic_vector(15 downto 0);

signal ralu : std_logic_vector(15 downto 0) := (others => '0');
signal rd1 : std_logic_vector(15 downto 0) := (others => '0');
signal rd2 : std_logic_vector(15 downto 0) := (others => '0');
signal ext_imm : std_logic_vector(15 downto 0) := (others => '0');
signal func : std_logic_vector(2 downto 0) := (others => '0');
signal ext_func : std_logic_vector(15 downto 0) := (others => '0');
signal ext_sa : std_logic_vector(15 downto 0) := (others => '0');
signal sa : std_logic := '0';

signal RegDst : std_logic := '0';
signal ExtOp : std_logic := '0';
signal ALUSrc : std_logic := '0';
signal Branch : std_logic := '0';
signal Jump : std_logic := '0';
signal ALUOp : std_logic_vector(1 downto 0) := "00";
signal MemWrite : std_logic := '0';
signal MemToReg : std_logic := '0';
signal RegWrite : std_logic := '0';
signal BranchNE : std_logic := '0';

signal BranchAddress : std_logic_vector(15 downto 0) := (others => '0');
signal Zero : std_logic := '0';
signal ALURes : std_logic_vector(15 downto 0) := (others => '0');
signal ALURes_out : std_logic_vector(15 downto 0) := (others => '0');
signal MemData : std_logic_vector(15 downto 0) := (others => '0');
signal writeD : std_logic_vector(15 downto 0) := (others => '0');
signal jumpaddr : std_logic_vector(15 downto 0) := (others => '0');
signal PCSrc : std_logic := '0';

begin

Mpg_reset: Mpg port map(en=>rst, input=>btn(0), clk=>clk);
Mpg_enable: Mpg port map(en=>en, input=>btn(1), clk=>clk);

instrF: InF port map(
        clk => clk,
        rst => rst,
        en => en,
        jump => Jump,
        pcsrc => PCSrc,
        jaddr => jumpaddr,
        baddr => BranchAddress,
        pcout => pcout,
        instr => instr);
        
S: ssd port map(digit=>digits,clk=>clk,cat=>cat,an=>an);
 
instrD: ID port map(
         clk => clk,
         instr => instr,
         wd => writeD,
         en => en,
         reg_write => RegWrite,
         reg_dst => RegDst,
         ext_op => ExtOp,
         rd1 => rd1,
         rd2 => rd2,
         ext_imm => ext_imm,
         func => func,
         sa => sa);

--uc
mainControl: UC port map(instr(15 downto 13)=>instr(15 downto 13),
    RegDst=>RegDst,
    ExtOp=>ExtOp, 
    ALUSrc=>ALUSrc,
    Branch=>Branch, 
    Jump=>Jump, 
    ALUOp=>ALUOp, 
    MemWrite=>MemWrite, 
    MemToReg=>MemToReg, 
    RegWrite=>RegWrite, 
    BranchNE=>BranchNE);

--unitatea de executie 
exec: EX port map(
RD1=>rd1,
ALUSrc=>ALUSrc,
RD2=>rd2,
ext_imm=>ext_imm,
sa=>sa,
func=>func,
ALUOp=>ALUOp,
PCp1=>pcout,
Zero=>Zero,
ALURes=>ALURes,
BranchAddress=>BranchAddress);

--unitatea de memorie
memorie: mem port map(
MemWrite=>MemWrite,
ALURes_in=>ALURes,
RD2=>rd2,
MemData=>MemData,
ALURes_out=>ALURes_out,
clk=>clk,
en=>en
);



--afisarea pe ssd a semnalelor relevane din calea de date
process(sw(7 downto 5), instr, pcout, rd1, rd2, ext_imm, ALURes, MemData, writeD)
 begin
     case sw(7 downto 5) is
         when "000" => digits <= instr; --se afiseaza instructiunea pe ssd
         when "001" => digits <= pcout; --se afis urm valoare secventiala a PC (PC+1) pe ssd
         when "010" => digits <= rd1;
         when "011" => digits <= rd2;
         when "100" => digits <= ext_imm;
         when "101" => digits <= ALURes;
         when "110" => digits <= MemData;
         when "111" => digits <= writeD;
     end case;
 end process;  

led(10 downto 0) <= ALUOp & RegDst & ExtOp & ALUSrc & Branch & Jump & MemWrite & MemToReg & RegWrite & BranchNE;

jumpaddr <= (pcout(15 downto 13) & instr(12 downto 0));
writeD <= MemData when MemToReg='1' else ALURES_out;
PCSrc <= (Branch and Zero) or (BranchNE and not Zero);

end Behavioral;
