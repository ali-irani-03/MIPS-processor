`timescale 1ns / 1ps

module Control(
	output reg 
		regDst, 
		jump, 
		branch, 
		memRead, 
		memToReg, 
		memWrite, 
		alusrc, 
		regWrite,

	output reg [3:0] alu_op,

	input [31:0] op
);


	always@(op)
	begin
		regDst = 0;
		jump = 0;
		branch = 0;
		memRead = 0;
		memToReg = 0;
		memWrite = 0;
		alusrc = 0;
		regWrite = 0;
		alu_op = 0;
		
		case(op[31:26])

			//load
			6'b001110: begin
				alu_op = 4'b0010;
				alusrc = 1;
				regWrite = 1;
			end

			//alu
			// R-type
			6'b000000: begin
				regDst = 1;
				alu_op = op[3:0];
				regWrite = 1;
			end

			//branch
			6'b001100: begin
				branch = 1;
				alu_op = 4'b0110;
			end
			
			//jump
			6'b000100: jump = 1;
			
			//??????? lw
			6'b100100: begin
				memRead = 1;
				memToReg = 1;
				alu_op = 4'b0010;
				alusrc = 1;
				regWrite = 1;
			end
			
			//??????? sw
			6'b100110: begin
				alu_op = 4'b0010;
				memWrite = 1;
				alusrc = 1;
			end
			
			6'b001111: begin
				alusrc = 1;
				regWrite = 1;
			end
		endcase
	end
endmodule
