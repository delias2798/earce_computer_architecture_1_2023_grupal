module DataMemory(input logic clk, we,
						input logic [31:0] a, wd,
						output logic [31:0] rd);

	reg [31:0] RAM [64:0];

	initial $readmemb("C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaX/mem.txt", RAM);

	always_ff @(negedge clk) begin
		if (we) begin
			RAM[a[31:2]] <= wd;
			$writememb("C:/Users/kevii/OneDrive/Escritorio/GitHub/earce_computer_architecture_1_2023_grupal/TessiaX/mem.txt", RAM);
		end
	end
	
	assign rd = RAM[a[31:2]];
			
endmodule
