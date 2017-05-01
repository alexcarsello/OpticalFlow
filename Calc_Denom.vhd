----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 11:49:13 AM
-- Design Name: 
-- Module Name: Calc_Denom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Calc_Denom is
    Port ( A_11 : in SIGNED (31 downto 0);
           A_12 : in SIGNED (31 downto 0);
           A_22 : in SIGNED (31 downto 0);
           denom : out SIGNED (31 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end Calc_Denom;

architecture Behavioral of Calc_Denom is
SIGNAL temp, mult, square : SIGNED (63 downto 0);
SIGNAL tempDenom : SIGNED(31 downto 0);
begin
	mult <= A_11 * A_22;
	square <= A_12 * A_12;
	temp <= (mult - square);
	tempDenom <= temp(41 downto 10);
	
	flop:process(clk) begin
			if(rising_edge(clk))then
				if(reset = '1') then
					denom <= (others => '0');
				else
					denom <= tempDenom;
				end if;
			end if;
		end process;

end Behavioral;
