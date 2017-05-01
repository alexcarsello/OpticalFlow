----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 11:49:13 AM
-- Design Name: 
-- Module Name: divide - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divide is
    Port ( denom : in SIGNED (31 downto 0);
           A_11_shift : in SIGNED (31 downto 0);
           A_12_shift : in SIGNED (31 downto 0);
           A_22_shift : in SIGNED (31 downto 0);
           A_11_inv : out SIGNED (31 downto 0);
           A_12_inv : out SIGNED (31 downto 0);
           A_22_inv : out SIGNED (31 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end divide;

architecture Behavioral of divide is

begin

	
	
	flop:process(clk) begin
			if(rising_edge(clk))then
				if(reset = '0') then
					A_11_inv <= (others => '0');
					A_12_inv <= (others => '0');
					A_22_inv <= (others => '0');
				else
					A_11_inv <= A_11_shift / denom;
					A_12_inv <= A_12_shift / denom;
					A_22_inv <= A_22_shift / denom;
				end if;
			end if;
		end process;
	
end Behavioral;
