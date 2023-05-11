module DataMemory(input logic clk, we,
						input logic [31:0] a, wd,
						output logic [31:0] rd);

	logic [31:0] RAM [17999:0];

	initial begin
		$readmemb("ram_data.txt", RAM);
	end

	always_ff @(negedge clk) begin
		if (we) begin
			RAM[a[17:0]] <= wd;
			$writememb("ram_data.txt", RAM);
		end
	end
	
	always_ff @(posedge clk)
		rd <= RAM[a[17:0]];
			
endmodule
