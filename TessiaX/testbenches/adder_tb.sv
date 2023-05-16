module adder_tb;

  // Parameters
  parameter WIDTH = 8;

  // Signals
  logic [WIDTH-1:0] a;
  logic [WIDTH-1:0] b;
  logic [WIDTH-1:0] result;

  // Instantiate the adder module
  adder #(WIDTH) dut (
    .a(a),
    .b(b),
    .result(result)
  );

  // Clock generation
//  always begin
//    #5ns;
//    @(posedge clk);
//  end

  // Test cases
  initial begin
    // Test case 1
    a = 8'b00000001;
    b = 8'b00000001;
    #10ns;
    assert(result === 8'b00000010) else $error("Test case 1 failed");

    // Test case 2
    a = 8'b00001111;
    b = 8'b00001111;
    #10ns;
    assert(result === 8'b00011110) else $error("Test case 2 failed");

    // Test case 3
    a = 8'b11110000;
    b = 8'b00001111;
    #10ns;
    assert(result === 8'b11111111) else $error("Test case 3 failed");

    // Test case 4
    a = 8'b11111111;
    b = 8'b00000001;
    #10ns;
    assert(result === 8'b00000000) else $error("Test case 4 failed");

    // Test case 5
    a = 8'b11111111;
    b = 8'b11111111;
    #10ns;
    assert(result === 8'b11111110) else $error("Test case 5 failed");

    // Test case 6
    a = 8'b01010101;
    b = 8'b10101010;
    #10ns;
    assert(result === 8'b11111111) else $error("Test case 6 failed");

    // Test case 7
    a = 8'b00000001;
    b = 8'b11111110;
    #10ns;
    assert(result === 8'b11111111) else $error("Test case 7 failed");

    // Test case 8
    a = 8'b01010101;
    b = 8'b01010101;
    #10ns;
    assert(result === 8'b10101010) else $error("Test case 8 failed");

    // Test case 9
    a = 8'b00000001;
    b = 8'b00000000;
    #10ns;
    assert(result === 8'b00000001) else $error("Test case 9 failed");

    // Test case 10
    a = 8'b11111111;
    b = 8'b11111110;
    #10ns;
    assert(result === 8'b11111101) else $error("Test case 10 failed");

    // End simulation
    $finish;
  end

endmodule
