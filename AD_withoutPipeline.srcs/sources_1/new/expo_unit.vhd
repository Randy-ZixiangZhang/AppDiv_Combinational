----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2022 04:25:38 PM
-- Design Name: 
-- Module Name: expo_unit - Behavioral
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

entity expo_unit is
    Port ( Expo_A : in integer range 0 to 15;
           Expo_B : in integer range 0 to 15;
           Carry : in STD_LOGIC;
           Num_shift : out integer range 0 to 15);
end expo_unit;

architecture Behavioral of expo_unit is

begin
    process(Expo_A,Expo_B,Carry)
    begin
        if carry = '1' then --carry is 1 when mantissa dividend is less than mantissa divisor
            
            -- Num_shift <= 12 - Expo_A + Expo_B + 2;
            --shift right index
            --Num_shift <= 8 - Expo_A + Expo_B + 1;  --12 int 4 fraction
            --Num_shift <= 4 - Expo_A + Expo_B + 1;  --8 int 8 fractional
            Num_shift <= Expo_B - Expo_A + 1;
        else
            Num_shift <= Expo_B- Expo_A ;
        end if;
    
    end process;

end Behavioral;