`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:46:34 01/09/2024
// Design Name:   instruction_memory
// Module Name:   C:/Documents and Settings/Administrator/Desktop/finally/ins.v
// Project Name:  finally
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ins;

	// Inputs
	reg [7:0] read_address;
	reg reset;
	reg clk = 1;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	instruction_memory uut (
		.instruction(instruction), 
		.read_address(read_address), 
		.reset(reset), 
		.clk(clk)
	);

	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		read_address = 0;

		// Wait 100 ns for global reset to finish
		#20 read_address = 1;
				#20 read_address = 2;

        
		// Add stimulus here

	end
      
endmodule

