----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2016 09:31:49 AM
-- Design Name: 
-- Module Name: StkPntr - Stk_dtfl
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TPointer is
end TPointer;

architecture TStk_dtfl of TPointer is

signal CLK, RST, SP_LD, SP_INCR, SP_DECR : std_logic := '0';
signal DATA_IN, DATA_OUT : std_logic_vector(7 downto 0) := x"00";

begin

CLK <= not CLK after 1 ns;
SP_LD <= not SP_LD after 2 ns;
SP_INCR <= not SP_INCR after 4 ns;
SP_DECR <= not SP_DECR after 8 ns;

DATA_IN <= x"A4", x"23" after 2 ns, x"FF" after 8 ns, x"82" after 16 ns;

RESET: process
    begin
    RST <= '0';
    wait for 16 ns;
    RST <= '1';
    wait for 4 ns;
    end process RESET;

CLOCK: process (CLK, DATA_IN, RST, SP_LD, SP_INCR, SP_DECR)
    variable data : std_logic_vector(7 downto 0) := x"00";
    begin
        if (RST = '1') then
            data := x"00";
        elsif (rising_edge(CLK)) then
            if (SP_LD = '1') then
                data := DATA_IN;
            elsif (SP_INCR = '1') then
                data := data + 1;
            elsif (SP_DECR = '1') then
                data := data - 1;
            end if;
        end if;
        
        DATA_OUT <= data;
    end process CLOCK;

end TStk_dtfl;
