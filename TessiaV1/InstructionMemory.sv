module InstructionMemory( input logic clk,
								  input logic [31:0] a,
							     output logic [31:0] rd);
							  
	rom imem(.address(a[7:0]), .clock(~clk), .q(rd));
	
endmodule
