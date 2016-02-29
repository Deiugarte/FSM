`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   div_frec
// Module Name:   C:/Users/oscad/Documents/Xilinx Projects/Laboratorio2Ascensor/div_frec_test.v
// Project Name:  Laboratorio2Ascensor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: div_frec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module div_frec_test;

	// Inputs
	reg clk_in;
	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	div_frec uut (
		.clk_in(clk_in), 
		.clk_out(clk_out)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		forever #10 clk_in = !clk_in;
		begin
			clk_in = 1'b0;
		end
		
	end
      
endmodule

