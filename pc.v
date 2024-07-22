`timescale 1ns / 1ps

module pc(
	output reg [7:0] out,

	input [7:0] in,
	input reset, clk
);

	always @(posedge clk) begin
		out = in;
		if(reset) out = 8'b0;		
	end
endmodule
