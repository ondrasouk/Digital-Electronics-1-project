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
    Port (
        clk : in STD_LOGIC;
        reset : inout STD_LOGIC;
        button : in STD_LOGIC;
        leds : out std_logic_vector(5 - 1 downto 0);
        s_speed : in std_logic_vector(22 - 1 downto 0);        -- in dekam/h
        s_distance : in std_logic_vector(22 - 1 downto 0);     -- in meters
        s_calories : in std_logic_vector(22 - 1 downto 0);     -- in cal
        s_max_speed : in std_logic_vector(22 - 1 downto 0);   -- in dekam/h
        dp_o    : out std_logic_vector(4 - 1 downto 0);
        data3_o : out  std_logic_vector(4 - 1 downto 0);
        data2_o : out  std_logic_vector(4 - 1 downto 0);
        data1_o : out  std_logic_vector(4 - 1 downto 0);
        data0_o : out  std_logic_vector(4 - 1 downto 0));
end display_control;

architecture Behavioral of display_control is
    signal s_en_t : STD_LOGIC;
    signal s_en_r : STD_LOGIC;
    signal s_rst_r : STD_LOGIC;
    signal s_temp_local : unsigned(22 - 1 downto 0);
    signal s_total_time : unsigned(19 - 1 downto 0);
    signal s_sel_display_local : unsigned(4 - 1 downto 0);
    signal s_rst_t_local : unsigned(2 - 1 downto 0);
begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en2 : entity work.clock_enable
        generic map(
            g_MAX => 1000000000 -- 1s
        )
        port map(
            clk => clk,
            reset => reset,
            ce_o => s_en_t
        );
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en3 : entity work.clock_enable
        generic map(
            g_MAX => 2000000000 -- 2s
        )
        port map(
            clk => clk,
            reset => s_rst_r,
            ce_o => s_en_r
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up entity
    bin_cnt1 : entity work.cnt_up
        generic map(
            g_CNT_WIDTH => 16
        )
        port map(
            clk => clk,
            reset => reset,
            en_i => s_en_t,
            unsigned(cnt_o) => s_total_time
        );


    --------------------------------------------------------------------
    -- p_total_time:
    -- Counter counting seconds.
    --------------------------------------------------------------------
    p_total_time : process(s_en_t, reset)
    begin
        if rising_edge(reset) then
            s_total_time <= (others => '0');
        elsif rising_edge(s_en_t) then
            s_total_time <= s_total_time + 1;
        end if;
    end process p_total_time;
    
    
    --------------------------------------------------------------------
    -- p_display_selection:
    -- Counter reacting for falling edge of button and when long press
    -- (8s) reset sets on and then off.
    --------------------------------------------------------------------
    p_display_selection : process(clk, button)
    begin
        if rising_edge(button) then
            s_rst_r <= '0';
        elsif falling_edge(button) then
            s_rst_r <= '1';
            s_sel_display_local <= s_sel_display_local + 1;
            if (s_sel_display_local = 5) then
                s_sel_display_local <= (others => '0');
            end if;
        else
            if rising_edge(s_en_r) and (s_rst_t_local = "11") then
                s_rst_t_local <= (others => '0');
                s_rst_r <= '1';
                reset <= '1';
            elsif rising_edge(s_en_r) then
                s_rst_t_local <= s_rst_t_local + 1;
            elsif (reset = '1') and rising_edge(clk) and (s_total_time = 0) then
                reset <= '0';
                s_rst_t_local <= (others => '0');
            end if;
        end if;
    end process p_display_selection;
    
    
    --------------------------------------------------------------------
    -- p_display_control:
    -- Converts input number to format that is compatible with 
    -- driver_7seg_4digits and displays only one number.
    --------------------------------------------------------------------
    p_display_control : process(s_speed)
    begin
        case s_sel_display_local is
            when x"0" => -- speed
                s_temp_local <= unsigned(s_speed);
                if ((s_temp_local / 10000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(s_temp_local / 1000);
                    data2_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data1_o <= std_logic_vector((s_temp_local mod 100) / 10);
                    data0_o <= std_logic_vector(s_temp_local mod 10);
                elsif ((s_temp_local / 100000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(s_temp_local / 10000);
                    data2_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data1_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data0_o <= std_logic_vector((s_temp_local mod 100) / 10);
                elsif ((s_temp_local / 1000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(s_temp_local / 100000);
                    data2_o <= std_logic_vector((s_temp_local mod 100000) / 10000);
                    data1_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data0_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                end if;
            when x"1" => -- distance
                s_temp_local <= unsigned(s_distance);
                if ((s_temp_local / 10000) < 1) then -- format DDD.D
                    dp_o <= b"0111";
                    data3_o <= std_logic_vector(s_temp_local / 1000);
                    data2_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data1_o <= std_logic_vector((s_temp_local mod 100) / 10);
                    data0_o <= std_logic_vector(s_temp_local mod 10);
                elsif ((s_temp_local / 100000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(s_temp_local / 10000);
                    data2_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data1_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data0_o <= std_logic_vector((s_temp_local mod 100) / 10);
                elsif ((s_temp_local / 1000000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(s_temp_local / 100000);
                    data2_o <= std_logic_vector((s_temp_local mod 100000) / 10000);
                    data1_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data0_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                elsif ((s_temp_local / 10000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(s_temp_local / 1000000);
                    data2_o <= std_logic_vector((s_temp_local mod 1000000) / 100000);
                    data1_o <= std_logic_vector((s_temp_local mod 100000) / 10000);
                    data0_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                end if;
            when x"2" => -- distance
                s_temp_local <= unsigned(s_calories);
                if ((s_temp_local / 10000) < 1) then -- format DDD.D
                    dp_o <= b"0111";
                    data3_o <= std_logic_vector(s_temp_local / 1000);
                    data2_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data1_o <= std_logic_vector((s_temp_local mod 100) / 10);
                    data0_o <= std_logic_vector(s_temp_local mod 10);
                elsif ((s_temp_local / 100000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(s_temp_local / 10000);
                    data2_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data1_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data0_o <= std_logic_vector((s_temp_local mod 100) / 10);
                elsif ((s_temp_local / 1000000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(s_temp_local / 100000);
                    data2_o <= std_logic_vector((s_temp_local mod 100000) / 10000);
                    data1_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data0_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                elsif ((s_temp_local / 10000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(s_temp_local / 1000000);
                    data2_o <= std_logic_vector((s_temp_local mod 1000000) / 100000);
                    data1_o <= std_logic_vector((s_temp_local mod 100000) / 10000);
                    data0_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                end if;
            when x"3" => -- total time
                if (s_total_time < 3600) then -- MM.SS
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector((s_total_time / 60) / 10);
                    data2_o <= std_logic_vector((s_total_time / 60) mod 10);
                    data1_o <= std_logic_vector((s_total_time mod 60) / 10);
                    data0_o <= std_logic_vector((s_total_time mod 60) mod 10);
                else -- HH.MM
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector((s_total_time / 3600) / 10);
                    data2_o <= std_logic_vector((s_total_time / 3600) mod 10);
                    data1_o <= std_logic_vector(((s_total_time mod 3600) / 60) / 10);
                    data0_o <= std_logic_vector(((s_total_time mod 3600) / 60) mod 10);
                end if;
            when x"4" => -- maximal speed
                s_temp_local <= unsigned(s_max_speed);
                if ((s_temp_local / 10000) < 1) then -- format DD.DD
                    dp_o <= b"1011";
                    data3_o <= std_logic_vector(s_temp_local / 1000);
                    data2_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data1_o <= std_logic_vector((s_temp_local mod 100) / 10);
                    data0_o <= std_logic_vector(s_temp_local mod 10);
                elsif ((s_temp_local / 100000) < 1) then -- format DDD.D
                    dp_o <= b"1101";
                    data3_o <= std_logic_vector(s_temp_local / 10000);
                    data2_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data1_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                    data0_o <= std_logic_vector((s_temp_local mod 100) / 10);
                elsif ((s_temp_local / 1000000) < 1) then -- format DDDD
                    dp_o <= b"1111";
                    data3_o <= std_logic_vector(s_temp_local / 100000);
                    data2_o <= std_logic_vector((s_temp_local mod 100000) / 10000);
                    data1_o <= std_logic_vector((s_temp_local mod 10000) / 1000);
                    data0_o <= std_logic_vector((s_temp_local mod 1000) / 100);
                end if;
        end case;
    end process p_display_control;

end Behavioral;
