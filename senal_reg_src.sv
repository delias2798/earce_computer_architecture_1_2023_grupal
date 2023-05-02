module senal_reg_src (op, funct, res);
	
	input logic [1:0] op;
	input logic funct;
	output logic [1:0] res;
	
	always @ (funct or op) begin
		if(op == 2'b00) res = 2'b00;
		else if(op == 2'b10) res = 2'bx1;
		else if(op == 2'b01 && !funct) res = 2'b10;
	end
	
endmodule 