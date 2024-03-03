
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UC is
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
end UC;

architecture Behavioral of UC is

begin

 process(Instr) 
    begin
        RegDst <= '0';
        ExtOp <= '0';
        ALUSrc <= '0';
        Branch <= '0';
        Jump <= '0';
        ALUOp <= "00";
        MemWrite <= '0';
        MemToReg <= '0';
        RegWrite <= '0';
        BranchNE <= '0';
        
        case Instr is
            when "000" => 
                RegDst <= '1'; 
                RegWrite <= '1';
            when "111" =>
                ExtOp <= '1';
                ALUSrc <= '1'; 
                RegWrite <= '1'; 
                ALUOp <= "01";
            when "010" => 
                 ExtOp <= '1';
                 ALUSrc <= '1';
                 MemToReg <= '1';
                 RegWrite <= '1';
                 ALUOp <= "01";     
            when "101" =>
                 ExtOp <= '1';
                 ALUSrc <= '1';
                 MemWrite <= '1';
                 ALUOp <= "01";      
            when "100" =>
                 Branch <= '1';
                 ALUOp <= "10";
            when "011" =>
                 BranchNE <= '1';
                 ALUOp <= "10";
           when "110" =>
                 ALUSrc <= '1';
           when "001" =>
                Jump <= '1';    
             when others =>                    
        end case;
    end process;
end Behavioral;
