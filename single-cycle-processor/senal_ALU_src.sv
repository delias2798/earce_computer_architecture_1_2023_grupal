module senal_ALU_src (op, funct, res);
	
	input logic [1:0] op;
	input logic funct;
	output logic res;
	
	always @ (funct or op) begin
		if(op == 2'b00 && !funct) res = 0;
		else res = 1;
	end
	
endmodule 