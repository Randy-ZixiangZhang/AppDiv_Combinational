--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:35:55 04/10/2022
-- Design Name:   
-- Module Name:   /home/randy/Documents/Forschungspraxis/Curve_Fitting_Method/Approximate_Divider/tb_combinational_unit.vhd
-- Project Name:  Approximate_Divider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparision_unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- unsigned for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_AppDiv_Curf IS
END tb_AppDiv_Curf;
 
ARCHITECTURE behavior OF tb_AppDiv_Curf IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
   --Inputs
   signal N_a : unsigned(15 downto 0);
   signal N_b : unsigned(15 downto 0) ;

 	--Outputs
   signal Q: unsigned (15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.AppDiv_Curf PORT MAP (
            Dividend=>N_a,
            Divisor=>N_b,
            Quotient=>Q
        );

-- 	N_a <= "0001010111000000",
-- 	      "0000010111000000" after 2ns,
-- 	      "0000010111000000" after 4ns,
-- 	      "0001111111111111" after 6ns,
-- 	      "0000000111111111" after 8ns,
-- 	      "0000000111110111" after 10ns
-- 	      ;
--	N_b <= "0000000010010101",
--	       "0000000111000000" after 2ns,
--	       "0001100111001110" after 4ns,
--	       "0000000011111111" after 6ns,
--	       "0000000001111111" after 8ns,
--	       "0000000001111111" after 10ns
--	       ;


 	N_a <= "0000010111000000";
	N_b <= "0000000011010000";

END;