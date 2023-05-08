module RegisterFile(
    input logic clk, we3,
	input logic [3:0] ra1, ra2, ra3,
	input logic [31:0] wd3, r15,
	output logic [31:0] rd1, rd2
);

	// Declare 15 32-bit registers array					  
	logic [31:0] rf[14:0];
	
	// Three ported Register File
	// Read two ports combinationally
	// Write third port on rising edge of clock
	// Register 15 reads PC+8 instead
	
	always_ff @(posedge clk)
		if (we3) rf[ra3] <= wd3;
	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];
endmodule
