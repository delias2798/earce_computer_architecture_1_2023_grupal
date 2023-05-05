`timescale 1ns / 1ps
module unidad_control_tb ();

	// Defining the instance signals
	logic clk = 0;
	logic [5:0] funct;
	logic [3:0] cond, ALU_flags, rd;
	logic [1:0] op;
	logic PC_src, mem_to_reg, mem_write, ALU_src, reg_write;
	logic [3:0] ALU_control;
	logic [1:0] imm_src, reg_src;

	// Instance of the Unit Under Test (UUD)
		unidad_control uut ( .cond(cond),
									.op(op),
									.funct(funct),
									.rd(rd),
									.ALU_flags(ALU_flags),
									.PC_src(PC_src),
									.mem_to_reg(mem_to_reg),
									.mem_write(mem_write),
									.ALU_control(ALU_control),
									.ALU_src(ALU_src),
									.imm_src(imm_src),
									.reg_write(reg_write),
									.reg_src(reg_src), 
									.clk(clk));
		

	// Testing the design module functinality
	initial begin
		cond = 1110;
		op = 00;
		funct = 001000;
		rd = 0001;
		ALU_flags = 0000;
		#10
		clk = 1;
		#10
		clk = 0;
		cond = 1110;
		op = 00;
		funct = 101000;
		rd = 0010;
		#10
		clk = 1;
		#10
		clk = 0;
		cond = 1110;
		op = 10;
		funct = 101000;
		rd = 0010;
		#10
		clk = 1;
		#10;

	end 
endmodule 