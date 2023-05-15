module Decoder(input logic [1:0] Op,
					input logic [5:0] Funct,
					input logic [3:0] Rd,
					output logic [1:0] FlagW,
					output logic PCS, RegW, MemW, NoWrite,
					output logic MemtoReg, ALUSrc,
					output logic [1:0] ImmSrc, RegSrc,
					output logic [3:0] ALUControl);
					
	logic [9:0] controls;
	logic Branch, ALUOp;
	
	// Main Decoder *******************************************************
	always_comb
		casex(Op)
		
		// Data-processing immediate
		2'b00: if (Funct[5]) controls = 10'b0000101001;
		// Data-processing register
		else controls = 10'b0000001001;
		
		// LDR
		2'b01: if (Funct[0]) controls = 10'b0001111000;
		// STR
		else controls = 10'b1001110100;
		
		// B
		2'b10: controls = 10'b0110100010;
		// Unimplemented
		
		default: controls = 10'bx;
		endcase
		
	assign {RegSrc, ImmSrc, ALUSrc, MemtoReg,
	RegW, MemW, Branch, ALUOp} = controls;
	
	// ALU Decoder
	always_comb
		if (ALUOp) begin // which DP Instr?
			case(Funct[4:1])
				4'b0100: ALUControl = 4'b0000; // ADD
				4'b0010: ALUControl = 4'b0001; // SUB
				4'b0000: ALUControl = 4'b0010; // Multiplication
				4'b1100: ALUControl = 4'b0011; // ORR
				4'b0111: ALUControl = 4'b0101; // AND
				4'b0101: ALUControl = 4'b0111; // Shift left
				4'b0110: ALUControl = 4'b1001; // Shift right
				4'b0001: ALUControl = 4'b1000; // Division
				4'b0011: ALUControl = 4'b0100; // MOD
				4'b1101: ALUControl = 4'b0110; // Copy Imm
				4'b1010: ALUControl = 4'b0001; // Compare Rs1 Rs2
				default: ALUControl = 4'bx;    // unimplemented
			endcase
			
			// update flags if S bit is set (C & V only for arith)
			FlagW[1] = Funct[0];
			FlagW[0] = Funct[0] & (ALUControl == 4'b0000 | ALUControl == 4'b0001);
				
			NoWrite = (Funct[4:1] == 4'b1010);
		end else begin
			// add or sub for non-DP instructions
			ALUControl = Funct[5] ? 4'b0000 : 4'b0001;
			FlagW = 2'b00; // don't update Flags
			NoWrite = 1'b0;
		end
		
		// PC Logic
		assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule
