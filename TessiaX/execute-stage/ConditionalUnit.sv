module ConditionalUnit(
    input logic clk, reset, PCSrcE,
    RegWriteE, MemWriteE, BranchE, NoWrite,
    input [3:0] CondE, FlagsE, ALUFlags,
    input logic [1:0] FlagWriteE,
    output logic PCSrcEout, RegWriteEout, MemWriteEout,
    output logic [3:0] Flags
);

    logic CondExE;
    logic wPC, wBranch;
    logic [1:0] FlagWrite;

	flopenr #(2)flagreg1(clk, reset, FlagWrite[1], ALUFlags[3:2], Flags[3:2]);
	flopenr #(2)flagreg0(clk, reset, FlagWrite[0], ALUFlags[1:0], Flags[1:0]);

	// write controls are conditional
	ConditionCheck cc(CondE, FlagsE, CondExE);

    // Define the Outputs
    assign FlagWrite = FlagWriteE & {2{CondExE}};
    assign wPC = PCSrcE & CondExE;
    assign wBranch = BranchE & CondExE;
    assign PCSrcEout = wPC | wBranch;
    assign RegWriteEout = RegWriteE & CondExE & ~NoWrite;
	assign MemWriteEout = MemWriteE & CondExE;

endmodule