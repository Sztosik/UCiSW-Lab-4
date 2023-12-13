--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:53:53 12/13/2023
-- Design Name:   
-- Module Name:   C:/Users/Sztosik/Desktop/UCiSW/lab4-13.12/lab4-13.12/moore_test.vhd
-- Project Name:  lab4-13.12
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab4_moore
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY moore_test IS
END moore_test;
 
ARCHITECTURE behavior OF moore_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab4_moore
    PORT(
         X : IN  std_logic;
         Y : OUT  std_logic;
         CLK : IN  std_logic;
         CE : IN  std_logic;
         RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CE : std_logic := '1';
   signal RST : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
	
	signal test_vector : STD_LOGIC_VECTOR (0 to 20) := "111011100010011101000";

   -- Clock period definitions
   constant CLK_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab4_moore PORT MAP (
          X => X,
          Y => Y,
          CLK => CLK,
          CE => CE,
          RST => RST
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- X <= '1';
		wait for 5 ns;
		for i in 0 to 20 loop
			X <= test_vector(i);
			wait for CLK_period;
		end loop;
      wait;
   end process;

END;
