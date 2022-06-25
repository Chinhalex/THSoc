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
   reg [5 : 0]  c;
	output reg pwm;
	
	integer loop ;
	integer d;	
	integer duty_count ;
   always @(posedge iClk, negedge iReset_n)
     begin
        if (~iReset_n) begin
           c <= 6'b0;
        end
        else
          begin
            c <= (c == loop - 1) ? 4'b0 : c + 1;
          end
     end 
     always @* begin
   	pwm = (c <= duty_count) ? 1'b1 : 1'b0;
		loop = (fre == 0) ? 5 : (fre == 1) ? 10 : (fre == 2) ? 25 : (fre == 3) ? 50 : 1;
		d = (duty == 0 ) ? 100 :(duty == 1) ? 80 : (duty == 2) ? 50 : (duty == 3) ? 25 : (duty == 4) ? 10 : 0;
		duty_count = loop * (d/100.0); //loop=10 duty_count=5
     end  
 
  
endmodule
