module ControlUnit #(parameter WIDTH=8)(
    input logic clk, reset,
    input logic [1:0] Op,
    input logic [5:0] Funct,
    input logic [3:0] Rd,
    output logic PCSrcD, RegWriteD,
    MemToRegD, MemWriteD, BranchD, ALUSrcD, NoWrite,
    output logic [3:0] ALUControlD,
    output logic [1:0] ImmSrcD, FlagWriteD, RegSrcD
);
	logic [9:0] controls;
	logic Branch, ALUOp;
	
	// Main Decoder *******************************************************************************
	always_comb
		casex(Op)
            2'b00: 
                // Data-processing immediate
                if (Funct[5]) controls = 10'b0000101001;
                // Data-processing register
                else controls = 10'b0000001001;
            
            2'b01:
                // LDR
                if (Funct[0]) controls = 10'b0001111000;
                // STR
                else controls = 10'b1001110100;
            
            
            2'b10: 
                // B
                controls = 10'b0110100010;

            // Unimplemented
            default:
                 controls = 10'bx;
		endcase
		
	assign {RegSrcD, ImmSrcD, ALUSrcD, MemToRegD,
	RegWriteD, MemWriteD, BranchD, ALUOp} = controls;

	// ALU Decoder ***********************************************************************************
	always_comb
		if (ALUOp) begin // which DP Instr?
			case(Funct[4:1])
				4'b0100: ALUControlD = 4'b0000; // ADD
				4'b0010: ALUControlD = 4'b0001; // SUB
				4'b0000: ALUControlD = 4'b0010; // Multiplication
				4'b1100: ALUControlD = 4'b0011; // ORR
				4'b1101: ALUControlD = 4'b0110; // Copy Imm
				4'b1010: ALUControlD = 4'b0001; // Compare Rs1 Rs2
				default: ALUControlD = 4'bx;    // unimplemented
			endcase
			
			// update flags if S bit is set (C & V only for arith)
			FlagWriteD[1] = Funct[0];
			FlagWriteD[0] = Funct[0] & (ALUControlD == 4'b0000 | ALUControlD == 4'b0001 | ALUControlD == 4'b0110);
				
			NoWrite = (Funct[4:1] == 4'b1010);
        end 
        else begin
			// add or sub for non-DP instructions
			ALUControlD = Funct[5] ? 4'b0000 : 4'b0001;
			FlagWriteD = 2'b00; // don't update Flags
			NoWrite = 1'b0;
		end
		
		// PC Logic *****************************************************************
		assign PCSrcD = ((Rd == 4'b1111) & RegWriteD) | BranchD;

endmodule