module count (
	iClk,
   iReset_n,
   fre,
   duty,
   pwm
);
   input iClk;
   input iReset_n;
   input [1 : 0] fre;
   input [2 : 0] duty;
   output pwm;

	reg [5 : 0]  c;
	
	wire [6:0] loop, d;
	reg [6:0] duty_count;

always @(posedge iClk, negedge iReset_n)
     begin
			if (~iReset_n) 
				begin
					c <= 6'b0;  
				end
			else
				begin
					c <= (c == loop - 1) ? 4'b0 : c + 1;
				end
     end 

always @(posedge iClk)
     begin
			if (loop & d) 
				begin
					duty_count = loop * (d/100);
				end
     end
 	  
assign pwm = (c <= duty_count) ? 1'b1 : 1'b0; 
assign loop = (fre == 0) ? 5 : (fre == 1) ? 10 : (fre == 2) ? 25 : (fre == 3) ? 50 : 1;
assign d = (duty == 0 ) ? 100 :(duty == 1) ? 80 : (duty == 2) ? 50 : (duty == 3) ? 25 : (duty == 4) ? 10 : 0;
//assign duty_count = loop * (d/100.0); //loop=10 duty_count=5

endmodule
