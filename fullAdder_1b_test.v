`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   19:01:53 02/18/2016
// Design Name:   fullAdder_1b
// Module Name:   /home/brallan/Programming/HDL/2016/FullAdder/fullAdder_1b_test.v
// Project Name:  FullAdder
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: fullAdder_1b
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module fullAdder_1b_test;

	// Inputs
	reg a;
	reg b;
	reg cin;
	reg clk;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	fullAdder_1b uut (
		.a(a),
		.b(b),
		.cin(cin),
		.sum(sum),
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;
		clk = 0;

		// Add stimulus here
		#100	a = 1; b = 1;
		#100	a = 0; b = 1;
	end

always begin
	#100 clk = ~clk;
end

endmodule
