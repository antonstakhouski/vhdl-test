----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2017 23:21:57
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
end test;

architecture Behavioral of test is
    component p_reg 
         Port (
          C : in std_logic;
          D : in std_logic_vector(3 downto 0);
          Q : out std_logic_vector(3 downto 0);
          nQ : out std_logic_vector(3 downto 0)   
        );
    end component;
    
signal d_int :  std_logic_vector(3 downto 0):= "0000";
signal c_int :  std_logic := '0';
signal q_int :  std_logic_vector(3 downto 0):= "0000";
signal nq_int : std_logic_vector(3 downto 0):= "0000";

begin
    main : p_reg port map (
        C => c_int,
        D => d_int,
        Q => q_int,
        nQ => nq_int
    );

    process
    variable cnt : std_logic_vector(4 downto 0);
    begin
        cnt := "00000";
        for i in 0 to 31 loop
            cnt := std_logic_vector(to_unsigned(i, cnt'length));
            d_int(3) <= cnt(4);
            d_int(2) <= cnt(3);
            d_int(1) <= cnt(2);
            d_int(0) <= cnt(1);
            c_int <= cnt(0);
            wait for 10 ps;
        end loop;
        
        assert false
            report "End of simulation"
            severity failure;
        wait;
 
    end process;
end Behavioral;
 