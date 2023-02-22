----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 04:22:33 PM
-- Design Name: 
-- Module Name: mux_3bit_4to1 - Behavioral
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

entity mux_3bit_4to1 is
port (
    sel         : in    std_logic_vector(1 downto 0);
    a_i         : in    std_logic_vector(2 downto 0);
    b_i         : in    std_logic_vector(2 downto 0);
    c_i         : in    std_logic_vector(2 downto 0);
    d_i         : in    std_logic_vector(2 downto 0);
    f_o         : out   std_logic_vector(2 downto 0)                   
  );
end mux_3bit_4to1;

architecture Behavioral of mux_3bit_4to1 is

begin

f_o <= a_i when (sel = "00") else
       b_i when (sel = "01") else
       c_i when (sel = "10") else
       d_i; 
end Behavioral;

