----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Ondřej Soukeník
-- 
-- Create Date: 21.04.2021 14:16:08
-- Design Name: 
-- Module Name: display_control - Behavioral
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

entity display_control is
    generic (
        g_clk_div_sec : natural := 1000000000; -- 1s
        g_time_for_reset : natural := 2000000000 -- 2s
    );
    Port (
        clk : in STD_LOGIC;
        reset : out STD_LOGIC;
        button_i : in STD_LOGIC;
        leds_o : out std_logic_vector(5 - 1 downto 0);
        s_speed : in std_logic_vector(22 - 1 downto 0);         -- in dekam/h
        s_distance : in std_logic_vector(22 - 1 downto 0);      -- in meters
        s_calories : in std_logic_vector(22 - 1 downto 0);      -- in cal
        s_max_speed : in std_logic_vector(22 - 1 downto 0);     -- in dekam/h
        s_dp    : out std_logic_vector(4 - 1 downto 0);         -- decimal point output (leftmost bit to leftomost digit)
        s_data3 : out  std_logic_vector(4 - 1 downto 0);        -- signal output of leftmost digit
        s_data2 : out  std_logic_vector(4 - 1 downto 0);
        s_data1 : out  std_logic_vector(4 - 1 downto 0);
        s_data0 : out  std_logic_vector(4 - 1 downto 0));       -- signal output of rightmost digit
end display_control;

architecture Behavioral of display_control is
    signal s_en_t : STD_LOGIC;                          -- clock enable for total time
    signal s_en_r : STD_LOGIC;                          -- clock enable for reset
    signal s_rst_r_local : STD_LOGIC := '1';            -- reset for timer counting time to reset
    signal s_reset : STD_LOGIC := '1';                  -- local signal for global reset signal
    signal s_temp_local : unsigned(22 - 1 downto 0);
    signal s_total_time : unsigned(19 - 1 downto 0) := (others => '0'); -- time from start or reset in seconds
    signal s_sel_display_local : unsigned(4 - 1 downto 0) := x"0";      -- display selection
    signal s_rst_t_local : unsigned(2 - 1 downto 0);    -- counter for reset
begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en2 : entity work.clock_enable
        generic map(
            g_MAX => g_clk_div_sec
        )
        port map(
            clk => clk,
            reset => s_reset,
            ce_o => s_en_t
        );
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en3 : entity work.clock_enable
        generic map(
            g_MAX => g_time_for_reset
        )
        port map(
            clk => clk,
            reset => s_rst_r_local,
            ce_o => s_en_r
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up entity
    bin_cnt1 : entity work.cnt_up
        generic map(
            g_CNT_WIDTH => 19
        )
        port map(
            clk => clk,
            reset => s_reset,
            en_i => s_en_t,
            unsigned(cnt_o) => s_total_time
        );


    --------------------------------------------------------------------
    -- p_total_time:
    -- Counter counting seconds.
    --------------------------------------------------------------------
    p_total_time : process(s_en_t, s_reset)
    begin
        if rising_edge(s_reset) then
            s_total_time <= (others => '0');
        elsif rising_edge(s_en_t) then
            s_total_time <= s_total_time + 1;
        end if;
    end process p_total_time;
    
    
    --------------------------------------------------------------------
    -- p_display_selection:
    -- Counter reacting for falling edge of button and when long press
    -- (8s) s_reset sets on and then off.
    --------------------------------------------------------------------
    p_display_selection : process(clk, button_i)
    begin
        if rising_edge(button_i) then
            s_rst_r_local <= '0';
        elsif falling_edge(button_i) then
            s_sel_display_local <= s_sel_display_local + 1;
            if (s_sel_display_local > x"3") then
                s_sel_display_local <= x"0";
            end if;
            s_rst_r_local <= '1';
            s_rst_t_local <= "00";
        else
            if rising_edge(s_en_r) and (s_rst_t_local = "11") then
                s_rst_t_local <= (others => '0');
                s_rst_r_local <= '1';
                s_reset <= '1';
            elsif rising_edge(s_en_r) then
                s_rst_t_local <= s_rst_t_local + 1;
            elsif (s_reset = '1') and rising_edge(clk) and (s_total_time = 0) then
                s_reset <= '0';
                s_rst_t_local <= (others => '0');
            end if;
        end if;
    end process p_display_selection;
    
    
    --------------------------------------------------------------------
    -- p_display_control:
    -- Converts input number to format that is compatible with 
    -- driver_7seg_4digits and displays only one number.
    --------------------------------------------------------------------
    p_display_control : process(clk)
    begin
        case s_sel_display_local is
            when x"0" => -- speed
                s_temp_local <= unsigned(s_speed);
                leds_o <= b"10000";
                if ((s_temp_local / 10000) < 1) then -- format DD.DD
                    s_dp <= b"1011";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    s_data0 <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DDD.D
                    s_dp <= b"1101";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDDD
                    s_dp <= b"1111";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                end if;
            when x"1" => -- distance
                s_temp_local <= unsigned(s_distance);
                leds_o <= b"01000";
                if ((s_temp_local / 10000) < 1) then -- format DDD.D
                    s_dp <= b"0111";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    s_data0 <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DD.DD
                    s_dp <= b"1011";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDD.D
                    s_dp <= b"1101";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                elsif ((s_temp_local / 10000000) < 1) then -- format DDDD
                    s_dp <= b"1111";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 1000000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 1000000) / 100000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                end if;
            when x"2" => -- distance
                s_temp_local <= unsigned(s_calories);
                leds_o <= b"00100";
                if ((s_temp_local / 10000) < 1) then -- format DDD.D
                    s_dp <= b"0111";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    s_data0 <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DD.DD
                    s_dp <= b"1011";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDD.D
                    s_dp <= b"1101";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                elsif ((s_temp_local / 10000000) < 1) then -- format DDDD
                    s_dp <= b"1111";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 1000000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 1000000) / 100000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                end if;
            when x"3" => -- total time
                leds_o <= b"00010";
                if (s_total_time < 3600) then -- MM.SS
                    s_dp <= b"1011";
                    s_data3 <= std_logic_vector(resize((s_total_time / 60) / 10, 4));
                    s_data2 <= std_logic_vector(resize((s_total_time / 60) mod 10, 4));
                    s_data1 <= std_logic_vector(resize((s_total_time mod 60) / 10, 4));
                    s_data0 <= std_logic_vector(resize((s_total_time mod 60) mod 10, 4));
                else -- HH.MM
                    s_dp <= b"1011";
                    s_data3 <= std_logic_vector(resize((s_total_time / 3600) / 10, 4));
                    s_data2 <= std_logic_vector(resize((s_total_time / 3600) mod 10, 4));
                    s_data1 <= std_logic_vector(resize(((s_total_time mod 3600) / 60) / 10, 4));
                    s_data0 <= std_logic_vector(resize(((s_total_time mod 3600) / 60) mod 10, 4));
                end if;
            when x"4" => -- maximal speed
                s_temp_local <= unsigned(s_max_speed);
                leds_o <= b"00001";
                if ((s_temp_local / 10000) < 1) then -- format DD.DD
                    s_dp <= b"1011";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    s_data0 <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DDD.D
                    s_dp <= b"1101";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDDD
                    s_dp <= b"1111";
                    s_data3 <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    s_data2 <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    s_data1 <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    s_data0 <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                end if;
            when others => -- there are no other states.
        end case;
    end process p_display_control;

    reset <= s_reset;
end Behavioral;
