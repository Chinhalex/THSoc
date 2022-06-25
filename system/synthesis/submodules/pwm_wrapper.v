module pwm_wrapper
(
	input iClk,
	input iReset_n,
	input iChipselect_n,
	input iWrite_n,
	input iRead_n,
	input [31:0] iData,
	output reg [31:0] oData
	
);
reg [31:0] sw;
wire [31:0] led;

always @(posedge iClk, negedge iReset_n)
	begin
		if (~iReset_n)
			begin
				sw <= 32'h0;
				oData <= 32'h0;
			end
		else if (~iChipselect_n)
			begin
				if (~iRead_n)
					begin
						sw[31:0] <= iData[31:0];
					end
				else if (~iWrite_n)
					begin
					   oData <= led[31:0];
					end
			end 
	end
		
count count(
		.iClk(iClk),
      .iReset_n(iReset_n),
      .fre(sw[1:0]),
      .duty(sw[4:2]),
      .pwm(led)
);

endmodule	
	