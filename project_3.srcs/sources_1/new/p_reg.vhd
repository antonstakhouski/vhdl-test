----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2017 23:07:28
-- Design Name: 
-- Module Name: p_reg - Behavioral
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
use IEEE.NUMERIC_STD.UNSIGNED;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity p_reg is
  Port (
    C : in std_logic;
    D : in std_logic_vector(3 downto 0);
    Q : out std_logic_vector(3 downto 0);
    nQ : out std_logic_vector(3 downto 0)   
  );
end p_reg;

architecture Behavioral of p_reg is

component d_trigger
  Port (
      D : in std_logic;
      C : in std_logic;
      Q : out std_logic;
      nQ : out std_logic
      );
end component;

signal c_int :  std_logic := '0';
signal d_int :  std_logic_vector(3 downto 0):= "0000";
signal q_int :  std_logic_vector(3 downto 0):= "0000";
signal nq_int : std_logic_vector(3 downto 0):= "0000";

begin
    t0 : d_trigger port map (
        D => d_int(0),
        C => c_int,
        Q => q_int(0),
        nQ => nq_int(0) 
    );
    
    t1 : d_trigger port map (
        D => d_int(1),
        C => c_int,
        Q => q_int(1),
        nQ => nq_int(1) 
    );
    
    t2 : d_trigger port map (
        D => d_int(2),
        C => c_int,
        Q => q_int(2),
        nQ => nq_int(2) 
    );
    
    t3 : d_trigger port map (
        D => d_int(3),
        C => c_int,
        Q => q_int(3),
        nQ => nq_int(3) 
    );
    
    process(C)
    begin
        c_int <= C;
        d_int <= D;
        Q <= q_int;
        nQ <= nq_int;
    end process;
end Behavioral;
