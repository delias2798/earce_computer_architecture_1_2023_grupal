module InstructionMemory(
    input logic [31:0] a,
	output logic [31:0] rd
);

  // Define the ROM array with initial values
  logic [31:0] ROM [63:0];

	 // Initialize ROM with values
	initial begin
		ROM[0] = 32'hE04F000F;
		ROM[1] = 32'hE3A0A00A;
		ROM[2] = 32'hE3A01001;
		ROM[3] = 32'hE15A0001;
		ROM[4] = 32'h1A000002;
		ROM[5] = 32'hE2800001;
		ROM[6] = 32'hE2811001;
		ROM[7] = 32'hE8000006;
		ROM[8] = 32'hE0013000;
		ROM[9] = 32'hE7810000;
		
		for (int i = 10; i < 64; i++) begin
		  ROM[i] = 32'h0;
		end
	end
	// Assign the output based on the input address
	assign rd = ROM[a[31:2]]; // word aligned
endmodule
