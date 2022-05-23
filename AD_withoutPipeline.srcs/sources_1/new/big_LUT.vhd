----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2022 10:25:24 AM
-- Design Name: 
-- Module Name: big_LUT - Behavioral
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

entity big_LUT is
    Port ( result_comp : in STD_LOGIC;
           Mantissa_Dividend : in unsigned(15 downto 0);
           Mantissa_Divisor : in unsigned(15 downto 0);
           P_00 : out unsigned(15 downto 0);
           P_01 : out unsigned(15 downto 0);
           P_10 : out unsigned(15 downto 0)
           );
end big_LUT;

architecture Behavioral of big_LUT is

begin
    process(result_comp,Mantissa_Dividend,Mantissa_Divisor)
       variable p10: unsigned(15 downto 0);--:= "0000000000000000"; --:= "0001000001011010";-- -  -1.022
	   variable p01: unsigned(15 downto 0);--:= "0000000000000000"; --:= "0000110111101100"; --  0.8702
	   variable p00: unsigned(15 downto 0);--:= "0000000000000000"; -- := "0001011001101110"; --  1.402 
	   
	   
	   -- principle is 0000 first 4 for decimal, 
	   
      constant m0: unsigned(15 downto 0) := "0000000000000000";
	  constant m1: unsigned(15 downto 0) := "0000000110011001";
	  constant m2: unsigned(15 downto 0) := "0000001100110011";
	  constant m3: unsigned(15 downto 0) := "0000010011001100";
	  constant m4: unsigned(15 downto 0) := "0000011001100110";
	  constant m5: unsigned(15 downto 0) := "0000100000000000";
	  constant m6: unsigned(15 downto 0) := "0000100110011001";
	  constant m7: unsigned(15 downto 0) := "0000101100110011";
	  constant m8: unsigned(15 downto 0) := "0000110011001100";
	  constant m9: unsigned(15 downto 0) := "0000111001100110";
	  constant m10: unsigned(15 downto 0) := "0001000000000000";
	   
    begin
    if result_comp = '1' then --mantissa dividend > mantissa divisor
        if Mantissa_Dividend < m1 then
            
                p00 := "0001000000000011";
                p10 := "0000111101000011";
                p01 := "0000111101000000";

        elsif Mantissa_Dividend < m2 then
            if Mantissa_Divisor < m1 then
                p00 := "0001001101001000";
                p10 := "0001000010110111";
                p01 := "0000111101000000";
            else
                p00 := "0001000000000011";
                p10 := "0000110111101110";
                p01 := "0000110111101100";
            end if;
        elsif Mantissa_Dividend < m3 then
            if Mantissa_Divisor < m1 then
                p00 := "0001011011011000";
                p10 := "0001001000101011";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0001001100011010";
                p10 := "0000111100100100";
                p01 := "0000110111101100";
            else
                p00 := "0001000000000011";
                p10 := "0000110011010000";
                p01 := "0000110011001110";
            end if;
        elsif Mantissa_Dividend < m4 then
            if Mantissa_Divisor < m1 then
                p00 := "0001101010110010";
                p10 := "0001001110011111";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0001011001101110";
                p10 := "0001000001011010";
                p01 := "0000110111101100";
            elsif Mantissa_Divisor < m3 then
                p00 := "0001001011101110";
                p10 := "0000110111010110";
                p01 := "0000110011001110";
            else
                p00 := "0001000000000010";
                p10 := "0000101111011101";
                p01 := "0000101111011011";
            end if;
        elsif Mantissa_Dividend < m5 then
            if Mantissa_Divisor < m1 then
                p00 := "0001111011010110";
                p10 := "0001010100010011";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0001101000000001";
                p10 := "0001000110010000";
                p01 := "0000110111101100";
            elsif Mantissa_Divisor < m3 then
                p00 := "0001011000001111";
                p10 := "0000111011011101";
                p01 := "0000110011001110";
            elsif Mantissa_Divisor < m4 then
                p00 := "0001001011000111";
                p10 := "0000110010111110";
                p01 := "0000101111011011";
            else
                p00 := "0001000000000010";
                p10 := "0000101100001011";
                p01 := "0000101100001010";
            end if;
        elsif Mantissa_Dividend < m6 then
            if Mantissa_Divisor < m1 then
                p00 := "0010001101000101";
                p10 := "0001011010000111";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0001110111010010";
                p10 := "0001001011000111";
                p01 := "0000110111101100";
            elsif Mantissa_Divisor < m3 then
                p00 := "0001100101100011";
                p10 := "0000111111100011";
                p01 := "0000110011001110";
            elsif Mantissa_Divisor < m4 then
                p00 := "0001010110111000";
                p10 := "0000110110011110";
                p01 := "0000101111011011";
            elsif Mantissa_Divisor < m5 then
                p00 := "0001001010100011";
                p10 := "0000101111001110";
                p01 := "0000101100001010";
            else
                p00 := "0001000000000010";
                p10 := "0000101001010100";
                p01 := "0000101001010011";
            end if;
        elsif Mantissa_Dividend < m7 then
            if Mantissa_Divisor < m1 then
                p00 := "0010011111111110";
                p10 := "0001011111111011";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0010000111100000";
                p10 := "0001001111111101";
                p01 := "0000110111101100";
            elsif Mantissa_Divisor < m3 then
                p00 := "0001110011101101";
                p10 := "0001000011101010";
                p01 := "0000110011001110";
            elsif Mantissa_Divisor < m4 then
                p00 := "0001100011010111";
                p10 := "0000111001111111";
                p01 := "0000101111011011";
            elsif Mantissa_Divisor < m5 then
                p00 := "0001010101101010";
                p10 := "0000110010010001";
                p01 := "0000101100001010";
            elsif Mantissa_Divisor < m6 then
                p00 := "0001001010000001";
                p10 := "0000101011111111";
                p01 := "0000101001010011";
            else
                p00 := "0001000000000001";
                p10 := "0000100110110100";
                p01 := "0000100110110011";
            end if;
        elsif Mantissa_Dividend < m8 then
            if Mantissa_Divisor < m1 then
                p00 := "0010110100000001";
                p10 := "0001100101110000";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0010011000101101";
                p10 := "0001010100110011";
                p01 := "0000110111101100";
            elsif Mantissa_Divisor < m3 then
                p00 := "0010000010101010";
                p10 := "0001000111110000";
                p01 := "0000110011001110";
            elsif Mantissa_Divisor < m4 then
                p00 := "0001110000100010";
                p10 := "0000111101100000";
                p01 := "0000101111011011";
            elsif Mantissa_Divisor < m5 then
                p00 := "0001100001011001";
                p10 := "0000110101010100";
                p01 := "0000101100001010";
            elsif Mantissa_Divisor < m6 then
                p00 := "0001010100100011";
                p10 := "0000101110101001";
                p01 := "0000101001010011";
            elsif Mantissa_Divisor < m7 then
                p00 := "0001001001100011";
                p10 := "0000101001001010";
                p01 := "0000100110110011";
            else
                p00 := "0001000000000001";
                p10 := "0000100100100101";
                p01 := "0000100100100101";
            end if;
        elsif Mantissa_Dividend < m9 then
            if Mantissa_Divisor < m1 then
                p00 := "0011001001001111";
                p10 := "0001101011100100";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0010101010111000";
                p10 := "0001011001101001";
                p01 := "0000110111101100";
            elsif Mantissa_Divisor < m3 then
                p00 := "0010010010011101";
                p10 := "0001001011110111";
                p01 := "0000110011001110";
            elsif Mantissa_Divisor < m4 then
                p00 := "0001111110011011";
                p10 := "0001000001000001";
                p01 := "0000101111011011";
            elsif Mantissa_Divisor < m5 then
                p00 := "0001101101101110";
                p10 := "0000111000010111";
                p01 := "0000101100001010";
            elsif Mantissa_Divisor < m6 then
                p00 := "0001011111100111";
                p10 := "0000110001010100";
                p01 := "0000101001010011";
            elsif Mantissa_Divisor < m7 then
                p00 := "0001010011100011";
                p10 := "0000101011100001";
                p01 := "0000100110110011";
            elsif Mantissa_Divisor < m8 then
                p00 := "0001001001000111";
                p10 := "0000100110101011";
                p01 := "0000100100100101";
            else
                p00 := "0001000000000001";
                p10 := "0000100010100111";
                p01 := "0000100010100110";
            end if;
        else
            if Mantissa_Divisor < m1 then
                p00 := "0011011111101000";
                p10 := "0001110001011000";
                p01 := "0000111101000000";
            elsif Mantissa_Divisor < m2 then
                p00 := "0010111110000001";
                p10 := "0001011110011111";
                p01 := "0000110111101100";
            elsif Mantissa_Divisor < m3 then
                p00 := "0010100011000011";
                p10 := "0001001111111101";
                p01 := "0000110011001110";
            elsif Mantissa_Divisor < m4 then
                p00 := "0010001101000000";
                p10 := "0001000100100010";
                p01 := "0000101111011011";
            elsif Mantissa_Divisor < m5 then
                p00 := "0001111010101011";
                p10 := "0000111011011010";
                p01 := "0000101100001010";
            elsif Mantissa_Divisor < m6 then
                p00 := "0001101011001101";
                p10 := "0000110011111111";
                p01 := "0000101001010011";
            elsif Mantissa_Divisor < m7 then
                p00 := "0001011110000001";
                p10 := "0000101101110111";
                p01 := "0000100110110011";
            elsif Mantissa_Divisor < m8 then
                p00 := "0001010010101000";
                p10 := "0000101000110001";
                p01 := "0000100100100101";
            elsif Mantissa_Divisor < m9 then
                p00 := "0001001000101110";
                p10 := "0000100100011110";
                p01 := "0000100010100110";
            else
                p00 := "0001000000000001";
                p10 := "0000100000110101";
                p01 := "0000100000110101";
            end if;
        end if;
        
        
        
        
        
    else
        if Mantissa_Divisor < m1 then
                p00 := "0010000000000111";
                p10 := "0001111010000110";
                p01 := "0001111010000000";
        elsif Mantissa_Divisor < m2 then
            if Mantissa_Dividend < m1 then
                p00 := "0001101001010101";
                p10 := "0001100101110000";
                p01 := "0001101111011000";
            else
                p00 := "0010000000000110";
                p10 := "0001101111011101";
                p01 := "0001101111011000";
            end if;
        elsif Mantissa_Divisor < m3 then
            if Mantissa_Dividend < m1 then
                p00 := "0001010110010001";
                p10 := "0001010110000111";
                p01 := "0001100110011101";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001101010010111";
                p10 := "0001011110010100";
                p01 := "0001100110011101";
            else
                p00 := "0010000000000110";
                p10 := "0001100110100001";
                p01 := "0001100110011101";
            end if;
        elsif Mantissa_Divisor < m4 then
            if Mantissa_Dividend < m1 then
                p00 := "0001000110000110";
                p10 := "0001001001110100";
                p01 := "0001011110110111";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001011000000001";
                p10 := "0001010000110110";
                p01 := "0001011110110111";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001101011010110";
                p10 := "0001010111111000";
                p01 := "0001011110110111";
            else
                p00 := "0010000000000101";
                p10 := "0001011110111010";
                p01 := "0001011110110111";
            end if;
        elsif Mantissa_Divisor < m5 then
            if Mantissa_Dividend < m1 then
                p00 := "0000111000001100";
                p10 := "0000111111111110";
                p01 := "0001011000010100";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001001000010101";
                p10 := "0001000110000100";
                p01 := "0001011000010100";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001011001101100";
                p10 := "0001001100001010";
                p01 := "0001011000010100";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001101100010001";
                p10 := "0001010010010000";
                p01 := "0001011000010100";
            else
                p00 := "0010000000000100";
                p10 := "0001011000010110";
                p01 := "0001011000010100";
            end if;
        elsif Mantissa_Divisor < m6 then
            if Mantissa_Dividend < m1 then
                p00 := "0000101100000110";
                p10 := "0000110111111110";
                p01 := "0001010010100111";
            elsif Mantissa_Dividend < m2 then
                p00 := "0000111010110001";
                p10 := "0000111101010100";
                p01 := "0001010010100111";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001001010011111";
                p10 := "0001000010101001";
                p01 := "0001010010100111";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001011011010010";
                p10 := "0001000111111110";
                p01 := "0001010010100111";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001101101001001";
                p10 := "0001001101010011";
                p01 := "0001010010100111";
            else
                p00 := "0010000000000100";
                p10 := "0001010010101001";
                p01 := "0001010010100111";
            end if;
        elsif Mantissa_Divisor < m7 then
            if Mantissa_Dividend < m1 then
                p00 := "0000100001100000";
                p10 := "0000110001011001";
                p01 := "0001001101100110";
            elsif Mantissa_Dividend < m2 then
                p00 := "0000101110111010";
                p10 := "0000110110000110";
                p01 := "0001001101100110";
            elsif Mantissa_Dividend < m3 then
                p00 := "0000111101010000";
                p10 := "0000111010110011";
                p01 := "0001001101100110";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001001100100011";
                p10 := "0000111111100000";
                p01 := "0001001101100110";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001011100110001";
                p10 := "0001000100001101";
                p01 := "0001001101100110";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001101101111100";
                p10 := "0001001000111011";
                p01 := "0001001101100110";
            else
                p00 := "0010000000000011";
                p10 := "0001001101101000";
                p01 := "0001001101100110";
            end if;
        elsif Mantissa_Divisor < m8 then
            if Mantissa_Dividend < m1 then
                p00 := "0000011000001001";
                p10 := "0000101011111010";
                p01 := "0001001001001010";
            elsif Mantissa_Dividend < m2 then
                p00 := "0000100100011110";
                p10 := "0000110000000101";
                p01 := "0001001001001010";
            elsif Mantissa_Dividend < m3 then
                p00 := "0000110001101001";
                p10 := "0000110100010001";
                p01 := "0001001001001010";
            elsif Mantissa_Dividend < m4 then
                p00 := "0000111111101010";
                p10 := "0000111000011101";
                p01 := "0001001001001010";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001001110100000";
                p10 := "0000111100101000";
                p01 := "0001001001001010";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001011110001011";
                p10 := "0001000000110100";
                p01 := "0001001001001010";
            elsif Mantissa_Dividend < m7 then
                p00 := "0001101110101100";
                p10 := "0001000101000000";
                p01 := "0001001001001010";
            else
                p00 := "0010000000000011";
                p10 := "0001001001001011";
                p01 := "0001001001001010";
            end if;
        elsif Mantissa_Divisor < m9 then
            if Mantissa_Dividend < m1 then
                p00 := "0000001111110011";
                p10 := "0000100111010010";
                p01 := "0001000101001101";
            elsif Mantissa_Dividend < m2 then
                p00 := "0000011011001101";
                p10 := "0000101011000010";
                p01 := "0001000101001101";
            elsif Mantissa_Dividend < m3 then
                p00 := "0000100111011000";
                p10 := "0000101110110001";
                p01 := "0001000101001101";
            elsif Mantissa_Dividend < m4 then
                p00 := "0000110100010010";
                p10 := "0000110010100001";
                p01 := "0001000101001101";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001000001111100";
                p10 := "0000110110010000";
                p01 := "0001000101001101";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001010000010110";
                p10 := "0000111001111111";
                p01 := "0001000101001101";
            elsif Mantissa_Dividend < m7 then
                p00 := "0001011111011111";
                p10 := "0000111101101111";
                p01 := "0001000101001101";
            elsif Mantissa_Dividend < m8 then
                p00 := "0001101111011001";
                p10 := "0001000001011110";
                p01 := "0001000101001101";
            else
                p00 := "0010000000000011";
                p10 := "0001000101001110";
                p01 := "0001000101001101";
            end if;
        else
            if Mantissa_Dividend < m1 then
                p00 := "0000001000010101";
                p10 := "0000100011010111";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m2 then
                p00 := "0000010010111100";
                p10 := "0000100110101110";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m3 then
                p00 := "0000011110001110";
                p10 := "0000101010000110";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m4 then
                p00 := "0000101010001011";
                p10 := "0000101101011101";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m5 then
                p00 := "0000110110110011";
                p10 := "0000110000110101";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001000100000110";
                p10 := "0000110100001100";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m7 then
                p00 := "0001010010000101";
                p10 := "0000110111100100";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m8 then
                p00 := "0001100000101110";
                p10 := "0000111010111011";
                p01 := "0001000001101010";
            elsif Mantissa_Dividend < m9 then
                p00 := "0001110000000011";
                p10 := "0000111110010011";
                p01 := "0001000001101010";
            else
                p00 := "0010000000000010";
                p10 := "0001000001101010";
                p01 := "0001000001101010";
            end if;
        end if;
    end if; 
                    
    
    P_00 <= p00;
    P_01 <= p01;
    P_10 <= p10;
    
    end process;

end Behavioral;