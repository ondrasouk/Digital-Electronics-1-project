----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ondřej Soukeník
-- 
-- Create Date: 13.04.2021 13:12:51
-- Design Name: 
-- Module Name: speedometer - Behavioral
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

entity speedometer is
    generic(
        g_RESISTLOAD : natural := 16; -- Magnetical brakes load in miliN/m (g*m^2) when T = 1s
        g_INERTIA_MOMENT : natural := 800; -- moment of inertia of flywheel. In g*m^2.
        g_WHEEL_CIRCUMFERENCE : natural := 250; -- in centimeters (l=2*pi*r)
        g_ETIME_ZERO : unsigned(16 - 1 downto 0) := x"9C40" -- d40000 = 4s. 
        -- If no hall sensor input for some time then turn zero the speed of bike.
    );
    Port (  clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            hall_sensor_i : in STD_LOGIC;
            s_speed : out std_logic_vector(22 - 1 downto 0);        -- in dekam/h
            s_distance : out std_logic_vector(20 - 1 downto 0);     -- in meters
            s_calories : out std_logic_vector(20 - 1 downto 0);     -- in cal
            s_max_speed : out std_logic_vector(22 - 1 downto 0));   -- in dekam/h
end speedometer;

architecture Behavioral of speedometer is
    signal s_en : STD_LOGIC;
    signal s_rst_t : STD_LOGIC;                         --reset of clock divider and counter
    signal s_etime : std_logic_vector(16 - 1 downto 0);

    signal s_etime_local : unsigned(16 - 1 downto 0);   -- elapsed time(n)
    signal s_etime1_local : unsigned(16 - 1 downto 0);  -- elapsed time(n-1)
    signal s_etime2_local : unsigned(16 - 1 downto 0);  -- elapsed time(n-2)
    signal s_etime3_local : unsigned(16 - 1 downto 0);  -- elapsed time(n-3)
    
    signal s_speed_local : unsigned(22 - 1 downto 0);       -- in cm/s
    signal s_distance_local : unsigned(20 - 1 downto 0);    -- total distance (in wheel circumferences, max.2621.44 km (250cm))
    signal s_calories_local : unsigned(22 - 1 downto 0);    -- sum of calories
    signal s_work_local : unsigned(16 - 1 downto 0);        -- Work needed between one rotation
    signal s_max_speed_local : unsigned(20 - 1 downto 0);   -- in cm/s
    

begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en1 : entity work.clock_enable
        generic map(
            g_MAX => 100000 -- 0.1ms
        )
        port map(
            clk => clk,
            reset => s_rst_t,
            ce_o => s_en
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up entity
    bin_cnt0 : entity work.cnt_up
        generic map(
            g_CNT_WIDTH => 16
        )
        port map(
            clk => clk,
            reset => s_rst_t,
            en_i => s_en,
            cnt_o => s_etime
        );





    --------------------------------------------------------------------
    -- p_etime:
    -- Measure elapsed time using clock divider and counter.
    --------------------------------------------------------------------
    p_etime : process(clk,hall_sensor_i)
    begin
        if rising_edge(clk) and (s_rst_t = '1') and (s_etime = x"0000") then
            s_rst_t <= '0'; -- on the next clock take down the reset for timer
        elsif rising_edge(hall_sensor_i) then
            s_etime3_local <= s_etime2_local;
            s_etime2_local <= s_etime1_local;
            s_etime1_local <= s_etime_local;
            s_etime_local <= unsigned(s_etime);
            s_rst_t <= '1'; -- reset the timer and clock divider
            s_distance_local <= s_distance_local + 1;
        end if;
        if (rising_edge(clk) and (unsigned(s_etime) > g_ETIME_ZERO)) then
            s_etime3_local <= x"FFFF";
            s_etime2_local <= x"FFFF";
            s_etime1_local <= x"FFFF";
            s_etime_local  <= x"FFFF";
            s_speed_local <= x"0000";
        end if;
    end process p_etime;
    
    
    --------------------------------------------------------------------
    -- p_calc:
    -- Calculate actual speed (average of last four speeds).
    -- Also monitor maximal speed, calories in total.
    --------------------------------------------------------------------
    p_calc : process(hall_sensor_i)
    begin
        if rising_edge(hall_sensor_i) then
            s_speed_local <= (g_WHEEL_CIRCUMFERENCE*10000/s_etime_local + g_WHEEL_CIRCUMFERENCE*10000/s_etime1_local + g_WHEEL_CIRCUMFERENCE*10000/s_etime2_local + g_WHEEL_CIRCUMFERENCE*10000/s_etime3_local)/4; -- m*1e-6/s*1e-4=cm/s
            -- averageing of last four speeds (v=s/t)
            if (s_max_speed_local < s_speed_local) then
                s_max_speed_local <= s_speed_local;
            end if;
            s_work_local <= (((g_INERTIA_MOMENT/s_etime_local) + (g_RESISTLOAD/(s_etime_local*s_etime_local))) - (g_INERTIA_MOMENT/s_etime1_local)); -- in Joules
            s_calories_local <= s_calories_local + ((s_work_local * 1000) / 4184);
        end if;
    end process p_calc;
    s_speed <= std_logic_vector(resize(s_speed_local, 22)*36);
    s_max_speed <= std_logic_vector(resize(s_max_speed_local, 22)*36);
    s_distance <= std_logic_vector((resize(s_distance_local, 20)*g_WHEEL_CIRCUMFERENCE)/100);
    s_calories <= std_logic_vector(s_calories_local);

    
end Behavioral;
