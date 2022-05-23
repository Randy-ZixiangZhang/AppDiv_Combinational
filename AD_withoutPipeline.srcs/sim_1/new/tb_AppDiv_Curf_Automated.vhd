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
use IEEE.std_logic_textio.all;

--use ieee.fixed_pkg.all;
--use IEEE.MATH_REAL.ALL; -- only for simulation
 use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

library std;
     use std.textio.all; 
      --use std.textio.all; 
 
ENTITY tb_AppDiv_Curf_Automated IS
END tb_AppDiv_Curf_Automated;
 
ARCHITECTURE behavior OF tb_AppDiv_Curf_Automated IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
   --Inputs
   signal N_a : unsigned(15 downto 0);
   signal N_b : unsigned(15 downto 0) ;

 	--Outputs
   signal Q: unsigned (31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
   constant C_FILE_NAME :string  := "/home/randy/Documents/AD_withoutPipeline/MATLAB_src/DataIn.txt";
   --constant C_FILE_NAME_OUT :string := "DataOut";
   constant C_CLK :time := 10 ns;
   constant C_DATA1_W   :integer := 16;
   --constant C_DATA1_INT_W : integer:= 12;
   constant C_DATA2_W   :integer := 16;
   --constant C_DATA2_INT_W : integer:= 12;
   
   signal data1         :integer range 0 to 50000;
   signal data2         :integer range 0 to 50000;
   
   signal Read_Good1 : boolean;
   signal Read_Good2 : boolean;
   
   signal flag_done:boolean := false;
   signal flag_open:boolean := false;
   
   signal clk : std_logic := '0';
   file fptr: text;
   file fptr_out: text;
   
           -- for fractional interpretation
        --signal x: ufixed(11 downto -4);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.AppDiv_Curf PORT MAP (
            Dividend=>N_a,
            Divisor=>N_b,
            Quotient=>Q
        );


   ClockGenerator: Process
   begin 
        clk <= '0' after C_CLK, '1' after 2*C_CLK;
        wait for 2*C_CLK;
   end process; 


    GetData_proc: process

    
        variable fstatus       :file_open_status;
        variable file_line     :line;
        variable var_data1     :integer;
        variable var_data2     :integer;
        variable good1:boolean;
        variable good2:boolean;
        
        --write
        file w_file: text;
        variable w_file_is_open: boolean;
        variable trace_line : line;
        --variable line_count : natural := 0;
        

        
    begin
        file_open(fptr,C_FILE_NAME,READ_MODE);
        
        --only works with absolute path
        file_open(fstatus,w_file,"//home/randy/Documents/AD_withoutPipeline/MATLAB_src/DataOut.txt",WRITE_MODE);
        
        while (not endfile(fptr)) loop
            wait until clk = '1';
            
            readline(fptr,file_line);
            read(file_line, var_data1,good1);
            Read_Good1 <= good1;
            data1 <= var_data1;
            read(file_line, var_data2,good2);
            data2 <= var_data2;     
            Read_Good2 <= good2;    
            
            N_a      <= shift_left(to_unsigned(var_data1,C_DATA1_W),4);
            N_b      <= shift_left(to_unsigned(var_data2,C_DATA1_W),4); -- 1st May change so front 12 integer, 4 last zeros(fractional)

--            N_a      <= shift_left(to_unsigned(var_data1,C_DATA1_W),8);
--            N_b      <= shift_left(to_unsigned(var_data2,C_DATA1_W),8); 
            
--            write(trace_line,var_data1);
--            write(trace_line,var_data2);
--            write(trace_line,string'("test"));
--            write(trace_line,to_integer(Q));

            write(trace_line,var_data1);
            write(trace_line,' ');
            
            write(trace_line,var_data2);
            write(trace_line,' ');
            
            wait for 5ns;
            --if to_integer(Q) = 'X' then
               --write(trace_line,to_integer(Q));
               write(trace_line,std_logic_vector(Q));
               --x := to_ufixed(Q);
               --write(trace_line,to_real(x));
            --else
                --write(trace_line,to_integer(Q));
            --end if;
            writeline(w_file,trace_line);
            
        end loop;
        
       wait  until rising_edge(clk);
       flag_done <= true;
       file_close(fptr);
       --file_close(w_file);
       wait;
    end process;

--	       ;

END;