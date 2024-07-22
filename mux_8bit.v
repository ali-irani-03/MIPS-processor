`timescale 1ns / 1ps

module mux_8bit(
    output [7:0] out,

    input [7:0] a, b,
    input selector
);

    assign out = (selector)? b : a;

endmodule
