----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.04.2021 09:34:08
-- Design Name: 
-- Module Name: tb_display_control - Behavioral
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

entity tb_display_control is
--  Port ( );
end tb_display_control;

architecture Behavioral of tb_display_control is
    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    constant c_clk_div_sec : natural := 100; --0.1us
    constant c_time_for_reset : natural := 20; --20ns

    --Local signals for UUT
    -- inputs
    signal s_clk_100MHz : std_logic;
    signal s_button : std_logic;
    signal s_speed : std_logic_vector(22 - 1 downto 0);        -- in dekam/h
    signal s_distance : std_logic_vector(22 - 1 downto 0);     -- in meters
    signal s_calories : std_logic_vector(22 - 1 downto 0);     -- in cal
    signal s_max_speed : std_logic_vector(22 - 1 downto 0);    -- in dekam/h
    -- outputs
    signal s_reset : std_logic;
    signal s_leds  : std_logic_vector(5 - 1 downto 0);
    signal s_dp : std_logic_vector(4 - 1 downto 0);
    signal s_data3 : std_logic_vector(4 - 1 downto 0);
    signal s_data2 : std_logic_vector(4 - 1 downto 0);
    signal s_data1 : std_logic_vector(4 - 1 downto 0);
    signal s_data0 : std_logic_vector(4 - 1 downto 0);
begin
    -- Connecting testbench signals with speedometer entity (Unit Under Test)
    uut_display_control : entity work.display_control
        generic map(
            g_clk_div_sec  => c_clk_div_sec,
            g_time_for_reset => c_time_for_reset
        )
        port map(
            -- inputs
            clk => s_clk_100MHz,
            button_i => s_button,
            speed_i => s_speed,
            distance_i => s_distance,
            calories_i => s_calories,
            max_speed_i => s_max_speed,
            -- outputs
            reset => s_reset,
            leds_o => s_leds,
            dp_o => s_dp,
            data3_o => s_data3,
            data2_o => s_data2,
            data1_o => s_data1,
            data0_o => s_data0
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 100sec loop
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus begin" severity note;
        
        s_speed <= std_logic_vector(to_unsigned(1554 ,22));
        s_distance <= std_logic_vector(to_unsigned(2989 ,22));
        s_calories <= std_logic_vector(to_unsigned(9521 ,22));
        s_max_speed <= std_logic_vector(to_unsigned(5214 ,22));
        s_button <= '0';
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1011") and (s_data3 = x"1") and (s_data2 = x"5") and (s_data1 = x"5") and (s_data0 = x"4")
        report "Fault displaying 15.54" severity error;
        
        s_speed <= std_logic_vector(to_unsigned(91554 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1101") and (s_data3 = x"9") and (s_data2 = x"1") and (s_data1 = x"5") and (s_data0 = x"5")
        report "Fault displaying 915.5" severity error;
        
        s_speed <= std_logic_vector(to_unsigned(491554 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1111") and (s_data3 = x"4") and (s_data2 = x"9") and (s_data1 = x"1") and (s_data0 = x"5")
        report "Fault displaying 4915" severity error;
        
        wait until falling_edge(s_clk_100MHz);
        s_speed <= std_logic_vector(to_unsigned(5491554 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1111") and (s_data3 = x"9") and (s_data2 = x"9") and (s_data1 = x"9") and (s_data0 = x"9")
        report "Fault when displaying bigger number than 9999 km/h." severity error;
        
        s_button <= '1'; wait for 21ns; s_button <= '0'; -- next display (distance)
        
        s_speed <= std_logic_vector(to_unsigned(1558 ,22));
        s_distance <= std_logic_vector(to_unsigned(2989 ,22));
        s_calories <= std_logic_vector(to_unsigned(6514 ,22));
        s_max_speed <= std_logic_vector(to_unsigned(5247 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"0111") and (s_data3 = x"2") and (s_data2 = x"9") and (s_data1 = x"8") and (s_data0 = x"9")
        report "Fault displaying 2.989 km" severity error;
        
        s_distance <= std_logic_vector(to_unsigned(71558 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1011") and (s_data3 = x"7") and (s_data2 = x"1") and (s_data1 = x"5") and (s_data0 = x"5")
        report "Fault displaying 71.55 km" severity error;
        
        s_distance <= std_logic_vector(to_unsigned(571558 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1101") and (s_data3 = x"5") and (s_data2 = x"7") and (s_data1 = x"1") and (s_data0 = x"5")
        report "Fault displaying 571.5 km" severity error;
        
        s_distance <= std_logic_vector(to_unsigned(1571558 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1111") and (s_data3 = x"1") and (s_data2 = x"5") and (s_data1 = x"7") and (s_data0 = x"1")
        report "Fault displaying 1571 km" severity error;
        -- 2621.21 km is limitation
        
        s_button <= '1'; wait for 21ns; s_button <= '0'; -- next display (calories)
        
        s_calories <= std_logic_vector(to_unsigned(6514 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"0111") and (s_data3 = x"6") and (s_data2 = x"5") and (s_data1 = x"1") and (s_data0 = x"4")
        report "Fault displaying 6.514 kcal" severity error;
        
        s_calories <= std_logic_vector(to_unsigned(71558 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1011") and (s_data3 = x"7") and (s_data2 = x"1") and (s_data1 = x"5") and (s_data0 = x"5")
        report "Fault displaying 71.55 kcal" severity error;
        
        s_calories <= std_logic_vector(to_unsigned(571558 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1101") and (s_data3 = x"5") and (s_data2 = x"7") and (s_data1 = x"1") and (s_data0 = x"5")
        report "Fault displaying 571.5 kcal" severity error;
        
        s_calories <= std_logic_vector(to_unsigned(1186304 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1111") and (s_data3 = x"1") and (s_data2 = x"1") and (s_data1 = x"8") and (s_data0 = x"6")
        report "Fault displaying 1186 kcal" severity error;
        -- 4194.304 kcal is limitation
        
        s_button <= '1'; wait for 21ns; s_button <= '0'; -- next display (total time)
        
        s_calories <= std_logic_vector(to_unsigned(1304 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1011") and (s_data3 = x"0") and (s_data2 = x"0") and (s_data1 = x"0") and (s_data0 = x"0")
        report "Fault when displaying time 00:00 (MM:SS)" severity error;
        
        s_button <= '1'; wait for 21ns; s_button <= '0'; -- next display (max speed)
        
        s_max_speed <= std_logic_vector(to_unsigned(3214 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1011") and (s_data3 = x"3") and (s_data2 = x"2") and (s_data1 = x"1") and (s_data0 = x"4")
        report "Fault displaying 32.22" severity error;
        
        s_max_speed <= std_logic_vector(to_unsigned(91554 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1101") and (s_data3 = x"9") and (s_data2 = x"1") and (s_data1 = x"5") and (s_data0 = x"5")
        report "Fault displaying 915.5" severity error;
        
        s_max_speed <= std_logic_vector(to_unsigned(491554 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1111") and (s_data3 = x"4") and (s_data2 = x"9") and (s_data1 = x"1") and (s_data0 = x"5")
        report "Fault displaying 4915" severity error;
        
        wait until falling_edge(s_clk_100MHz);
        s_max_speed <= std_logic_vector(to_unsigned(5491554 ,22));
        wait until falling_edge(s_clk_100MHz);
        wait until falling_edge(s_clk_100MHz);
        assert (s_dp = b"1111") and (s_data3 = x"9") and (s_data2 = x"9") and (s_data1 = x"9") and (s_data0 = x"9")
        report "Fault when displaying bigger number than 9999 km/h." severity error;
        report "Display tests completed" severity note;
        
        s_button <= '1';
        wait for 805ns;
        assert (s_reset = '1')
        report "Fault when reseting (no reset signal generated)." severity error;
        wait for 80ns;
        assert (s_reset = '0')
        report "Fault when reseting (reset signal not taken down after 80ns)." severity error;
        s_button <= '0';
        
        report "Stimulus completed" severity note;
        wait;
    end process p_stimulus;

end Behavioral;
