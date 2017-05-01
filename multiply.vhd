----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2017 06:24:43 PM
-- Design Name: 
-- Module Name: multiply - Behavioral
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

entity multiply is
    Port ( xm : in SIGNED (8 downto 0);
           ym : in SIGNED (8 downto 0);
           tm : in SIGNED (8 downto 0);
           
           prodA_11 : out SIGNED (17 downto 0);
           prodA_12 : out SIGNED (17 downto 0);
           prodA_22 : out SIGNED (17 downto 0);
           prodB_1 : out SIGNED (17 downto 0);
           prodB_2 : out SIGNED (17 downto 0);
           clk : in STD_LOGIC;
           reset: in STD_LOGIC);
end multiply;

architecture Behavioral of multiply is
    
begin
    flop:process(clk) begin
    		if(rising_edge(clk))then
    			if(reset = '1') then
    				prodA_11 <= (others => '0');
    				prodA_12 <= (others => '0');
    				prodA_22 <= (others => '0');
    				prodB_1 <= (others => '0');
    				prodB_2 <= (others => '0');
    			else
    				prodA_11 <= xm*xm;
    			    prodA_12 <= xm*ym;
    			    prodA_22 <= ym*ym;
    			    prodB_1 <= xm*tm;
    			    prodB_2 <= ym*tm;
    			end if;
    		end if;
    	end process;
end Behavioral;
