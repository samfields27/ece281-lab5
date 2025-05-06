----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:50:18 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ALU is
    Port ( i_A : in STD_LOGIC_VECTOR (7 downto 0);
           i_B : in STD_LOGIC_VECTOR (7 downto 0);
           i_op : in STD_LOGIC_VECTOR (2 downto 0);
           o_result : out STD_LOGIC_VECTOR (7 downto 0);
           o_flags : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

    signal numB : std_logic_vector (7 downto 0);
    
    signal total : std_logic_vector (7 downto 0);
    
    signal carry : std_logic_vector (8 downto 0);
    
    
    
    
    
    component ripple_adder is
        port(
        
        
            A: in std_logic_vector (3 downto 0);
            B: in std_logic_vector (3 downto 0);
            Cin: in std_logic;
            S: out std_logic_vector (3 downto 0);
            Cout: out std_logic);
        end component;



begin

    carry(0)<=  '0' when i_op=  "000"      else '1';
    
    
    numB<= i_B when i_op="000"   else  not i_B;
    
    ripple_adder0: ripple_adder
        port map(
            A=>i_A(3 downto 0),
            B=>numB(3 downto 0),
            Cin=>carry(0),
            S=>total(3 downto 0),
            Cout=>carry(4) );
    ripple_adder1: ripple_adder
        port map(
            A=>i_A(7 downto 4),
            B=>numB(7 downto 4),
            Cin=>carry(4),
            S=>total(7 downto 4),
            Cout=>carry(8) );





end Behavioral;
