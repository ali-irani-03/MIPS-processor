`timescale 1ns / 1ps

module alu (
    output reg [15:0] alu_result,
    output reg zero_flag = 0,
   
    input [7:0] a, b,
    input [3:0] control
);

    always@(*) begin
        
        case (control)
            4'b0000: alu_result <= a & b;   
            4'b0001: alu_result <= a | b;
            4'b0010: alu_result <= a + b;
            4'b0110: alu_result <= a - b;
            4'b1100: alu_result <= ~(a | b); 
            4'b1101: alu_result <= a * b;
            default: alu_result <= 0;
        endcase

        zero_flag = (alu_result == 0);
    end
endmodule