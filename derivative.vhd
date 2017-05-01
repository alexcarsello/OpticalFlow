----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2017 06:24:43 PM
-- Design Name: 
-- Module Name: derivative - Behavioral
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

entity derivative is
    Port ( up : in UNSIGNED (7 downto 0);
           down : in UNSIGNED (7 downto 0);
           r : in UNSIGNED (7 downto 0);
           m : in UNSIGNED (7 downto 0);
           l : in UNSIGNED (7 downto 0);
           n : in UNSIGNED (7 downto 0);
           
           x : out UNSIGNED (8 downto 0);       
           y : out UNSIGNED (8 downto 0);
           t : out UNSIGNED (8 downto 0);
           clk: in STD_LOGIC;
           reset: in STD_LOGIC);
           
end derivative;

architecture Behavioral of derivative is
signal temp_up : UNSIGNED (8 downto 0);
signal temp_down : UNSIGNED (8 downto 0);
signal temp_r : UNSIGNED (8 downto 0);
signal temp_m : UNSIGNED (8 downto 0);
signal temp_l : UNSIGNED (8 downto 0);
signal temp_n : UNSIGNED (8 downto 0);

begin
    temp_up <= '0' & up;
    temp_down <= '0' & down;
    temp_r <= '0' & r;
    temp_m <= '0' & m;
    temp_l <= '0' & l;
    temp_n <= '0' & n;
    
    
    flop:process(clk) begin
    		if(rising_edge(clk))then
    			if(reset = '1') then
    				x <= (others => '0');
    				y <= (others => '0');
    				t <= (others => '0');
    			else
    				x <= temp_r-temp_l;
    			    y <= temp_down-temp_up;
    			    t <= temp_n-temp_m;
    			end if;
    		end if;
    	end process;
end Behavioral;
