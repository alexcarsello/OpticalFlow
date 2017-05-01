----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2017 10:48:40 AM
-- Design Name: 
-- Module Name: control - Behavioral
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

entity control is
    Port ( clk : in STD_LOGIC;
           reset_l : in STD_LOGIC;
           line_buf_full : in STD_LOGIC;
           n_line_buf_full: in STD_LOGIC;
           FF_en : out STD_LOGIC;
           data_valid : out STD_LOGIC;
           subtract : out STD_LOGIC;
           FIFO_rd : out STD_LOGIC;
           FIFO_clear : out STD_LOGIC;
           clean_FIFOs : out STD_LOGIC;
           FIFO_wr : out STD_LOGIC);
end control;

architecture Behavioral of control is

    TYPE states is (init, reset_line, start_line, fill_FIFO, rd_FIFO, run, done, cleanup);
    SIGNAL state: states := init;
    SIGNAL next_state : states := init;
    signal h : unsigned(7 downto 0);
    signal v : unsigned(7 downto 0);
    signal count_en : STD_LOGIC;
    signal reset_counter_l : STD_LOGIC;

begin
    --state register
    clkd: process (clk)
    begin
        if (clk'EVENT and clk='1') then
            if (reset_l = '1') then
                state <= init;
            else
                state <= next_state;
            end if;
        end if;
    end process clkd;
    
    --determine next state
    state_trans: process (state, h, v, line_buf_full, n_line_buf_full)
    begin
        next_state <= state;
        case state is
            when init =>        if (line_buf_full = '1' and n_line_buf_full = '1') then
                                    next_state <= reset_line;
                                end if;
            when reset_line =>  if (h >= 6) then
                                    next_state <= start_line;
                                end if;
                                
            when start_line =>  next_state <= fill_FIFO;
            
            when fill_FIFO 	=>	if (h >= 17) then
            						next_state <= rd_FIFO;
            					end if;
            when rd_FIFO	=> 	next_state <= run;
            					
            when run		=>	if (h >= 255 and v < 131) then
            						next_state <= reset_line;
            					elsif (h >= 255 and v >= 131) then
            						next_state <= done;
            					end if;
            					
            when done		=>	if (h >= 26) then
            						next_state <= cleanup;
            					end if;
            					
            when cleanup	=> next_state <= init;
        end case;
    end process state_trans;
    
    --define outputs
    output: process(state,h,v,line_buf_full,n_line_buf_full, reset_l)
    begin
        case state is
        	when init 		=>	FF_en <= '0';
        						subtract <= '0';
        						FIFO_rd <= '0';
        						FIFO_wr <= '0';
								FIFO_clear <= '1';
								count_en <= '0';
								reset_counter_l <= '0';
								clean_FIFOs <= '0'; 
        				
			when reset_line	=>	FF_en <= '1';
        						subtract <= '1';
        						FIFO_rd <= '1';
        						FIFO_wr <= '1';
        						FIFO_clear <= '0';
        						count_en <= '1';
        						reset_counter_l <= '1';
        						clean_FIFOs <= '0'; 
        						
			when start_line	=>	FF_en <= '1';
        						subtract <= '0';
        						FIFO_rd <= '0';
        						FIFO_wr <= '0';
        						FIFO_clear <= '1';
        						count_en <= '1'; 
        						reset_counter_l <= '1';
        						clean_FIFOs <= '0';
        						
			when fill_FIFO	=>	FF_en <= '1';
        						subtract <= '0';
        						FIFO_rd <= '0';
        						FIFO_wr <= '1';
        						FIFO_clear <= '0';
        						count_en <= '1'; 
        						reset_counter_l <= '1';
        						clean_FIFOs <= '0';
        						
        	when rd_FIFO 	=>	FF_en <= '1';
								subtract <= '0';
								FIFO_rd <= '1';
								FIFO_wr <= '1';
								FIFO_clear <= '0';
								count_en <= '1'; 
								reset_counter_l <= '1';
								clean_FIFOs <= '0';
        						
			when run		=>	FF_en <= '1';
        						subtract <= '1';
        						FIFO_rd <= '1';
        						FIFO_wr <= '1';
        						FIFO_clear <= '0';
        						count_en <= '1';
        						reset_counter_l <= '1';
        						clean_FIFOs <= '0';        						 
        						
			when done		=>	FF_en <= '0';
        						subtract <= '1';
        						FIFO_rd <= '1';
        						FIFO_wr <= '1';
        						FIFO_clear <= '0';
        						count_en <= '1';  
        						reset_counter_l <= '1';
        						clean_FIFOs <= '0';        						
        						
			when cleanup	=>	FF_en <= '0';
        						subtract <= '0';
        						FIFO_rd <= '0';
        						FIFO_wr <= '0';
        						FIFO_clear <= '0';
        						count_en <= '0';
        						reset_counter_l <= '0';
        						clean_FIFOs <= '1';        						        		        						         						        						       					
        					
        end case;
    end process output;
    
    --IMPLEMENT THE COUNTERS
    counters: process(clk)
    begin
        if (clk = '1' and clk'EVENT) then
            if (reset_counter_l = '0') then    
                h <= (others => '0');
                v <= (others => '0');
            elsif (count_en = '1') then
                if (h = 255) then
                    h <= (others => '0');
                    v <= v+1;
                else
                    h <= h+1;
                end if;
            end if;
        end if;
    end process  counters;
    
    data_valid <= '0' when (( v= 0 and h < 40) or ((v > 0) and (h >= 27) and (h < 40))) else '1';
                    
                     
end Behavioral;
