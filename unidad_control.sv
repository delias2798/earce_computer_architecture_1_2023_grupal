module unidad_control ( cond,
								op,
								funct,
								rd,
								ALU_flags,
								PC_src,
								mem_to_reg,
								mem_write,
								ALU_control,
								ALU_src,
								imm_src,
								reg_write,
								reg_src, 
								clk);
	input clk;
	input logic [5:0] funct;
	input logic [3:0] cond, ALU_flags, rd;
	input logic [1:0] op;
	output logic PC_src, mem_to_reg, mem_write, ALU_src, reg_write;
	output logic [3:0] ALU_control;
	output logic [1:0] imm_src, reg_src;
	
	wire [1:0] flag_w;
	wire pcs, reg_w, mem_w;
	
	ALU_deco ad(.op(op), .funct(funct), .rd(rd), .flag_w(flag_w), .pcs(pcs), .reg_w(reg_w), .mem_w(mem_w), .mem_to_reg(mem_to_reg), .ALU_src(ALU_src), .imm_src(imm_src), .reg_src(reg_src), .ALU_control(ALU_control));
	logica_cond lc(.cond(cond), .ALU_flags(ALU_flags), .flag_w(flag_w), .pcs(pcs), .reg_w(reg_w), .mem_w(mem_w), .PC_src(PC_src), .reg_write(reg_write), .mem_write(mem_write), .clk(clk));
	
endmodule 