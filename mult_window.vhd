----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 10:46:47 AM
-- Design Name: 
-- Module Name: mult_window - Behavioral
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

entity mult_window is
    Port ( xm_2 : in SIGNED (8 downto 0);
           ym_2 : in SIGNED (8 downto 0);
           tm_2 : in SIGNED (8 downto 0);
           
           xm_3 : in SIGNED (8 downto 0);
           ym_3 : in SIGNED (8 downto 0);
           tm_3 : in SIGNED (8 downto 0);
           
           xm_4 : in SIGNED (8 downto 0);
           ym_4 : in SIGNED (8 downto 0);
           tm_4 : in SIGNED (8 downto 0);
          
           xm_5 : in SIGNED (8 downto 0);
           ym_5 : in SIGNED (8 downto 0);
           tm_5 : in SIGNED (8 downto 0); 
           
           xm_6 : in SIGNED (8 downto 0);
           ym_6 : in SIGNED (8 downto 0);
           tm_6 : in SIGNED (8 downto 0); 
           
           xm_7 : in SIGNED (8 downto 0);
           ym_7 : in SIGNED (8 downto 0);
           tm_7 : in SIGNED (8 downto 0);
           
           xm_8 : in SIGNED (8 downto 0);
           ym_8 : in SIGNED (8 downto 0);
           tm_8 : in SIGNED (8 downto 0); 
           
           xm_9 : in SIGNED (8 downto 0);
           ym_9 : in SIGNED (8 downto 0);
           tm_9 : in SIGNED (8 downto 0);
           
           xm_10 : in SIGNED (8 downto 0);
           ym_10 : in SIGNED (8 downto 0);
           tm_10 : in SIGNED (8 downto 0);          

           xm_11 : in SIGNED (8 downto 0);
           ym_11 : in SIGNED (8 downto 0);
           tm_11 : in SIGNED (8 downto 0);
          
           xm_12 : in SIGNED (8 downto 0);
           ym_12 : in SIGNED (8 downto 0);
           tm_12 : in SIGNED (8 downto 0);
    
           prodA_11_2 : out SIGNED (17 downto 0);
           prodA_12_2 : out SIGNED (17 downto 0);
           prodA_22_2 : out SIGNED (17 downto 0);
           prodB_1_2 : out SIGNED (17 downto 0);
           prodB_2_2 : out SIGNED (17 downto 0);
           
           prodA_11_3 : out SIGNED (17 downto 0);
           prodA_12_3 : out SIGNED (17 downto 0);
           prodA_22_3 : out SIGNED (17 downto 0);
           prodB_1_3 : out SIGNED (17 downto 0);
           prodB_2_3 : out SIGNED (17 downto 0);
           
           prodA_11_4 : out SIGNED (17 downto 0);
           prodA_12_4 : out SIGNED (17 downto 0);
           prodA_22_4 : out SIGNED (17 downto 0);
           prodB_1_4 : out SIGNED (17 downto 0);
           prodB_2_4 : out SIGNED (17 downto 0);           

           prodA_11_5 : out SIGNED (17 downto 0);
           prodA_12_5 : out SIGNED (17 downto 0);
           prodA_22_5 : out SIGNED (17 downto 0);
           prodB_1_5 : out SIGNED (17 downto 0);
           prodB_2_5 : out SIGNED (17 downto 0);           
    
           prodA_11_6 : out SIGNED (17 downto 0);
           prodA_12_6 : out SIGNED (17 downto 0);
           prodA_22_6 : out SIGNED (17 downto 0);
           prodB_1_6 : out SIGNED (17 downto 0);
           prodB_2_6 : out SIGNED (17 downto 0);    
    
           prodA_11_7 : out SIGNED (17 downto 0);
           prodA_12_7 : out SIGNED (17 downto 0);
           prodA_22_7 : out SIGNED (17 downto 0);
           prodB_1_7 : out SIGNED (17 downto 0);
           prodB_2_7 : out SIGNED (17 downto 0);
           
           prodA_11_8 : out SIGNED (17 downto 0);
           prodA_12_8 : out SIGNED (17 downto 0);
           prodA_22_8 : out SIGNED (17 downto 0);
           prodB_1_8 : out SIGNED (17 downto 0);
           prodB_2_8 : out SIGNED (17 downto 0);
           
           prodA_11_9 : out SIGNED (17 downto 0);
           prodA_12_9 : out SIGNED (17 downto 0);
           prodA_22_9 : out SIGNED (17 downto 0);
           prodB_1_9 : out SIGNED (17 downto 0);
           prodB_2_9 : out SIGNED (17 downto 0);           

           prodA_11_10 : out SIGNED (17 downto 0);
           prodA_12_10 : out SIGNED (17 downto 0);
           prodA_22_10 : out SIGNED (17 downto 0);
           prodB_1_10 : out SIGNED (17 downto 0);
           prodB_2_10 : out SIGNED (17 downto 0);           
    
           prodA_11_11 : out SIGNED (17 downto 0);
           prodA_12_11 : out SIGNED (17 downto 0);
           prodA_22_11 : out SIGNED (17 downto 0);
           prodB_1_11 : out SIGNED (17 downto 0);
           prodB_2_11 : out SIGNED (17 downto 0);    
    
           prodA_11_12 : out SIGNED (17 downto 0);
           prodA_12_12 : out SIGNED (17 downto 0);
           prodA_22_12 : out SIGNED (17 downto 0);
           prodB_1_12 : out SIGNED (17 downto 0);
           prodB_2_12 : out SIGNED (17 downto 0);
           
           clk : in STD_LOGIC;
           reset: in STD_LOGIC);
           
end mult_window;

architecture Structural of mult_window is
    component multiply
    port(xm : in SIGNED (8 downto 0);
         ym : in SIGNED (8 downto 0);
         tm : in SIGNED (8 downto 0);
         prodA_11 : out SIGNED (17 downto 0);
         prodA_12 : out SIGNED (17 downto 0);
         prodA_22 : out SIGNED (17 downto 0);
         prodB_1 : out SIGNED (17 downto 0);
         prodB_2 : out SIGNED (17 downto 0);
         clk : in STD_LOGIC;
         reset : in STD_LOGIC);
     end component;

begin

    mult_2: multiply
        port map    (xm       => xm_2,
                    ym       => ym_2,
                    tm       => tm_2,
                    prodA_11  => prodA_11_2,
                    prodA_12  => prodA_12_2,
                    prodA_22  => prodA_22_2,
                    prodB_1   => prodB_1_2,
                    prodB_2   => prodB_2_2,
                    clk => clk,
                    reset => reset);
                                   
    mult_3: multiply
        port map    (xm       => xm_3,
                    ym       => ym_3,
                    tm       => tm_3,
                    prodA_11  => prodA_11_3,
                    prodA_12  => prodA_12_3,
                    prodA_22  => prodA_22_3,
                    prodB_1   => prodB_1_3,
                    prodB_2   => prodB_2_3,
                    clk => clk,
					reset => reset);
                    
    mult_4: multiply
        port map    (xm       => xm_4,
                    ym       => ym_4,
                    tm       => tm_4,
                    prodA_11  => prodA_11_4,
                    prodA_12  => prodA_12_4,
                    prodA_22  => prodA_22_4,
                    prodB_1   => prodB_1_4,
                    prodB_2   => prodB_2_4,
                    clk => clk,
					reset => reset);
                    
    mult_5: multiply
        port map    (xm       => xm_5,
                    ym       => ym_5,
                    tm       => tm_5,
                    prodA_11  => prodA_11_5,
                    prodA_12  => prodA_12_5,
                    prodA_22  => prodA_22_5,
                    prodB_1   => prodB_1_5,
                    prodB_2   => prodB_2_5,
                    clk => clk,
					reset => reset);
                    
    mult_6: multiply
        port map    (xm       => xm_6,
                ym       => ym_6,
                tm       => tm_6,
                prodA_11  => prodA_11_6,
                prodA_12  => prodA_12_6,
                prodA_22  => prodA_22_6,
                prodB_1   => prodB_1_6,
                prodB_2   => prodB_2_6,
                clk => clk,
				reset => reset);
                
    mult_7: multiply
         port map    (xm       => xm_7,
                ym       => ym_7,
                tm       => tm_7,
                prodA_11  => prodA_11_7,
                prodA_12  => prodA_12_7,
                prodA_22  => prodA_22_7,
                prodB_1   => prodB_1_7,
                prodB_2   => prodB_2_7,
                clk => clk,
				reset => reset);
                
    mult_8: multiply
        port map    (xm       => xm_8,
                ym       => ym_8,
                tm       => tm_8,
                prodA_11  => prodA_11_8,
                prodA_12  => prodA_12_8,
                prodA_22  => prodA_22_8,
                prodB_1   => prodB_1_8,
                prodB_2   => prodB_2_8,
                clk => clk,
				reset => reset);
                
    mult_9: multiply
        port map    (xm       => xm_9,
                ym       => ym_9,
                tm       => tm_9,
                prodA_11  => prodA_11_9,
                prodA_12  => prodA_12_9,
                prodA_22  => prodA_22_9,
                prodB_1   => prodB_1_9,
                prodB_2   => prodB_2_9,
                clk => clk,
				reset => reset);
                
    mult_10: multiply
        port map    (xm       => xm_10,
                ym       => ym_10,
                tm       => tm_10,
                prodA_11  => prodA_11_10,
                prodA_12  => prodA_12_10,
                prodA_22  => prodA_22_10,
                prodB_1   => prodB_1_10,
                prodB_2   => prodB_2_10,
                clk => clk,
				reset => reset);
                
    mult_11: multiply
        port map    (xm       => xm_11,
                ym       => ym_11,
                tm       => tm_11,
                prodA_11  => prodA_11_11,
                prodA_12  => prodA_12_11,
                prodA_22  => prodA_22_11,
                prodB_1   => prodB_1_11,
                prodB_2   => prodB_2_11,
                clk => clk,
				reset => reset);
                
    mult_12: multiply
        port map    (xm       => xm_12,
                ym       => ym_12,
                tm       => tm_12,
                prodA_11  => prodA_11_12,
                prodA_12  => prodA_12_12,
                prodA_22  => prodA_22_12,
                prodB_1   => prodB_1_12,
                prodB_2   => prodB_2_12,
                clk => clk,
				reset => reset);
	
end Structural;
