module senal_imm_src (op, res);
	
	input logic [1:0] op;
	output logic [1:0] res;
	
	always @ (op) begin
		if(op == 2'b00) res = 2'b00;
		else if(op == 2'b01) res = 2'b01;
		else if(op == 2'b10) res = 2'b10;
	end
	
endmodule 