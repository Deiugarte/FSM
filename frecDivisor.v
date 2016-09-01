`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    div_frec
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
////////////////////////////////////////////////////////////////////////////////
module div_frec(
	input wire clk_in,
	output wire clk_out
	);

	// Valor por defecto del divisor
	parameter M = 100_000_000;
	// log2(M)
	localparam N = 15;

	// Registro para implementar el contador modulo M
	reg [N-1:0] divcounter = 0;

	// Contador módulo M
	always @(posedge clk_in)
		if (divcounter == M - 1)
			divcounter <= 0;
		else
			divcounter <= divcounter + 1;

	// Sacar el bit mas significativo por clk_out
	assign clk_out = divcounter[N-1];

endmodule
