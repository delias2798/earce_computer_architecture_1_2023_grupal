		  
module Tessia(input logic clk, reset,
			  input logic [31:0] Instr, ReadData,
			  output logic MemWrite,
			  output logic [31:0] PC, ALUResult, WriteData,
			  output logic [3:0] ALUFlags);
	
	logic RegWrite, ALUSrc, MemtoReg, PCSrc;
	
	logic [1:0] RegSrc, ImmSrc;
	
	logic [3:0] ALUControl;
	
	ControlUnit c(clk, reset, Instr[31:12], ALUFlags,
						RegSrc, RegWrite, ImmSrc,
						ALUSrc, ALUControl,
						MemWrite, MemtoReg, PCSrc);
						
	Datapath dp(clk, reset,
					RegSrc, RegWrite, ImmSrc,
					ALUSrc, ALUControl,
					MemtoReg, PCSrc,
					ALUFlags, PC, Instr,
					ALUResult, WriteData, ReadData);
endmodule