----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2016 09:32:33 AM
-- Design Name: 
-- Module Name: Flags - Flag_dtfl
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

entity tFlags is
end tFlags;

architecture tFlag_dtfl of tFlags is
signal LD, CLK, SET, CLR, DATA_IN, DATA_OUT : std_logic := '0';
begin

CLK <= not CLK after 2 ns;
LD <= not LD after 4 ns;
SET <= not SET after 8 ns;
CLR <= not CLR after 12 ns;
DATA_IN <= '1', '0' after 2 ns, '1' after 10 ns, '0' after 20 ns;
CLOCK: process (CLK, SET, CLR, DATA_IN, LD)
    variable data : std_logic := '0';
    begin
        if (rising_edge(CLK)) then
            if (CLR = '1') then
                data := '0';
            elsif (SET = '1') then
                data := '1';
            else
                if (LD = '1') then
                    data := DATA_IN;
                end if;
            end if;
        end if;
        DATA_OUT <= data;
    end process CLOCK;

end tFlag_dtfl;
