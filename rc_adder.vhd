library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity rc_adder is
    Port ( A : in std_logic_vector(7 downto 0);
           B : in std_logic_vector(7 downto 0);
           CIN : in std_logic;
           S : out std_logic_vector(7 downto 0);
           COUT : out std_logic);
end rc_adder;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity NANDGATE is
     Port ( L : in std_logic;
            M : in std_logic;
            Y : out std_logic);
end NANDGATE;

architecture Behavioral of NANDGATE is
begin
    Process (L,M)
    begin
        Y <= L NAND M;
    end process;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity FullAdder1 is
    Port ( A : in std_logic;
           B : in std_logic;
           CIN : in std_logic;
           S : out std_logic;
           COUT : out std_logic);
end FullAdder1;
 
architecture Structure of FullAdder1 is
component NANDGATE
    Port ( L : in std_logic;
        M : in std_logic;
        Y : out std_logic);
end component;
 
signal T1, T2, T3, T4, T5, T6, T7: std_logic;
 
begin
 
        Y1 : NANDGATE Port map(A,B,T1);
        
        Y2 : NANDGATE Port map(A,T1,T2);
        
        Y3 : NANDGATE Port map(B,T1,T3);
        
        Y4 : NANDGATE Port map(T2,T3,T4);
        
        Y5 : NANDGATE Port map(T4,T5,T6);
        
        Y6 : NANDGATE Port map(T4,T5,T6);
        
        Y7 : NANDGATE Port map(T6,T7,T7);
        
        Y8 : NANDGATE Port map(T6,T7,S);
        
        Y9 : NANDGATE Port map(T1,T5,COUT);
 
end Structure;
 
 
architecture Structural of rc_adder is
    component FullAdder1
        Port ( A : in std_logic;
               B : in std_logic;
               CIN : in std_logic;
               S : out std_logic;
               COUT : out std_logic);
    end component;

    signal C : std_logic_vector(6 downto 0);
begin

U1 : FullAdder1 port map (A(0),B(0),CIN,S(0),C(0));
U2 : for i in 1 to 6 generate
U3 : FullAdder1 port map (A(i),B(i),C(i-1),S(i),C(i));
end generate;
U4 : FullAdder1 port map (A(7),B(7),C(6),S(7),COUT);

end Structural;