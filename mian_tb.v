`timescale 1ns / 1ps

module mian_tb;

	reg clk = 0;
	reg reset = 1;

	main uut (
		.clk(clk), 
		.reset(reset)
	);

	always 
		#10 clk = ~clk;
	
	initial
		#30 reset = 0;
      
endmodule

