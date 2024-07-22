`timescale 1ns / 1ps

module data_memory(
	output reg [7:0] read_data,

	input [7:0] 
		write_data,
		address,
	
	input 
		reset,
		mem_read,
		mem_write,
		clk
);

	reg [7:0] memory [255:0];
	integer i;

	always @(posedge clk)
	begin
		if(reset)
			for( i = 0; i < 256; i = i + 1)
				memory[i] = 0;

		if(mem_write) memory[address] = write_data;
		if(mem_read) read_data = memory[address];
		
	end
endmodule
