module testbench();

	logic clk;
	logic reset;
	logic RegWrite, MemToReg;
	logic [31:0] ALUResult;
	logic [3:0] ALUFlags, A3;
	logic [31:0] Instruction;
	logic [31:0] WriteData, WD3, ResultWB;
	logic [31:0] SrcA, SrcB;
	logic [1:0] ForwardA, ForwardB;
	
	// instantiate device to be tested
	TOP DUT(
		.clk(clk), 
		.reset(reset),
    	.ALUResult(ALUResult),
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
	
	// initialize test
	initial
	begin
		reset <= 1; # 100; reset <= 0;
	end
	
	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end

	integer clk_count = 0;
	always begin
		if (clk_count < 60) begin
			clk <= 1; #5;
			clk <= 0; #5;
			clk_count = clk_count + 1;
		end else begin
			#1; // Wait for any remaining logic to settle before stopping the clock
			$stop;
		end
	end

	
	// check that 7 gets written to address 0x64
	// at end of program
	always @(negedge clk)
	begin
		// $display("The ALU result is: %d, The", ALUResult);
		//if (RegWrite) begin
			$display("Decode {A3: %d, WD3: %d}", A3, WD3);
			$display("Execute {ForwardA: %b, ForwardB: %b, WriteDataE: %d, SrcA: %d, SrcB: %d, ALUResult: %d}",ForwardA, ForwardB, WriteData, SrcA, SrcB, ALUResult);
			//$display("WriteBack {MemToReg: %d, ResultW: %d}", MemToReg, ResultWB);
			$display("\n \n");


		//end
		// if() begin
		// 	if(ALUResult === 100) begin
		// 		$display("Simulation succeeded");
		// 		$stop;
		// 	end else if (ALUResult !== 96) begin
		// 		$display("Simulation failed");
		// 		$stop;
		// 	end
		// end
	end
endmodule
