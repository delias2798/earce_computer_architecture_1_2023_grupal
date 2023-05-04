module senal_reg_write	(op, funct, res);
	
	input logic [1:0] op;
	input logic funct;
	output logic res;
	
	always @ (op or funct) begin
		if(op == 2'b00 || (op == 2'b01 && funct)) res = 1;
		else res = 0;
	end
	
endmodule 