module InstructionMemory(input logic [31:0] a,
							     output logic [31:0] rd);
//	logic [31:0] ROM[63:0];
//	initial
//		$readmemh("inst.dat",ROM);
//	assign rd = ROM[a[31:2]]; // word aligned

  // Define the ROM array with initial values
  logic [31:0] ROM [63:0];

	 // Initialize ROM with values
	initial begin
		ROM[0] = 32'hE3A0204B;
		ROM[1] = 32'hE04F000F;
		ROM[2] = 32'hE282300A;
		ROM[3] = 32'hE3A04055;
		ROM[4] = 32'hE1530004;
		ROM[5] = 32'hEA000000;
		ROM[6] = 32'hE202000A;
		ROM[7] = 32'hE3A00064;
		ROM[8] = 32'h0A00000C;
		ROM[9] = 32'hE0538004;
		ROM[10] = 32'hAA000000;
		ROM[11] = 32'hE2805000;
		ROM[12] = 32'hE0578002;
		ROM[13] = 32'hB2857001;
		ROM[14] = 32'hE0477002;
		ROM[15] = 32'hE5837054;
		ROM[16] = 32'hE5902060;
		ROM[17] = 32'hE08FF000;
		ROM[18] = 32'hE280200E;
		ROM[19] = 32'hEA000001;
		ROM[20] = 32'hE280200D;
		ROM[21] = 32'hE280200A;
		ROM[22] = 32'hE5802064;
		
		for (int i = 23; i < 64; i++) begin
		  ROM[i] = 32'h0;
		end
		
	end
  
	// Assign the output based on the input address
	assign rd = ROM[a[31:2]]; // word aligned
endmodule
