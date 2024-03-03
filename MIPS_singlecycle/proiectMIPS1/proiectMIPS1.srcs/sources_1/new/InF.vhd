library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity InF is
 Port  (clk : in std_logic; --semnal de ceas pt PC
        rst : in std_logic;
        en : in std_logic;
        jump : in std_logic;    --semnal de control jump
        pcsrc : in std_logic;   --semnal de control (pt branch)
        jaddr : in std_logic_vector(15 downto 0);   --adresa de jump
        baddr : in std_logic_vector(15 downto 0);   --adresa de branch 
        pcout : out std_logic_vector(15 downto 0);  --adresa urmatoarei instr, mod secvential
        instr : out std_logic_vector(15 downto 0)   --instr de executat in ciclul de ceas curent 
        );
end InF;

architecture Behavioral of InF is

--int A[6]={1,2,8,6,9,3};
--int sum=0;
--for(int i=0;i<6;i++){
--sum=sum+A[i];}

--0.   add $1,$0,$0     #$1 -> i=0 contor bucla
--1.    addi $4,$0,3    #$4 -> salvam nr de iteratii 
--2.    add $2,$0,$0    #
--3.    add $5,$0,$0    #$5 -> sum
--4.begin_loop:beq $1,$4,end_loop
--5.    lw $3,A_addr($2)
--6.    add $5,$5,$3
--7.    addi $2,$2,2
--8.    addi $1,$1,2
--9.    j begin_loop
--10.end_loop:sw $5,sum_addr($0)

signal aux : std_logic_vector(4 downto 0);

type tip_mem is array(0 to 31) of std_logic_vector(15 downto 0);
signal mem: tip_mem := (

B"000_000_000_001_0_000",   -- x"0010" --  0.add $1,$0,$0   --rd1 si rd2 sunt egale
B"111_000_100_0000110",   -- x"E206 -- 1
B"000_000_000_010_0_000",   -- x"0020" --2
B"000_000_000_101_0_000",   --x"0050" --3
B"100_100_001_0000101",     --x"9085" --4
B"010_010_011_0000000", --"4980" --5
B"000_101_011_101_0_000",   --"15d0" --6
B"111_010_010_0000010",   --"E902 "--7
B"111_001_001_0000010",   --"E482" --8
B"001_0000000000100",   --"2004" --9. j4
B"101_000_101_0010000",  --"A290" --10. sw $5, 16($0)
others=>x"0000"
);

signal pc: std_logic_vector(15 downto 0):=(others => '0');
signal pcp1 : std_logic_vector(15 downto 0) := (others => '0');
signal pcmux : std_logic_vector(15 downto 0) := (others => '0');--al doilea mux
signal d : std_logic_vector(15 downto 0) := (others => '0');--primul mux

begin

--program counter
process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            pc<=x"0000";
        elsif en='1' then 
            pc<=d;
        end if;
    end if;
end process;


instr <= mem(conv_integer(pc(4 downto 0)));

pcp1 <= pc + 1;
pcout <= pcp1;
pcmux <= baddr when pcsrc = '1' else pcp1;
d <= jaddr when jump = '1' else pcmux;


end Behavioral;
