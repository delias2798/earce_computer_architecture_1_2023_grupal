module TOP(input logic clk, reset,
			  output logic [31:0] WriteData, ALUResult,
			  output logic MemWrite);
			  
	logic [31:0] PC, ReadData, Instr;
	
	// instantiate Tessia processor and memories
					
	Tessia tess(.clk(clk), .reset(reset),
			  .Instr(Instr), .ReadData(ReadData),
			 .MemWrite(MemWrite),
			 .PC(PC), .ALUResult(ALUResult),
			 .WriteData(WriteData));
					
	InstructionMemory imem(PC, Instr);
	
	DataMemory dmem(clk, MemWrite, ALUResult, WriteData, ReadData);
endmodule
