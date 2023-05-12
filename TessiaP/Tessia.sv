module Tessia(
    input logic clk, reset,
	output logic [31:0] PCF, ALUResult, WriteData,
	output logic [3:0] ALUFlags
);

    logic [31:0] InstructionF, InstructionD, ReadData;
    logic [31:0] ResultW;
    logic PCSrcW;
    logic [32:0] PCPlus4;

    logic RegWriteW;
    logic [1:0] RegSrcD;
    logic [31:0] WA3W;
    logic [31:0] RD1, RD2, ExtImmD;

    logic PCSrcD, RegWriteD, MemToRegD, MemWriteD;
    logic BranchD, ALUSrcD, NoWriteD;
    logic [3:0] ALUControlD;
    logic [1:0] ImmSrcD, FlagWriteD;
    logic [3:0] Flags;


    logic PCSrcE, RegWriteE, MemToRegE, MemWriteE;
    logic BranchE, ALUSrcE, NoWriteE;
    logic [3:0] ALUControlE, WA3E;
    logic [1:0] FlagWriteE;
    logic [3:0] FlagsE, CondE;
    logic [31:0] SrcAE, WriteDataE, ExtImmE;


    logic PCSrcEout, RegWriteEout, MemWriteEout;
    logic [31:0] ALUResultE;
    assign ALUResult = ALUResultE;

    logic PCSrcM, RegWriteM, MemWriteM, MemToRegM;
    logic [31:0] ALUOutM, WriteDataM, ReadDataM;
    logic [3:0] WA3M;

    assign MemWrite = MemWriteM;
    logic MemToRegW;
    logic [31:0] ReadDataW, ALUOutW;

    //***************************** FETCH STAGE ***********************************
    InstructionMemory imem(
        .a(PCF), 
        .rd(InstructionF)
    );

    fetch #(32) Fetch(
        .clk(clk), 
        .reset(reset),
        .PCSrcW(PCSrcW), 
        .ResultW(ResultW), 
        .PCF(PCF), 
        .PCPlus4F(PCPlus4)
    );

    flopenrc #(32) FetchDecodeFlipFlop(
        .clk(clk), 
        .reset(reset), 
        .en(1), 
        .d({InstructionF}), 
        .q(InstructionD)
    );

    //***************************** DECODE STAGE ***********************************
    ControlUnit #(32) controlunit(
        .clk(clk), 
        .reset(reset), 
        .Op(InstructionD[27:26]),
        .Funct(InstructionD[25:20]),
        .Rd(InstructionD[15:12]),
        .PCSrcD(PCSrcD), 
        .RegWriteD(RegWriteD),
        .MemToRegD(MemToRegD), 
        .MemWriteD(MemWriteD), 
        .BranchD(BranchD), 
        .ALUSrcD(ALUSrcD), 
        .NoWrite(NoWriteD),
        .ALUControlD(ALUControlD),
        .ImmSrcD(ImmSrcD), 
        .FlagWriteD(FlagWriteD),
        .RegSrcD(RegSrcD)
    );

    decode #(32) Decode(
        .clk(clk), 
        .reset(reset), 
        .RegWriteW(RegWriteW),
        .RegSrcD(RegSrcD), 
        .ImmSrcD(ImmSrcD),
        .WA3W(WA3W), 
        .InstructionD(InstructionD), 
        .ResultW(ResultW), 
        .PCPlus8D(PCPlus4),
        .RD1(RD1), 
        .RD2(RD2), 
        .ExtImmD(ExtImmD)
    );

    // Decode - Execute Flip Flop
    flopenrc #(121) DecodeExecuteFlipFlop(
        .clk(clk), 
        .reset(reset), 
        .en(1), 
        .d({
            PCSrcD,
            RegWriteD,
            MemToRegD,
            MemWriteD,
            ALUControlD,
            BranchD,
            ALUSrcD,
            NoWriteD,
            FlagWriteD,
            InstructionD[31:28],
            Flags,
            RD1,
            RD2,
            InstructionD[15:12],
            ExtImmD
            }), 
        .q({
            PCSrcE,
            RegWriteE,
            MemToRegE,
            MemWriteE,
            ALUControlE,
            BranchE,
            ALUSrcE,
            NoWriteE,
            FlagWriteE,
            CondE,
            FlagsE,
            SrcAE,
            WriteDataE,
            WA3E,
            ExtImmE
            }));

    //***************************** EXECUTE STAGE ***********************************
    ConditionalUnit CondUnit(
        .clk(clk), 
        .reset(reset), 
        .PCSrcE(PCSrcE),
        .RegWriteE(RegWriteE), 
        .MemWriteE(MemWriteE), 
        .BranchE(BranchE),
        .NoWrite(NoWriteE),
        .CondE(CondE), 
        .FlagsE(FlagsE), 
        .ALUFlags(ALUFlags),
        .FlagWriteE(FlagWriteE),
        .PCSrcEout(PCSrcEout), 
        .RegWriteEout(RegWriteEout), 
        .MemWriteEout(MemWriteEout),
        .Flags(Flags)); 

    execute #(32) Execute(
        .clk(clk), 
        .reset(reset), 
        .ALUSrcE(ALUSrcE),
        .ALUControlE(ALUControlE),
        .SrcAE(SrcAE), 
        .WriteDataE(WriteDataE), 
        .ExtImmE(ExtImmE),
        .ALUResultE(ALUResultE),
        .ALUFlags(ALUFlags)
    );

    flopenrc #(72) ExecuteMemoryFlipFlop(
        .clk(clk), 
        .reset(reset), 
        .en(1), 
        .d({
            PCSrcEout,
            RegWriteEout,
            MemToRegE,
            MemWriteEout,
            ALUResultE,
            WriteDataE,
            WA3E
            }), 
        .q({
            PCSrcM,
            RegWriteM,
            MemToRegM,
            MemWriteM,
            ALUOutM,
            WriteDataM,
            WA3M
            }));

    //***************************** MEMORY STAGE ***********************************
    DataMemory dmem(
        .clk(clk), 
        .we(MemWriteM),
        .a(ALUOutM), 
        .wd(WriteDataM),
        .rd(ReadDataM)
    );

    flopenrc #(71) MemoryWriteBackFlipFlop(
        .clk(clk), 
        .reset(reset), 
        .en(1), 
        .d({
            PCSrcM,
            RegWriteM,
            MemToRegM,
            ReadDataM,
            ALUOutM,
            WA3M
            }), 
        .q({
            PCSrcW,
            RegWriteW,
            MemToRegW,
            ReadDataW,
            ALUOutW,
            WA3W
            })
    );

    //***************************** WRITE BACK STAGE ***********************************
    WriteBack #(32) writeback(
        .MemToRegW(MemToRegW),
        .ReadDataW(ReadDataW), 
        .ALUOutW(ALUOutW),
        .ResultW(ResultW)
    );

endmodule