//module DataMemory(input logic clk, we,
//						input logic [31:0] a, wd,
//						output logic [31:0] rd);
//
//	ram dm(
//	.address(a),
//	.clock(clk),
//	.data(wd),
//	.wren(we),
//	.q(rd));
//			
//endmodule


module DataMemory(input logic clk, we,
						input logic [31:0] a, wd,
						output logic [31:0] rd);

	reg [31:0] RAM [45099:0];

	initial $readmemb("ram_data.txt", RAM);

	always_ff @(negedge clk) begin
		if (we) begin
			RAM[a[17:0]] <= wd;
			$writememb("ram_data.txt", RAM);
		end
	end
	
	assign rd = RAM[a[17:0]];
			
endmodule
