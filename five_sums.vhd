----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 01:24:01 PM
-- Design Name: 
-- Module Name: five_sums - Behavioral
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

entity five_sums is
    Port (  prodA_11_2s : in SIGNED (17 downto 0);
    		prodA_12_2s : in SIGNED (17 downto 0);
    		prodA_22_2s : in SIGNED (17 downto 0);
    		prodB_1_2s : in SIGNED (17 downto 0);
    		prodB_2_2s : in SIGNED (17 downto 0);
    		
            prodA_11_3s : in SIGNED (17 downto 0);
            prodA_12_3s : in SIGNED (17 downto 0);
            prodA_22_3s : in SIGNED (17 downto 0);
            prodB_1_3s : in SIGNED (17 downto 0);
            prodB_2_3s : in SIGNED (17 downto 0);
            
            prodA_11_4s : in SIGNED (17 downto 0);
            prodA_12_4s : in SIGNED (17 downto 0);
            prodA_22_4s : in SIGNED (17 downto 0);
            prodB_1_4s : in SIGNED (17 downto 0);
            prodB_2_4s : in SIGNED (17 downto 0);
            
            prodA_11_5s : in SIGNED (17 downto 0);
            prodA_12_5s : in SIGNED (17 downto 0);
            prodA_22_5s : in SIGNED (17 downto 0);
            prodB_1_5s : in SIGNED (17 downto 0);
            prodB_2_5s : in SIGNED (17 downto 0);
            
            prodA_11_6s : in SIGNED (17 downto 0);
            prodA_12_6s : in SIGNED (17 downto 0);
            prodA_22_6s : in SIGNED (17 downto 0);
            prodB_1_6s : in SIGNED (17 downto 0);
            prodB_2_6s : in SIGNED (17 downto 0);
            
            prodA_11_7s : in SIGNED (17 downto 0);
            prodA_12_7s : in SIGNED (17 downto 0);
            prodA_22_7s : in SIGNED (17 downto 0);
            prodB_1_7s : in SIGNED (17 downto 0);
            prodB_2_7s : in SIGNED (17 downto 0);
            
            prodA_11_8s : in SIGNED (17 downto 0);
            prodA_12_8s : in SIGNED (17 downto 0);
            prodA_22_8s : in SIGNED (17 downto 0);
            prodB_1_8s : in SIGNED (17 downto 0);
            prodB_2_8s : in SIGNED (17 downto 0);
            
            prodA_11_9s : in SIGNED (17 downto 0);
            prodA_12_9s : in SIGNED (17 downto 0);
            prodA_22_9s : in SIGNED (17 downto 0);
            prodB_1_9s : in SIGNED (17 downto 0);
            prodB_2_9s : in SIGNED (17 downto 0);
            
            prodA_11_10s : in SIGNED (17 downto 0);
            prodA_12_10s : in SIGNED (17 downto 0);
            prodA_22_10s : in SIGNED (17 downto 0);
            prodB_1_10s : in SIGNED (17 downto 0);
            prodB_2_10s : in SIGNED (17 downto 0);
            
            prodA_11_11s : in SIGNED (17 downto 0);
            prodA_12_11s : in SIGNED (17 downto 0);
            prodA_22_11s : in SIGNED (17 downto 0);
            prodB_1_11s : in SIGNED (17 downto 0);
            prodB_2_11s : in SIGNED (17 downto 0);
            
            prodA_11_12s : in SIGNED (17 downto 0);
            prodA_12_12s : in SIGNED (17 downto 0);
            prodA_22_12s : in SIGNED (17 downto 0);
 			prodB_1_12s : in SIGNED (17 downto 0);
            prodB_2_12s : in SIGNED (17 downto 0);
            
            sum_a_11 : out SIGNED (31 downto 0);
            sum_a_12 : out SIGNED (31 downto 0);
            sum_a_22 : out SIGNED (31 downto 0);
            sum_b_1 : out SIGNED (31 downto 0);
            sum_b_2 : out SIGNED (31 downto 0);
            clk : in STD_LOGIC;
            reset : in STD_LOGIC);
end five_sums;

architecture structural of five_sums is

    component sum_1
    Port (     row2 : in SIGNED (17 downto 0);
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
               reset : in STD_LOGIC);
     end component;
     
     SIGNAL tempA11, tempA12, tempA22, tempB1, tempB2 : SIGNED (31 downto 0);
begin
    sum_A11: sum_1
        port map (  row2 => prodA_11_2s,
                    row3 => prodA_11_3s,
                    row4 => prodA_11_4s,
                    row5 => prodA_11_5s,
                    row6 => prodA_11_6s,
                    row7 => prodA_11_7s,
                    row8 => prodA_11_8s,
                    row9 => prodA_11_9s,
                    row10=> prodA_11_10s,
                    row11=> prodA_11_11s,
                    row12=> prodA_11_12s,
                    sum => tempA11,
                    clk => clk,
                    reset => reset);
					
	sum_A12: sum_1
        port map (  row2 => prodA_12_2s,
                    row3 => prodA_12_3s,
                    row4 => prodA_12_4s,
                    row5 => prodA_12_5s,
                    row6 => prodA_12_6s,
                    row7 => prodA_12_7s,
                    row8 => prodA_12_8s,
                    row9 => prodA_12_9s,
                    row10=> prodA_12_10s,
                    row11=> prodA_12_11s,
                    row12=> prodA_12_12s,
                    sum => tempA12,
					clk => clk,
					reset => reset);

	sum_A22: sum_1
        port map (  row2 => prodA_22_2s,
                    row3 => prodA_22_3s,
                    row4 => prodA_22_4s,
                    row5 => prodA_22_5s,
                    row6 => prodA_22_6s,
                    row7 => prodA_22_7s,
                    row8 => prodA_22_8s,
                    row9 => prodA_22_9s,
                    row10=> prodA_22_10s,
                    row11=> prodA_22_11s,
                    row12=> prodA_22_12s,
                    sum => tempA22,
					clk => clk,
					reset => reset);

	sum_B1: sum_1
        port map (  row2 => prodB_1_2s,
                    row3 => prodB_1_3s,
                    row4 => prodB_1_4s,
                    row5 => prodB_1_5s,
                    row6 => prodB_1_6s,
                    row7 => prodB_1_7s,
                    row8 => prodB_1_8s,
                    row9 => prodB_1_9s,
                    row10=> prodB_1_10s,
                    row11=> prodB_1_11s,
                    row12=> prodB_1_12s,
                    sum => tempB1,
					clk => clk,
					reset => reset);

	sum_B2: sum_1
        port map (  row2 => prodB_2_2s,
                    row3 => prodB_2_3s,
                    row4 => prodB_2_4s,
                    row5 => prodB_2_5s,
                    row6 => prodB_2_6s,
                    row7 => prodB_2_7s,
                    row8 => prodB_2_8s,
                    row9 => prodB_2_9s,
                    row10=> prodB_2_10s,
                    row11=> prodB_2_11s,
                    row12=> prodB_2_12s,
                    sum => tempB2,
					clk => clk,
					reset => reset);	
  
	sum_a_11 <= tempA11;
	sum_a_12 <= tempA12;
	sum_a_22 <= tempA22;
	sum_b_1 <= tempB1;
	sum_b_2 <= tempB2;
end structural;
