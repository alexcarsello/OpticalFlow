----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2017 01:07:58 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( intensity : in UNSIGNED (7 downto 0);
           u : out SIGNED (31 downto 0);
           v : out SIGNED (31 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC);
end top;

architecture Behavioral of top is
	component deriv_window
	Port ( m_1, r_2, m_2, l_2, n_2, r_3, m_3, l_3, n_3 : in UNSIGNED (7 downto 0);
	           r_4, m_4, l_4, n_4, r_5, m_5, l_5, n_5 : in UNSIGNED (7 downto 0);
	           r_6, m_6, l_6, n_6, r_7, m_7, l_7, n_7 : in UNSIGNED (7 downto 0);
	           r_8,  m_8, l_8, n_8, r_9, m_9, l_9, n_9 : in UNSIGNED (7 downto 0);        
	           r_10, m_10, l_10, n_10, r_11, m_11, l_11, n_11 : in UNSIGNED (7 downto 0);
	           r_12, m_12, l_12, n_12, m_13 : in UNSIGNED (7 downto 0);      
	           x_2, y_2, t_2, x_3, y_3, t_3, x_4, y_4, t_4 : out UNSIGNED (8 downto 0);  
	           x_5, y_5, t_5, x_6, y_6, t_6, x_7, y_7, t_7 : out UNSIGNED (8 downto 0);
	           x_8, y_8, t_8, x_9, y_9, t_9, x_10, y_10, t_10 : out UNSIGNED (8 downto 0);
	           x_11, y_11, t_11, x_12, y_12, t_12 : out UNSIGNED (8 downto 0);
	           clk, reset : in STD_LOGIC);
	end component;
	
	component mult_window
	Port ( xm_2, ym_2 , tm_2 : in SIGNED (8 downto 0);
	           
	           xm_3, ym_3, tm_3 : in SIGNED (8 downto 0);
	           
	           xm_4, ym_4, tm_4 : in SIGNED (8 downto 0);
	          
	           xm_5, ym_5, tm_5 : in SIGNED (8 downto 0); 
	           
	           xm_6, ym_6, tm_6 : in SIGNED (8 downto 0); 
	           
	           xm_7, ym_7, tm_7 : in SIGNED (8 downto 0);
	           
	           xm_8, ym_8, tm_8 : in SIGNED (8 downto 0); 
	           
	           xm_9, ym_9, tm_9 : in SIGNED (8 downto 0);
	           
	           xm_10, ym_10, tm_10 : in SIGNED (8 downto 0);          
	
	           xm_11, ym_11, tm_11 : in SIGNED (8 downto 0);
	          
	           xm_12, ym_12, tm_12 : in SIGNED (8 downto 0);
	    
	           prodA_11_2, prodA_12_2, prodA_22_2, prodB_1_2, prodB_2_2 : out SIGNED (17 downto 0);
	           
	           prodA_11_3, prodA_12_3, prodA_22_3, prodB_1_3, prodB_2_3 : out SIGNED (17 downto 0);
	           
	           prodA_11_4, prodA_12_4, prodA_22_4, prodB_1_4, prodB_2_4 : out SIGNED (17 downto 0);           
	
	           prodA_11_5, prodA_12_5, prodA_22_5, prodB_1_5, prodB_2_5 : out SIGNED (17 downto 0);           
	    
	           prodA_11_6, prodA_12_6, prodA_22_6, prodB_1_6 ,prodB_2_6 : out SIGNED (17 downto 0);    
	    
	           prodA_11_7, prodA_12_7, prodA_22_7, prodB_1_7, prodB_2_7 : out SIGNED (17 downto 0);
	           
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
	           prodB_2_12 : out SIGNED (17 downto 0));
	end component mult_window;
	
	component delay
	Port ( B_1, B_2 : in SIGNED (31 downto 0);
	           B_1_del, B_2_del : out SIGNED (31 downto 0);
	           clk, reset : in STD_LOGIC);
	end component;
	
	component Shift_Inv
	Port ( A_11, A_12, A_22 : in SIGNED (31 downto 0);
	           A_11_shift, A_12_shift, A_22_shift : out SIGNED (31 downto 0);
	           clk, reset : in STD_LOGIC);
	end component;
	
	component Calc_Denom
	Port ( A_11, A_12, A_22 : in SIGNED (31 downto 0);
				denom : out SIGNED (31 downto 0);
	           	clk, reset : in STD_LOGIC);
	end component;
	           
	component divide
	Port ( denom, A_11_shift, A_12_shift, A_22_shift : in SIGNED (31 downto 0);
	           A_11_inv, A_12_inv, A_22_inv : out SIGNED (31 downto 0);
	           clk, reset : in STD_LOGIC);
	end component;

	component result
	Port( A_11_inv, A_12_inv, A_22_inv, B_1_del, B_2_del : IN SIGNED (31 downto 0);
		u, v : OUT SIGNED (31 downto 0);
		clk, reset : in STD_LOGIC);
	end component;
	
	SIGNAL m_1, r_2, m_2, l_2, n_2, r_3, m_3, l_3, n_3 : UNSIGNED (7 downto 0);
	SIGNAL r_4, m_4, l_4, n_4, r_5, m_5, l_5, n_5 : UNSIGNED (7 downto 0);
	SIGNAL r_6, m_6, l_6, n_6, r_7, m_7, l_7, n_7 : UNSIGNED (7 downto 0);
	SIGNAL  r_8,  m_8, l_8, n_8, r_9, m_9, l_9, n_9 : UNSIGNED (7 downto 0);        
	SIGNAL  r_10, m_10, l_10, n_10, r_11, m_11, l_11, n_11 : UNSIGNED (7 downto 0);
	SIGNAL  r_12, m_12, l_12, n_12, m_13 : UNSIGNED (7 downto 0);      
	SIGNAL  x_2, y_2, t_2, x_3, y_3, t_3, x_4, y_4, t_4 : UNSIGNED (8 downto 0);  
	SIGNAL  x_5, y_5, t_5, x_6, y_6, t_6, x_7, y_7, t_7 : UNSIGNED (8 downto 0);
	SIGNAL  x_8, y_8, t_8, x_9, y_9, t_9, x_10, y_10, t_10 : UNSIGNED (8 downto 0);
	SIGNAL  x_11, y_11, t_11, x_12, y_12, t_12 : UNSIGNED (8 downto 0);
	
	SIGNAL b_1, b_2 : SIGNED (31 downto 0);
	SIGNAL a_11, a_12, a_22: SIGNED (31 downto 0);
	SIGNAL a_11_shift, a_12_shift, a_22_shift, denom : SIGNED (31 downto 0);
	SIGNAL a_11_inv, a_12_inv, a_22_inv, b_1_del, b_2_del : SIGNED (31 downto 0);
begin
	derivMod : deriv_window
		port map (	m_1 => m_1,
					r_2 => r_2, m_2 => m_2, l_2 => l_2, n_2 => n_2,          
					r_3 => r_3, m_3 => m_3, l_3 => l_3, n_3 => n_3,
					r_4 => r_4, m_4 => m_4, l_4 => l_4, n_4 => n_4,
					r_5 => r_5, m_5 => m_5, l_5 => l_5, n_5 => n_5,
					r_6 => r_6, m_6 => m_6, l_6 => l_6, n_6 => n_6,
					r_7 => r_7, m_7 => m_7, l_7 => l_7, n_7 => n_7,
					r_8 => r_8, m_8 => m_8, l_8 => l_8, n_8 => n_8,
					r_9 => r_9, m_9 => m_9, l_9 => l_9, n_9 => n_9,
					r_10 => r_10, m_10 => m_10, l_10 => l_10, n_10 => n_10,
					r_11 => r_11, m_11 => m_11, l_11 => l_11, n_11 => n_11,
					r_12 => r_12, m_12 => m_12, l_12 => l_12, n_12 => n_12,
					m_13 => m_13,		 
					x_2 => x_2, y_2 => y_2, t_2 => t_2,
					x_3 => x_3, y_3 => y_3, t_3 => t_3,
					x_4 => x_4, y_4 => y_4, t_4 => t_4,
					x_5 => x_5, y_5 => y_5, t_5 => t_5,
					x_6 => x_6, y_6 => y_6, t_6 => t_6,
					x_7 => x_7, y_7 => y_7, t_7 => t_7,
					x_8 => x_8, y_8 => y_8, t_8 => t_8,
					x_9 => x_9, y_9 => y_9, t_9 => t_9,
					x_10 => x_10, y_10 => y_10, t_10 => t_10,
					x_11 => x_11, y_11 => y_11, t_11 => t_11,
					x_12 => x_12, y_12 => y_12, t_12 => t_12,
					clk => clk,
					reset => reset);

	delayMod : delay
		port map (	B_1 => b_1,
					B_2 => b_2,
					B_1_del => b_1_del,
					B_2_del => b_2_del,
					clk => clk,
					reset => reset);
					
	shift_invMod : shift_inv
		port map (	a_11 => a_11,
					a_12 => a_12,
					a_22 => a_22,
					a_11_shift => a_11_shift,
					a_12_shift => a_12_shift,
					a_22_shift => a_22_shift,
					clk => clk,
					reset => reset);
	
	calc_denomMod : calc_denom
		port map (	a_11 => a_11,
					a_12 => a_12,
					a_22 => a_22,
					denom => denom,
					clk => clk,
					reset => reset);
	
	divideMod : divide
		port map (	denom => denom,
					A_11_shift => a_11_shift,
					A_12_shift => a_12_shift,
					A_22_shift => a_22_shift,
					A_11_inv => a_11_inv,
					A_12_inv => a_12_inv,
					A_22_inv => a_22_inv,
					clk => clk,
					reset => reset);
	
	resultMod: result
		PORT Map (	u => u,
					v => v,
					A_11_inv => a_11_inv,
					A_12_inv => a_12_inv,
					A_22_inv => a_22_inv,
					B_1_del => b_1_del,
					B_2_del => b_2_del,
					clk => clk,
					reset => reset);
					
					

end Behavioral;
