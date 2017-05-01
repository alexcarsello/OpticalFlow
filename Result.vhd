----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 10:31:36 AM
-- Design Name: 
-- Module Name: Result - Behavioral
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

entity Result is
    Port ( A_11_inv : in SIGNED (39 downto 0);
           A_12_inv : in SIGNED (39 downto 0);
           A_22_inv : in SIGNED (39 downto 0);
           B_1 : in SIGNED (31 downto 0);
           B_2 : in SIGNED (31 downto 0);
           u : out SIGNED (31 downto 0);
           v : out SIGNED (31 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end Result;

architecture Behavioral of Result is
SIGNAL temp1, temp2, temp3, temp4 : SIGNED (63 downto 0);
SIGNAL debug1 : SIGNED (31 downto 0);
SIGNAL tempU, tempV : SIGNED (31 downto 0);
begin
	
	debug1 <= A_11_inv(33 downto 2);
	
	flop:process(clk) begin
		if(rising_edge(clk))then
			if(reset = '1') then
				u <= (others => '0');
				v <= (others => '0');
				temp1 <= (others => '0');
				temp2 <= (others => '0');
				temp3 <= (others => '0');
				temp4 <= (others =>'0');
			else
				temp1 <= A_11_inv(33 downto 2) * (-B_1);
				temp2 <= A_22_inv(33 downto 2) * (-B_2);
				temp3 <= A_12_inv(33 downto 2) * (-B_1);
				temp4 <= A_12_inv(33 downto 2) * (-B_2);
				u <= (temp1(31 downto 0) + temp4(31 downto 0));
				v <= (temp3(31 downto 0) + temp2(31 downto 0));
			end if;
		end if;
	end process;

end Behavioral;
