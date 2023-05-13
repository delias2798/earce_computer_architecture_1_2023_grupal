module HazardUnit(
    input logic Match_1E_M,
    input logic Match_1E_W,
    input logic Match_2E_M,
    input logic Match_2E_W,
    input logic RegWriteM, RegWriteW,
    output logic [1:0] ForwardAE, ForwardBE
);
	
	always_comb begin
		// Forwarding Logic
		ForwardAE = 2'b00;
		ForwardBE = 2'b00;
        // Check Matches for the destination in Write Back Stage
		if(RegWriteW) begin 
			if (Match_1E_W) begin
				ForwardAE = 2'b01;
			end
			if (Match_2E_W) begin
				ForwardBE = 2'b01;
			end
		end 
		// Check Matches for the destination in Memory Stage
		if(RegWriteM) begin 
			if(Match_1E_M) begin
			    ForwardAE = 2'b10;
			end 
			if (Match_2E_M) begin
			    ForwardBE = 2'b10;
			end
		end 
	end
	
endmodule 