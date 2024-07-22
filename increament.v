`timescale 1ns / 1ps

module increament(
	output reg [7:0] out,

	input [7:0] in,
	input clk
);

	always @(posedge clk)
		out = in + 1;

endmodule
