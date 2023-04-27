library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Ripple_TB is
end Ripple_TB;

architecture Behavioral of Ripple_TB is

    -- Component declaration for the DUT
    component rc_adder is
        Port ( A : in std_logic_vector(7 downto 0);
               B : in std_logic_vector(7 downto 0);
               CIN : in std_logic;
               S : out std_logic_vector(7 downto 0);
               COUT : out std_logic);
    end component;

    -- Inputs
    signal A_s : std_logic_vector(7 downto 0);
    signal B_s : std_logic_vector(7 downto 0);
    signal CIN_s : std_logic;

    -- Outputs
    signal S_s : std_logic_vector(7 downto 0);
    signal COUT_s : std_logic;

begin

DUT : rc_adder port map (A_s,B_s,CIN_s,S_s,COUT_s);

process

 begin
 
  A_s<= "10101010";
  B_s <= "01010101";
  CIN_s <= '0';
  wait for 10 ns;
  
  A_s <= "11001100";
  B_s <= "11110000";
  CIN_s <= '1';
  wait for 10 ns;
  
  A_s <= "11010111";
  B_s <= "01011010";
  CIN_s <= '0';
  wait for 10 ns;
  
  A_s <= "10110011";
  B_s <= "11111111";
  CIN_s <= '1';
  wait for 10 ns;
 end process;
 
end Behavioral;