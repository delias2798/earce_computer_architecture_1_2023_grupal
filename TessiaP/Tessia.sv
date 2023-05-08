module Tessia(
    input logic clk, reset,
	output logic [31:0] PC, ALUResult, WriteData,
	output logic [3:0] ALUFlags
);

    logic [31:0] InstructionF, InstructionD, ReadData;
    logic [31:0] ResultW;
    logic PCSrc;
    logic [32:0] PCPlus4;

    logic RegWriteW;
    logic [1:0] RegSrcD, ImmSrcD;
    logic [31:0] WA3W;
    logic [31:0] RD1, RD2, ExtImmD;

    // MEMORY ******************************************************************
    InstructionMemory imem(.a(PC), .rd(InstructionF));

    // FETCH STAGE *************************************************************
    fetch #(32) Fetch(.clk(clk), .reset(reset),
                    .PCSrcW(PCSrc), .ResultW(ResultW), 
                    .PCF(PC), .PCPlus4F(PCPlus4));

    flopenrc #(32) FetchFlipFlop(.clk(clk), .reset(reset), .en(1), 
        .d({InstructionF}), .q(InstructionD);
    );

    // DECODE STAGE ************************************************************
    decode #(32)(.clk(clk), .reset(reset), .RegWriteW(RegWriteW),
                    .RegSrcD(RegSrcD), .ImmSrcD(ImmSrcD),
                    .WA3W(WA3W), .InstructionD(InstructionD), 
                    .ResultW(ResultW), .PCPlus8D(PCPlus4),
                    .RD1(RD1), .RD2(RD2), .ExtImmD(ExtImmD)
    );
endmodule
