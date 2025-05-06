----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2025 02:42:49 PM
-- Design Name: 
-- Module Name: controller_fsm - FSM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller_fsm is
    Port ( i_reset : in STD_LOGIC;
           i_adv : in STD_LOGIC;
           o_cycle : out STD_LOGIC_VECTOR (3 downto 0));
end controller_fsm;

architecture FSM of controller_fsm is


    signal w_Q : std_logic_vector(3 downto 0):="0001";
    
    
    
    
    

begin
    
    
    process(i_adv, i_reset)
    begin  
        if i_reset='1' then w_Q <="0000";
        
        
        elsif rising_edge(i_adv) then case w_Q is
        --
            when "0001" =>w_Q<="0010";   --0 going to S1
            when "0010" =>w_Q<="0100"; --S1 to S2 etc.
            when "0100" =>w_Q<="1000";
            
            --when "1000" =>w_Q<="0001";
            when others =>w_Q<="0001";

end FSM;
