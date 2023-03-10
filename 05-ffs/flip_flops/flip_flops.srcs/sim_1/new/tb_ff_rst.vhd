library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_ff_rst is
  -- Entity of testbench is always empty
end entity tb_ff_rst;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal sig_clk_100MHz : std_logic;
    signal sig_rst        : std_logic;
    signal sig_data       : std_logic;
    signal sig_dq_d         : std_logic;
    signal sig_dq_d_bar     : std_logic;

    signal sig_dq_t     : std_logic;
    signal sig_dq_t_bar     : std_logic;

begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_d_ff_rst : entity work.d_ff_rst
        port map (
            clk   => sig_clk_100MHz,
            rst   => sig_rst,
            d     => sig_data,
            q     => sig_dq_d,
            q_bar => sig_dq_d_bar
        );
        
    uut_t_ff_rst : entity work.t_ff_rst
        port map (
            clk   => sig_clk_100MHz,
            rst   => sig_rst,
            t     => sig_data,
            q     => sig_dq_t,
            q_bar => sig_dq_t_bar
        );
    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process is
    begin
        while now < 300 ns loop -- 30 periods of 100MHz clock
            sig_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process is
    begin
        sig_rst <= '0';

        -- ACTIVATE AND DEACTIVATE RESET HERE
        wait for 16 ns;
        sig_rst <= '1';
        wait for 34 ns;
        sig_rst <= '0';
        wait for 76 ns;
        sig_rst <= '1';
        wait for 34 ns;
        sig_rst <= '0';

        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process is
    begin
        report "Stimulus process started";
        sig_data <='0'; wait for 13 ns;

        wait for 16 ns;
        sig_data <= '1';
        wait for 17 ns;
        sig_data <= '0';
        wait for 36 ns;
        sig_data <= '1';
        wait for 31 ns;
        sig_data <= '0';
        wait for 11 ns;
        sig_data <= '1';
        wait for 6 ns;
        sig_data <= '0';
        wait for 18 ns;
        sig_data <= '1';
        wait for 13 ns;
        sig_data <= '0';
        wait for 33 ns;
        sig_data <= '1';
        wait for 26 ns;
        sig_data <= '0';



        report "Stimulus process finished";
        wait;
    end process p_stimulus;

end architecture testbench;
