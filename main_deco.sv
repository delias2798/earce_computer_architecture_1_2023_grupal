module main_deco (op, 
						funct,
						reg_w,
						mem_w,
						mem_to_reg,
						ALU_src,
						imm_src,
						reg_src, 
						branch, 
						ALU_op);
	
	input logic [1:0] op;
	input logic [5:0] funct;
	output logic [1:0] imm_src, reg_src;
	output logic reg_w, mem_w, mem_to_reg, ALU_src, branch, ALU_op;

	
	senal_reg_write srw(.op(op), .funct(funct[0]), .res(reg_w));
	senal_mem_write smw(.op(op), .funct(funct[0]), .res(mem_w));
	senal_mem_to_reg smtr(.op(op), .funct(funct[0]), .res(mem_to_reg));
	senal_ALU_src sas(.op(op), .funct(funct[5]), .res(ALU_src));
	senal_imm_src sis(.op(op), .res(imm_src));
	senal_reg_src srs(.op(op), .funct(funct[0]), .res(reg_src));
	
	always @ (op) begin
		if(op == 2'b00) ALU_op = 1; else ALU_op = 0;
		if(op == 2'b10) branch = 1; else branch = 0;
	end
				 
endmodule 
