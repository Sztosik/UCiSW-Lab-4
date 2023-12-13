----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:35:06 12/13/2023 
-- Design Name: 
-- Module Name:    lab4_moore - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab4_moore is
    Port ( X : in  STD_LOGIC;
           Y : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           RST : in  STD_LOGIC);
end lab4_moore;

architecture Behavioral of lab4_moore is

type state_type is (A, B, C, D, E, F, G);
signal state, next_state : state_type;

begin
	process1 : process(CLK)
	begin
		if rising_edge (CLK) then
			if RST = '1' then -- powrót do pierwszego stanu po resecie.
				state <= A;
			else					-- przejscie do kolejnego stanu.
				state <= next_state;
			end if;
		end if;
	end process process1;

	process2 : process (state, X , CE)
	begin
		next_state <= state;
		if CE = '1' then
			-- case `state e.g. A` when
		end if;
	end process process2;
	
	Y <= '1' when state = G else '0';

end Behavioral;

