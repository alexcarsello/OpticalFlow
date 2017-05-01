----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 11:49:13 AM
-- Design Name: 
-- Module Name: Shift_Inv - Behavioral
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

entity Shift_Inv is
    Port ( A_11 : in SIGNED (31 downto 0);
           A_12 : in SIGNED (31 downto 0);
           A_22 : in SIGNED (31 downto 0);
           A_11_shift : out SIGNED (31 downto 0);
           A_12_shift : out SIGNED (31 downto 0);
           A_22_shift : out SIGNED (31 downto 0);
           valid : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end Shift_Inv;

architecture Behavioral of Shift_Inv is
begin

	valid <= '1';
	
	flop:process(clk) begin
		if(rising_edge(clk))then
			if(reset = '1') then
				A_11_shift <= (others => '0');
				A_12_shift <= (others => '0');
				A_22_shift <= (others => '0');
			else
				A_11_shift <= shift_left(A_22,10);
				A_12_shift <= shift_left((-A_12),10);
				A_22_shift <= shift_left(A_11,10);
			end if;
		end if;
	end process;
end Behavioral;
