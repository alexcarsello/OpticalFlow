----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2017 06:50:00 PM
-- Design Name: 
-- Module Name: LineBufCtrl - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LineBufCtrl is
    Port ( this_full : in STD_LOGIC;
           prev_empty : in STD_LOGIC;
           rd : out STD_LOGIC;
           wr : out STD_LOGIC;
           FF_en : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end LineBufCtrl;

architecture Behavioral of LineBufCtrl is
signal temprd, tempwr, FF_en_del: STD_LOGIC;
begin
	temprd <= '1' when (this_full = '0' and prev_empty = '0') else '0';
	rd <= temprd or FF_en_del;
	wr <= tempwr or FF_en;
	buf:process(clk) begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				tempwr <= '0';
				FF_en_del <= '0';
			else
				tempwr <= temprd;
				FF_en_del <= FF_en;
			end if;
		end if;
	end process;
end Behavioral;
