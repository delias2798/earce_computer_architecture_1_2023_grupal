module SegmentedMemory(
    input logic clk, we,
    input logic [31:0] a, wd,
    output logic [31:0] rd
);
    // Define memory segments
//    reg [31:0] segment0 [8191:0]; // Segment 0 with address range 0-8191
//    reg [31:0] segment1 [8191:0]; // Segment 1 with address range 8192-16383
	 reg [31:0] instructionsMem [299:0]; 	// Segment 0 with address range 0-299
    reg [31:0] GeneralMem [99:0]; 			// Segment 1 with address range 300-399
	 reg [31:0] Imagen1 [22499:0]; 			// Segment 2 with address range 400-22899
    reg [31:0] Imagen2 [22499:0]; 			// Segment 3 with address range 22900-45399
	 
    // Add more segments as needed

    // Determine the segment based on the address
    reg [1:0] segment_sel;
    always_comb begin
        if ((a >= 13'h0000) && (a <= 13'h12B)) begin
            segment_sel = 2'b00; // Segment instructionsMem
		  end else 
		  if ((a >= 13'h12C) && (a <= 13'h18F)) begin
            segment_sel = 2'b01; // Segment GeneralMem
		  end else 
		  if ((a >= 13'h190) && (a <= 13'h5973)) begin
            segment_sel = 2'b10; // Segment Imagen1
		  end else 
		  if ((a >= 13'h5974) && (a <= 13'hB157)) begin
            segment_sel = 2'b11; // Segment Imagen2
		  end
		  else begin 
				segment_sel = 2'b00;
		  end
    end

    // Read from the selected segment
    always_ff @(posedge clk) begin
        case (segment_sel)
            2'b00: begin
				rom imem(.address(a[7:0]), .clock(~clk), .q(rd));
				//rd <= instructionsMem[a]; // Read from Segment instructionsMem
				end
            2'b01: rd <= GeneralMem[a]; // Read from Segment GeneralMem
				2'b10: rd <= Imagen1[a]; // Read from Segment Imagen1
            2'b11: rd <= Imagen2[a]; // Read from Segment Imagen2
            // Add more cases for other segments
            default: rd <= 0; // Default value if segment is not selected
        endcase
    end

    // Write to the selected segment 
    always_ff @(posedge clk) begin
        if (we) begin
            case (segment_sel)
                2'b00: instructionsMem[a] <= wd; // Write to instructionsMem
                2'b01: GeneralMem[a] <= wd; // Write to GeneralMem
					 2'b10: Imagen1[a] <= wd; // Write to Segment Imagen1
					 2'b11: Imagen2[a] <= wd; // Write to Segment Imagen2
                // Add more cases for other segments
            endcase
        end
    end
endmodule
