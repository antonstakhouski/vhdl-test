----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2017 00:58:58
-- Design Name: 
-- Module Name: stest - Behavioral
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

entity stest is
--  Port ( );
end stest;

architecture Behavioral of stest is
    component s_reg
      Port (
      D : in std_logic;
      C : in std_logic;
      Q : out std_logic_vector(3 downto 0);
      nQ : out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal d_int : std_logic;
    signal c_int : std_logic;
    signal q_int : std_logic_vector(3 downto 0);
    signal nq_int : std_logic_vector(3 downto 0);

begin
    reg : s_reg port map (
        D => d_int,
        C => c_int,
        Q => q_int,
        nQ => nq_int
    );
    
    process
    variable cnt : std_logic_vector(3 downto 0);
    begin
        for i in 0 to 15 loop
            cnt := std_logic_vector(to_unsigned(i, cnt'length));
            
            d_int <= cnt(0);
            c_int <= '0';
            wait for 10 ps;
            
            d_int <= cnt(0);
            c_int <= '1';
            wait for 10 ps;
            
            d_int <= cnt(1);
            c_int <= '0';
            wait for 10 ps;
            
            d_int <= cnt(1);
            c_int <= '1';
            wait for 10 ps;
            
            d_int <= cnt(2);
            c_int <= '0';
            wait for 10 ps;
            
            d_int <= cnt(2);
            c_int <= '1';
            wait for 10 ps;
            
            d_int <= cnt(3);
            c_int <= '0';
            wait for 10 ps;
            
            d_int <= cnt(3);
            c_int <= '1';
            wait for 10 ps;
        end loop;
        
        assert false
            report "End"
            severity failure;
        wait;
    end process;

end Behavioral;
