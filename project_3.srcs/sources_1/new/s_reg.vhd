----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2017 00:43:21
-- Design Name: 
-- Module Name: s_reg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity s_reg is
  Port (
    D : in std_logic;
    C : in std_logic;
    Q : out std_logic_vector(3 downto 0);
    nQ : out std_logic_vector(3 downto 0)
  );
end s_reg;

architecture Behavioral of s_reg is

component d_trigger
Port (
    D : in std_logic;
    C : in std_logic;
    Q : out std_logic;
    nQ : out std_logic
);
end component;

signal d_int : std_logic_vector(3 downto 0);
signal c_int : std_logic;
signal q_int : std_logic_vector(3 downto 0);
signal nq_int : std_logic_vector(3 downto 0);

begin

c_int <= C;
d_int(3) <= D;

t3 : d_trigger port map (
    D => d_int(3),
    C => c_int,
    Q => q_int(3),
    nQ => nq_int(3)
);

t2 : d_trigger port map (
    D => d_int(2),
    C => c_int,
    Q => q_int(2),
    nQ => nq_int(2)
);

t1 : d_trigger port map (
    D => d_int(1),
    C => c_int,
    Q => q_int(1),
    nQ => nq_int(1)
);

t0 : d_trigger port map (
    D => d_int(0),
    C => c_int,
    Q => q_int(0),
    nQ => nq_int(0)
);

process(C)
begin
    if C'event and C = '1' then
        d_int(2) <= q_int(3);
        d_int(1) <= q_int(2);
        d_int(0) <= q_int(1);
    end if;    
end process;

Q <= q_int;
nQ <= nQ_int;
              
end Behavioral;
