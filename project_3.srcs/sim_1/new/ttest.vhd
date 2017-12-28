----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2017 23:57:43
-- Design Name: 
-- Module Name: ttest - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ttest is
end ttest;

architecture Behavioral of ttest is

component d_trigger
  Port (
      D : in std_logic;
      C : in std_logic;
      Q : out std_logic;
      nQ : out std_logic
  );
end component;

signal d_int : std_logic;
signal c_int : std_logic;
signal q_int : std_logic;
signal nq_int : std_logic;

begin
  
  trig : d_trigger port map (
      D => d_int,
      C => c_int,
      Q => q_int,
      nQ =>  nq_int
  );

  process
  variable cnt : std_logic_vector(1 downto 0);
  begin
      cnt := "00";
      for i in 0 to 3 loop
        cnt := std_logic_vector(to_unsigned(i, cnt'length));
        d_int <= cnt(1);
        c_int <= cnt(0);
        wait for 10 ps;
      end loop;
      
      assert false
        report "End of simulation"
        severity failure;
      wait;
  end process;

end Behavioral;
