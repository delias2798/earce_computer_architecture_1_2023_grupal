module ALU_tb();

    // Parameters
    parameter N = 8;
    
    // Inputs
    logic [N-1:0] a;
    logic [N-1:0] b;
    logic [3:0] ctrl;

    // Outputs
    logic [N-1:0] result;
    logic [3:0] flags;

    // Instantiate DUT
    ALU #(N) dut (
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .result(result),
        .flags(flags)
    );

    // Test cases
    initial begin
        // Test case 1: Addition (5 + 3 = 8)
        a = 5;
        b = 3;
        ctrl = 4'b0000;
        #10;
        assert(result === 8) else $error("Test case 1 failed");
        assert(flags === 4'b0000) else $error("Test case 1 failed");

        // Test case 2: Subtraction (5 - 3 = 2)
        a = 5;
        b = 3;
        ctrl = 4'b0001;
        #10;
        assert(result === 2) else $error("Test case 2 failed");
        assert(flags === 4'b0000) else $error("Test case 2 failed");

        // Test case 3: Logical AND (5 & 3 = 1)
        a = 5;
        b = 3;
        ctrl = 4'b0010;
        #10;
        assert(result === 1) else $error("Test case 3 failed");
        assert(flags === 4'b0000) else $error("Test case 3 failed");

        // Test case 4: Logical OR (5 | 3 = 7)
        a = 5;
        b = 3;
        ctrl = 4'b0011;
        #10;
        assert(result === 7) else $error("Test case 4 failed");
        assert(flags === 4'b0000) else $error("Test case 4 failed");

        // Test case 5: Modulus (5 % 3 = 2)
        a = 5;
        b = 3;
        ctrl = 4'b0100;
        #10;
        assert(result === 2) else $error("Test case 5 failed");
        assert(flags === 4'b0000) else $error("Test case 5 failed");

        // Test case 6: Multiplication (5 * 3 = 15)
        a = 5;
        b = 3;
        ctrl = 4'b0101;
        #10;
        assert(result === 15) else $error("Test case 6 failed");
        assert(flags === 4'b0000) else $error("Test case 6 failed");

        // Test case 7: Logical shift right (5 >> 1 = 2)
        a = 5;
        b = 1;
        ctrl = 4'b0110;
        #10;
        assert(result === 2) else $error("Test case 7 failed");
        assert(flags === 4'b0000) else $error("Test case 7 failed");

        $display("All test cases passed");
        $finish;
    end

endmodule


