----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2017 22:55:28
-- Design Name: 
-- Module Name: d_trigger - Behavioral
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

entity d_trigger is
  Port (
        D : in std_logic;
        C : in std_logic;
        Q : out std_logic;
        nQ : out std_logic
        );
end d_trigger;

architecture Behavioral of d_trigger is
begin
    process(C)
    begin
        if C'event and C = '1' then
            Q <= D;
            nQ <= not D;
        end if;
    end process;
end Behavioral;
