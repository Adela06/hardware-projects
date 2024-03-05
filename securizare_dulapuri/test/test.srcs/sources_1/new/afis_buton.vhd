library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity afis_buton is
    Port (
        btn_up: in std_logic;
        btn_down: in std_logic;
        clk : in STD_LOGIC;
        adauga_cifru: in std_logic;  --buton trecere la urmatorul anod 
        caractere_distincte: inout std_logic;
        reset: inout std_logic;
        liber_ocupat: inout std_logic := '0'; --led 0, dulap liber
        introdu_caractere: out std_logic; --led
        catozi : out STD_LOGIC_VECTOR (6 downto 0);
        anozi : out STD_LOGIC_VECTOR (3 downto 0) := "0001"
    );
end afis_buton;

architecture arhitect of afis_buton is

    component debouncer_afis is
        Port ( button : in STD_LOGIC;
             clk : in STD_LOGIC;
             en : out STD_LOGIC);
    end component;

    component registru_12B is
        port (clk: in std_logic;
             reset: in std_logic;
             nradcif: inout  std_logic_vector(1 downto 0);--numara de cate ori a fost apasat butonul adauga cifru
             d: inout std_logic_vector(3 downto 0);--intrare care vine din iesirea numaratorului
             qout: inout std_logic_vector(11 downto 0)--iesirea de la registru care intra la afisare
            );
    end component;

    component  afis_ssd is
        Port (nr_anod: in std_logic_vector (1 downto 0);
             clk: in std_logic;
             catozi : out STD_LOGIC_VECTOR (6 downto 0);
             anozi : out STD_LOGIC_VECTOR (3 downto 0) := "0001";
             iesire_ssd1: inout std_logic_vector (11 downto 8);--primul anod de la stanga
             iesire_ssd2: inout std_logic_vector (7 downto 4);
             iesire_ssd3: inout std_logic_vector (3 downto 0)
            );
    end component ;


    component  numarator is
        Port (clk : in STD_LOGIC;
             btn_up: in std_logic;
             btn_down: in std_logic;
             reset: in std_logic;--apasare buton reset
             ad_cif: in std_logic;--cand apas adauga_cifre
             q : out STD_LOGIC_VECTOR (3 downto 0)--iesirea care intra in registru
            );
    end component ;


    signal tmp: STD_LOGIC_VECTOR(3 downto 0) := "0000";   --numar de apasari pe butonul adauga 
    signal tmp1: STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal iesire_numarator, iesire_numarator1: STD_LOGIC_VECTOR(3 downto 0);
    signal en_adauga_cifru, en_reset: std_logic;
    signal caractere, caractere1 :std_logic_vector(11 downto 0);

begin
    buton_adcif: debouncer_afis  port map(button => adauga_cifru, clk => clk ,en => en_adauga_cifru);
    buton_reset: debouncer_afis  port map(button => reset, clk => clk ,en => en_reset);

    process(clk, en_adauga_cifru, tmp, liber_ocupat )
        variable nr: std_logic_vector(3 downto 0) := "0000";
    begin
        if rising_edge(clk) and en_adauga_cifru = '1' then ---la apasarea butonului sa treaca la anodul urmator
            nr := nr + 1;
        end if;
        if en_reset = '1' then nr := "0000";
        end if;
        
         if nr = "1001" and liber_ocupat = '1' then --revine in starea 5 daca codul nu e bun, se permit mai multe incercari de deblocare
            nr := "0101";
        elsif nr = "1001" and liber_ocupat = '0' then nr := "0000";   --se intoarce in starea initiala daca s-a introdus codul corect
        end if;
        
        tmp <= nr; --0001 0010 0011 0100 0101..
    end process;

    p1: numarator port map(clk, btn_up, btn_down, reset, adauga_cifru, iesire_numarator);
    p2: registru_12B port map (clk, reset, tmp(1 downto 0), iesire_numarator, caractere);
    p3: afis_ssd port map(tmp(1 downto 0), clk, catozi, anozi, caractere(11 downto 8), caractere(7 downto 4), caractere(3 downto 0));

    process (caractere, caractere1, tmp, clk)
        variable registru1_blocare, registru2_debl: std_logic_vector (11 downto 0);
    begin
        if(rising_edge  (clk)) then
            case tmp is
                when "0000" => introdu_caractere <= '0';
                when "0001" => introdu_caractere <= '1';
                when "0010" => introdu_caractere <= '1';
                when "0011" => introdu_caractere <= '1';
                when "0100" => introdu_caractere <= '0'; registru1_blocare := caractere; liber_ocupat <= '1';
                when "0101" => introdu_caractere <= '1';
                when "0110" => introdu_caractere <= '1';
                when "0111" => introdu_caractere <= '1';
                when "1000" => introdu_caractere <= '0'; registru2_debl := caractere;
                when others => introdu_caractere <= '0';
            end case;
        end if;

        if en_reset = '1' or (caractere_distincte = '0' and tmp = "0100") then
            introdu_caractere <= '0';  liber_ocupat <= '0';
        end if;

        if caractere(11 downto 8) = caractere(7 downto 4) or caractere(11 downto 8) = caractere(3 downto 0) or caractere(7 downto 4) = caractere(3 downto 0)then
            caractere_distincte <= '0'; --caracterele nu sunt distincte 2 cate 2
        else caractere_distincte <= '1';    ---caracterele date sunt distincte
        end if;
        if registru1_blocare  = registru2_debl then
            liber_ocupat <= '0';
        end if;
    end process ;

end arhitect;