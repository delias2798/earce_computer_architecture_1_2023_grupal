module senal_mem_to_reg	(op, funct, res);
	
	input logic [1:0] op;
	input logic funct;
	output logic res;
	
	always @ (op or funct) begin
		if(op == 2'b01 && funct) res = 1;
		else res = 0;
	end
	
endmodule 