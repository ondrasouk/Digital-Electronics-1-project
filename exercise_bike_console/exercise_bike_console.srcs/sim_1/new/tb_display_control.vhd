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
--use IEEE.NUMERIC_STD.ALL;

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
    constant c_clk_div_sec : natural := 1000; --1us
    constant c_time_for_reset : natural := 2000; --2us

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
        s_speed <= b"00" & x"09115";
        s_distance <= b"00" & x"00007";
        s_calories <= b"00" & x"00003";
        s_max_speed <= b"00" & x"00004";
        s_button <= '0';
        wait for 17ns;
        wait for 25ns;
        s_button <= '1'; wait for 21ns; s_button <= '0';
        wait for 42ns;
        s_button <= '1'; wait for 21ns; s_button <= '0';
        wait for 42ns;
        s_button <= '1'; wait for 21ns; s_button <= '0';
        wait for 42ns;
        s_button <= '1'; wait for 21ns; s_button <= '0';
        wait for 42ns;
        s_button <= '1'; wait for 21ns; s_button <= '0';
        wait for 42ns;
        s_button <= '1'; wait for 21ns; s_button <= '0';
        wait;
    end process p_stimulus;
    
    --------------------------------------------------------------------
    -- Output validation process
    --------------------------------------------------------------------
    tb_check : process
    begin
        wait;
    end process tb_check;

end Behavioral;
