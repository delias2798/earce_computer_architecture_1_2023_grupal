module ExtendImmediate_tb();

	//parameter WIDTH = 4;  
	logic [23:0] Instruction;
	logic [1:0] ImmSrc;
	logic [31:0] ExtImm;
	logic [31:0] ExtImmExpected;
	
	
	ExtendImmediate Imm (.Instruction(Instruction),
								.ImmSrc(ImmSrc),
								.ExtImm(ExtImm));
	
	initial 
	begin
		
		
		$display ("=============Data Processing Immediate=============");
		
		Instruction = {16'b0, 8'b11001000};
		ImmSrc = 1'b0;
		ExtImmExpected = 200;
		
		#10
		
		assert (ExtImm == ExtImmExpected)   
			$display ($sformatf("Success for the Data Processing Immediate"));
		else $error($sformatf("Failure for the Data Processing Immediate"));
		

		$display ("=============LDR STR Immediate=============");
		
		Instruction = {20'b0, 12'b000010000110};
		ImmSrc = 1'b1;
		ExtImmExpected = 134;
		
		#10
		
		assert (ExtImm == ExtImmExpected)   
			$display ($sformatf("Success for the LDR/STR Immediate"));
		else $error($sformatf("Failure for the LDR/STR Immediate"));

		
	end	
endmodule
