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
        g_RESISTLOAD : natural := 20; -- Magnetical brakes load. Work in Joules needed for one rotation.
        g_INERTIA_MOMENT : natural := 5000000; -- 10^4*pi^2*moment of inertia of flywheel. In kg*m^2.
        g_WHEEL_CIRCUMFERENCE : natural := 250; -- in centimeters (l=2*pi*r)
        g_ETIME_ZERO : unsigned(16 - 1 downto 0) := x"EA60"; -- d60000 = 6 sec 
        -- If no hall sensor input for some time then turn zero the speed of bike.
        g_TIME_UNIT_LENGHT : natural := 10000 -- 0.1 ms
    );
    Port (  clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            hall_sensor_i : in STD_LOGIC;
            speed_o : out std_logic_vector(22 - 1 downto 0);        -- in dekam/h
            distance_o : out std_logic_vector(22 - 1 downto 0);     -- in meters
            calories_o : out std_logic_vector(22 - 1 downto 0);     -- in cal
            max_speed_o : out std_logic_vector(22 - 1 downto 0));   -- in dekam/h
end speedometer;

architecture Behavioral of speedometer is
    signal s_en : STD_LOGIC;
    signal s_rst_t : STD_LOGIC := '0';                          --reset of clock divider and counter
    signal s_etime : std_logic_vector(16 - 1 downto 0);
    signal s_skip: std_logic;                                   --skip the next input from hall sensor and reset timer

    signal s_etime_local : unsigned(16 - 1 downto 0) := (others => '1');   -- elapsed time(n)
    
    signal s_speed_local : unsigned(22 - 1 downto 0) := (others => '0');       -- in cm/s
    signal s_speed1_local : unsigned(22 - 1 downto 0) := (others => '0');      -- in cm/s (n-1)
    signal s_speed2_local : unsigned(22 - 1 downto 0) := (others => '0');      -- in cm/s (n-2)
    signal s_speed3_local : unsigned(22 - 1 downto 0) := (others => '0');      -- in cm/s (n-3)
    signal s_avg_speed_local : unsigned(22 - 1 downto 0) := (others => '0');    -- in cm/s (average of 4)
    signal s_max_speed_local : unsigned(22 - 1 downto 0);   -- in cm/s
    signal s_distance_local : unsigned(20 - 1 downto 0);    -- total distance (in wheel circumferences, max.2621.44 km (250cm))
    signal s_inertia_local : unsigned(16 - 1 downto 0);     -- Actual inertia of flywheel in Joules
    signal s_inertia1_local : unsigned(16 - 1 downto 0);    -- Last inertia of flywheel in Joules
    signal s_work_local : unsigned(24 - 1 downto 0);        -- Work

    

begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en1 : entity work.clock_enable
        generic map(
            g_MAX => g_TIME_UNIT_LENGHT
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
    p_etime : process(clk,hall_sensor_i,reset)
    begin
        if reset = '1' then
            s_rst_t <= '1';
            s_etime_local <= (others => '0');
            s_distance_local <= (others => '0');
            s_skip <= '1';
        elsif ((s_rst_t = '1') and (s_etime = x"0000")) then
            s_rst_t <= '0'; -- on the next clock take down the reset for timer
        elsif (unsigned(s_etime) > g_ETIME_ZERO) then
            s_etime_local <= (others => '0');
            s_skip <= '1';
        end if;
        if rising_edge(hall_sensor_i) then
            if (s_skip = '1') and (reset = '0') then
                s_rst_t <= '1';
                s_skip <= '0';
            elsif reset = '0' then
                s_etime_local <= unsigned(s_etime);
                s_distance_local <= s_distance_local + 1;
                s_rst_t <= '1'; -- reset the timer and clock divider
            end if;
        end if;
    end process p_etime;
    
    --------------------------------------------------------------------
    -- p_calc:
    -- Calculate actual speed (average of last four speeds).
    -- Also monitor maximal speed, calories in total.
    --------------------------------------------------------------------
    p_calc : process(hall_sensor_i,reset,s_etime_local)
    begin
        if falling_edge(reset) then
            s_speed_local <= (others => '0');
            s_speed1_local <= (others => '0');
            s_speed2_local <= (others => '0');
            s_speed3_local <= (others => '0');
            s_avg_speed_local <= (others => '0');
            s_max_speed_local <= (others => '0');
            s_inertia_local <= (others => '0');
            s_inertia1_local <= (others => '0');
            s_work_local <= (others => '0');
        end if;
        if (s_etime_local = x"0000") and (reset = '0') then --flywheel is stopped
            s_speed_local <= (others => '0');
            s_speed1_local <= (others => '0');
            s_speed2_local <= (others => '0');
            s_speed3_local <= (others => '0');
            s_avg_speed_local <= (others => '0');
            s_inertia_local <= (others => '0');
        end if;
        if rising_edge(hall_sensor_i) and not(s_etime_local = x"0000") then
            if reset = '0' then
                s_speed3_local <= s_speed2_local;
                s_speed2_local <= s_speed1_local;
                s_speed1_local <= s_speed_local;
                s_speed_local <= (g_WHEEL_CIRCUMFERENCE*10000/resize(s_etime_local, 22)); -- m*1e-6/s*1e-4=cm/s
                s_avg_speed_local <= resize(resize(s_speed_local+s_speed1_local+s_speed2_local+s_speed3_local, 24)/4, 22);
                if (s_max_speed_local < s_avg_speed_local) then
                    s_max_speed_local <= s_avg_speed_local;
                end if;
                s_inertia1_local <= s_inertia_local;
                s_inertia_local <= resize(g_INERTIA_MOMENT/((s_etime_local * s_etime_local)/5000), 16);
                s_work_local <= s_work_local + s_inertia_local - s_inertia1_local + g_RESISTLOAD; -- in Joules
            end if;
        end if;
    end process p_calc;
    
    speed_o <= std_logic_vector(resize(resize(s_avg_speed_local*36, 26)/10, 22));
    max_speed_o <= std_logic_vector(resize(resize(s_max_speed_local*36, 26)/10, 22));
    distance_o <= std_logic_vector(resize(resize(s_distance_local * g_WHEEL_CIRCUMFERENCE, 30) / 100, 22));
    calories_o <= std_logic_vector(resize(resize(s_work_local*1000, 26)/4184, 22)); -- 1cal = 4.184 Joules
    
    
end Behavioral;
