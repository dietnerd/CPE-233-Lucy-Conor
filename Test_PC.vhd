----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2016 09:22:49 AM
-- Design Name: 
-- Module Name: PC - PC_dtfl
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

entity TPC is
end TPC;

architecture TPC_dtfl of TPC is
signal CLK, RST, PC_LD, PC_INC : std_logic := '0';
signal DIN, PC_COUNT : std_logic_vector(9 downto 0) := (others => '0');
begin

CLK <= not CLK after 2 ns;
PC_LD <= not PC_LD after 4 ns;
PC_INC <= not PC_INC after 8 ns;
DIN <= "00" & x"A4", "00" & x"23" after 2 ns, "00" & x"FF" after 10 ns, "00" & x"82" after 20 ns;
RESET: process
    begin
    RST <= '0';
    wait for 40 ns;
    RST <= '1';
    wait for 4 ns;
    end process RESET;

CLOCK: process (CLK, RST, PC_LD, PC_INC, DIN)
    variable ln : std_logic_vector(9 downto 0) := "00" & x"01";
    begin
        if (RST = '1') then
            ln := (others => '0');
        elsif (rising_edge(CLK)) then
            if (PC_LD = '1') then
                ln := DIN;
            elsif (PC_INC = '1') then
                ln := ln + 1;
            end if;
        end if;
        
        PC_COUNT <= ln;
    end process CLOCK;
    
end TPC_dtfl;
