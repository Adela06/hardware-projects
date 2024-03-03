
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

--adaugare semnale pt mips pipeline, descrierea registrelor intermediare
signal REG_IF_ID: std_logic_vector(31 downto 0);
signal REG_ID_EX: std_logic_vector(82 downto 0);
signal REG_EX_MEM: std_logic_vector(56 downto 0);
signal REG_MEM_WB: std_logic_vector(36 downto 0);

----
signal rd : std_logic_vector(2 downto 0) := (others => '0');
signal rt : std_logic_vector(2 downto 0) := (others => '0');
signal ALUResOut : std_logic_vector(15 downto 0) := (others => '0');
signal wa : std_logic_vector(2 downto 0) := (others => '0');

begin

----pipeline

IF_ID: process(clk)
        begin
            if rising_edge(clk) then
                if en = '1' then
                    REG_IF_ID(31 downto 16) <= pcout;
                    REG_IF_ID(15 downto 0) <= instr;
                 end if;
            end if;
       end process;

ID_EX: process(clk)
        begin
            if rising_edge(clk) then
                if en = '1' then
                    REG_ID_EX(82) <= RegDst;
                    REG_ID_EX(81) <= ALUSrc;
                    REG_ID_EX(80) <= Branch;
                    REG_ID_EX(78 downto 77) <= ALUOp;
                    REG_ID_EX(76) <= MemWrite;                        
                    REG_ID_EX(75) <= MemtoReg;
                    REG_ID_EX(74) <= RegWrite;
                    REG_ID_EX(73 downto 58) <= rd1;                        
                    REG_ID_EX(57 downto 42) <= rd2;
                    REG_ID_EX(41 downto 26) <= Ext_imm;
                    REG_ID_EX(25 downto 23) <= func;                        
                    REG_ID_EX(22) <= sa;
                    REG_ID_EX(21 downto 19) <= rd;
                    REG_ID_EX(18 downto 16) <= rt;
                    REG_ID_EX(15 downto 0) <= REG_IF_ID(15 downto 0);
                end if;
            end if;
       end process;
       
EX_MEM: process(clk)
            begin
                if rising_edge(clk) then
                    if en = '1' then
                         REG_EX_MEM(56) <= REG_ID_EX(80);
                         REG_EX_MEM(55) <= REG_ID_EX(79);
                         REG_EX_MEM(54) <= REG_ID_EX(76);
                         REG_EX_MEM(53) <= REG_ID_EX(75);
                         REG_EX_MEM(52) <= REG_ID_EX(74);
                         REG_EX_MEM(51) <= zero;
                         REG_EX_MEM(50 downto 35) <= BranchAddress;
                         REG_EX_MEM(34 downto 19) <= ALURes;
                         REG_EX_MEM(18 downto 16) <= wa;
                         REG_EX_MEM(15 downto 0) <= REG_ID_EX(57 downto 42);
                    end if;
               end if;
        end process;
        
MEM_WB: process(clk)
            begin
                if rising_edge(clk) then
                    if en = '1' then
                        REG_MEM_WB(36) <= REG_EX_MEM(53);
                        REG_MEM_WB(35) <= REG_EX_MEM(52);
                        REG_MEM_WB(34 downto 19) <= ALUResOut;
                        REG_MEM_WB(18 downto 3) <= MemData;
                        REG_MEM_WB(2 downto 0) <= rd;
                    end if;
                end if;
        end process;

-----

Mpg_reset: Mpg port map(en=>rst, input=>btn(0), clk=>clk);
Mpg_enable: Mpg port map(en=>en, input=>btn(1), clk=>clk);

instrF: InF port map(
        clk => clk,
        rst => rst,
        en => en,
        jump => Jump,
        pcsrc => PCSrc,
        jaddr => jumpaddr,
        baddr => REG_EX_MEM(50 downto 35),
        pcout => pcout,
        instr => instr);
        
S: ssd port map(digit=>digits,clk=>clk,cat=>cat,an=>an);

instrD: ID port map(
         clk => clk,
         instr => REG_IF_ID(31 downto 16),
         wa =>  REG_MEM_WB(2 downto 0),
         wd => writeD,
         en => en,
         reg_write => REG_MEM_WB(35),
         reg_dst => RegDst,
         ext_op => ExtOp,
         rd1 => rd1,
         rd2 => rd2,
         ext_imm => ext_imm,
         func => func,
         sa => sa);
  
--uc
mainControl: UC port map(
instr(15 downto 13)=> REG_IF_ID(31 downto 29),
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
RD1 => REG_ID_EX(73 downto 58),
ALUSrc => REG_ID_EX(81),
RD2 => REG_ID_EX(57 downto 42),
ext_imm => REG_ID_EX(41 downto 26),
sa => REG_ID_EX(22),
func => REG_ID_EX(25 downto 23),
ALUOp => REG_ID_EX(78 downto 77),
PCp1 => REG_ID_EX(15 downto 0),
Zero => Zero,
ALURes => ALURes,
BranchAddress => BranchAddress);

--unitatea de memorie
memorie: mem port map(
MemWrite => REG_EX_MEM(54),
ALURes_in => REG_EX_MEM(34 downto 19),
RD2 => REG_EX_MEM(15 downto 0),
MemData => MemData,
ALURes_out => ALURes_out,
clk=>clk,
en=>en
);

--afisarea pe ssd a semnalelor relevane din calea de date
process(sw(7 downto 5), instr, pcout, rd1, rd2, ext_imm, ALURes, MemData, writeD)
 begin
     case sw(7 downto 5) is
         when "000" => digits <= instr; --se afiseaza instructiunea pe ssd
         when "001" => digits <= pcout; --se afis urm valoare secventiala a PC (PC+1) pe ssd
         when "010" => digits <= REG_ID_EX(73 downto 58);
         when "011" => digits <= REG_ID_EX(57 downto 42);
         when "100" => digits <= REG_ID_EX(41 downto 26);
         when "101" => digits <= ALURes;
         when "110" => digits <= MemData;
         when "111" => digits <= writeD;
     end case;
 end process;  

led(10 downto 0) <= ALUOp & RegDst & ExtOp & ALUSrc & Branch & Jump & MemWrite & MemToReg & RegWrite & BranchNE;

jumpaddr <= (REG_IF_ID(15 downto 13) & REG_IF_ID(28 downto 16));
writeD <= REG_MEM_WB(18 downto 3) when REG_MEM_WB(36)='1' else REG_MEM_WB(34 downto 19);
PCSrc <= (REG_EX_MEM(56) and REG_EX_MEM(51)) or (REG_EX_MEM(55) and not REG_EX_MEM(51));
--PCSrc <= (Branch and Zero) or (BranchNE and not Zero);

end Behavioral;
