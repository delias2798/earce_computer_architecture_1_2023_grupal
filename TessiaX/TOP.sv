module TOP(
    input logic clk, reset,
    output logic [31:0] ALUResult,
    output logic [3:0] ALUFlags
);
			  
	logic [31:0] PC;
	
	// instantiate Tessia processor	
	Tessia tess(.clk(clk), 
					.reset(reset),
					.PCF(PC), 
					.ALUResult(ALUResult), 
					.ALUFlags(ALUFlags));
					

endmodule
