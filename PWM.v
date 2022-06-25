module PWM (

	input CLOCK_50,
	input [0:0] KEY,
	input [15:0] SW,
	output [15:0] LEDR
);

system Nios_system(
	.clk_clk	(CLOCK_50),
	.reset_reset_n (KEY[0]),
	.red_leds_0_conduit_end_export (LEDR),
	.switches_0_conduit_end_export (SW)
);

endmodule