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

entity Pointer is
  Port ( RST, SP_LD, SP_INCR, SP_DECR : in std_logic;
         DATA_IN : std_logic_vector(7 downto 0);
         CLK : in std_logic;
         DATA_OUT : out std_logic_vector(7 downto 0));
end Pointer;

architecture Stk_dtfl of Pointer is

begin
CLOCK: process (CLK, DATA_IN, RST, SP_LD, SP_INCR, SP_DECR)
    variable data : std_logic_vector(7 downto 0) := x"00";
    begin
        if (RST) then
            data := x"00";
        elsif (rising_edge(CLK)) then
            if (LD = '1') then
                data := DATA_IN;
            elsif (INCR = '1') then
                data := data + 1;
            elsif (DECR = '1') then
                data := data - 1;
            end if;
        end if;
        
        DATA_OUT <= data;
    end process CLOCK;

end Stk_dtfl;
