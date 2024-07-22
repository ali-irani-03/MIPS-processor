`timescale 1ns / 1ps

module adder(
	output [7:0] out,

	input [7:0] a, b
);

	assign out = a + b;

endmodule
