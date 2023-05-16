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
	output logic [1:0] ForwardA, ForwardB,
	output logic [3:0] ALUOP,
	output logic BranchTaken,
	output logic [3:0] ALUFlagsE0,
	output logic imageSelector,
	output logic enableVGAX
);
			  
	// instantiate Tessia processor	
	Tessia tess(
		.clk(clk), 
		.reset(reset),
		.ALUResultE(ALUResult), 
		.ALUFlagsE(ALUFlags),
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
		.ForwardB(ForwardB),
		.ALUOP(ALUOP),
		.BranchTaken(BranchTaken),
		.ALUFlagsE0(ALUFlagsE0),
		.imageSelector(imageSelector),
		.enableVGAX(enableVGAX));
					

endmodule
