`timescale 1ns / 1ps

module mux_5bit(
	output [4:0] out,

	input [4:0] a,
	input [4:0] b,
	input selector
);

	assign out = (selector)? b : a;

endmodule
