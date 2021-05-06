----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.04.2021 15:14:43
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port (
        CLK100MHZ   : in STD_LOGIC;
        btn0        : in STD_LOGIC; -- right BTN0 button
        AN0         : out STD_LOGIC; -- AN0
        AN1         : out STD_LOGIC; -- AN1
        AN2         : out STD_LOGIC; -- AN2
        AN3         : out STD_LOGIC; -- AN3
        A           : out STD_LOGIC; -- A
        B           : out STD_LOGIC; -- B
        C           : out STD_LOGIC; -- C
        D           : out STD_LOGIC; -- D
        E           : out STD_LOGIC; -- E
        F           : out STD_LOGIC; -- F
        G           : out STD_LOGIC; -- G
        P           : out STD_LOGIC; -- P (DP)
        LED1        : out STD_LOGIC; -- LED1
        LED2        : out STD_LOGIC; -- LED2
        LED3        : out STD_LOGIC; -- LED3
        LED4        : out STD_LOGIC; -- LED4
        LED5        : out STD_LOGIC; -- LED5
        HALL        : in STD_LOGIC  -- Hall sensor
    );
end top;

architecture Behavioral of top is
    -- outternal reset
    signal s_reset      : std_logic;
    
    signal s_speed      : std_logic_vector(22 - 1 downto 0);
    signal s_distance   : std_logic_vector(22 - 1 downto 0);
    signal s_calories   : std_logic_vector(22 - 1 downto 0);
    signal s_max_speed  : std_logic_vector(22 - 1 downto 0);
    
    signal s_dp         : std_logic_vector(4 - 1 downto 0);
    signal s_data0      : std_logic_vector(4 - 1 downto 0);
    signal s_data1      : std_logic_vector(4 - 1 downto 0);
    signal s_data2      : std_logic_vector(4 - 1 downto 0);
    signal s_data3      : std_logic_vector(4 - 1 downto 0);

begin

    --------------------------------------------------------------------
    -- outstance (copy) of speedometer entity
    speedometer : entity work.speedometer
        port map(
            clk             => CLK100MHZ,
            reset           => s_reset,
            hall_sensor_i   => HALL,
            speed_o         => s_speed,
            distance_o      => s_distance,
            calories_o      => s_calories,
            max_speed_o     => s_max_speed
        );
        
    --------------------------------------------------------------------
    -- outstance (copy) of display_control entity
    display_control : entity work.display_control
        port map(
            clk         => CLK100MHZ,
            speed_i     => s_speed,
            distance_i  => s_distance,
            calories_i  => s_calories,
            max_speed_i => s_max_speed,
            button_i    => btn0,
            reset       => s_reset,
            leds_o(0)   => LED1,
            leds_o(1)   => LED2,
            leds_o(2)   => LED3,
            leds_o(3)   => LED4,
            leds_o(4)   => LED5
        );

    --------------------------------------------------------------------
    -- outstance (copy) of driver_7seg_4digits entity
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk         => CLK100MHZ,
            reset       => s_reset,
            data0_i     => s_data0,
            data1_i     => s_data1,
            data2_i     => s_data2,
            data3_i     => s_data3,
            dp_i        => s_dp,
            seg_o(6)    => A,
            seg_o(5)    => B,
            seg_o(4)    => C,
            seg_o(3)    => D,
            seg_o(2)    => E,
            seg_o(1)    => F,
            seg_o(0)    => G,
            dp_o        => P,
            dig_o(0)    => AN0,
            dig_o(1)    => AN1,
            dig_o(2)    => AN2,
            dig_o(3)    => AN3
        );

end Behavioral;
