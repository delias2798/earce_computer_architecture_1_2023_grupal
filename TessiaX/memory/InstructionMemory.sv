module InstructionMemory(
    input logic [31:0] a,
	output logic [31:0] rd
);

  // Define the ROM array with initial values
  logic [31:0] ROM [63:0];

	 // Initialize ROM with values
	initial begin
		ROM[0] = 32'hE04F000F;
		ROM[1] = 32'hE3A0101E;
		ROM[2] = 32'hE3A02011;
		ROM[3] = 32'hE2811001;
		ROM[4] = 32'hE0013002;
		ROM[5] = 32'hE3A04001;
		ROM[6] = 32'hE0815002;
		ROM[7] = 32'hE0856003;
		ROM[8] = 32'hE0867004;
		ROM[9] = 32'hE7807005;
		ROM[10] = 32'hE3A08001;
		ROM[11] = 32'hE3A09001;
		ROM[12] = 32'hE3A0A001;
		
		for (int i = 10; i < 64; i++) begin
		  ROM[i] = 32'h0;
		end
	end
	// Assign the output based on the input address
	assign rd = ROM[a[31:2]]; // word aligned
endmodule
