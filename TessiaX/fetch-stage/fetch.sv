module fetch #(parameter WIDTH= 8)(
    input logic clk, reset, PCSrcW,
    input logic [WIDTH-1:0] ResultW,
    output logic [WIDTH-1:0] PCF, PCPlus4F
);
    logic [WIDTH-1:0] PCNext;

    // Next PC Multiplexer
    mux2to1 #(WIDTH) pcmux(.d0(PCPlus4F), .d1(ResultW),
                         .selection(PCSrcW), .result(PCNext));

    // PC Holder Register
    flopr #(WIDTH) pcregister(.clk(clk), .reset(reset),
                         .d(PCNext), .q(PCF));

    // (PC + 4) Adder
    adder #(WIDTH) pcadd1(.a(PCF), .b(4), .result(PCPlus4F));

endmodule
