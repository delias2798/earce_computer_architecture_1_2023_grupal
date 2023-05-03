module ALU_deco (
					op,
					funct,
					rd,
					flag_w,
					pcs,
					reg_w,
					mem_w,
					mem_to_reg,
					ALU_src,
					imm_src,
					reg_src,
					ALU_control);
	
	input logic [1:0] op;
	input logic [5:0] funct;
	input logic [3:0] rd;
	output logic [1:0] flag_w, imm_src, reg_src;
	output logic pcs, reg_w, mem_w, mem_to_reg, ALU_src;
	output logic [3:0] ALU_control;
	
	logic branch, ALU_op;
	
	//Main Decoder
	
	main_deco m_deco(.op(op), .funct(funct), .reg_w(reg_w), .mem_w(mem_w), .mem_to_reg(mem_to_reg), .ALU_src(ALU_src), .imm_src(imm_src), .reg_src(reg_src), .branch(branch), .ALU_op(ALU_op));
	
	//PC Logic
	
	assign pcs = ((rd == 4'b1111) & reg_w) | branch;
	
	//ALU Decoder
	
	senal_ALU_control sac(.funct(funct[4:0]), .ALU_op(ALU_op), .res(ALU_control));
	
	
endmodule 