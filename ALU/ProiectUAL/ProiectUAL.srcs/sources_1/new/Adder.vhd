library ieee;
use ieee.std_logic_1164.all;
 
entity Adder is
  port (
    i_add1  : in std_logic_vector(3 downto 0);
    i_add2  : in std_logic_vector(3 downto 0);
    o_result   : out std_logic_vector(4 downto 0)
    );
end Adder;
 
architecture behav of Adder is
 
  component fullAdder is
      Port ( x : in STD_LOGIC;
             y : in STD_LOGIC;
             cin : in STD_LOGIC;
             cout : out STD_LOGIC;
             sum : out STD_LOGIC);
  end component;
 
  signal w_G : std_logic_vector(3 downto 0); -- Generate
  signal w_P : std_logic_vector(3 downto 0); -- Propagate
  signal w_C : std_logic_vector(4 downto 0); -- Carry
 
  signal w_SUM   : std_logic_vector(3 downto 0);
 
begin
   
  fullAdder_b0 : fullAdder
    port map (
      x  => i_add1(0),
      y  => i_add2(0),
      cin => w_C(0),
      sum   => w_SUM(0),
      cout => open
      );
 
  fullAdder_b1 : fullAdder
    port map (
      x  => i_add1(1),
      y  => i_add2(1),
      cin => w_C(1),
      sum   => w_SUM(1),
      cout => open
      );
 
  fullAdder_b2 : fullAdder
    port map (
      x  => i_add1(2),
      y  => i_add2(2),
      cin => w_C(2),
      sum   => w_SUM(2),
      cout => open
      );
   
  fullAdder_b3 : fullAdder
    port map (
      x  => i_add1(3),
      y  => i_add2(3),
      cin => w_C(3),
      sum   => w_SUM(3),
      cout => open
      );
 
  -- Gi=Ai*Bi
  w_G(0) <= i_add1(0) and i_add2(0);
  w_G(1) <= i_add1(1) and i_add2(1);
  w_G(2) <= i_add1(2) and i_add2(2);
  w_G(3) <= i_add1(3) and i_add2(3);
 
  -- Pi=Ai+Bi
  w_P(0) <= i_add1(0) or i_add2(0);
  w_P(1) <= i_add1(1) or i_add2(1);
  w_P(2) <= i_add1(2) or i_add2(2);
  w_P(3) <= i_add1(3) or i_add2(3);
 
  -- carry
  w_C(0) <= '0'; --input: no carry
  w_C(1) <= w_G(0) or (w_P(0) and w_C(0));
  w_C(2) <= w_G(1) or (w_P(1) and w_C(1));
  w_C(3) <= w_G(2) or (w_P(2) and w_C(2));
  w_C(4) <= w_G(3) or (w_P(3) and w_C(3));
 
  --final result
  o_result <= w_C(4) & w_SUM;  
   
end behav;