----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2022 04:23:59 PM
-- Design Name: 
-- Module Name: shift_back_unit - Behavioral
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

entity shift_back_unit is
    Port ( 
           Mantissa_Dividend: in unsigned (15 downto 0);
           Mantissa_Divisor: in unsigned (15 downto 0);
           P00 : in  unsigned (15 downto 0);
           P01 : in  unsigned (15 downto 0);
           P10 : in  unsigned (15 downto 0);
           Num_shift : in integer range 0 to 15;
           Quotient : out unsigned (15 downto 0));
end shift_back_unit;

architecture Behavioral of shift_back_unit is




begin

    process(Mantissa_Dividend,Mantissa_Divisor,P00,P01,P10,Num_shift)
       variable tempMUL_1: unsigned(31 downto 0);
	   variable tempMUL_2: unsigned(31 downto 0);
	   variable temp1: unsigned(15 downto 0);
	   variable temp2: unsigned(15 downto 0);
	   variable temp3: unsigned(15 downto 0);
       variable app_M: unsigned (15 downto 0);
        
        begin
        
        tempMUL_1 := p10*Mantissa_Dividend;
        tempMUL_2 := p01*Mantissa_Divisor;
        temp1 := tempMUL_1(27 downto 24) & tempMUL_1(23 downto 12);
        temp2 := tempMUL_2(27 downto 12);
        
        app_M := temp2  + p00 - temp1;
        Quotient <= shift_right(app_M,Num_shift);
    
    end process;

end Behavioral;