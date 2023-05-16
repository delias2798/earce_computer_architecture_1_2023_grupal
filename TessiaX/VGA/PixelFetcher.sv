module PixelFetcher(
	input logic clk,
  	input logic imageSelector,
  	input logic [9:0] v_counter,
  	input logic [9:0] h_counter,
  	input logic video_on,
  	input logic [31:0] pixel,
  	output logic [21:0] address,
  	output logic [7:0] VGA_R,
  	output logic [7:0] VGA_G,
  	output logic [7:0] VGA_B
);

	// Parameters
	parameter IMG_WIDTH = 300;    // Width of the image
	parameter IMG_HEIGHT = 300;   // Height of the image
	parameter SCREEN_WIDTH = 640; // Width of the screen
	parameter SCREEN_HEIGHT = 480; // Height of the screen
	parameter IMAGE_START_ADDR1 = 100;  // Starting address 100 of the image in the RAM
	parameter IMAGE_START_ADDR2 = 22601;  // Starting address 22601 of the image in the RAM

	// Internal variables
	logic [9:0] row_counter;
	logic [9:0] col_counter;

	// Calculate address based on v_counter and h_counter
	always_comb begin
		if (imageSelector) begin
			row_counter = (v_counter * IMG_HEIGHT) / SCREEN_HEIGHT;
			col_counter = (h_counter * IMG_WIDTH) / SCREEN_WIDTH;
			address = (row_counter * IMG_WIDTH + col_counter) + IMAGE_START_ADDR2;
		end
		else begin
			row_counter = (v_counter * IMG_HEIGHT) / SCREEN_HEIGHT;
			col_counter = (h_counter * IMG_WIDTH) / SCREEN_WIDTH;
			address = (row_counter * IMG_WIDTH + col_counter) + IMAGE_START_ADDR1;
		end
	end

	// Fetch pixel value based on the address
	always_ff @(posedge clk) begin
	if (video_on) begin
		case(h_counter % 4) // Determine which pixel within the word to select
		0: begin
			VGA_R <= pixel[7:0];
			VGA_G <= 8'b00000000;
			VGA_B <= 8'b00000000;
		end
		1: begin
			VGA_R <= 8'b00000000;
			VGA_G <= pixel[7:0];
			VGA_B <= 8'b00000000;
		end
		2: begin
			VGA_R <= 8'b00000000;
			VGA_G <= 8'b00000000;
			VGA_B <= pixel[7:0];
		end
		3: begin
			VGA_R <= pixel[7:0];
			VGA_G <= pixel[7:0];
			VGA_B <= pixel[7:0];
		end
		endcase
	end else begin
		VGA_R <= 8'b00000000;
		VGA_G <= 8'b00000000;
		VGA_B <= 8'b00000000;
	end
	end

endmodule
