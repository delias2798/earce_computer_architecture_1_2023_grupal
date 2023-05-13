module InstructionMemory(
    input logic [31:0] a,
	output logic [31:0] rd
);

  // Define the ROM array with initial values
  logic [31:0] ROM [63:0];

	 // Initialize ROM with values
	initial begin
		ROM[0] = 32'hE3A0204B;
		ROM[1] = 32'hE04F000F;
		ROM[2] = 32'hE3A04055;
		
		for (int i = 3; i < 64; i++) begin
		  ROM[i] = 32'h0;
		end
	end
	// Assign the output based on the input address
	assign rd = ROM[a[31:2]]; // word aligned
endmodule
