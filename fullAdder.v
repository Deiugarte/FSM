`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:29:36 02/18/2016
// Design Name:
// Module Name:    fullAdder
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module fullAdder_1b(a, b, cin, sum, cout);

input 	a, b, cin;
output 	sum, cout;

assign	cout	= a & b | cin & b | cin & a;
assign	sum		= cin & ~a & ~b | ~cin & ~a & b | ~cin & a & ~b | cin & a & b;

initial begin
	$display("Valor de a: %b", a);
	$display("Valor de b: %b", b);
	$display("Valor de cin: %b", cin);
	$display("Valor de sum: %b", sum);
	$display("Valor de cout: %b", cout);
end

endmodule
