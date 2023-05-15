module ALU #(parameter N = 8) (
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic [3:0] ctrl,
    output logic [N-1:0] result,
    output logic [3:0] flags
);

    logic [N-1:0] temp_result;
    
    always_comb begin
        case(ctrl)
            4'b0000: temp_result = a + b;  // Addition
            4'b0001: temp_result = a - b;  // Subtraction
            4'b0010: temp_result = a * b;  // Multiplication
            4'b0011: temp_result = a | b;  // Logical OR
            4'b0100: temp_result = a % b;  // Modulus
            4'b0101: temp_result = a & b;  // Logical AND
            4'b0110: temp_result = b;      // Copy Imm
            4'b0111: temp_result = a << b; // Logical shift left
				4'b1000: temp_result = a / b; // Division
				4'b1001: temp_result = a >> b; // Logical shift right
            default: temp_result = 0;
        endcase
        
        if(ctrl == 4'b0001 && a[N-1] == 1 && b[N-1] == 0 && temp_result[N-1] == 0) begin
            flags[3:0] = 4'b1000; // Negative flag
        end else if(ctrl == 4'b0001 && a[N-1] == 0 && b[N-1] == 1 && temp_result[N-1] == 1) begin
            flags[3:0] = 4'b1000; // Negative flag
        end else if(temp_result == 0) begin
            flags[3:0] = 4'b0100; // Zero flag
        end else if(ctrl == 4'b0000 && a[N-1] == 1 && b[N-1] == 1 && temp_result[N-1] == 0) begin
            flags[3:0] = 4'b0010; // Carry flag
        end else if(ctrl == 4'b0010 && temp_result[N-1] == 1) begin
            flags[3:0] = 4'b0010; // Carry flag
        end else if((a[N-1] == 1 && b[N-1] == 1 && temp_result[N-1] == 0) || (a[N-1] == 0 && b[N-1] == 0 && temp_result[N-1] == 1)) begin
            flags[3:0] = 4'b0001; // Overflow flag
        end else begin
            flags[3:0] = 4'b0000; // No flags set
        end
        
        result = temp_result;
    end

endmodule