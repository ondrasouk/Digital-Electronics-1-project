----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.04.2021 09:34:08
-- Design Name: 
-- Module Name: tb_speedometer - Behavioral
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

entity tb_speedometer is
--  Port ( );
end tb_speedometer;

architecture Behavioral of tb_speedometer is
    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    constant c_TIME_UNIT_LENGHT : natural := 10; --0.1ms / 1000 = 0.1us = 100ns

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset : std_logic;
    signal s_hall_sensor : std_logic;
    signal s_speed : std_logic_vector(22 - 1 downto 0);        -- in dekam/h
    signal s_distance : std_logic_vector(22 - 1 downto 0);     -- in meters
    signal s_calories : std_logic_vector(22 - 1 downto 0);     -- in cal
    signal s_max_speed : std_logic_vector(22 - 1 downto 0);    -- in dekam/h
begin
    -- Connecting testbench signals with speedometer entity (Unit Under Test)
    uut_speedometer : entity work.speedometer
        generic map(
            g_TIME_UNIT_LENGHT  => c_TIME_UNIT_LENGHT
        )
        port map(
            clk => s_clk_100MHz,
            reset => s_reset,
            hall_sensor_i => s_hall_sensor,
            speed_o => s_speed,
            distance_o => s_distance,
            calories_o => s_calories,
            max_speed_o => s_max_speed
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
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        -- Reset activated
        s_reset <= '1'; wait for 15ns;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    -- Speedup from 0 to 10 m/s = 3600 dekam/h = 36km/h
    -- c/v=t -> 2.5/10=0.25s -> in simulation t/1000 -> 0.25ms = 250us
    -- Note: Run the simulation for 20ms.
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus begin" severity note;
        s_hall_sensor <= '0';
        wait for 800ns;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        assert (s_speed = std_logic_vector(to_unsigned(0 ,22)))
        report "The speed should be 0.00 km/h (d_0), but it's not." severity error;
        wait for 1ms;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 800us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 700us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 550us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        assert (s_distance = std_logic_vector(to_unsigned(10 ,22))) -- there is one cycle delay.
        report "The distance should be 10m (d_10), but it's not." severity error;
        wait for 420us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 380us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 360us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 340us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 325us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 315us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 310us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 300us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 292us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 285us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 275us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 265us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 260us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 255us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        wait for 247us;
        s_hall_sensor <= '1';
        wait for 3us;
        s_hall_sensor <= '0';
        assert (s_speed = std_logic_vector(to_unsigned(3600 ,22)))
        report "The speed should be 36.00 km/h (d_3600), but it's not." severity error;
        wait until now > 16ms; --wait until flywheel virtually stops
        assert (s_speed = std_logic_vector(to_unsigned(0 ,22)))
        report "The speed should be 0.00 km/h (d_0), but it's not." severity error;
        -- When the speedup passed, there is nothing to test, probably everything works.
        -- Calories is very hard to test because the division in VHDL is always rounds down. 
        report "Stimulus completed" severity note;
        wait;
    end process p_stimulus;
end Behavioral;
