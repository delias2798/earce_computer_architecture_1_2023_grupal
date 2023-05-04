module logica_cond ( cond,
							ALU_flags,
							flag_w, 
							pcs,
							reg_w,
							mem_w,
							PC_src,
							reg_write,
							mem_write,
							clk);
	input clk;
	input logic [3:0] cond, ALU_flags;
	input logic pcs, reg_w, mem_w;
	output logic [1:0] flag_w;
	output logic PC_src,	reg_write, mem_write;
	wire cond_ex;
	wire [1:0] flag_write;
	
	cond_check cond_ch(.cond(cond), .flags(ALU_flags), .cond_ex(cond_ex));
	
	assign PC_src = cond_ex & pcs;
	assign reg_write = cond_ex & reg_w;
	assign mem_write = cond_ex & mem_w;
			 
	

				 
endmodule 