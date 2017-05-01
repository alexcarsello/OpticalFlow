----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 01:42:11 PM
-- Design Name: 
-- Module Name: delay - Behavioral
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

entity delay is
    Port ( B_1 : in SIGNED (31 downto 0);
           B_2 : in SIGNED (31 downto 0);
           B_1_del : out SIGNED (31 downto 0);
           B_2_del : out SIGNED (31 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end delay;

architecture Behavioral of delay is
	SIGNAL nxt_b1, nxt_b2 : SIGNED (31 downto 0);
	SIGNAL nxt1_b1, nxt1_b2 : SIGNED (31 downto 0);
	SIGNAL nxt2_b1, nxt2_b2 : SIGNED (31 downto 0);
	SIGNAL nxt3_b1, nxt3_b2 : SIGNED (31 downto 0);
	SIGNAL nxt4_b1, nxt4_b2 : SIGNED (31 downto 0);
	SIGNAL nxt5_b1, nxt5_b2 : SIGNED (31 downto 0);
	SIGNAL nxt6_b1, nxt6_b2 : SIGNED (31 downto 0);
	SIGNAL nxt7_b1, nxt7_b2 : SIGNED (31 downto 0);
	SIGNAL nxt8_b1, nxt8_b2 : SIGNED (31 downto 0);
	SIGNAL nxt9_b1, nxt9_b2 : SIGNED (31 downto 0);
	SIGNAL nxt10_b1, nxt10_b2 : SIGNED (31 downto 0);
	SIGNAL nxt11_b1, nxt11_b2 : SIGNED (31 downto 0);
	SIGNAL nxt12_b1, nxt12_b2 : SIGNED (31 downto 0);
	SIGNAL nxt13_b1, nxt13_b2 : SIGNED (31 downto 0);
	SIGNAL nxt14_b1, nxt14_b2 : SIGNED (31 downto 0);
	
	SIGNAL nxt15_b1, nxt15_b2 : SIGNED (31 downto 0);
	SIGNAL nxt16_b1, nxt16_b2 : SIGNED (31 downto 0);
	SIGNAL nxt17_b1, nxt17_b2 : SIGNED (31 downto 0);
begin

	delay : process (clk) begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				b_1_del <= (others => '0');
				b_2_del <= (others => '0');
				nxt_b1 <= (others => '0');
				nxt_b2 <= (others => '0');
				
				nxt1_b1 <= (others => '0');
				nxt1_b2 <= (others => '0');
				nxt2_b1 <= (others => '0');
				nxt2_b2 <= (others => '0');
				
				nxt3_b1 <= (others => '0');
				nxt3_b2 <= (others => '0');
				nxt4_b1 <= (others => '0');
				nxt4_b2 <= (others => '0');
				
				nxt5_b1 <= (others => '0');
				nxt5_b2 <= (others => '0');
				nxt6_b1 <= (others => '0');
				nxt6_b2 <= (others => '0');
				
				nxt7_b1 <= (others => '0');
				nxt7_b2 <= (others => '0');
				nxt8_b1 <= (others => '0');
				nxt8_b2 <= (others => '0');
				
				nxt9_b1 <= (others => '0');
				nxt9_b2 <= (others => '0');
				nxt10_b1 <= (others => '0');
				nxt10_b2 <= (others => '0');
				
				nxt11_b1 <= (others => '0');
				nxt11_b2 <= (others => '0');
				nxt12_b1 <= (others => '0');
				nxt12_b2 <= (others => '0');
				
				nxt13_b1 <= (others => '0');
				nxt13_b2 <= (others => '0');
				nxt14_b1 <= (others => '0');
				nxt14_b2 <= (others => '0');
				
				nxt15_b1 <= (others => '0');
				nxt15_b2 <= (others => '0');
				nxt16_b1 <= (others => '0');
				nxt16_b2 <= (others => '0');
				
				nxt17_b1 <= (others => '0');
				nxt17_b2 <= (others => '0');
				
				
			else
				nxt_b1 <= B_1;
				nxt_b2 <= B_2;
				nxt1_b1 <= nxt_b1;
				nxt1_b2 <= nxt_b2;
				nxt2_b1 <= nxt1_b1;
				nxt2_b2 <= nxt1_b2;
				
				nxt3_b1 <= nxt2_b1;
				nxt3_b2 <= nxt2_b2;
				nxt4_b1 <= nxt3_b1;
				nxt4_b2 <= nxt3_b2;
				
				nxt5_b1 <= nxt4_b1;
				nxt5_b2 <= nxt4_b2;
				nxt6_b1 <= nxt5_b1;
				nxt6_b2 <= nxt5_b2;
				
				nxt7_b1 <= nxt6_b1;
				nxt7_b2 <= nxt6_b2;
				nxt8_b1 <= nxt7_b1;
				nxt8_b2 <= nxt7_b2;
				
				nxt9_b1 <= nxt8_b1;
				nxt9_b2 <= nxt8_b2;
				nxt10_b1 <= nxt9_b1;
				nxt10_b2 <= nxt9_b2;
				
				nxt11_b1 <= nxt10_b1;
				nxt11_b2 <= nxt10_b2;
				nxt12_b1 <= nxt11_b1;
				nxt12_b2 <= nxt11_b2;
				
				nxt13_b1 <= nxt12_b1;
				nxt13_b2 <= nxt12_b2;
				nxt14_b1 <= nxt13_b1;
				nxt14_b2 <= nxt13_b2;
				
				nxt15_b1 <= nxt14_b1;
				nxt15_b2 <= nxt14_b2;
				nxt16_b1 <= nxt15_b1;
				nxt16_b2 <= nxt15_b2;
				
				nxt17_b1 <= nxt16_b1;
				nxt17_b2 <= nxt16_b2;
				
				b_1_del <= nxt17_b1;
				b_2_del <= nxt17_b2;
			end if;
		end if;
	end process;
end Behavioral;
