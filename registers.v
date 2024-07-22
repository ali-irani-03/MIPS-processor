`timescale 1ns / 1ps

module registers(
	output reg [7:0] 
		read_data_1, 
		read_data_2,
		

	input [4:0] 
		read_register_1, 
		read_register_2, 	
		write_register, 

	input [7:0]
		write_data,

	input 
		reset, 
		regWrite
);
    
	reg [7:0] registers [31:0];
	integer i; 
	
	always @(
		read_register_1 
		or read_register_2 
		or write_data 
		or reset
	) begin
		
		if(reset) begin
			for(i = 0; i<32; i=i+1) begin
				registers[i] = 0;
			end
		end
		
		read_data_1 = registers[read_register_1];
		read_data_2 = registers[read_register_2];

		if(regWrite) registers[write_register] = write_data;
		
	end

endmodule
