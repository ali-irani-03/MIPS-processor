`timescale 1ns / 1ps

module main(
	input clk, reset
);

	wire jump, 
		 alusrc, 
		 branch, 
	     regDst, 
		 memRead, 
		 regWrite, 
		 memToReg, 
		 memWrite, 
		 zero_flag;

	wire [3:0] alu_op;
	
	wire [4:0] regDst_mux_out;

	wire [7:0] pc_out, 
			   alu_out, 
			   adder_out, 
			   read_data_1, 
			   read_data_2, 
			   jump_mux_out, 
			   alusrc_mux_out, 
			   branch_mux_out, 
			   increament_out, 
			   data_memory_out,
			   memToReg_mux_out; 
	
	wire [31:0] instruction_out; 

	pc pc (
		.out(pc_out), 
		.in(jump_mux_out),
		.reset(reset), 
		.clk(clk)
	);
		
	data_memory data_memory (
		 .read_data(data_memory_out), 
		 .write_data(read_data_2),
		 .address(alu_out),
		 .mem_write(memWrite),
		 .mem_read(memRead),
		 .reset(reset), 
		 .clk(clk)
	);
	
	instruction_memory instruction_memory (
		 .instruction(instruction_out), 
		 .read_address(pc_out),
		 .reset(reset),
		 .clk(clk)
	);
	
	increament increament (
		 .out(increament_out), 
		 .in(pc_out),
		 .clk(clk)
	);
	
	adder adder (
		 .out(adder_out), 
		 .a(increament_out), 
		 .b(instruction_out[7:0])
	);
	
	alu alu (
		 .alu_result(alu_out), 
		 .zero_flag(zero_flag),
		 .a(read_data_1), 
		 .b(alusrc_mux_out), 
		 .control(alu_op) 
	);
	
	registers registers (
		 .read_data_1(read_data_1), 
		 .read_data_2(read_data_2), 
		 .read_register_1(instruction_out[25:21]), 
		 .read_register_2(instruction_out[20:16]), 
		 .write_register(regDst_mux_out),
		 .write_data(memToReg_mux_out), 
		 .reset(reset),
		 .regWrite(regWrite)
	);
	
	Control control (
		 .regDst(regDst), 
		 .jump(jump), 
		 .branch(branch), 
		 .memRead(memRead), 
		 .memToReg(memToReg), 
		 .alu_op(alu_op), 
		 .memWrite(memWrite), 
		 .alusrc(alusrc), 
		 .regWrite(regWrite), 
		 .op(instruction_out)
	);
		 
	 
	mux_5bit regDst_mux (
		 .out(regDst_mux_out), 
		 .selector(regDst), 
		 .a(instruction_out[20:16]), 
		 .b(instruction_out[15:11])
	);
		 
	mux_8bit alusrc_mux (
		 .out(alusrc_mux_out), 
		 .selector(alusrc), 
		 .a(read_data_2), 
		 .b(instruction_out[7:0])
	);
	mux_8bit branch_mux (
		 .out(branch_mux_out), 
		 .selector(zero_flag & branch), 
		 .a(increament_out), 
		 .b(adder_out)
	);	 
	
	mux_8bit jump_mux (
		.out(jump_mux_out), 
		.selector(jump), 
		.a(branch_mux_out),
		.b(instruction_out[7:0])
	);
	 
	mux_8bit memToReg_mux (
		 .out(memToReg_mux_out), 
		 .selector(memToReg), 
		 .a(alu_out), 
		 .b(data_memory_out)
	);
	
endmodule