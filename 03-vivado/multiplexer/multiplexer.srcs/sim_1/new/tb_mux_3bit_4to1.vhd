----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 04:36:21 PM
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1 - Behavioral
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

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture testbench of tb_mux_3bit_4to1 is

  -- Testbench local signals
  signal sig_sel           : std_logic_vector(1 downto 0);
  signal sig_a             : std_logic_vector(2 downto 0);
  signal sig_b             : std_logic_vector(2 downto 0);
  signal sig_c             : std_logic_vector(2 downto 0);
  signal sig_d             : std_logic_vector(2 downto 0);
  signal sig_out             : std_logic_vector(2 downto 0);
  
begin
uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
port map (
      a_i           => sig_a,
      b_i           => sig_b,
      c_i           => sig_c,
      d_i           => sig_d,
      f_o           => sig_out,
      sel           => sig_sel
    );
 p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    -- First test case ...
    sig_b <= "000";
    sig_a <= "001";
    sig_c <= "011";
    sig_d <= "111";
    wait for 100 ns;
    
    sig_sel <= "00";
    wait for 100 ns;
    sig_sel <= "01";
    wait for 100 ns;
    sig_sel <= "10";
    wait for 100 ns;
    sig_sel <= "11";
    wait for 100 ns;
    
    -- Report a note at the end of stimulus process
    report "Stimulus process finished";

    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end architecture testbench;
