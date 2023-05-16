module ALU_tb();

    // Parameters
    parameter N = 6;
    
    // Inputs
    logic signed [N-1:0] a;
    logic signed [N-1:0] b;
    logic [3:0] ctrl;

    // Outputs
    logic signed [N-1:0] result;
    logic [3:0] flags;

    // Instantiate DUT
    ALU #(N) dut (
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .result(result),
        .flags(flags)
    );

    
	 
    initial begin
	 //// Test cases for 6 bits /////////////////////////////////////////////
			// Test case 1: Substraction (Para BLT) ***********************************************
        a = 6'b001010;
        b = 6'b010100;
        ctrl = 4'b0001;
        #10;
		  
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 6'b110110) else $error("Test case 1 in 6 bits: BLT failed (result)");
        assert(flags === 4'b1000) else $error("Test case 1 in 6 bits: BLT failed (flags)");
		  
		  // Test case 2: Substraction (Para BGT) ***********************************************
        a = 6'b010100;
        b = 6'b001010;
        ctrl = 4'b0001;
        #10;
//		  $display("Binary a: %0b",a);
//		  $display("Binary b: %0b",b);
//		  $display("Binary result: %0b",result);
//		  $display("Binary flags: %0b",flags);
		  
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 6'b001010) else $error("Test case 2 in 6 bits: BGT failed (result)");
        assert(flags === 4'b0000) else $error("Test case 2 in 6 bits: BGT failed (flags)");
		  
		  // Test case 3: Divition () ***********************************************
        a = 6'b111111;
        b = 6'b000010;
        ctrl = 4'b1000;
        #10;
		  $display("Binary a: %0b",a);
		  $display("Binary b: %0b",b);
		  $display("Binary result: %0b",result);
		  $display("Binary flags: %0b",flags);
		  
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 6'b000000) else $error("Test case 3 in 6 bits: division failed (result)");
        assert(flags === 4'b0100) else $error("Test case 3 in 6 bits: division failed (flags)");
		  
		  
	//// Test cases for 4bits /////////////////////////////////////////////
//        // Test case 1: Addition (1 + 1 = 2) **********************************
//        a = 4'b0001;
//        b = 4'b0001;
//        ctrl = 4'b0000;
//        #10;
//        assert(result === 4'b0010) else $error("Test case 1 failed");
//        assert(flags === 4'b0000) else $error("Test case 1 failed");
//		  
//		  // Test case 2: Addition (-1 + 1 = temp_result = 0000) ***********************************************
//        a = 4'b1111;
//        b = 4'b0001;
//		  //b = 4'b1110;
//        ctrl = 4'b0000;
//        #10;
//		  
//		  // 3=negative, 2=zero, 1=carry, 0=overflow
//        assert(result === 4'b0000) else $error("Test case 2 failed (result)");
//        assert(flags === 4'b0100) else $error("Test case 2 failed (flags)");
//		  
//		  // Test case 3: Addition (temp_result = 1 1101) ***********************************************
//        a = 4'b1111;
//        b = 4'b1110;
//        ctrl = 4'b0000;
//        #10;
//		  
//		  // 3=negative, 2=zero, 1=carry, 0=overflow
//        assert(result === 4'b1101) else $error("Test case 3 failed (result)");
//        assert(flags === 4'b1000) else $error("Test case 3 failed (flags)");
//		  
//		  // Test case 4: Addition (-1 + 0 temp_result = -1 = 1111) ***********************************************
//        a = 4'b1111;
//        b = 4'b0000;
//        ctrl = 4'b0000;
//        #10;
//
//		  // 3=negative, 2=zero, 1=carry, 0=overflow
//        assert(result === 4'b1111) else $error("Test case 4 failed (result)");
//        assert(flags === 4'b1000) else $error("Test case 4 failed (flags)");
//		  
//		  // Test case 5: Addition (7 + 4 = 11 Overfloat and carrie) ***********************************************
//        a = 4'b0111;
//        b = 4'b0100;
//        ctrl = 4'b0000;
//        #10;
//		  $display("Binary a: %0b",a);
//		  $display("Binary b: %0b",b);
//		  $display("Binary result: %0b",result);
//		  $display("Binary flags: %0b",flags);
//		  
//		  
//		  // 3=negative, 2=zero, 1=carry, 0=overflow
//        assert(result === 4'b1011) else $error("Test case 5 failed (result)");
//        assert(flags === 4'b0011) else $error("Test case 5 failed (flags)");
//		  
//		  // Test case 6: Addition (7 + 4 = 11 Overfloat and carrie) ***********************************************
//        a = 4'b1111;
//        b = 4'b1100;
//        ctrl = 4'b0000;
//        #10;
//		  $display("Binary a: %0b",a);
//		  $display("Binary b: %0b",b);
//		  $display("Binary result: %0b",result);
//		  $display("Binary flags: %0b",flags);
//		  
//		  
//		  // 3=negative, 2=zero, 1=carry, 0=overflow
//        assert(result === 4'b1011) else $error("Test case 6 failed (result)");
//        assert(flags === 4'b0011) else $error("Test case 6 failed (flags)");
		  /*
		  // Test case 6: Substraction (temp_result = 1) ***********************************************
        a = 4'b0010;
        b = 4'b0001;
        ctrl = 4'b0001;
        #10;
		  
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 4'b0001) else $error("Test case 6 failed (result)");
        assert(flags === 4'b0000) else $error("Test case 6 failed (flags)");
		  
		  // Test case 7: Substraction (temp_result = - 0001) ***********************************************
        a = 4'b0010;
        b = 4'b0011;
        ctrl = 4'b0001;
        #10;
		  $display("Binary a: %0b",a);
		  $display("Binary b: %0b",b);
		  $display("Binary result: %0b",result);
		  $display("Binary flags: %0b",flags);
		  
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        assert(result === 4'b0001) else $error("Test case 7 failed (result)");
        assert(flags === 4'b1000) else $error("Test case 7 failed (flags)");
		  
		  // Test case 4: Addition ************************************************
        a = 4'b1111;
        b = 4'b1111;
        ctrl = 4'b0000;
        #10;
		  
		  // 3=negative, 2=zero, 1=carry, 0=overflow
        //assert(result === 4'b1110) else $error("Test case 4 failed (result)");
        //assert(flags === 4'b1010) else $error("Test case 4 failed (flags)");
		  */
		  

        $display("All test cases passed");
        $finish;
    end

endmodule


