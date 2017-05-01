----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2017 06:24:43 PM
-- Design Name: 
-- Module Name: sum_1 - Behavioral
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

entity sum_1 is
    Port ( row2 : in SIGNED (17 downto 0);
           row3 : in SIGNED (17 downto 0);
           row4 : in SIGNED (17 downto 0);
           row5 : in SIGNED (17 downto 0);
           row6 : in SIGNED (17 downto 0);
           row7 : in SIGNED (17 downto 0);
           row8 : in SIGNED (17 downto 0);
           row9 : in SIGNED (17 downto 0);
           row10 : in SIGNED (17 downto 0);
           row11 : in SIGNED (17 downto 0);
           row12 : in SIGNED (17 downto 0);
           
           sum : out SIGNED (31 downto 0);
           clk : in STD_LOGIC;
           reset: in STD_LOGIC);
end sum_1;


architecture Behavioral of sum_1 is

SIGNAL temprow2 : SIGNED (31 downto 0);
SIGNAL temprow3 : SIGNED (31 downto 0);
SIGNAL temprow4 : SIGNED (31 downto 0);
SIGNAL temprow5 : SIGNED (31 downto 0);
SIGNAL temprow6 : SIGNED (31 downto 0);
SIGNAL temprow7 : SIGNED (31 downto 0);
SIGNAL temprow8 : SIGNED (31 downto 0);
SIGNAL temprow9 : SIGNED (31 downto 0);
SIGNAL temprow10 : SIGNED (31 downto 0);
SIGNAL temprow11 : SIGNED (31 downto 0);
SIGNAL temprow12 : SIGNED (31 downto 0);

begin
    temprow2 <= ("00000000000000" & row2) when row2(17) = '0' else ("11111111111111" & row2);
    temprow3 <= ("00000000000000" & row3) when row3(17) = '0' else ("11111111111111" & row3);
    temprow4 <= ("00000000000000" & row4) when row4(17) = '0' else ("11111111111111" & row4);
    temprow5 <= ("00000000000000" & row5) when row5(17) = '0' else ("11111111111111" & row5);
    temprow6 <= ("00000000000000" & row6) when row6(17) = '0' else ("11111111111111" & row6);
    temprow7 <= ("00000000000000" & row7) when row7(17) = '0' else ("11111111111111" & row7);
    temprow8 <= ("00000000000000" & row8) when row8(17) = '0' else ("11111111111111" & row8);
    temprow9 <= ("00000000000000" & row9) when row9(17) = '0' else ("11111111111111" & row9);
    temprow10 <= ("00000000000000" & row10) when row10(17) = '0' else ("11111111111111" & row10);
    temprow11 <= ("00000000000000" & row11) when row11(17) = '0' else ("11111111111111" & row11);
    temprow12 <= ("00000000000000" & row12) when row12(17) = '0' else ("11111111111111" & row12);
    
    flop:process(clk) begin
    		if(rising_edge(clk))then
    			if(reset = '1') then
    				sum <= (others => '0');
    			else
    				sum <= temprow2 + temprow3 + temprow4 + temprow5 + temprow6 + temprow7 + temprow8 + temprow9 + temprow10 + temprow11 + temprow12;
    			end if;
    		end if;
    	end process;
end Behavioral;
