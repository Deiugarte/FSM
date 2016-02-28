`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   20:53:37 08/22/2015
// Design Name:   debounce
// Module Name:   /home/brallan/Xilinx/DeBounce2/debounce_test.v
// Project Name:  DeBounce2
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: debounce
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module debounce_test;

	// Inputs
	reg reset;
	reg clk;
	reg sw;

	// Outputs
	wire db_level;
	wire db_tick;

	// Instantiate the Unit Under Test (UUT)
	debounce uut (
	    .clk(clk),
	    .reset(reset),
	    .sw(sw),
	    .db_level(db_level),
	    .db_tick(db_tick)
	    );

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		sw = 0;

		// Wait 10 ns for global reset to finish
			// de 0 a 10 -> reset = 1, clk = 0 y sw = 0

		// Add stimulus here				// Tiempo inicio del reset y sw
		#10; reset = 1; sw = 0;		// 20 ns
		#10; reset = 0; sw = 1;		// 30 ns
		#15; reset = 0; sw = 0;		// 40 ns
		#10; reset = 0; sw = 1;		// 50 ns
		#10; reset = 0; sw = 0;		// 60 ns
		#30; reset = 0; sw = 1;		// 90 ns
		#10; reset = 0; sw = 1;		// 100 ns
		#50; reset = 0; sw = 0;		// 150 ns
		#20; reset = 0; sw = 1;		// 170 ns
		#05; reset = 0; sw = 1;		// 175 ns
		#175; reset = 0; sw = 0;	// 310 ns
		#20; reset = 0; sw = 0;		// 330 ns
		#20; reset = 0; sw = 1;		// 350 ns
		#13; reset = 0; sw = 0;		// 363 ns
		#100; reset = 0; sw = 1;	// 463 ns
		#61; reset = 0; sw = 0;		// 524 ns
		#30; reset = 0; sw = 1;		// 554 ns
		#61; reset = 0; sw = 0;		// 615 ns
		#65; reset = 0; sw = 1;		// 680 ns
		#85; reset = 0; sw = 0;		// 745 ns??

		/*#000; reset = 0; sw = 0;	// 010 ns
		#020; reset = 0; sw = 1;	// 030 ns
		#031; reset = 0; sw = 0;	// 071 ns
		#010; reset = 0; sw = 1;
		#20; sw = 0;
		#50; sw = 1;
		#40; sw = 0;*/

	end

	always
		begin
			#10; clk = ~clk;
		end
endmodule
