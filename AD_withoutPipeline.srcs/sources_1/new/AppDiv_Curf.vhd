----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:41 04/07/2022 
-- Design Name: 
-- Module Name:    AppDiv_Curf - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AppDiv_Curf is
    Port(Dividend:in unsigned (15 downto 0);
        Divisor:in unsigned (15 downto 0);
        Quotient:out unsigned (31 downto 0)
    );


end AppDiv_Curf;

architecture Structural of AppDiv_Curf is
    component shift_unit
        Port ( N : in unsigned (15 downto 0);
           Exp : out integer range -1 to 15;
           N_s : out unsigned (15 downto 0));
    end component;
    
    component big_LUT
        Port ( result_comp : in STD_LOGIC;
               Mantissa_Dividend : in unsigned(15 downto 0);
               Mantissa_Divisor : in unsigned(15 downto 0);
               P_00 : out unsigned(15 downto 0);
               P_01 : out unsigned(15 downto 0);
               P_10 : out unsigned(15 downto 0)
               );    
    end component;
    
    component expo_unit
        Port ( Expo_A : in integer range 0 to 15;
               Expo_B : in integer range 0 to 15;
               Carry : in STD_LOGIC;
               Num_shift : out integer range 0 to 15);
    end component;
    
    component compara_unit
        Port ( Mantissa_Dividend : in unsigned (15 downto 0);
               Mantissa_Divisor : in unsigned (15 downto 0);
               Carry : out STD_LOGIC;
               Result : out STD_LOGIC);
    end component;
    
    component shift_back_unit
        Port ( 
               Mantissa_Dividend: in unsigned (15 downto 0);
               Mantissa_Divisor: in unsigned (15 downto 0);
               P00 : in  unsigned (15 downto 0);
               P01 : in  unsigned (15 downto 0);
               P10 : in  unsigned (15 downto 0);
               Num_shift : in integer range 0 to 15;
               Quotient : out unsigned (31 downto 0));
    end component;
    
    signal ExpA: integer range 0 to 15;
    signal ExpB: integer range 0 to 15;
   -- signal expA: unsigned (15 downto 0);
    signal mantissa_dividend: unsigned (15 downto 0);
    signal mantissa_divisor: unsigned (15 downto 0);
    signal carry: std_logic;
    signal comp_result: std_logic;
    signal num_shift: integer range 0 to 15;
    
    signal p00: unsigned (15 downto 0);
    signal p01: unsigned (15 downto 0);
    signal p10: unsigned (15 downto 0);
begin

    shift_dividend:shift_unit port map(
                N => Dividend,
                Exp =>  ExpA,
                N_s => mantissa_dividend
                );
    
    shift_divisor:shift_unit port map(
                N => Divisor,
                Exp =>  ExpB,
                N_s => mantissa_divisor
                );

    compar:compara_unit port map(
                Mantissa_Dividend => mantissa_dividend,
                Mantissa_Divisor => mantissa_divisor,
                Carry => carry,
                Result => comp_result
                );
    
    expo:expo_unit port map(
                Expo_A => ExpA,
                Expo_B => ExpB,
                Carry => carry,
                 Num_shift => num_shift
                );
    lut:big_LUT port map(
               result_comp => comp_result,
               Mantissa_Dividend => mantissa_dividend,
               Mantissa_Divisor => mantissa_divisor,
               P_00 => p00,
               P_01 => p01,
               P_10 => p10  
                );
    
    shift_b:shift_back_unit port map(
               Mantissa_dividend=>mantissa_dividend,
               Mantissa_divisor=>mantissa_divisor,
               P00 => p00,
               P01 => p01,
               P10 => p10,
               Num_shift => num_shift,
               Quotient => Quotient
    );
    
    
    
end Structural;
