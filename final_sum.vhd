----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 06:00:44 PM
-- Design Name: 
-- Module Name: final_sum - Behavioral
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

entity final_sum is
    Port ( prev_a_11 : in SIGNED (31 downto 0);
           prev_a_12 : in SIGNED (31 downto 0);
           prev_a_22 : in SIGNED (31 downto 0);
           prev_b_1 : in SIGNED (31 downto 0);
           prev_b_2 : in SIGNED (31 downto 0);
           sum_a_11 : in SIGNED (31 downto 0);
           sum_a_12 : in SIGNED (31 downto 0);
           sum_a_22 : in SIGNED (31 downto 0);
           sum_b_1 : in SIGNED (31 downto 0);
           sum_b_2 : in SIGNED (31 downto 0);
           a_11 : out SIGNED (31 downto 0);
           a_12 : out SIGNED (31 downto 0);
           a_22 : out SIGNED (31 downto 0);
           b_1 : out SIGNED (31 downto 0);
           b_2 : out SIGNED (31 downto 0);
           subtract : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end final_sum;

architecture Behavioral of final_sum is

SIGNAL temp_a11, temp_a12, temp_a22, temp_b1, temp_b2 : SIGNED (31 downto 0);

begin
	a_11 <= temp_a11;
	a_12 <= temp_a12;
	a_22 <= temp_a22;
	b_1 <= temp_b1;
	b_2 <= temp_b2;
	sum:process(clk) begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				temp_a11 <= (others => '0');
				temp_a12 <= (others => '0');
				temp_a22 <= (others => '0');
				temp_b1 <= (others => '0');
				temp_b2 <= (others => '0');
			else
				if(subtract = '1') then
					temp_a11 <= (temp_a11 + sum_a_11) - prev_a_11;
					temp_a12 <= (temp_a12 + sum_a_12) - prev_a_12;
					temp_a22 <= (temp_a22 + sum_a_22) - prev_a_22;
					temp_b1 <= (temp_b1 + sum_b_1) - prev_b_1;
					temp_b2 <= (temp_b2 + sum_b_2) - prev_b_2;
				else
					temp_a11 <= (temp_a11 + sum_a_11);
					temp_a12 <= (temp_a12 + sum_a_12);
					temp_a22 <= (temp_a22 + sum_a_22);
					temp_b1 <= (temp_b1 + sum_b_1);
					temp_b2 <= (temp_b2 + sum_b_2);
				end if;
			end if;
		end if;
	end process;

end Behavioral;
