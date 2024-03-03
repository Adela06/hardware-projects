library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity EX is
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
end EX;

architecture Behavioral of EX is

signal B_salt : std_logic_vector(15 downto 0) := (others => '0');
signal C : std_logic_vector(15 downto 0) := (others => '0');
signal ALUCtrl : std_logic_vector(3 downto 0) := (others => '0');

begin

-- calculul adresei de salt conditionat (Branch Address)
B_salt <= ext_imm when ALUSrc = '1' else RD2;

-- proces pt descrierea ALU; campul sa e folosit doar pt operatii de deplasare logica sau aritm
ALU_descriere: process(ALUCtrl, RD1, B_salt, sa)
begin 
case ALUCtrl is
    when "0000" => C <= RD1 + B_salt;   --add
    when "0001" => C <= RD1 - B_salt;   --sub
    when "0010" => --sll
        if sa = '1' then
            C <= B_salt(14 downto 0) & "0";
         else C <= B_salt;
         end if;
    when "0011" => --srl
        if sa = '1' then
            C <= "0" & B_salt(15 downto 1);
        else C <= B_salt;
        end if;
        
    when "0100" => C <= RD1  and B_salt;    --and
    when "0101" => C <= RD1 or B_salt;  --or
    
    when "0110" => C <= RD1 xor B_salt; --xor
    when "0111" => if signed(RD1) < signed(B_salt) then --slt
            C <= x"0001";
            else C <= x"0000";
            end if;
   when others => C <= (others => '0');
 end case;
end process;

-- multiplexor
B_salt <= Ext_Imm when ALUSrc = '1' else RD2;

ALURes <= C;
Zero <= '1' when C = x"0000" else '0';  --detector de 0
BranchAddress <= PCp1 + Ext_Imm;

-- proces pt implementarea unitatii locale de control ALU
ALU_control: process(ALUOp, func)
begin 
case ALUOp is
    when "00" => 
        case func is
            when "000" => ALUCtrl <= "0000";
            when "001" => ALUCtrl <= "0001";
            when "010" => ALUCtrl <= "0010";
            when "011" => ALUCtrl <= "0011";
            when "100" => ALUCtrl <= "0100";
            when "101" => ALUCtrl <= "0101";
            when "110" => ALUCtrl <= "0110";
            when "111" => ALUCtrl <= "0111";
        end case;
        when "01" => ALUCtrl <= "0000";
        when "10" => ALUCtrl <= "0001";
        when "11" => ALUCtrl <= "1000";
        when others => ALUCtrl <= "0000";
end case;        
end process;

end Behavioral;
