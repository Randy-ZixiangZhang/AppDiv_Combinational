----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2022 08:39:35 AM
-- Design Name: 
-- Module Name: shift_unit - Behavioral
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
--use IEEE.fixed_pkg.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_unit is
    generic( BITS : integer:= 16;
             INTS : integer:= 4;
             DECS : integer:= 12
            );
    Port ( N : in unsigned (15 downto 0);
           Exp : out integer range -1 to BITS - 1;
           N_s : out unsigned (15 downto 0));
end shift_unit;

architecture Behavioral of shift_unit is

begin

 process(N)
    variable index_msb_N: integer range -1 to BITS - 1:= -1;
    
    
    --change to constant
    constant bit_mask:unsigned (BITS - 1 downto 0):= (others => '1');
    
    begin 
        index_msb_N := -1;--reset added
        for i in BITS - 1 downto 0 loop
            if N(i) = '1' then
                index_msb_N:= i;
                --Exp <= index_msb_N;
                --N_s <= shift_left(N, BITS -1 - index_msb_N - (INTS - 1)) and shift_right(bit_mask,INTS);
                exit;
            else
                next;
            end if;
        end loop;
        
        
        if index_msb_N = -1 then
            Exp <= -1;
            N_s <= (others => 'U');
        else
            Exp <= index_msb_N;
            
            -- to make first INT bits zero, remove the first one and remain the mantissa
            -- Exp is stored for radix position
            N_s <= shift_left(N, BITS -1 - index_msb_N - (INTS - 1)) and shift_right(bit_mask,INTS);
        end if;
        
        
        --Math
        -- 
    
     --N_a_shifted <=shift_left(N_a, 15 - index_N_a - 3) and "0000111111111111";
    
	end process;


end Behavioral;