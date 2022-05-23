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
        p10 := "0000111101000000";
        p01 := "0000111101000011";

elsif Mantissa_Dividend < m2 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000000010110";
        p10 := "0000111101000000";
        p01 := "0001000010110111";
    else
        p00 := "0001000000000011";
        p10 := "0000110111101100";
        p01 := "0000110111101110";
    end if;
elsif Mantissa_Dividend < m3 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000000101001";
        p10 := "0000111101000000";
        p01 := "0001001000101011";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000000110001";
        p10 := "0000110111101100";
        p01 := "0000111100100100";
    else
        p00 := "0001000000000011";
        p10 := "0000110011001110";
        p01 := "0000110011010000";
    end if;
elsif Mantissa_Dividend < m4 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000000111011";
        p10 := "0000111101000000";
        p01 := "0001001110011111";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000001100000";
        p10 := "0000110111101100";
        p01 := "0001000001011010";
    elsif Mantissa_Divisor < m3 then
        p00 := "0001000001000100";
        p10 := "0000110011001110";
        p01 := "0000110111010110";
    else
        p00 := "0001000000000010";
        p10 := "0000101111011011";
        p01 := "0000101111011101";
    end if;
elsif Mantissa_Dividend < m5 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000001001110";
        p10 := "0000111101000000";
        p01 := "0001010100010011";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000010001110";
        p10 := "0000110111101100";
        p01 := "0001000110010000";
    elsif Mantissa_Divisor < m3 then
        p00 := "0001000010000110";
        p10 := "0000110011001110";
        p01 := "0000111011011101";
    elsif Mantissa_Divisor < m4 then
        p00 := "0001000001010001";
        p10 := "0000101111011011";
        p01 := "0000110010111110";
    else
        p00 := "0001000000000010";
        p10 := "0000101100001010";
        p01 := "0000101100001011";
    end if;
elsif Mantissa_Dividend < m6 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000001100000";
        p10 := "0000111101000000";
        p01 := "0001011010000111";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000010111101";
        p10 := "0000110111101100";
        p01 := "0001001011000111";
    elsif Mantissa_Divisor < m3 then
        p00 := "0001000011000111";
        p10 := "0000110011001110";
        p01 := "0000111111100011";
    elsif Mantissa_Divisor < m4 then
        p00 := "0001000010100000";
        p10 := "0000101111011011";
        p01 := "0000110110011110";
    elsif Mantissa_Divisor < m5 then
        p00 := "0001000001011010";
        p10 := "0000101100001010";
        p01 := "0000101111001110";
    else
        p00 := "0001000000000010";
        p10 := "0000101001010011";
        p01 := "0000101001010100";
    end if;
elsif Mantissa_Dividend < m7 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000001110011";
        p10 := "0000111101000000";
        p01 := "0001011111111011";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000011101100";
        p10 := "0000110111101100";
        p01 := "0001001111111101";
    elsif Mantissa_Divisor < m3 then
        p00 := "0001000100001001";
        p10 := "0000110011001110";
        p01 := "0001000011101010";
    elsif Mantissa_Divisor < m4 then
        p00 := "0001000011101110";
        p10 := "0000101111011011";
        p01 := "0000111001111111";
    elsif Mantissa_Divisor < m5 then
        p00 := "0001000010110001";
        p10 := "0000101100001010";
        p01 := "0000110010010001";
    elsif Mantissa_Divisor < m6 then
        p00 := "0001000001100000";
        p10 := "0000101001010011";
        p01 := "0000101011111111";
    else
        p00 := "0001000000000001";
        p10 := "0000100110110011";
        p01 := "0000100110110100";
    end if;
elsif Mantissa_Dividend < m8 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000010000110";
        p10 := "0000111101000000";
        p01 := "0001100101110000";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000100011010";
        p10 := "0000110111101100";
        p01 := "0001010100110011";
    elsif Mantissa_Divisor < m3 then
        p00 := "0001000101001011";
        p10 := "0000110011001110";
        p01 := "0001000111110000";
    elsif Mantissa_Divisor < m4 then
        p00 := "0001000100111101";
        p10 := "0000101111011011";
        p01 := "0000111101100000";
    elsif Mantissa_Divisor < m5 then
        p00 := "0001000100001001";
        p10 := "0000101100001010";
        p01 := "0000110101010100";
    elsif Mantissa_Divisor < m6 then
        p00 := "0001000010111101";
        p10 := "0000101001010011";
        p01 := "0000101110101001";
    elsif Mantissa_Divisor < m7 then
        p00 := "0001000001100011";
        p10 := "0000100110110011";
        p01 := "0000101001001010";
    else
        p00 := "0001000000000001";
        p10 := "0000100100100101";
        p01 := "0000100100100101";
    end if;
elsif Mantissa_Dividend < m9 then
    if Mantissa_Divisor < m1 then
        p00 := "0001000010011000";
        p10 := "0000111101000000";
        p01 := "0001101011100100";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000101001001";
        p10 := "0000110111101100";
        p01 := "0001011001101001";
    elsif Mantissa_Divisor < m3 then
        p00 := "0001000110001100";
        p10 := "0000110011001110";
        p01 := "0001001011110111";
    elsif Mantissa_Divisor < m4 then
        p00 := "0001000110001100";
        p10 := "0000101111011011";
        p01 := "0001000001000001";
    elsif Mantissa_Divisor < m5 then
        p00 := "0001000101100001";
        p10 := "0000101100001010";
        p01 := "0000111000010111";
    elsif Mantissa_Divisor < m6 then
        p00 := "0001000100011011";
        p10 := "0000101001010011";
        p01 := "0000110001010100";
    elsif Mantissa_Divisor < m7 then
        p00 := "0001000011000101";
        p10 := "0000100110110011";
        p01 := "0000101011100001";
    elsif Mantissa_Divisor < m8 then
        p00 := "0001000001100110";
        p10 := "0000100100100101";
        p01 := "0000100110101011";
    else
        p00 := "0001000000000001";
        p10 := "0000100010100110";
        p01 := "0000100010100111";
    end if;
else
    if Mantissa_Divisor < m1 then
        p00 := "0001000010101011";
        p10 := "0000111101000000";
        p01 := "0001110001011000";
    elsif Mantissa_Divisor < m2 then
        p00 := "0001000101110111";
        p10 := "0000110111101100";
        p01 := "0001011110011111";
    elsif Mantissa_Divisor < m3 then
        p00 := "0001000111001110";
        p10 := "0000110011001110";
        p01 := "0001001111111101";
    elsif Mantissa_Divisor < m4 then
        p00 := "0001000111011011";
        p10 := "0000101111011011";
        p01 := "0001000100100010";
    elsif Mantissa_Divisor < m5 then
        p00 := "0001000110111001";
        p10 := "0000101100001010";
        p01 := "0000111011011010";
    elsif Mantissa_Divisor < m6 then
        p00 := "0001000101111001";
        p10 := "0000101001010011";
        p01 := "0000110011111111";
    elsif Mantissa_Divisor < m7 then
        p00 := "0001000100100111";
        p10 := "0000100110110011";
        p01 := "0000101101110111";
    elsif Mantissa_Divisor < m8 then
        p00 := "0001000011001010";
        p10 := "0000100100100101";
        p01 := "0000101000110001";
    elsif Mantissa_Divisor < m9 then
        p00 := "0001000001100111";
        p10 := "0000100010100110";
        p01 := "0000100100011110";
    else
        p00 := "0001000000000001";
        p10 := "0000100000110101";
        p01 := "0000100000110101";
    end if;
end if;

        
    else
        if Mantissa_Divisor < m1 then
        
                p00 := "0010000000000111";
                p10 := "0001111010000000";
                p01 := "0001111010000110";
        
        elsif Mantissa_Divisor < m2 then
            if Mantissa_Dividend < m1 then
                p00 := "0001111110101001";
                p10 := "0001101111011000";
                p01 := "0001100101110000";
            else
                p00 := "0010000000000110";
                p10 := "0001101111011000";
                p01 := "0001101111011101";
            end if;
        elsif Mantissa_Divisor < m3 then
            if Mantissa_Dividend < m1 then
                p00 := "0001111011111111";
                p10 := "0001100110011101";
                p01 := "0001010110000111";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001111110000010";
                p10 := "0001100110011101";
                p01 := "0001011110010100";
            else
                p00 := "0010000000000110";
                p10 := "0001100110011101";
                p01 := "0001100110100001";
            end if;
        elsif Mantissa_Divisor < m4 then
            if Mantissa_Dividend < m1 then
                p00 := "0001111000101100";
                p10 := "0001011110110111";
                p01 := "0001001001110100";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001111011001010";
                p10 := "0001011110110111";
                p01 := "0001010000110110";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001111101100111";
                p10 := "0001011110110111";
                p01 := "0001010111111000";
            else
                p00 := "0010000000000101";
                p10 := "0001011110110111";
                p01 := "0001011110111010";
            end if;
        elsif Mantissa_Divisor < m5 then
            if Mantissa_Dividend < m1 then
                p00 := "0001110101000110";
                p10 := "0001011000010100";
                p01 := "0000111111111110";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001110111110110";
                p10 := "0001011000010100";
                p01 := "0001000110000100";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001111010100101";
                p10 := "0001011000010100";
                p01 := "0001001100001010";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001111101010101";
                p10 := "0001011000010100";
                p01 := "0001010010010000";
            else
                p00 := "0010000000000100";
                p10 := "0001011000010100";
                p01 := "0001011000010110";
            end if;
        elsif Mantissa_Divisor < m6 then
            if Mantissa_Dividend < m1 then
                p00 := "0001110001011001";
                p10 := "0001010010100111";
                p01 := "0000110111111110";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001110100010101";
                p10 := "0001010010100111";
                p01 := "0000111101010100";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001110111010001";
                p10 := "0001010010100111";
                p01 := "0001000010101001";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001111010001101";
                p10 := "0001010010100111";
                p01 := "0001000111111110";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001111101001000";
                p10 := "0001010010100111";
                p01 := "0001001101010011";
            else
                p00 := "0010000000000100";
                p10 := "0001010010100111";
                p01 := "0001010010101001";
            end if;
        elsif Mantissa_Divisor < m7 then
            if Mantissa_Dividend < m1 then
                p00 := "0001101101101101";
                p10 := "0001001101100110";
                p01 := "0000110001011001";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001110000110001";
                p10 := "0001001101100110";
                p01 := "0000110110000110";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001110011110101";
                p10 := "0001001101100110";
                p01 := "0000111010110011";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001110110111000";
                p10 := "0001001101100110";
                p01 := "0000111111100000";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001111001111100";
                p10 := "0001001101100110";
                p01 := "0001000100001101";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001111101000000";
                p10 := "0001001101100110";
                p01 := "0001001000111011";
            else
                p00 := "0010000000000011";
                p10 := "0001001101100110";
                p01 := "0001001101101000";
            end if;
        elsif Mantissa_Divisor < m8 then
            if Mantissa_Dividend < m1 then
                p00 := "0001101010000110";
                p10 := "0001001001001010";
                p01 := "0000101011111010";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001101101001111";
                p10 := "0001001001001010";
                p01 := "0000110000000101";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001110000010111";
                p10 := "0001001001001010";
                p01 := "0000110100010001";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001110011100000";
                p10 := "0001001001001010";
                p01 := "0000111000011101";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001110110101001";
                p10 := "0001001001001010";
                p01 := "0000111100101000";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001111001110010";
                p10 := "0001001001001010";
                p01 := "0001000000110100";
            elsif Mantissa_Dividend < m7 then
                p00 := "0001111100111010";
                p10 := "0001001001001010";
                p01 := "0001000101000000";
            else
                p00 := "0010000000000011";
                p10 := "0001001001001010";
                p01 := "0001001001001011";
            end if;
        elsif Mantissa_Divisor < m9 then
            if Mantissa_Dividend < m1 then
                p00 := "0001100110100110";
                p10 := "0001000101001101";
                p01 := "0000100111010010";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001101001110010";
                p10 := "0001000101001101";
                p01 := "0000101011000010";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001101100111101";
                p10 := "0001000101001101";
                p01 := "0000101110110001";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001110000001001";
                p10 := "0001000101001101";
                p01 := "0000110010100001";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001110011010101";
                p10 := "0001000101001101";
                p01 := "0000110110010000";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001110110100000";
                p10 := "0001000101001101";
                p01 := "0000111001111111";
            elsif Mantissa_Dividend < m7 then
                p00 := "0001111001101100";
                p10 := "0001000101001101";
                p01 := "0000111101101111";
            elsif Mantissa_Dividend < m8 then
                p00 := "0001111100110111";
                p10 := "0001000101001101";
                p01 := "0001000001011110";
            else
                p00 := "0010000000000011";
                p10 := "0001000101001101";
                p01 := "0001000101001110";
            end if;
        elsif Mantissa_Divisor < m10 then
            if Mantissa_Dividend < m1 then
                p00 := "0001100011010000";
                p10 := "0001000001101010";
                p01 := "0000100011010111";
            elsif Mantissa_Dividend < m2 then
                p00 := "0001100110011100";
                p10 := "0001000001101010";
                p01 := "0000100110101110";
            elsif Mantissa_Dividend < m3 then
                p00 := "0001101001101001";
                p10 := "0001000001101010";
                p01 := "0000101010000110";
            elsif Mantissa_Dividend < m4 then
                p00 := "0001101100110110";
                p10 := "0001000001101010";
                p01 := "0000101101011101";
            elsif Mantissa_Dividend < m5 then
                p00 := "0001110000000011";
                p10 := "0001000001101010";
                p01 := "0000110000110101";
            elsif Mantissa_Dividend < m6 then
                p00 := "0001110011001111";
                p10 := "0001000001101010";
                p01 := "0000110100001100";
            elsif Mantissa_Dividend < m7 then
                p00 := "0001110110011100";
                p10 := "0001000001101010";
                p01 := "0000110111100100";
            elsif Mantissa_Dividend < m8 then
                p00 := "0001111001101001";
                p10 := "0001000001101010";
                p01 := "0000111010111011";
            elsif Mantissa_Dividend < m9 then
                p00 := "0001111100110110";
                p10 := "0001000001101010";
                p01 := "0000111110010011";
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