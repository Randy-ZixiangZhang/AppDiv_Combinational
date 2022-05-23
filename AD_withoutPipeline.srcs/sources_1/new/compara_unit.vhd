----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2022 04:01:11 PM
-- Design Name: 
-- Module Name: compara_unit - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity compara_unit is
    Port ( Mantissa_Dividend : in unsigned (15 downto 0);
           Mantissa_Divisor : in unsigned (15 downto 0);
           Carry : out STD_LOGIC;
           Result : out STD_LOGIC);
end compara_unit;

architecture Behavioral of compara_unit is


begin
    process(Mantissa_Dividend,Mantissa_Divisor)
    begin
        if Mantissa_Dividend >= Mantissa_Divisor then
            Carry <= '0';
            Result <= '1';
        else 
            Carry <= '1';
            Result <= '0';
        end if;
    end process;
end Behavioral;