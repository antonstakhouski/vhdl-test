----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2017 07:23:03
-- Design Name: 
-- Module Name: cnt - Behavioral
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

entity cnt is
  Port (
    C : in std_logic;
    Q: out std_logic_vector(3 downto 0);
    nQ: out std_logic_vector(3 downto 0)
  );
end cnt;

architecture Behavioral of cnt is
component d_trigger
  Port (
      D : in std_logic;
      C : in std_logic;
      Q : out std_logic;
      nQ : out std_logic
      );
end component;

signal d_int : std_logic_vector(3 downto 0);
signal c_int : std_logic_vector(3 downto 0);
signal q_int : std_logic_vector(3 downto 0);
signal nq_int : std_logic_vector(3 downto 0);

begin
t0 : d_trigger port map (
    D => nq_int(0),
    C => c_int(0),
    Q => q_int(0),
    nQ => nq_int(0)
);

t1 : d_trigger port map (
    D => nq_int(1),
    C => c_int(1),
    Q => q_int(1),
    nQ => nq_int(1)
);

t2 : d_trigger port map (
    D => nq_int(2),
    C => c_int(2),
    Q => q_int(2),
    nQ => nq_int(2)
);

t3 : d_trigger port map (
    D => nq_int(3),
    C => c_int(3),
    Q => q_int(3),
    nQ => nq_int(3)
);
c_int(3) <= C;

process(C)
begin
if C'event and C = '1'then
    c_int(2) <= q_int(3);
    c_int(1) <= q_int(2);
    c_int(0) <= q_int(1);
end process;

end Behavioral;
