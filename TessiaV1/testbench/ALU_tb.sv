module ALU_tb();

    // Parameters
    parameter N = 4;
    
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
        // Test case 1: Addition (5 + 3 = 8) **********************************
        a = 4'b0001;
        b = 4'b0001;
        ctrl = 4'b0000;
        #10;
        assert(result === 4'b0010) else $error("Test case 1 failed");
        assert(flags === 4'b0000) else $error("Test case 1 failed");
		  
		  // Test case 2: Addition ***********************************************
        a = 4'b1111;
        b = 4'b1110;
        ctrl = 4'b0000;
        #10;
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 4'b1101) else $error("Test case 2 failed (result)");
        assert(flags === 4'b1010) else $error("Test case 2 failed (flags)");
		  
		  
		  // Test case 3: Addition ***********************************************
        a = 4'b0000;
        b = 4'b1110;
        ctrl = 4'b0000;
        #10;
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 4'b1110) else $error("Test case 3 failed (result)");
        assert(flags === 4'b1000) else $error("Test case 3 failed (flags)");
		  
		  // Test case 4: Addition ************************************************
        a = 4'b1111;
        b = 4'b1111;
        ctrl = 4'b0000;
        #10;
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 4'b1110) else $error("Test case 4 failed (result)");
        assert(flags === 4'b1010) else $error("Test case 4 failed (flags)");
		  
		  

        $display("All test cases passed");
        $finish;
    end

endmodule


