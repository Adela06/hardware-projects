library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity butoane is
    port(btn:inout std_logic;
     CLK : in STD_LOGIC;
	btn_DB : out STD_LOGIC);	
	--yc:inout std_logic_vector(15 downto 0);
	--q:out std_logic_vector(3 downto 0));
end entity ;

architecture arch_butoane of butoane is	
signal buton: STD_LOGIC_VECTOR (3 downto 0):="1111";   
signal en:std_logic;
begin
    process(CLK)
	variable yc:std_logic_vector(15 downto 0):="0000000000000000";	
    begin  	   	  
	if CLK='1'and CLK'event then yc:= yc + 1;
	end if;					
	en<=yc(0) and yc(1)and yc(2) and yc(3) and yc(4) and yc(5) and yc(6) and yc(7) and yc(8) and yc(9) and yc(10) and yc(11) and yc(12) and yc(13) and yc(14) and yc(15);   
	if en='1' then
        	--if(CLK = '1' and CLK'EVENT) then
            	buton(3 downto 1) <= buton(2 downto 0);
            	buton(0) <= btn;
        	end if;
		--end if;
	end process;		  
	--q<=buton;
    btn_DB <= buton(0) and buton(1) and buton(2) and buton(3);
end architecture ;