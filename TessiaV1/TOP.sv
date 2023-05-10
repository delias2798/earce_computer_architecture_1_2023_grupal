module TOP(input logic clk, reset,
			  output logic [31:0] WriteData, ALUResult,
			  output logic MemWrite, output logic [3:0] ALUFlags);
			  
	logic [31:0] PC, ReadData, Instr;
	
	// instantiate Tessia processor and memories		
	Tessia tess(.clk(clk), .reset(reset),
			  .Instr(Instr), .ReadData(ReadData),
			 .MemWrite(MemWrite),
			 .PC(PC), .ALUResult(ALUResult),
			 .WriteData(WriteData),
			 .ALUFlags(ALUFlags));
					
	InstructionMemory imem(.clk(clk), .a(PC), .rd(Instr));
	
	DataMemory dmem(.clk(clk), .we(MemWrite), .a(ALUResult), .wd(WriteData), .rd(ReadData));

endmodule
