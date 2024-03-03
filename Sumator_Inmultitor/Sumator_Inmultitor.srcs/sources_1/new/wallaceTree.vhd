library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wallaceTree is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           p : out STD_LOGIC_VECTOR (7 downto 0));
end wallaceTree;

architecture Behavioral of wallaceTree is

component carrySave8bit is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           z : in STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end component;

component carryPropagateAdder is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end component;


signal num1, num2, num3, num4, sum1, sum2, part_sum: STD_LOGIC_VECTOR(7 downto 0) := x"00";
signal c1, c2, c3, c4: STD_LOGIC;
signal aux1, aux2, aux3, aux4: STD_LOGIC_VECTOR(3 downto 0);
signal global_carry1, global_carry2: STD_LOGIC_VECTOR(7 downto 0) := x"00";

begin

--salvam y-ul, aux1->y0, aux2->y1, aux3->y2, aux4->y3
   process(y) 
   begin
    for i in 0 to 3 loop
        aux1(i) <= y(0);
        aux2(i) <= y(1);
        aux3(i) <= y(2);
        aux4(i) <= y(3);
     end loop;
    end process;

    -- il shiftez pe x, pe masura ce calculez urmatorul operand al sumei
    num1 <= "0000" & (x and aux1);
    num2 <= "000" & (x and aux2) & "0";
    num3 <= "00" & (x and aux3) & "00";
    num4 <= "0" & (x and aux4) & "000";    
   
    
    -- punem operanzii in carry save addere pe 8 biti
    A1: carrySave8bit port map (x => num1, y => num2, z => num3, sum => sum1, cout => c1);
    A2: carrySave8bit port map (x => num4, y => sum1, z => global_carry2, sum => part_sum, cout => c2);
    
    global_carry1(0) <= c2;
    global_carry1(1) <= c1;
   
    global_carry2(0) <= c1;
    
    -- carry propagate adder => calculeaza rezultatul final
    LAST_ADDER: carryPropagateAdder port map (x => part_sum, y => global_carry1, s => p, cout => open);

end Behavioral;
