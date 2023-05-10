module DataMemory(input logic clk, we,
						input logic [31:0] a, wd,
						output logic [31:0] rd);
						
		ram dmem(.address(a[11:0]), .clock(clk), .data(wd), .wren(we), .q(rd));

	
endmodule
