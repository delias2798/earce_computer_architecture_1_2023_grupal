//module SegmentedMemory_tb;
//    reg clk;
//    reg we;
//    reg [31:0] a;
//    reg [31:0] wd;
//    wire [31:0] rd;
//
//    SegmentedMemory dut (
//        .clk(clk),
//        .we(we),
//        .a(a),
//        .wd(wd),
//        .rd(rd)
//    );
//
//    initial begin
//        // Initialize inputs
//        clk = 0;
//        we = 0;
//        a = 0;
//        wd = 0;
//
//        // Wait for some time for stability
//        #10;
//
//        // Test case 1 - Read from instructionsMem segment
//        we = 0;
//        a = 8'h01;
//        #5;
//        $display("Test case 1: Read from instructionsMem segment");
//        $display("Read data: %h", rd);
//        // Add assertion for expected value
//        assert(rd === 0) else $error("Test case 1 failed");
//
//        // Test case 2 - Write to instructionsMem segment
//        we = 1;
//        a = 8'h02;
//        wd = 32'h12345678;
//        #5;
//        $display("Test case 2: Write to instructionsMem segment");
//        // Add read operation to verify the written data
//        we = 0;
//        #5;
//        $display("Read data: %h", rd);
//        // Add assertion for expected value
//        // assert(rd === wd) else $error("Test case 2 failed");
//
//        // Add more test cases
//
//        // End simulation
//        $finish;
//    end
//
//    // Clock generation
//    always begin
//        #5;
//        clk = ~clk;
//    end
//endmodule
//
//module SegmentedMemory_tb;
//
//    reg clk;
//    reg we;
//    reg [31:0] a;
//    reg [31:0] wd;
//    wire [31:0] rd;
//    
//    SegmentedMemory dut (
//        .clk(clk),
//        .we(we),
//        .a(a),
//        .wd(wd),
//        .rd(rd)
//    );
//    
//    initial begin
//        // Initialize inputs
//        clk = 0;
//        we = 0;
//        a = 0;
//        wd = 0;
//        
//        // Write some values to memory segments
//        we = 1;
//        a = 100;
//        wd = 1234;
//        #10;
//        we = 0;
//        a = 100;
//        wd = 0;
//        
//        // Read values from memory segments
//        we = 0;
//        a = 100;
//        #10;
//        
//        // Display the read value
//        $display("Read value: %d", rd);
//		  
//
//        // Test case 2 - Write to instructionsMem segment
//        we = 1;
//        a = 8'h02;
//        wd = 32'h12345678;
//        #5;
//        $display("Test case 2: Write to instructionsMem segment");
//        // Add read operation to verify the written data
//        we = 1;
//        #5;
//        $display("Read data: %h", rd);
//        // Add assertion for expected value
//        assert(rd === wd) else $error("Test case 2 failed");
//
//        
//        // End simulation
//        $finish;
//    end
//    
//    always begin
//        #5;
//        clk = ~clk;
//    end
//
//endmodule

module SegmentedMemory_tb;

  // Inputs
  logic clk;
  logic we;
  logic [31:0] a;
  logic [31:0] wd;

  // Outputs
  logic [31:0] rd;

  // Instantiate the DUT
  SegmentedMemory dut (
    .clk(clk),
    .we(we),
    .a(a),
    .wd(wd),
    .rd(rd)
  );

	initial begin
 
  // Test case 1 - write and read back from segment instructionsMem
    // Write data to segment instructionsMem at address 0
    we = 1;
    a = 0;
    wd = 32'h12345678;
    #5;
    we = 0;
    #5;

    // Read back data from segment instructionsMem at address 0
    a = 0;
    #5;
    $display("Test case 1 - read data from segment instructionsMem: %h", rd);

    // End simulation


  // Test case 2 - write and read back from segment GeneralMem
    // Write data to segment GeneralMem at address 300
    we = 1;
    a = 300;
    wd = 32'hABCDEF01;
    #5;
    we = 0;
    #5;

    // Read back data from segment GeneralMem at address 300
    a = 300;
    #5;
    $display("Test case 2 - read data from segment GeneralMem: %h", rd);

    // End simulation


  // Test case 3 - write and read back from segment Imagen1
    // Write data to segment Imagen1 at address 4000
    we = 1;
    a = 4000;
    wd = 32'hDEADBEEF;
    #5;
    we = 0;
    #5;

    // Read back data from segment Imagen1 at address 4000
    a = 4000;
    #5;
    $display("Test case 3 - read data from segment Imagen1: %h", rd);

    // End simulation

  // Test case 4 - write and read back from segment Imagen2
    // Write data to segment Imagen2 at address 40000
    we = 1;
    a = 40000;
    wd = 32'hCAFEBABE;
    #5;
    we = 0;
    #5;

    // Read back data from segment Imagen2 at address 40000
    a = 40000;
    #5;
    $display("Test case 4 - read data from segment Imagen2: %h", rd);

    // End simulation
    $finish;
  end
  
    always begin
        #5;
        clk = ~clk;
    end


endmodule

