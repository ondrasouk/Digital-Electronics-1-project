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
        speed_i : in std_logic_vector(22 - 1 downto 0);         -- in dekam/h
        distance_i : in std_logic_vector(22 - 1 downto 0);      -- in meters
        calories_i : in std_logic_vector(22 - 1 downto 0);      -- in cal
        max_speed_i : in std_logic_vector(22 - 1 downto 0);     -- in dekam/h
        dp_o    : out std_logic_vector(4 - 1 downto 0);         -- decimal point output (leftmost bit to leftomost digit)
        data3_o : out  std_logic_vector(4 - 1 downto 0);        -- signal output of leftmost digit
        data2_o : out  std_logic_vector(4 - 1 downto 0);
        data1_o : out  std_logic_vector(4 - 1 downto 0);
        data0_o : out  std_logic_vector(4 - 1 downto 0));       -- signal output of rightmost digit
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
    -- p_display_selection:
    -- Counter reacting for falling edge of button and when long press
    -- (8s) s_reset sets on and then off.
    --------------------------------------------------------------------
    p_display_selection : process(clk, button_i, s_en_r)
    begin
        if rising_edge(button_i) then
            s_rst_r_local <= '0';
        end if;
        if falling_edge(button_i) then
            s_sel_display_local <= s_sel_display_local + 1;
            if (s_sel_display_local > x"3") then
                s_sel_display_local <= x"0";
            end if;
            s_rst_r_local <= '1';
            s_rst_t_local <= "00";
        end if;
        if rising_edge(s_en_r) then
            if s_rst_t_local = "11" then
                s_rst_t_local <= (others => '0');
                s_rst_r_local <= '1';
                s_reset <= '1';
            else
                s_rst_t_local <= s_rst_t_local + 1;
            end if;
        end if;
        if (s_reset = '1') and rising_edge(clk) and (s_total_time = 0) then
            s_reset <= '0';
            s_rst_t_local <= (others => '0');
        end if;
    end process p_display_selection;
    
    
    --------------------------------------------------------------------
    -- p_display_control:
    -- Converts input number to format that is compatible with 
    -- driver_7seg_4digits and displays only one number.
    -- note:
    --   The omitted numbers is rounded down so 155.79 km -> 155.7 km.
    --------------------------------------------------------------------
    p_display_control : process(clk)
    begin
        case s_sel_display_local is
            when x"0" => -- speed
                s_temp_local <= unsigned(speed_i);
                leds_o <= b"10000";
                if ((s_temp_local / 10000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    data0_o <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                else -- for higher numbers display only 9999
                    dp_o <= b"1111";
                    data3_o <= x"9";
                    data2_o <= x"9";
                    data1_o <= x"9";
                    data0_o <= x"9";
                end if;
            when x"1" => -- distance
                s_temp_local <= unsigned(distance_i);
                leds_o <= b"01000";
                if ((s_temp_local / 10000) < 1) then -- format D.DDD
                    dp_o <= b"0111";
                    data3_o <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    data0_o <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                elsif ((s_temp_local / 10000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(resize(s_temp_local / 1000000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 1000000) / 100000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                end if;
            when x"2" => -- kcalories
                s_temp_local <= unsigned(calories_i);
                leds_o <= b"00100";
                if ((s_temp_local / 10000) < 1) then -- format D.DDD
                    dp_o <= b"0111";
                    data3_o <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    data0_o <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                elsif ((s_temp_local / 10000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(resize(s_temp_local / 1000000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 1000000) / 100000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                end if;
            when x"3" => -- total time
                leds_o <= b"00010";
                if (s_total_time < 3600) then -- MM.SS
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(resize((s_total_time / 60) / 10, 4));
                    data2_o <= std_logic_vector(resize((s_total_time / 60) mod 10, 4));
                    data1_o <= std_logic_vector(resize((s_total_time mod 60) / 10, 4));
                    data0_o <= std_logic_vector(resize((s_total_time mod 60) mod 10, 4));
                else -- HH.MM
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(resize((s_total_time / 3600) / 10, 4));
                    data2_o <= std_logic_vector(resize((s_total_time / 3600) mod 10, 4));
                    data1_o <= std_logic_vector(resize(((s_total_time mod 3600) / 60) / 10, 4));
                    data0_o <= std_logic_vector(resize(((s_total_time mod 3600) / 60) mod 10, 4));
                end if;
            when x"4" => -- maximal speed
                s_temp_local <= unsigned(max_speed_i);
                leds_o <= b"00001";
                if ((s_temp_local / 10000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(resize(s_temp_local / 1000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                    data0_o <= std_logic_vector(resize(s_temp_local mod 10, 4));
                elsif ((s_temp_local / 100000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(resize(s_temp_local / 10000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 100) / 10, 4));
                elsif ((s_temp_local / 1000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(resize(s_temp_local / 100000, 4));
                    data2_o <= std_logic_vector(resize((s_temp_local mod 100000) / 10000, 4));
                    data1_o <= std_logic_vector(resize((s_temp_local mod 10000) / 1000, 4));
                    data0_o <= std_logic_vector(resize((s_temp_local mod 1000) / 100, 4));
                else -- for higher numbers display only 9999
                    dp_o <= b"1111";
                    data3_o <= x"9";
                    data2_o <= x"9";
                    data1_o <= x"9";
                    data0_o <= x"9";
                end if;
            when others => -- there are no other states.
        end case;
    end process p_display_control;

    reset <= s_reset;
end Behavioral;
