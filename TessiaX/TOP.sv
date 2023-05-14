module TOP(
    input logic clk, reset,
    output logic [31:0] ALUResult,
    output logic [3:0] ALUFlags,
	output logic [31:0] Instruction,
	output logic [31:0] WriteData,
	output logic RegWrite,
	output logic [3:0] A3,
	output logic [31:0] WD3,
	output logic MemToReg,
	output logic [31:0] ResultWB,
	output logic [31:0] SrcA, SrcB,
	output logic [1:0] ForwardA, ForwardB
);
			  
	// instantiate Tessia processor	
	Tessia tess(
		.clk(clk), 
		.reset(reset),
		.ALUResultE(ALUResult), 
		.ALUFlags(ALUFlags),
		.Instruction(Instruction),
		.WriteData(WriteData),
		.RegWrite(RegWrite),
    	.A3(A3),
    	.WD3(WD3),
		.MemToReg(MemToReg),
		.ResultWB(ResultWB),
		.SrcA(SrcA),
		.SrcB(SrcB),
		.ForwardA(ForwardA), 
		.ForwardB(ForwardB));
					

endmodule
