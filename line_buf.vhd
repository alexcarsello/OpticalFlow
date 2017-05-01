----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 06:30:40 PM
-- Design Name: 
-- Module Name: line_buf - Behavioral
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

entity line_buf is
    Port ( in_val : in UNSIGNED (7 downto 0);
           right : out UNSIGNED (7 downto 0);
           middle : out UNSIGNED (7 downto 0);
           left : out UNSIGNED (7 downto 0);
           FF_en: in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end line_buf;

architecture Behavioral of line_buf is

SIGNAL tempRight, tempMiddle, tempLeft : UNSIGNED (7 downto 0);
begin

	right <= tempRight;
	left <= tempLeft;
	middle <= tempMiddle;
	
	buf:process(clk) begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				tempRight <= (others => '0');
				tempLeft <= (others => '0');
				tempMiddle <= (others => '0');
			else 
				if(FF_en = '1') then
					tempRight <= in_val;
					tempMiddle <= tempRight;
					tempLeft <= tempMiddle;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
