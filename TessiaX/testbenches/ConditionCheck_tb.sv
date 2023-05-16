module ConditionCheck_tb();

    // Parameters
    
    // Inputs 
	 logic [3:0] Cond;
	 logic [3:0] Flags;

    // Outputs
	 logic CondEx;

    // Instantiate DUT
	 ConditionCheck dut(
    .Cond(Cond), 
	 .Flags(Flags),
	 .CondEx(CondEx)
	 );

    
	 
    initial begin
	 
	 // Test case 1:  ***********************************************
        Cond = 4'b0000;
		  // Flags [neg, zero, carry, overflow]
        Flags = 4'b0100;
        #10;
		  
		  
		  // 0000: CondEx = zero; // EQ
        assert(CondEx === 1'b1) else $error("Test case EQ failed (CondEx)");
        
	 
	 // Test case 2:  ***********************************************
        Cond = 4'b0001;
		  // Flags [neg, zero, carry, overflow]
        Flags = 4'b0000;
        #10;
		  
		  
		  // 0000: CondEx = zero; // EQ
        assert(CondEx === 1'b1) else $error("Test case NE failed (CondEx)");
        
		  
	 // Test case 3:  ***********************************************
        Cond = 4'b1011;
		  // Flags [neg, zero, carry, overflow]
        Flags = 4'b1000;
        #10;
		  
		  
		  // 0000: CondEx = zero; // EQ
        assert(CondEx === 1'b1) else $error("Test case LT failed (CondEx)");
        
	  
	 // Test case 4:  ***********************************************
        Cond = 4'b1100;
		  // Flags [neg, zero, carry, overflow]
        Flags = 4'b0000;
        #10;
		  
		  
		  // 0000: CondEx = zero; // GT
        assert(CondEx === 1'b1) else $error("Test case GT failed (CondEx)");
        
		  
        $display("All test cases passed");
        $finish;
    end

endmodule
