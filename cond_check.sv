module cond_check (cond, flags, cond_ex);
	
	input logic [3:0] cond, flags;
	assign {n, z, c, v} = flags;
	output logic cond_ex;
	
	always @ (cond) begin
	
		case(cond)
            4'b0000: cond_ex = z; // EQ
            4'b0001: cond_ex = ~z; // NE
            4'b0010: cond_ex = c; // CS
            4'b0011: cond_ex = ~c; // CC
            4'b0100: cond_ex = n; // MI
            4'b0101: cond_ex = ~n; // PL
            4'b0110: cond_ex = v; // VS
            4'b0111: cond_ex = ~v; // VC
            4'b1000: cond_ex = ~z & c; // HI
            4'b1001: cond_ex = z | ~c; // LS
            4'b1010: cond_ex = ~(n ^ v); // GE
            4'b1011: cond_ex = (n ^ v); // LT
            4'b1100: cond_ex = ~z & ~(n ^ v); // GT
            4'b1101: cond_ex = z | (n ^ v); // LE
            4'b1110: cond_ex = 1'b1; // Always
            default: cond_ex = 1'bx; // undefined
		endcase
	
	end
	
endmodule 