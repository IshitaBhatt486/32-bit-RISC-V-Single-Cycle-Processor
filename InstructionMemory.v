`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 15:54:12
// Design Name: 
// Module Name: InstructionMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstructionMemory(
    input clk, reset,
    input [31:0] read_address,
    output [31:0] output_instruction
    );
    reg [31:0] Instruction_Memory[63:0];
    integer k;

    initial begin
        for (k = 0; k < 64; k = k + 1)
            Instruction_Memory[k] = 32'h00000013; // addi x0, x0, 0 (NOP)
        Instruction_Memory[0] = 32'h00500093; // addi x1, x0, 5
        Instruction_Memory[1] = 32'h00700113; // addi x2, x0, 7
        Instruction_Memory[2] = 32'h002081b3; // add  x3, x1, x2
        Instruction_Memory[3] = 32'h00302023; // sw   x3, 0(x0)
        Instruction_Memory[4] = 32'h00002203; // lw   x4, 0(x0)
        Instruction_Memory[5] = 32'h00320463; // beq  x4, x3, 8
        Instruction_Memory[6] = 32'h00100293; // addi x5, x0, 1 (skipped)
        Instruction_Memory[7] = 32'h00200293; // addi x5, x0, 2
    end

    assign output_instruction = read_address[31:2] < 64 ?
                                Instruction_Memory[read_address[7:2]] : 32'h00000013;
        
    
endmodule
