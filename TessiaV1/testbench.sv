`timescale 1ns / 1ns
module testbench();

	logic clk;
	logic reset;
	logic [31:0] WriteData, ALUResult;
	logic [3:0] ALUFlags;
	logic MemWrite;
	
	// instantiate device to be tested
	TOP dut(clk, reset, WriteData, ALUResult, MemWrite, ALUFlags);
	
	// initialize test
	initial
	begin
		reset <= 1; # 22; reset <= 0;
	end
	
	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	
	// check that 7 gets written to address 0x64
	// at end of program
	always @(negedge clk)
	begin
		//$display("The instruction is %h", Instr);
		$display("The ALU result is: %d and the ALU FLags are %b", ALUResult, ALUFlags);
		if(MemWrite) begin
			if(ALUResult === 100 & MemWrite === 7) begin
				$display("Simulation succeeded");
				$stop;
			end
		end
	end
endmodule
