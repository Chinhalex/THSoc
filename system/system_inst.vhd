	component system is
		port (
			clk_clk                       : in  std_logic                     := 'X';             -- clk
			red_leds_0_conduit_end_export : out std_logic_vector(31 downto 0);                    -- export
			reset_reset_n                 : in  std_logic                     := 'X';             -- reset_n
			switches_0_conduit_end_export : in  std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                       => CONNECTED_TO_clk_clk,                       --                    clk.clk
			red_leds_0_conduit_end_export => CONNECTED_TO_red_leds_0_conduit_end_export, -- red_leds_0_conduit_end.export
			reset_reset_n                 => CONNECTED_TO_reset_reset_n,                 --                  reset.reset_n
			switches_0_conduit_end_export => CONNECTED_TO_switches_0_conduit_end_export  -- switches_0_conduit_end.export
		);

