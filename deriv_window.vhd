----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 09:56:21 AM
-- Design Name: 
-- Module Name: deriv_window - Behavioral
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

entity deriv_window is
    Port ( m_1 : in UNSIGNED (7 downto 0);

           r_2 : in UNSIGNED (7 downto 0);
           m_2 : in UNSIGNED (7 downto 0);
           l_2 : in UNSIGNED (7 downto 0);
           n_2 : in UNSIGNED (7 downto 0);           

           r_3 : in UNSIGNED (7 downto 0);
           m_3 : in UNSIGNED (7 downto 0);
           l_3 : in UNSIGNED (7 downto 0);
           n_3 : in UNSIGNED (7 downto 0);

           r_4 : in UNSIGNED (7 downto 0);
           m_4 : in UNSIGNED (7 downto 0);
           l_4 : in UNSIGNED (7 downto 0);
           n_4 : in UNSIGNED (7 downto 0); 
     
           r_5 : in UNSIGNED (7 downto 0);
           m_5 : in UNSIGNED (7 downto 0);
           l_5 : in UNSIGNED (7 downto 0);
           n_5 : in UNSIGNED (7 downto 0);

           r_6 : in UNSIGNED (7 downto 0);
           m_6 : in UNSIGNED (7 downto 0);
           l_6 : in UNSIGNED (7 downto 0);
           n_6 : in UNSIGNED (7 downto 0);
           
           r_7 : in UNSIGNED (7 downto 0);
           m_7 : in UNSIGNED (7 downto 0);
           l_7 : in UNSIGNED (7 downto 0);
           n_7 : in UNSIGNED (7 downto 0);
           
           r_8 : in UNSIGNED (7 downto 0);
           m_8 : in UNSIGNED (7 downto 0);
           l_8 : in UNSIGNED (7 downto 0);
           n_8 : in UNSIGNED (7 downto 0); 
           
           r_9 : in UNSIGNED (7 downto 0);
           m_9 : in UNSIGNED (7 downto 0);
           l_9 : in UNSIGNED (7 downto 0);
           n_9 : in UNSIGNED (7 downto 0); 
           
           r_10 : in UNSIGNED (7 downto 0);
           m_10 : in UNSIGNED (7 downto 0);
           l_10 : in UNSIGNED (7 downto 0);
           n_10 : in UNSIGNED (7 downto 0);

           r_11 : in UNSIGNED (7 downto 0);
           m_11 : in UNSIGNED (7 downto 0);
           l_11 : in UNSIGNED (7 downto 0);
           n_11 : in UNSIGNED (7 downto 0);
           
           r_12 : in UNSIGNED (7 downto 0);
           m_12 : in UNSIGNED (7 downto 0);
           l_12 : in UNSIGNED (7 downto 0);
           n_12 : in UNSIGNED (7 downto 0);

           m_13 : in UNSIGNED (7 downto 0);
                         
           x_2 : out UNSIGNED (8 downto 0);       
           y_2 : out UNSIGNED (8 downto 0);
           t_2 : out UNSIGNED (8 downto 0);
           
           x_3 : out UNSIGNED (8 downto 0);       
           y_3 : out UNSIGNED (8 downto 0);
           t_3 : out UNSIGNED (8 downto 0);
 
           x_4 : out UNSIGNED (8 downto 0);       
           y_4 : out UNSIGNED (8 downto 0);
           t_4 : out UNSIGNED (8 downto 0); 
           
           x_5 : out UNSIGNED (8 downto 0);       
           y_5 : out UNSIGNED (8 downto 0);
           t_5 : out UNSIGNED (8 downto 0);
           
           x_6 : out UNSIGNED (8 downto 0);       
           y_6 : out UNSIGNED (8 downto 0);
           t_6 : out UNSIGNED (8 downto 0); 
           
           x_7 : out UNSIGNED (8 downto 0);       
           y_7 : out UNSIGNED (8 downto 0);
           t_7 : out UNSIGNED (8 downto 0);
           
           x_8 : out UNSIGNED (8 downto 0);       
           y_8 : out UNSIGNED (8 downto 0);
           t_8 : out UNSIGNED (8 downto 0);
           
           x_9 : out UNSIGNED (8 downto 0);       
           y_9 : out UNSIGNED (8 downto 0);
           t_9 : out UNSIGNED (8 downto 0);
           
           x_10 : out UNSIGNED (8 downto 0);       
           y_10 : out UNSIGNED (8 downto 0);
           t_10 : out UNSIGNED (8 downto 0);
           
           x_11 : out UNSIGNED (8 downto 0);       
           y_11 : out UNSIGNED (8 downto 0);
           t_11 : out UNSIGNED (8 downto 0); 
           
           x_12 : out UNSIGNED (8 downto 0);       
           y_12 : out UNSIGNED (8 downto 0);
           t_12 : out UNSIGNED (8 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
                    
end deriv_window;

architecture Structural of deriv_window is

    component derivative
    Port ( up : in UNSIGNED (7 downto 0);
           down : in UNSIGNED (7 downto 0);
           r : in UNSIGNED (7 downto 0);
           m : in UNSIGNED (7 downto 0);
           l : in UNSIGNED (7 downto 0);
           n : in UNSIGNED (7 downto 0);    
           x : out UNSIGNED (8 downto 0);       
           y : out UNSIGNED (8 downto 0);
           t : out UNSIGNED (8 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
     end component;

begin
    d_2: derivative
        PORT MAP (up    => m_1,
                  down  => m_3,
                  r     => r_2,
                  m     => m_2,
                  l     => l_2,
                  n     => n_2,
                  x     => x_2,
                  y     => y_2,
                  t     => t_2,
                  clk => clk,
				  reset => reset);

    d_3: derivative
        PORT MAP (up    => m_2,
                  down  => m_4,
                  r     => r_3,
                  m     => m_3,
                  l     => l_3,
                  n     => n_3,
                  x     => x_3,
                  y     => y_3,
                  t     => t_3,
                  clk => clk,
				  reset => reset);                  

    d_4: derivative
        PORT MAP (up    => m_3,
                  down  => m_5,
                  r     => r_4,
                  m     => m_4,
                  l     => l_4,
                  n     => n_4,
                  x     => x_4,
                  y     => y_4,
                  t     => t_4,
                  clk => clk,
				  reset => reset);

    d_5: derivative
        PORT MAP (up    => m_4,
                  down  => m_6,
                  r     => r_5,
                  m     => m_5,
                  l     => l_5,
                  n     => n_5,
                  x     => x_5,
                  y     => y_5,
                  t     => t_5,
                  clk => clk,
				  reset => reset);
  
    d_6: derivative
         PORT MAP (up   => m_5,
                  down  => m_7,
                  r     => r_6,
                  m     => m_6,
                  l     => l_6,
                  n     => n_6,
                  x     => x_6,
                  y     => y_6,
                  t     => t_6,
                  clk => clk,
				  reset => reset);

    d_7: derivative
         PORT MAP (up   => m_6,
                  down  => m_8,
                  r     => r_7,
                  m     => m_7,
                  l     => l_7,
                  n     => n_7,
                  x     => x_7,
                  y     => y_7,
                  t     => t_7,
                  clk => clk,
				  reset => reset);
                  
    d_8: derivative
         PORT MAP (up   => m_7,
                  down  => m_9,
                  r     => r_8,
                  m     => m_8,
                  l     => l_8,
                  n     => n_8,
                  x     => x_8,
                  y     => y_8,
                  t     => t_8,
                  clk => clk,
				  reset => reset);
    d_9: derivative
         PORT MAP (up   => m_8,
                  down  => m_10,
                  r     => r_9,
                  m     => m_9,
                  l     => l_9,
                  n     => n_9,
                  x     => x_9,
                  y     => y_9,
                  t     => t_9,
                  clk => clk,
				  reset => reset);  
                  
    d_10: derivative
         PORT MAP (up   => m_9,
                  down  => m_11,
                  r     => r_10,
                  m     => m_10,
                  l     => l_10,
                  n     => n_10,
                  x     => x_10,
                  y     => y_10,
                  t     => t_10,
                  clk => clk,
				  reset => reset);
                  
    d_11: derivative
         PORT MAP (up   => m_10,
                  down  => m_12,
                  r     => r_11,
                  m     => m_11,
                  l     => l_11,
                  n     => n_11,
                  x     => x_11,
                  y     => y_11,
                  t     => t_11,
                  clk => clk,
				  reset => reset);
                  
    d_12: derivative
         PORT MAP (up   => m_11,
                  down  => m_13,
                  r     => r_12,
                  m     => m_12,
                  l     => l_12,
                  n     => n_12,
                  x     => x_12,
                  y     => y_12,
                  t     => t_12,
                  clk => clk,
				  reset => reset);
                                       
end Structural;
