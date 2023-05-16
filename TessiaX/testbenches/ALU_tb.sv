module ALU_tb();

    // Parameters
    parameter N = 32;
    
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
        // Test case 1: Addition (10 + 256) **********************************
        a = 10;
        b = 256;
        ctrl = 4'b0000;
        #10;
        $display("ADD: %d + %d = %d and the flags are {neg %b, zero %b, carry %b, overflow %b}",
                 a, b, result, flags[3], flags[2], flags[1], flags[0]);

        // Test case 2: Addition (10 - 10) **********************************
        a = 10;
        b = 10;
        ctrl = 4'b0001;
        #10;
        $display("ADD: %d - %d = %d and the flags are {neg %b, zero %b, carry %b, overflow %b}",
                 a, b, result, flags[3], flags[2], flags[1], flags[0]);

        // Test case 1: Addition (1 - 10) **********************************
        a = 1;
        b = 10;
        ctrl = 4'b0001;
        #10;
        $display("ADD: %d - %d = %d and the flags are {neg %b, zero %b, carry %b, overflow %b}",
                 a, b, result, flags[3], flags[2], flags[1], flags[0]);

        // Test case 1: Addition (24 + -10) **********************************
        a = 24;
        b = -10;
        ctrl = 4'b0000;
        #10;
        $display("ADD: %d + %d = %d and the flags are {neg %b, zero %b, carry %b, overflow %b}",
                 a, b, result, flags[3], flags[2], flags[1], f11lags[0]);

        $stop;
    end

endmodule