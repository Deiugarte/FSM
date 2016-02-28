`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   02:08:20 02/25/2016
// Design Name:   async_input_sync
// Module Name:   /media/Data/Programming/HDL/2016/FullAdder/async_input_sync_test.v
// Project Name:  FullAdder
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: async_input_sync
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module async_input_sync_test;

	// Inputs
	reg clk;
	reg async_in;

	// Outputs
	wire sync_out;

	// Instantiate the Unit Under Test (UUT)
	async_input_sync uut (
		.clk(clk),
		.async_in(async_in),
		.sync_out(sync_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		async_in = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		#11 async_in = 1;
		#13 async_in = 0;
		#11 async_in = 1;
		#12 async_in = 0;
		#13 async_in = 1;
		#13 async_in = 0;
		#02 async_in = 1;
		#01 async_in = 0;
		#01 async_in = 1;
		#21 async_in = 0;
		#14 async_in = 1;
		#16 async_in = 0;
	end

	always begin
		#10 clk = ~clk;
	end

endmodule
