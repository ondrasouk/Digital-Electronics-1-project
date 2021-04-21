----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2021 14:21:33
-- Design Name: 
-- Module Name: hex_7seg - Behavioral
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

entity hex_7seg is
    Port (
        hex_i : in STD_LOGIC_VECTOR (3 downto 0);
        seg_o : out STD_LOGIC_VECTOR (6 downto 0)
    );
end hex_7seg;

architecture Behavioral of hex_7seg is

begin
    --------------------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display decoder. 
    -- Any time "hex_i" is changed, the process is "executed".
    -- Output pin seg_o(6) corresponds to segment A, seg_o(5) to B, etc.
    --------------------------------------------------------------------
    p_7seg_decoder : process(hex_i)begin
        case hex_i is
            when "0000" =>              -- 0
                seg_o <= "0000001";
            when "0001" =>              -- 1
                seg_o <= "1001111";
            when "0010" =>              -- 2
                seg_o <= "0010010";
            when "0011" =>              -- 3
                seg_o <= "0000110";
            when "0100" =>              -- 4
                seg_o <= "1001100";
            when "0101" =>              -- 5
                seg_o <= "0100100";
            when "0110" =>              -- 6
                seg_o <= "0100000";
            when "0111" =>              -- 7
                seg_o <= "0001111";
            when "1000" =>              -- 8
                seg_o <= "0000000";
            when "1001" =>              -- 9
                seg_o <= "0000100";
            when "1010" =>              -- A
                seg_o <= "0001000";
            when "1011" =>              -- B
                seg_o <= "1100000";
            when "1100" =>              -- C   
                seg_o <= "0110001";
            when "1101" =>              -- D
                seg_o <= "1000010";
            when "1110" =>              -- E
                seg_o <= "0110000";
            when "1111" =>              -- F
                seg_o <= "0111000";
            when others =>              -- undefined
                seg_o <= "0000000";
        end case;
    end process p_7seg_decoder;

end Behavioral;
