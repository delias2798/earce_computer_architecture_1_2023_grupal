module senal_ALU_control (funct, ALU_op, res, flag_w);
	
	input logic [4:0] funct;
	input logic ALU_op;
	output logic [3:0] res;
	output logic [1:0] flag_w;
	
	always @ (funct) begin
		if(ALU_op) begin
			case(funct[4:1])
				4'b0000: begin res = 4'b0100; if(funct[0]) flag_w = 2'b11; else flag_w = 2'b00; end
				4'b0010: begin res = 4'b0001; if(funct[0]) flag_w = 2'b11; else flag_w = 2'b00; end
				4'b0100: begin res = 4'b0000; if(funct[0]) flag_w = 2'b10; else flag_w = 2'b00; end
				4'b1100: begin res = 4'b0101; if(funct[0]) flag_w = 2'b10; else flag_w = 2'b00; end
				4'b1101: begin res = 4'b0010; if(funct[4]) flag_w = 2'b10; else flag_w = 2'b00; end
				default: begin res = 4'b1010; flag_w = 2'b00; end
			endcase
		end
		else begin
			flag_w = 2'b00;
			res = 4'b0000;
		end
		
	end
	
endmodule 