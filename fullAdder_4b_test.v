`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   00:01:54 02/19/2016
// Design Name:   fullAdder_4b
// Module Name:   /home/brallan/Programming/HDL/2016/FullAdder/fullAdder_4b_test.v
// Project Name:  FullAdder
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: fullAdder_4b
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module fullAdder_4b_test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] sseg;
	wire [3:0] AN;

	// Instantiate the Unit Under Test (UUT)
	fullAdder_4b uut (
		.a(a),
		.b(b),
		.cin(cin),
		.clk(clk),
		.reset(reset),
		.sseg(sseg),
		.AN(AN)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;
		clk = 0;
		reset = 0;

		// Add stimulus here						Entrada									Salida
	//	#100 a = 4'd02; b = 4'd06;	//	a = 2, b = 6, cin = 0		sseg = 8, cout = 0
		//#100 a = 4'd10; b = 4'd05;	//	a = 10, b = 5, cin = 0	sseg = 15, cout = 0
		//#100 a = 4'd13; b = 4'd03;	//	a = 13, b = 3, cin = 0	sseg = 16, cout = 1
		//#100 a = 4'd14; b = 4'd11;	//	a = 14, b = 11, cin = 0	sseg = 25, cout = 1

		// -------------------------------------------------------------------------
		// ENTRADA:	a = 0, b = 1, cin = 0
		// SALIDA:	AN = 1110, sseg = 1, cout = 0
		#100 a = 4'd00; b = 4'd01;
		// -------------------------------------------------------------------------
		// ENTRADA:	a = 3, b = 2, cin = 0
		// SALIDA:	AN = 1110, sseg = 5, cout = 0
		#137 a = 4'd03; b = 4'd02;
		// -------------------------------------------------------------------------
		// ENTRADA:	a = 2, b = 6, cin = 0
		// SALIDA:	AN = 1110, sseg = 8, cout = 0
		//#100 a = 4'd02; b = 4'd06;
		// -------------------------------------------------------------------------
		// ENTRADA:	a = 4, b = 4, cin = 0
		// SALIDA:	AN = 1110, sseg = 8, cout = 0
		//#100 a = 4'd04; b = 4'd04;
	end

	always begin
		#10 clk = ~clk;
	end

endmodule
