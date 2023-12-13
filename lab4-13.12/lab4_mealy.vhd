----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:44:50 12/13/2023 
-- Design Name: 
-- Module Name:    lab4_mealy - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity lab4_mealy is
    Port ( X : in  STD_LOGIC;
           Y : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end lab4_mealy;

architecture Behavioral of lab4_mealy is

type state_type is (A, B, C, D, E, F);
signal state, next_state : state_type;

begin
	process1 : process(CLK)
	begin
		if rising_edge (CLK) then
			if RST = '1' then -- powr�t do pierwszego stanu po resecie.
				state <= A;
			else					-- przejscie do kolejnego stanu.
				state <= next_state;
			end if;
		end if;
	end process process1;

	Y <= '1' when state = F and X = '0' else '0';

end Behavioral;

